                                -- ##10 INTERESTING QUESTIONS ##
-- 1. Which members participated in the most sessions this month?
-- Uses: SessionParticipation, Member, Session
-- Select * From Session; 
-- SELECT DISTINCT YEAR(SessionDate) AS Year, MONTH(SessionDate) AS Month FROM Session;

-- ------QUERY AS PER CURRENT DATE (29 JUNE 2025) -----------
SELECT m.PersonId, p.FirstName, p.LastName, COUNT(sp.SessionId) AS SessionsThisMonth
FROM Member m
JOIN Person p ON m.PersonId = p.PersonId
JOIN SessionParticipation sp ON m.PersonId = sp.PersonId
JOIN Session s ON sp.SessionId = s.SessionId
WHERE MONTH(s.SessionDate) = MONTH(CURDATE()) AND YEAR(s.SessionDate) = YEAR(CURDATE())
GROUP BY m.PersonId, p.FirstName, p.LastName
ORDER BY SessionsThisMonth DESC;



-- -----------QUERY AS PER SPECIFIC DATE ---------
SELECT m.PersonId, p.FirstName, p.LastName, COUNT(sp.SessionId) AS SessionsThisMonth
FROM Member m
JOIN Person p ON m.PersonId = p.PersonId
JOIN SessionParticipation sp ON m.PersonId = sp.PersonId
JOIN Session s ON sp.SessionId = s.SessionId
WHERE MONTH(s.SessionDate) = 7 AND YEAR(s.SessionDate) = 2024
GROUP BY m.PersonId, p.FirstName, p.LastName
ORDER BY SessionsThisMonth DESC;

-- 2. Which trainers have supervised the most group sessions of a specific type (e.g., Aerobics)?
-- Uses: Trainer, Session, SessionType
SELECT t.PersonId, p.FirstName, p.LastName, st.Description AS SessionType, COUNT(s.SessionId) AS GroupSessions
FROM Trainer t
JOIN Person p ON t.PersonId = p.PersonId
JOIN Session s ON t.PersonId = s.TrainerId
JOIN SessionType st ON s.SessionTypeId = st.SessionTypeId
WHERE s.SessionMode = 'group' AND st.Description = 'Aerobics'
GROUP BY t.PersonId, p.FirstName, p.LastName, st.Description
ORDER BY GroupSessions DESC;

-- 3. What is the average number of participants per group session by session type?
-- Uses: Session, SessionType, SessionParticipation
SELECT st.Description AS SessionType, ROUND(AVG(sub.Participants)) AS AvgParticipants
FROM SessionType st
JOIN (
    SELECT s.SessionTypeId, s.SessionId, COUNT(sp.PersonId) AS Participants
    FROM Session s
    LEFT JOIN SessionParticipation sp ON s.SessionId = sp.SessionId
    WHERE s.SessionMode = 'group'
    GROUP BY s.SessionTypeId, s.SessionId
) sub ON st.SessionTypeId = sub.SessionTypeId
GROUP BY st.Description;

-- 4. Which rooms in a fitness center are underutilized (e.g., host fewer than X sessions per week)?
-- Uses: Room, Session, FitnessCenter
-- Replace X with your threshold, e.g., 2

-- ---Query as per CURRENT date  -----------
SELECT r.FitnessCenterId, r.RoomNumber, fc.Name AS FitnessCenter, COUNT(s.SessionId) AS SessionsPerWeek
FROM Room r
JOIN FitnessCenter fc ON r.FitnessCenterId = fc.CenterId
LEFT JOIN Session s ON r.FitnessCenterId = s.FitnessCenterId AND r.RoomNumber = s.RoomNumber
    AND YEARWEEK(s.SessionDate, 1) = YEARWEEK(CURDATE(), 1)
GROUP BY r.FitnessCenterId, r.RoomNumber, fc.Name
HAVING SessionsPerWeek <= 2;



-- ---Query as per specific date  -----------
SELECT r.FitnessCenterId, r.RoomNumber, fc.Name AS FitnessCenter, COUNT(s.SessionId) AS SessionsPerWeek
FROM Room r
JOIN FitnessCenter fc ON r.FitnessCenterId = fc.CenterId
LEFT JOIN Session s ON r.FitnessCenterId = s.FitnessCenterId AND r.RoomNumber = s.RoomNumber
    AND YEARWEEK(s.SessionDate, 1) = YEARWEEK('2024-07-01', 1)
GROUP BY r.FitnessCenterId, r.RoomNumber, fc.Name
HAVING SessionsPerWeek < 2;

-- 5. List members who have never participated in any session yet.
-- Uses: Member, SessionParticipation
SELECT m.PersonId, p.FirstName, p.LastName, p.Email, p.Phone, m.MembershipType
FROM Member m
JOIN Person p ON m.PersonId = p.PersonId
LEFT JOIN SessionParticipation sp ON m.PersonId = sp.PersonId
WHERE sp.SessionId IS NULL;



-- 6. Which fitness center has hosted the highest number of sessions in Q3 2024?

-- Which fitness center has hosted the highest number of sessions last quarter?

-- Uses: FitnessCenter, Session

-- ----- ---Query as per CURRENT date  ----------------
   SELECT fc.CenterId, fc.Name, COUNT(s.SessionId) AS NumSessions
   FROM FitnessCenter fc
   JOIN Room r ON fc.CenterId = r.FitnessCenterId
   JOIN Session s ON r.FitnessCenterId = s.FitnessCenterId AND r.RoomNumber = s.RoomNumber
   WHERE QUARTER(s.SessionDate) = QUARTER(DATE_SUB(CURDATE(), INTERVAL 1 QUARTER))
     AND YEAR(s.SessionDate) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 QUARTER))
   GROUP BY fc.CenterId, fc.Name
   ORDER BY NumSessions DESC
   LIMIT 1;

-- ---Query as per specific date  -----------
SELECT fc.CenterId, fc.Name, COUNT(s.SessionId) AS NumSessions
FROM FitnessCenter fc
JOIN Room r ON fc.CenterId = r.FitnessCenterId
JOIN Session s ON r.FitnessCenterId = s.FitnessCenterId AND r.RoomNumber = s.RoomNumber
WHERE QUARTER(s.SessionDate) = 3 AND YEAR(s.SessionDate) = 2024
GROUP BY fc.CenterId, fc.Name
ORDER BY NumSessions DESC
LIMIT 1;

-- 7. Show contact info of members with 'Premium' membership who have attended at least 3 to 5 group sessions.
-- Uses: Member, SessionParticipation, Session, SessionType
SELECT m.PersonId, p.FirstName, p.LastName, p.Email, p.Phone, m.MembershipType, COUNT(sp.SessionId) AS GroupSessionsAttended
FROM Member m
JOIN Person p ON m.PersonId = p.PersonId
JOIN SessionParticipation sp ON m.PersonId = sp.PersonId
JOIN Session s ON sp.SessionId = s.SessionId
WHERE m.MembershipType = 'Premium' AND s.SessionMode = 'group'
GROUP BY m.PersonId, p.FirstName, p.LastName, p.Email, p.Phone, m.MembershipType
HAVING GroupSessionsAttended >= 5;



-- 8. List all individual sessions that took place on a specific date across all centers.
-- Uses: Session, filter by those not supervised by trainers
-- Replace '2024-07-01' with your desired date
SELECT s.SessionId, s.SessionDate, s.StartTime, s.FitnessCenterId, s.RoomNumber
FROM Session s
WHERE s.SessionMode = 'individual' AND s.SessionDate = '2024-07-01';










-- 9. Identify trainers who haven't supervised any group session yet.
-- Uses: Trainer, Session
SELECT t.PersonId, p.FirstName, p.LastName, p.Email, p.Phone, t.Diploma
FROM Trainer t
JOIN Person p ON t.PersonId = p.PersonId
WHERE t.PersonId NOT IN (
    SELECT TrainerId FROM Session WHERE SessionMode = 'group' AND TrainerId IS NOT NULL
);


-- ---Alternative  query with status------


   SELECT t.PersonId, CONCAT(p.FirstName, ' ', p.LastName) AS TrainerName, p.Email, p.Phone, t.Diploma,
          'Not Yet Assigned to Group Session' AS Status
   FROM Trainer t
   JOIN Person p ON t.PersonId = p.PersonId
   WHERE t.PersonId NOT IN (
       SELECT TrainerId FROM Session WHERE SessionMode = 'group' AND TrainerId IS NOT NULL
   );
   

  
-- 10. Which session types are most frequently offered across all fitness centers?
-- Uses: Session, SessionType
SELECT st.Description AS SessionType, COUNT(s.SessionId) AS NumSessions
FROM SessionType st
JOIN Session s ON st.SessionTypeId = s.SessionTypeId
GROUP BY st.Description
ORDER BY NumSessions DESC; 