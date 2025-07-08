# Fitness_database_system
 Designed 10+ entities and relationship sets to manage fitness centers ,  trainers , persons and services like there sessions and session types


# Data Management Project - Fitness Center

## Project Overview
This project is a comprehensive Data Management system for a Fitness Center, featuring:
- Relational database design and implementation (MySQL)
- ER/EER/UML modeling
- Sample data population
- 10+ complex SQL queries
- A modern, interactive GUI built with Python and Streamlit for full CRUD operations and analytics

---

## 1. Database Design & Setup
- Designed an EER diagram and relational schema for a fitness center, including tables for Person, Member, Trainer, Room, FitnessCenter, Session, SessionType, and SessionParticipation.
- Implemented the schema in MySQL using provided SQL files (`DBCREATION.sql`, `Table_Creation.sql`).
- Added additional attributes (e.g., Email, Phone, MembershipType) for realism and analytics.
- Set up foreign key constraints for referential integrity.

### **How to Set Up the Database**
1. Create the database (e.g., `fitness_db`).
2. Run the schema SQL files to create all tables:
   ```bash
   mysql -u <user> -p fitness_db < sql/DBCREATION.sql
   # or
   mysql -u <user> -p fitness_db < sql/Table_Creation.sql
   ```
3. Populate tables with sample data using `sample_data.sql` or your own inserts.

---

## 2. Sample Data
- Populated each table with at least 30-40 rows of realistic data.
- Ensured foreign key relationships are valid (e.g., only add a Member or Trainer if the Person exists).
- Adjusted data to ensure meaningful query results (e.g., a mix of active/inactive members, underutilized rooms, etc.).

---

## 3. SQL Queries
- Developed and tested 10+ complex SQL queries for:
  - Most active members
  - Most active trainers
  - Session type popularity
  - Underutilized rooms
  - Inactive members
  - Sessions per month
  - Custom analytics as required
- All queries are in `sql/queries.sql`.

---

## 4. ER/EER/UML Model
- Created an EER diagram to visualize entities, relationships, and attributes.
- Used the model to guide schema design and normalization.

---

## 5. Streamlit GUI (frontend/app.py)
- Built a modern, user-friendly web app using Streamlit and Python.
- Features:
  - **Dashboard:** Key metrics, charts, and a geospatial map of fitness centers.
  - **Members Management:** Add, edit, delete, and search members. Unified form for Person+Member.
  - **Trainers Management:** Add, edit, delete, and search trainers. Unified form for Person+Trainer.
  - **Sessions Management:** Add, edit, delete, and search sessions. Dropdowns for foreign keys.
  - **Room Management:** Add, edit, delete, and search rooms.
  - **Session Types Management:** Add, edit, delete session types.
  - **Persistent success/error messages** for all actions.
  - **Sidebar navigation** for easy access to all sections.
  - **Modern, beautiful UI** with custom CSS for cards, buttons, sidebar, and tables.
- All CRUD operations are fully functional and user-friendly.

### **How to Run the App**
1. Install dependencies:
   ```bash
   pip install streamlit mysql-connector-python pandas plotly
   ```
2. Start the app:
   ```bash
   streamlit run frontend/app.py
   ```
3. Open your browser to `http://localhost:8501`.

---

## 6. Troubleshooting & Tips
- **Foreign key errors:** Always add Person before adding as Member/Trainer. Only use valid Room/FitnessCenter/Trainer/SessionType IDs.
- **Database locks:** Kill long-running MySQL processes or restart MySQL if you get lock timeout errors.
- **UI not updating:** Hard refresh your browser and restart Streamlit.
- **Referential integrity:** All dropdowns and forms are designed to prevent invalid data entry.

---

## 7. Customization
- You can further customize the UI, add more analytics, or extend the schema as needed.
- All code is modular and easy to extend.

---

## 8. Project Structure
```
Data_management/
  frontend/
    app.py           # Streamlit GUI
  sql/
    DBCREATION.sql   # Schema
    Table_Creation.sql
    sample_data.sql  # Sample data
    queries.sql      # Complex queries
    ...
  README.txt         # This file
```

---


##Developed as part of a Data Management course project.

---

