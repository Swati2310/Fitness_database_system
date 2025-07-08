import streamlit as st
import mysql.connector
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from datetime import datetime, timedelta
import numpy as np

# Page configuration
st.set_page_config(
    page_title="Fitness Center Data Management",
    page_icon="💪",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Custom CSS for modern styling
st.markdown("""
<style>
    /* Main header */
    .main-header {
        font-size: 3rem;
        font-weight: bold;
        color: #1f77b4;
        text-align: center;
        margin-bottom: 2rem;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
    }
    /* Metric cards */
    .metric-card {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        padding: 1.5rem;
        border-radius: 14px;
        color: white;
        text-align: center;
        box-shadow: 0 4px 12px rgba(0,0,0,0.12);
        margin-bottom: 1rem;
        transition: box-shadow 0.2s;
    }
    .metric-card:hover {
        box-shadow: 0 8px 24px rgba(0,0,0,0.18);
    }
    .metric-value {
        font-size: 2.7rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
    }
    .metric-label {
        font-size: 1.1rem;
        opacity: 0.92;
    }
    /* Sidebar */
    section[data-testid="stSidebar"] {
        background: linear-gradient(180deg, #232526 0%, #414345 100%);
        color: #fff;
        border-right: 2px solid #764ba2;
    }
    .sidebar .sidebar-content {
        background: none;
    }
    /* Sidebar radio buttons */
    div[data-testid="stSidebar"] .stRadio > div {
        gap: 0.5rem;
    }
    div[data-testid="stSidebar"] label {
        font-size: 1.1rem;
        font-weight: 500;
        color: #fff;
        padding: 0.3rem 0.7rem;
        border-radius: 6px;
        transition: background 0.2s;
    }
    div[data-testid="stSidebar"] label[data-selected="true"] {
        background: #764ba2;
        color: #fff;
    }
    /* Buttons */
    .stButton > button {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        border-radius: 7px;
        padding: 0.5rem 1.2rem;
        font-weight: bold;
        font-size: 1.05rem;
        box-shadow: 0 2px 8px rgba(118,75,162,0.08);
        transition: background 0.2s, box-shadow 0.2s, transform 0.1s;
    }
    .stButton > button:hover {
        background: linear-gradient(135deg, #5a6fd8 0%, #6a4190 100%);
        transform: translateY(-2px) scale(1.04);
        box-shadow: 0 6px 16px rgba(118,75,162,0.18);
    }
    /* Expander */
    .stExpanderHeader {
        font-size: 1.1rem;
        font-weight: 600;
        color: #764ba2;
    }
    /* Forms and containers */
    .stForm, .stContainer {
        background: rgba(255,255,255,0.03);
        border-radius: 12px;
        padding: 1.2rem 1rem;
        margin-bottom: 1.2rem;
        box-shadow: 0 2px 8px rgba(31,119,180,0.06);
    }
    /* Table styling */
    .stDataFrame, .stTable {
        background: rgba(255,255,255,0.02);
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(31,119,180,0.06);
    }
    /* Success and error messages */
    .stAlert-success {
        background: linear-gradient(90deg, #43e97b 0%, #38f9d7 100%) !important;
        color: #222 !important;
        border-radius: 8px;
        font-weight: 500;
    }
    .stAlert-error {
        background: linear-gradient(90deg, #ff5858 0%, #f09819 100%) !important;
        color: #fff !important;
        border-radius: 8px;
        font-weight: 500;
    }
    /* Markdown headers */
    h1, h2, h3, h4, h5, h6 {
        color: #1f77b4;
        font-weight: 700;
        letter-spacing: 0.5px;
    }
</style>
""", unsafe_allow_html=True)

# Database connection
@st.cache_resource
def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Guleria@456",
            database="fitness_db"
        )
        return connection
    except mysql.connector.Error as err:
        st.error(f"Database connection failed: {err}")
        return None

# Helper functions
def execute_query(query, params=None, raise_on_error=False):
    """Execute a query and return results as DataFrame"""
    connection = get_db_connection()
    if connection is None:
        return pd.DataFrame()
    
    try:
        cursor = connection.cursor(dictionary=True)
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        
        if query.strip().upper().startswith('SELECT'):
            results = cursor.fetchall()
            return pd.DataFrame(results)
        else:
            connection.commit()
            return pd.DataFrame()
    except mysql.connector.Error as err:
        if raise_on_error:
            raise
        st.error(f"Query execution failed: {err}")
        return pd.DataFrame()
    finally:
        if connection.is_connected():
            cursor.close()

def get_table_data(table_name, order_by=None):
    """Get all data from a table, optionally ordered by a column DESC"""
    query = f"SELECT * FROM {table_name}"
    if order_by:
        query += f" ORDER BY {order_by} DESC"
    return execute_query(query)

def delete_record(table_name, id_column, record_id):
    """Delete a record from a table"""
    query = f"DELETE FROM {table_name} WHERE {id_column} = %s"
    execute_query(query, (record_id,))

# Dashboard functions
def get_dashboard_metrics():
    """Get key metrics for dashboard"""
    metrics = {}
    
    # Total members
    query = "SELECT COUNT(*) as count FROM Member"
    result = execute_query(query)
    metrics['total_members'] = result['count'].iloc[0] if not result.empty else 0
    
    # Active members (not available, set to 0 or N/A)
    metrics['active_members'] = 0
    
    # Total trainers
    query = "SELECT COUNT(*) as count FROM Trainer"
    result = execute_query(query)
    metrics['total_trainers'] = result['count'].iloc[0] if not result.empty else 0
    
    # Total sessions this month (use SessionDate)
    query = """
    SELECT COUNT(*) as count FROM Session
    WHERE MONTH(SessionDate) = MONTH(CURDATE())
      AND YEAR(SessionDate) = YEAR(CURDATE())
    """
    result = execute_query(query)
    metrics['sessions_this_month'] = result['count'].iloc[0] if not result.empty else 0
    
    return metrics

def get_chart_data():
    """Get data for charts"""
    charts = {}
    
    # No JoinDate, so skip membership trend
    charts['membership_trend'] = None
    
    # Session types distribution (use Description)
    query = """
    SELECT st.Description, COUNT(s.SessionTypeId) as count
    FROM SessionType st
    LEFT JOIN Session s ON st.SessionTypeId = s.SessionTypeId
    GROUP BY st.SessionTypeId, st.Description
    ORDER BY count DESC
    """
    charts['session_types'] = execute_query(query)
    
    # Room utilization (use RoomNumber)
    query = """
    SELECT r.RoomNumber, COUNT(s.RoomNumber) as session_count
    FROM Room r
    LEFT JOIN Session s ON r.RoomNumber = s.RoomNumber
    GROUP BY r.RoomNumber
    ORDER BY session_count DESC
    """
    charts['room_utilization'] = execute_query(query)
    
    return charts

# Main app
def main():
    # Sidebar navigation
    st.sidebar.title("🏋️ Fitness Center")
    st.sidebar.markdown("---")
    page = st.sidebar.radio(
        "Navigation",
        ["📊 Dashboard", "👥 Members", "🏃 Trainers", "📅 Sessions", "🏠 Rooms", "📋 Session Types"]
    )
    
    # Main content
    if page == "📊 Dashboard":
        show_dashboard()
    elif page == "👥 Members":
        show_members()
    elif page == "🏃 Trainers":
        show_trainers()
    elif page == "📅 Sessions":
        show_sessions()
    elif page == "🏠 Rooms":
        show_rooms()
    elif page == "📋 Session Types":
        show_session_types()

def show_dashboard():
    """Display dashboard with metrics and charts"""
    st.markdown('<h1 class="main-header">Fitness Center Dashboard</h1>', unsafe_allow_html=True)
    
    # Get metrics
    metrics = get_dashboard_metrics()
    
    # Display metrics in cards
    col1, col2, col3 = st.columns(3)
    with col1:
        st.markdown(f"""
        <div class="metric-card">
            <div class="metric-value">{metrics['total_members']}</div>
            <div class="metric-label">Total Members</div>
        </div>
        """, unsafe_allow_html=True)
    with col2:
        st.markdown(f"""
        <div class="metric-card">
            <div class="metric-value">{metrics['total_trainers']}</div>
            <div class="metric-label">Total Trainers</div>
        </div>
        """, unsafe_allow_html=True)
    with col3:
        st.markdown(f"""
        <div class="metric-card">
            <div class="metric-value">{metrics['sessions_this_month']}</div>
            <div class="metric-label">Sessions This Month</div>
        </div>
        """, unsafe_allow_html=True)
    
    st.markdown("---")
    
    # Charts
    charts = get_chart_data()
    
    col1, col2 = st.columns(2)
    with col1:
        if not charts['session_types'].empty:
            fig = px.pie(charts['session_types'], values='count', names='Description',
                        title='Session Types Distribution')
            fig.update_layout(height=400)
            st.plotly_chart(fig, use_container_width=True)
    with col2:
        # Geospatial colored bubble map of fitness centers by city
        city_coords = {
            'New York': {'lat': 40.7128, 'lon': -74.0060},
            'Atlanta': {'lat': 33.7490, 'lon': -84.3880},
            'Boston': {'lat': 42.3601, 'lon': -71.0589},
            'Chicago': {'lat': 41.8781, 'lon': -87.6298},
            'San Francisco': {'lat': 37.7749, 'lon': -122.4194},
            'Seattle': {'lat': 47.6062, 'lon': -122.3321},
            'Austin': {'lat': 30.2672, 'lon': -97.7431},
            'Denver': {'lat': 39.7392, 'lon': -104.9903},
            'Miami': {'lat': 25.7617, 'lon': -80.1918},
            'Portland': {'lat': 45.5152, 'lon': -122.6784},
        }
        df_fc = execute_query('SELECT CenterId, Name, City FROM FitnessCenter')
        if not df_fc.empty:
            df_fc['lat'] = df_fc['City'].map(lambda c: city_coords.get(c, {}).get('lat'))
            df_fc['lon'] = df_fc['City'].map(lambda c: city_coords.get(c, {}).get('lon'))
            df_fc = df_fc.dropna(subset=['lat', 'lon'])
            fig = px.scatter_mapbox(
                df_fc,
                lat='lat',
                lon='lon',
                color='City',
                hover_name='Name',
                hover_data=['City', 'CenterId'],
                size_max=20,
                zoom=3,
                mapbox_style='carto-positron',
                height=400,
                title='Fitness Centers by City (Colored Bubble Map)'
            )
            fig.update_layout(margin={"r":0,"t":40,"l":0,"b":0}, legend_title_text='City')
            st.plotly_chart(fig, use_container_width=True)

    # Room utilization chart
    if not charts['room_utilization'].empty:
        fig = px.bar(charts['room_utilization'], x='RoomNumber', y='session_count',
                    title='Room Utilization',
                    labels={'session_count': 'Number of Sessions', 'RoomNumber': 'Room'})
        fig.update_layout(height=400)
        st.plotly_chart(fig, use_container_width=True)

def show_members():
    """Display and manage members"""
    st.title("👥 Members Management")
    
    # Show persistent success message if present
    if st.session_state.get("member_added_success"):
        st.success("Member added successfully!")
        st.session_state.member_added_success = False
    
    # Add new member (unified form)
    with st.expander("➕ Add New Member", expanded=False):
        with st.form("add_member"):
            col1, col2 = st.columns(2)
            with col1:
                person_id = st.text_input("Person ID")
                first_name = st.text_input("First Name")
                last_name = st.text_input("Last Name")
                birth_date = st.date_input("Birth Date")
            with col2:
                email = st.text_input("Email (optional)")
                phone = st.text_input("Phone (optional)")
                membership_type = st.selectbox(
                    "Membership Type",
                    ["Basic", "Premium", "VIP", "Student", "Family", "Corporate"]
                )
            if st.form_submit_button("Add Member"):
                if person_id and first_name and last_name and birth_date:
                    # Check if PersonId exists in Person
                    check_person = execute_query(
                        "SELECT * FROM Person WHERE PersonId = %s",
                        (person_id,),
                        raise_on_error=True
                    )
                    # If not, insert into Person
                    if check_person.empty:
                        try:
                            execute_query(
                                "INSERT INTO Person (PersonId, FirstName, LastName, BirthDate, Email, Phone) VALUES (%s, %s, %s, %s, %s, %s)",
                                (person_id, first_name, last_name, birth_date, email, phone),
                                raise_on_error=True
                            )
                        except Exception as e:
                            st.error(f"Failed to add person: {e}")
                            st.stop()
                    # Check if already in Member
                    check_member = execute_query(
                        "SELECT * FROM Member WHERE PersonId = %s",
                        (person_id,),
                        raise_on_error=True
                    )
                    if not check_member.empty:
                        st.error("This Person ID is already a member.")
                        st.stop()
                    # Insert into Member
                    try:
                        execute_query(
                            "INSERT INTO Member (PersonId, MembershipType) VALUES (%s, %s)",
                            (person_id, membership_type),
                            raise_on_error=True
                        )
                        st.session_state.member_added_success = True
                        st.rerun()
                    except Exception as e:
                        st.error(f"Failed to add member: {e}")
    
    # Search/filter not available (no name/email/status columns)
    df = execute_query("SELECT * FROM Member ORDER BY PersonId DESC")
    
    if not df.empty:
        st.dataframe(df)
    else:
        st.info("No members found.")

def show_trainers():
    """Display and manage trainers"""
    st.title("🏃 Trainers Management")
    
    # Show persistent success message if present
    if st.session_state.get("trainer_success_message"):
        st.success(st.session_state.trainer_success_message)
        st.session_state.trainer_success_message = None
    
    # Add new trainer
    with st.expander("➕ Add New Trainer", expanded=False):
        with st.form("add_trainer"):
            col1, col2 = st.columns(2)
            with col1:
                person_id = st.text_input("Person ID")
                first_name = st.text_input("First Name")
                last_name = st.text_input("Last Name")
                birth_date = st.date_input("Birth Date")
            with col2:
                email = st.text_input("Email (optional)")
                phone = st.text_input("Phone (optional)")
                diploma = st.text_input("Diploma")
            if st.form_submit_button("Add Trainer"):
                if person_id and first_name and last_name and birth_date:
                    # Check if PersonId exists in Person
                    check_person = execute_query(
                        "SELECT * FROM Person WHERE PersonId = %s",
                        (person_id,),
                        raise_on_error=True
                    )
                    # If not, insert into Person
                    if check_person.empty:
                        try:
                            execute_query(
                                "INSERT INTO Person (PersonId, FirstName, LastName, BirthDate, Email, Phone) VALUES (%s, %s, %s, %s, %s, %s)",
                                (person_id, first_name, last_name, birth_date, email, phone),
                                raise_on_error=True
                            )
                        except Exception as e:
                            st.error(f"Failed to add person: {e}")
                            st.stop()
                    # Check if already a trainer
                    check_trainer = execute_query(
                        "SELECT * FROM Trainer WHERE PersonId = %s",
                        (person_id,),
                        raise_on_error=True
                    )
                    if not check_trainer.empty:
                        st.error("This person is already a trainer.")
                    else:
                        try:
                            execute_query(
                                "INSERT INTO Trainer (PersonId, Diploma) VALUES (%s, %s)",
                                (person_id, diploma),
                                raise_on_error=True
                            )
                            st.session_state.trainer_success_message = "Trainer added successfully!"
                            st.rerun()
                        except Exception as e:
                            st.error(f"Failed to add trainer: {e}")
    
    # Get and display data (join Trainer with Person)
    query = """
    SELECT t.PersonId, t.Diploma, p.FirstName, p.LastName, p.Email, p.Phone
    FROM Trainer t
    JOIN Person p ON t.PersonId = p.PersonId
    ORDER BY t.PersonId DESC
    """
    df = execute_query(query)
    if not df.empty:
        for index, row in df.iterrows():
            with st.container():
                col1, col2, col3, col4 = st.columns([3, 2, 1, 1])
                with col1:
                    st.write(f"**{row['FirstName']} {row['LastName']}**")
                    st.write(f"Email: {row['Email']} | Phone: {row['Phone']}")
                with col2:
                    st.write(f"Diploma: {row['Diploma']}")
                with col3:
                    edit_key = f"edit_trainer_{row['PersonId']}"
                    if st.button("Edit", key=edit_key):
                        st.session_state.editing_trainer = row['PersonId']
                with col4:
                    if st.button("Delete", key=f"delete_trainer_{row['PersonId']}"):
                        delete_record("Trainer", "PersonId", row['PersonId'])
                        st.session_state.trainer_success_message = "Trainer deleted successfully!"
                        st.rerun()
                # Edit form (below the row)
                if st.session_state.get("editing_trainer") == row['PersonId']:
                    with st.form(f"edit_trainer_form_{row['PersonId']}"):
                        new_diploma = st.text_input("Diploma", value=row['Diploma'] or "")
                        new_email = st.text_input("Email", value=row['Email'] or "")
                        new_phone = st.text_input("Phone", value=row['Phone'] or "")
                        if st.form_submit_button("Save Changes"):
                            try:
                                # Update Trainer
                                execute_query(
                                    "UPDATE Trainer SET Diploma = %s WHERE PersonId = %s",
                                    (new_diploma, row['PersonId']),
                                    raise_on_error=True
                                )
                                # Update Person
                                execute_query(
                                    "UPDATE Person SET Email = %s, Phone = %s WHERE PersonId = %s",
                                    (new_email, new_phone, row['PersonId']),
                                    raise_on_error=True
                                )
                                st.session_state.trainer_success_message = "Trainer updated successfully!"
                                st.session_state.editing_trainer = None
                                st.rerun()
                            except Exception as e:
                                st.error(f"Failed to update trainer: {e}")
                st.markdown("---")
    else:
        st.info("No trainers found.")

def show_sessions():
    """Display and manage sessions"""
    st.title("📅 Sessions Management")
    # Show persistent success message if present
    if st.session_state.get("session_success_message"):
        st.success(st.session_state.session_success_message)
        st.session_state.session_success_message = None
    # Add new session
    with st.expander("➕ Add New Session", expanded=False):
        with st.form("add_session"):
            col1, col2 = st.columns(2)
            with col1:
                session_id = st.text_input("Session ID")
                session_date = st.date_input("Session Date")
                start_time = st.text_input("Start Time (e.g., 09:00:00)")
                session_mode = st.selectbox("Session Mode", ["group", "individual"])
            with col2:
                # Dropdowns for foreign keys (not filtered)
                rooms_df = execute_query("SELECT RoomNumber FROM Room")
                fitness_df = execute_query("SELECT CenterId FROM FitnessCenter")
                session_types_df = execute_query("SELECT SessionTypeId FROM SessionType")
                trainers_df = execute_query("SELECT PersonId FROM Trainer")
                room_number = st.selectbox("Room Number", rooms_df['RoomNumber'] if not rooms_df.empty else [])
                fitness_center_id = st.selectbox("Fitness Center ID", fitness_df['CenterId'] if not fitness_df.empty else [])
                session_type_id = st.selectbox("Session Type ID", session_types_df['SessionTypeId'] if not session_types_df.empty else [])
                trainer_id = st.selectbox("Trainer ID", trainers_df['PersonId'] if not trainers_df.empty else [])
            if st.form_submit_button("Add Session"):
                if session_id and room_number and fitness_center_id and session_date and start_time and session_mode and session_type_id and trainer_id:
                    # Check if SessionId already exists
                    check_session = execute_query(
                        "SELECT * FROM Session WHERE SessionId = %s",
                        (session_id,),
                        raise_on_error=True
                    )
                    if not check_session.empty:
                        st.error("This Session ID already exists.")
                    else:
                        try:
                            execute_query(
                                "INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                                (session_id, room_number, fitness_center_id, session_date, start_time, session_mode, session_type_id, trainer_id),
                                raise_on_error=True
                            )
                            st.session_state.session_success_message = "Session added successfully!"
                            st.rerun()
                        except Exception as e:
                            st.error(f"Failed to add session: {e}")
    # Get and display all sessions with search/filter
    search_term = st.text_input("Search sessions by ID, Room, Fitness Center, Type, or Trainer")
    base_query = "SELECT * FROM Session"
    params = []
    if search_term:
        base_query += " WHERE SessionId LIKE %s OR RoomNumber LIKE %s OR FitnessCenterId LIKE %s OR SessionTypeId LIKE %s OR TrainerId LIKE %s"
        like_term = f"%{search_term}%"
        params = [like_term] * 5
    base_query += " ORDER BY SessionId DESC"
    df = execute_query(base_query, params)
    if not df.empty:
        for index, row in df.iterrows():
            with st.container():
                col1, col2, col3 = st.columns([4, 3, 1])
                with col1:
                    st.write(f"**Session ID:** {row['SessionId']}")
                    st.write(f"Room: {row['RoomNumber']} | Fitness Center: {row['FitnessCenterId']}")
                    st.write(f"Date: {row['SessionDate']} | Start: {row['StartTime']} | Mode: {row['SessionMode']}")
                with col2:
                    st.write(f"Session Type: {row['SessionTypeId']} | Trainer: {row['TrainerId']}")
                with col3:
                    edit_key = f"edit_session_{row['SessionId']}"
                    if st.button("Edit", key=edit_key):
                        st.session_state.editing_session = row['SessionId']
                    if st.button("Delete", key=f"delete_session_{row['SessionId']}"):
                        delete_record("Session", "SessionId", row['SessionId'])
                        st.session_state.session_success_message = "Session deleted successfully!"
                        st.rerun()
                # Edit form (below the row)
                if st.session_state.get("editing_session") == row['SessionId']:
                    with st.form(f"edit_session_form_{row['SessionId']}"):
                        session_date = st.date_input("Session Date", value=row['SessionDate'])
                        start_time = st.text_input("Start Time", value=row['StartTime'])
                        session_mode = st.selectbox("Session Mode", ["group", "individual"], index=0 if row['SessionMode'] == "group" else 1)
                        rooms_df = execute_query("SELECT RoomNumber FROM Room")
                        fitness_df = execute_query("SELECT CenterId FROM FitnessCenter")
                        session_types_df = execute_query("SELECT SessionTypeId FROM SessionType")
                        trainers_df = execute_query("SELECT PersonId FROM Trainer")
                        room_number = st.selectbox("Room Number", rooms_df['RoomNumber'] if not rooms_df.empty else [], index=rooms_df['RoomNumber'].tolist().index(row['RoomNumber']) if row['RoomNumber'] in rooms_df['RoomNumber'].tolist() else 0)
                        fitness_center_id = st.selectbox("Fitness Center ID", fitness_df['CenterId'] if not fitness_df.empty else [], index=fitness_df['CenterId'].tolist().index(row['FitnessCenterId']) if row['FitnessCenterId'] in fitness_df['CenterId'].tolist() else 0)
                        session_type_id = st.selectbox("Session Type ID", session_types_df['SessionTypeId'] if not session_types_df.empty else [], index=session_types_df['SessionTypeId'].tolist().index(row['SessionTypeId']) if row['SessionTypeId'] in session_types_df['SessionTypeId'].tolist() else 0)
                        trainer_id = st.selectbox("Trainer ID", trainers_df['PersonId'] if not trainers_df.empty else [], index=trainers_df['PersonId'].tolist().index(row['TrainerId']) if row['TrainerId'] in trainers_df['PersonId'].tolist() else 0)
                        if st.form_submit_button("Save Changes"):
                            try:
                                execute_query(
                                    "UPDATE Session SET RoomNumber=%s, FitnessCenterId=%s, SessionDate=%s, StartTime=%s, SessionMode=%s, SessionTypeId=%s, TrainerId=%s WHERE SessionId=%s",
                                    (room_number, fitness_center_id, session_date, start_time, session_mode, session_type_id, trainer_id, row['SessionId']),
                                    raise_on_error=True
                                )
                                st.session_state.session_success_message = "Session updated successfully!"
                                st.session_state.editing_session = None
                                st.rerun()
                            except Exception as e:
                                st.error(f"Failed to update session: {e}")
                st.markdown("---")
    else:
        st.info("No sessions found.")

def show_rooms():
    """Display and manage rooms"""
    st.title("🏠 Rooms Management")
    
    # Add new room
    with st.expander("➕ Add New Room", expanded=False):
        with st.form("add_room"):
            fitness_center_id = st.text_input("Fitness Center ID")
            room_number = st.text_input("Room Number")
            capacity = st.number_input("Capacity", min_value=1, value=10)
            if st.form_submit_button("Add Room"):
                if room_number:
                    query = "INSERT INTO Room (FitnessCenterId, RoomNumber, Capacity) VALUES (%s, %s, %s)"
                    execute_query(query, (fitness_center_id, room_number, capacity))
                    st.success("Room added successfully!")
                    st.rerun()
    
    # Get and display data with search/filter
    search_term = st.text_input("Search rooms by Room Number or Fitness Center ID")
    base_query = "SELECT * FROM Room"
    params = []
    if search_term:
        base_query += " WHERE RoomNumber LIKE %s OR FitnessCenterId LIKE %s"
        like_term = f"%{search_term}%"
        params = [like_term, like_term]
    base_query += " ORDER BY RoomNumber DESC"
    df = execute_query(base_query, params)
    if not df.empty:
        for index, row in df.iterrows():
            with st.container():
                col1, col2, col3, col4 = st.columns([3, 2, 1, 1])
                with col1:
                    st.write(f"**Room Number: {row['RoomNumber']}**")
                    st.write(f"Fitness Center: {row['FitnessCenterId']}")
                with col2:
                    st.write(f"Capacity: {row['Capacity']} people")
                with col3:
                    edit_key = f"edit_room_{row['RoomNumber']}"
                    if st.button("Edit", key=edit_key):
                        st.session_state.editing_room = row['RoomNumber']
                with col4:
                    if st.button("Delete", key=f"delete_room_{row['RoomNumber']}"):
                        delete_record("Room", "RoomNumber", row['RoomNumber'])
                        st.session_state.room_success_message = "Room deleted successfully!"
                        st.rerun()
                # Edit form (below the row)
                if st.session_state.get("editing_room") == row['RoomNumber']:
                    with st.form(f"edit_room_form_{row['RoomNumber']}"):
                        new_room_number = st.text_input("Room Number", value=row['RoomNumber'])
                        new_fitness_center_id = st.text_input("Fitness Center ID", value=row['FitnessCenterId'])
                        new_capacity = st.number_input("Capacity", min_value=1, value=row['Capacity'])
                        if st.form_submit_button("Save Changes"):
                            try:
                                execute_query(
                                    "UPDATE Room SET RoomNumber = %s, FitnessCenterId = %s, Capacity = %s WHERE RoomNumber = %s",
                                    (new_room_number, new_fitness_center_id, new_capacity, row['RoomNumber']),
                                    raise_on_error=True
                                )
                                st.session_state.room_success_message = "Room updated successfully!"
                                st.session_state.editing_room = None
                                st.rerun()
                            except Exception as e:
                                st.error(f"Failed to update room: {e}")
                st.markdown("---")
    else:
        st.info("No rooms found.")

def show_session_types():
    """Display and manage session types"""
    st.title("📋 Session Types Management")
    
    # Show persistent success/error message if present
    if st.session_state.get("sessiontype_success_message"):
        st.success(st.session_state.sessiontype_success_message)
        st.session_state.sessiontype_success_message = None
    if st.session_state.get("sessiontype_error_message"):
        st.error(st.session_state.sessiontype_error_message)
        st.session_state.sessiontype_error_message = None
    # Add new session type
    with st.expander("➕ Add New Session Type", expanded=False):
        with st.form("add_session_type"):
            session_type_id = st.text_input("Session Type ID")
            description = st.text_area("Description")
            if st.form_submit_button("Add Session Type"):
                if session_type_id:
                    # Check if SessionTypeId already exists
                    check_type = execute_query(
                        "SELECT * FROM SessionType WHERE SessionTypeId = %s",
                        (session_type_id,),
                        raise_on_error=True
                    )
                    if not check_type.empty:
                        st.session_state.sessiontype_error_message = "This Session Type ID already exists."
                        st.rerun()
                    else:
                        try:
                            execute_query(
                                "INSERT INTO SessionType (SessionTypeId, Description) VALUES (%s, %s)",
                                (session_type_id, description),
                                raise_on_error=True
                            )
                            st.session_state.sessiontype_success_message = "Session type added successfully!"
                            st.rerun()
                        except Exception as e:
                            st.session_state.sessiontype_error_message = f"Failed to add session type: {e}"
                            st.rerun()
    
    # Get and display data
    df = get_table_data("SessionType", order_by="SessionTypeId")
    if not df.empty:
        for index, row in df.iterrows():
            with st.container():
                col1, col2, col3, col4 = st.columns([3, 2, 1, 1])
                with col1:
                    st.write(f"**{row['SessionTypeId']}**")
                with col2:
                    st.write(f"Description: {row['Description']}")
                with col3:
                    edit_key = f"edit_session_type_{row['SessionTypeId']}"
                    if st.button("Edit", key=edit_key):
                        st.session_state.editing_session_type = row['SessionTypeId']
                with col4:
                    if st.button("Delete", key=f"delete_session_type_{row['SessionTypeId']}"):
                        delete_record("SessionType", "SessionTypeId", row['SessionTypeId'])
                        st.session_state.sessiontype_success_message = "Session type deleted successfully!"
                        st.rerun()
                # Edit form (below the row)
                if st.session_state.get("editing_session_type") == row['SessionTypeId']:
                    with st.form(f"edit_session_type_form_{row['SessionTypeId']}"):
                        new_description = st.text_area("Description", value=row['Description'] or "")
                        if st.form_submit_button("Save Changes"):
                            try:
                                execute_query(
                                    "UPDATE SessionType SET Description = %s WHERE SessionTypeId = %s",
                                    (new_description, row['SessionTypeId']),
                                    raise_on_error=True
                                )
                                st.session_state.sessiontype_success_message = "Session type updated successfully!"
                                st.session_state.editing_session_type = None
                                st.rerun()
                            except Exception as e:
                                st.error(f"Failed to update session type: {e}")
                st.markdown("---")
    else:
        st.info("No session types found.")

if __name__ == "__main__":
    main()
