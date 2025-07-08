-- FitnessCenter (10 centers)
INSERT INTO FitnessCenter (CenterId, Name, Address, City) VALUES
('FC1', 'FitPlaza', '123 Main St', 'New York'),
('FC2', 'My6Pack', '456 Elm St', 'Boston'),
('FC3', 'PowerZone', '789 Oak Ave', 'Chicago'),
('FC4', 'FlexGym', '321 Maple Rd', 'San Francisco'),
('FC5', 'IronWorks', '654 Pine St', 'Seattle'),
('FC6', 'PulseFit', '987 Cedar Ave', 'Austin'),
('FC7', 'CoreZone', '222 Spruce St', 'Denver'),
('FC8', 'UrbanFit', '333 Willow Rd', 'Miami'),
('FC9', 'PeakGym', '444 Aspen Blvd', 'Portland'),
('FC10', 'ZenFitness', '555 Birch Ln', 'Atlanta');

-- Room (8 per center, 40 total)
INSERT INTO Room (FitnessCenterId, RoomNumber, Capacity) VALUES
('FC1', '101', 30),('FC1', '102', 25),('FC1', '103', 20),('FC1', '104', 35),('FC1', '105', 40),('FC1', '106', 15),('FC1', '107', 28),('FC1', '108', 22),
('FC2', '201', 30),('FC2', '202', 25),('FC2', '203', 20),('FC2', '204', 35),('FC2', '205', 40),('FC2', '206', 15),('FC2', '207', 28),('FC2', '208', 22),
('FC3', '301', 30),('FC3', '302', 25),('FC3', '303', 20),('FC3', '304', 35),('FC3', '305', 40),('FC3', '306', 15),('FC3', '307', 28),('FC3', '308', 22),
('FC4', '401', 30),('FC4', '402', 25),('FC4', '403', 20),('FC4', '404', 35),('FC4', '405', 40),('FC4', '406', 15),('FC4', '407', 28),('FC4', '408', 22),
('FC5', '501', 30),('FC5', '502', 25),('FC5', '503', 20),('FC5', '504', 35),('FC5', '505', 40),('FC5', '506', 15),('FC5', '507', 28),('FC5', '508', 22);

-- SessionType (10 types)
INSERT INTO SessionType (SessionTypeId, Description) VALUES
('ST1', 'Aerobics'),
('ST2', 'Bodybuilding'),
('ST3', 'Yoga'),
('ST4', 'Pilates'),
('ST5', 'CrossFit'),
('ST6', 'Spin'),
('ST7', 'Boxing'),
('ST8', 'Dance'),
('ST9', 'Meditation'),
('ST10', 'Stretching');

-- Person (P1-P65) with Email and Phone
INSERT INTO Person (PersonId, FirstName, LastName, BirthDate, Email, Phone) VALUES
('P1', 'Alice', 'Smith', '1990-01-01', 'alice.smith@email.com', '555-1001'),
('P2', 'Bob', 'Johnson', '1985-05-12', 'bob.johnson@email.com', '555-1002'),
('P3', 'Carol', 'Williams', '1992-07-23', 'carol.williams@email.com', '555-1003'),
('P4', 'David', 'Brown', '1988-03-15', 'david.brown@email.com', '555-1004'),
('P5', 'Eve', 'Jones', '1991-11-30', 'eve.jones@email.com', '555-1005'),
('P6', 'Frank', 'Garcia', '1987-09-10', 'frank.garcia@email.com', '555-1006'),
('P7', 'Grace', 'Martinez', '1993-04-18', 'grace.martinez@email.com', '555-1007'),
('P8', 'Hank', 'Rodriguez', '1989-06-25', 'hank.rodriguez@email.com', '555-1008'),
('P9', 'Ivy', 'Lee', '1994-12-05', 'ivy.lee@email.com', '555-1009'),
('P10', 'Jack', 'Walker', '1990-08-14', 'jack.walker@email.com', '555-1010'),
('P11', 'Kathy', 'Hall', '1986-02-22', 'kathy.hall@email.com', '555-1011'),
('P12', 'Leo', 'Allen', '1992-10-09', 'leo.allen@email.com', '555-1012'),
('P13', 'Mona', 'Young', '1985-07-17', 'mona.young@email.com', '555-1013'),
('P14', 'Nina', 'Hernandez', '1991-05-28', 'nina.hernandez@email.com', '555-1014'),
('P15', 'Oscar', 'King', '1988-11-03', 'oscar.king@email.com', '555-1015'),
('P16', 'Paul', 'Wright', '1993-01-19', 'paul.wright@email.com', '555-1016'),
('P17', 'Quinn', 'Lopez', '1987-03-27', 'quinn.lopez@email.com', '555-1017'),
('P18', 'Rita', 'Hill', '1990-09-21', 'rita.hill@email.com', '555-1018'),
('P19', 'Sam', 'Scott', '1989-12-13', 'sam.scott@email.com', '555-1019'),
('P20', 'Tina', 'Green', '1994-04-07', 'tina.green@email.com', '555-1020'),
('P21', 'Uma', 'Adams', '1986-06-16', 'uma.adams@email.com', '555-1021'),
('P22', 'Vince', 'Baker', '1991-08-23', 'vince.baker@email.com', '555-1022'),
('P23', 'Wendy', 'Nelson', '1987-10-30', 'wendy.nelson@email.com', '555-1023'),
('P24', 'Xander', 'Carter', '1992-12-11', 'xander.carter@email.com', '555-1024'),
('P25', 'Yara', 'Mitchell', '1989-02-05', 'yara.mitchell@email.com', '555-1025'),
('P26', 'Zane', 'Perez', '1990-05-20', 'zane.perez@email.com', '555-1026'),
('P27', 'Amy', 'Roberts', '1988-07-29', 'amy.roberts@email.com', '555-1027'),
('P28', 'Ben', 'Turner', '1993-09-15', 'ben.turner@email.com', '555-1028'),
('P29', 'Cindy', 'Phillips', '1985-11-25', 'cindy.phillips@email.com', '555-1029'),
('P30', 'Derek', 'Campbell', '1991-03-03', 'derek.campbell@email.com', '555-1030'),
('P31', 'Ella', 'Parker', '1987-12-19', 'ella.parker@email.com', '555-1031'),
('P32', 'Fred', 'Evans', '1992-06-08', 'fred.evans@email.com', '555-1032'),
('P33', 'Gina', 'Edwards', '1986-08-27', 'gina.edwards@email.com', '555-1033'),
('P34', 'Harry', 'Collins', '1990-10-16', 'harry.collins@email.com', '555-1034'),
('P35', 'Irene', 'Stewart', '1989-01-12', 'irene.stewart@email.com', '555-1035'),
('P36', 'Jake', 'Sanchez', '1994-03-22', 'jake.sanchez@email.com', '555-1036'),
('P37', 'Kara', 'Morris', '1988-05-31', 'kara.morris@email.com', '555-1037'),
('P38', 'Liam', 'Rogers', '1991-07-06', 'liam.rogers@email.com', '555-1038'),
('P39', 'Maya', 'Reed', '1987-09-18', 'maya.reed@email.com', '555-1039'),
('P40', 'Noah', 'Cook', '1993-11-24', 'noah.cook@email.com', '555-1040'),
('P41', 'Olga', 'Morgan', '1985-04-13', 'olga.morgan@email.com', '555-1041'),
('P42', 'Pete', 'Bell', '1992-08-02', 'pete.bell@email.com', '555-1042'),
('P43', 'Queen', 'Murphy', '1986-11-09', 'queen.murphy@email.com', '555-1043'),
('P44', 'Ray', 'Bailey', '1990-02-28', 'ray.bailey@email.com', '555-1044'),
('P45', 'Sara', 'Rivera', '1989-06-04', 'sara.rivera@email.com', '555-1045'),
('P46', 'Tom', 'Cooper', '1991-12-21', 'tom.cooper@email.com', '555-1046'),
('P47', 'Usha', 'Richardson', '1988-10-08', 'usha.richardson@email.com', '555-1047'),
('P48', 'Vera', 'Cox', '1993-05-13', 'vera.cox@email.com', '555-1048'),
('P49', 'Will', 'Howard', '1987-01-26', 'will.howard@email.com', '555-1049'),
('P50', 'Zoe', 'Ward', '1994-09-30', 'zoe.ward@email.com', '555-1050'),
('P51', 'Lydia', 'Foster', '1992-10-10', 'lydia.foster@email.com', '555-1051'),
('P52', 'Marcus', 'Bennett', '1989-08-22', 'marcus.bennett@email.com', '555-1052'),
('P53', 'Nora', 'Sims', '1991-04-17', 'nora.sims@email.com', '555-1053'),
('P54', 'Owen', 'Fleming', '1987-12-03', 'owen.fleming@email.com', '555-1054'),
('P55', 'Paula', 'Hicks', '1993-06-29', 'paula.hicks@email.com', '555-1055'),
('P56', 'Quentin', 'Moss', '1990-09-14', 'quentin.moss@email.com', '555-1056'),
('P57', 'Renee', 'Barker', '1988-11-21', 'renee.barker@email.com', '555-1057'),
('P58', 'Steve', 'Holt', '1994-01-05', 'steve.holt@email.com', '555-1058'),
('P59', 'Tara', 'Nash', '1992-03-12', 'tara.nash@email.com', '555-1059'),
('P60', 'Umar', 'Peters', '1986-07-18', 'umar.peters@email.com', '555-1060'),
('P61', 'Violet', 'Quinn', '1991-05-23', 'violet.quinn@email.com', '555-1061'),
('P62', 'Walt', 'Reeves', '1989-10-30', 'walt.reeves@email.com', '555-1062'),
('P63', 'Xenia', 'Sutton', '1993-02-14', 'xenia.sutton@email.com', '555-1063'),
('P64', 'Yusuf', 'Tate', '1988-08-27', 'yusuf.tate@email.com', '555-1064'),
('P65', 'Zara', 'Underwood', '1990-11-11', 'zara.underwood@email.com', '555-1065');

-- Member (P1-P35) with MembershipType
INSERT INTO Member (PersonId, MembershipType) VALUES
('P1', 'Premium'),('P2', 'Standard'),('P3', 'Student'),('P4', 'Premium'),('P5', 'Standard'),('P6', 'Student'),('P7', 'Premium'),('P8', 'Standard'),('P9', 'Student'),('P10', 'Premium'),
('P11', 'Standard'),('P12', 'Student'),('P13', 'Premium'),('P14', 'Standard'),('P15', 'Student'),('P16', 'Premium'),('P17', 'Standard'),('P18', 'Student'),('P19', 'Premium'),('P20', 'Standard'),
('P21', 'Student'),('P22', 'Premium'),('P23', 'Standard'),('P24', 'Student'),('P25', 'Premium'),('P26', 'Standard'),('P27', 'Student'),('P28', 'Premium'),('P29', 'Standard'),('P30', 'Student'),
('P31', 'Premium'),('P32', 'Standard'),('P33', 'Student'),('P34', 'Premium'),('P35', 'Standard');

-- Trainer (P36-P65, 30 trainers)
INSERT INTO Trainer (PersonId, Diploma) VALUES
('P36', 'Certified Personal Trainer'),('P37', 'Advanced Fitness Coach'),('P38', 'Yoga Instructor'),('P39', 'Pilates Specialist'),('P40', 'CrossFit Level 1'),
('P41', 'Strength & Conditioning'),('P42', 'Group Fitness Leader'),('P43', 'Wellness Coach'),('P44', 'Bodybuilding Pro'),('P45', 'Aerobics Expert'),
('P46', 'Sports Nutritionist'),('P47', 'Rehabilitation Trainer'),('P48', 'Functional Trainer'),('P49', 'Endurance Coach'),('P50', 'HIIT Specialist'),
('P51', 'Senior Fitness Specialist'),('P52', 'Martial Arts Instructor'),('P53', 'Spin Class Leader'),('P54', 'Dance Fitness Pro'),('P55', 'Meditation Guide'),
('P56', 'Stretching Coach'),('P57', 'Kickboxing Trainer'),('P58', 'Zumba Instructor'),('P59', 'TRX Specialist'),('P60', 'Bootcamp Leader'),
('P61', 'Aqua Fitness Coach'),('P62', 'Prenatal Fitness Expert'),('P63', 'Youth Fitness Coach'),('P64', 'Senior Yoga Instructor'),('P65', 'Functional Movement Specialist');

-- Session (45 sessions, distributed)
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S1', '101', 'FC1', '2024-07-01', '09:00:00', 'group', 'ST1', 'P36'),('S2', '102', 'FC1', '2024-07-01', '10:00:00', 'individual', 'ST2', NULL),
('S3', '103', 'FC1', '2024-07-02', '11:00:00', 'group', 'ST3', 'P37'),('S4', '104', 'FC1', '2024-07-02', '12:00:00', 'group', 'ST4', 'P38'),('S5', '105', 'FC1', '2024-07-03', '13:00:00', 'group', 'ST5', 'P39'),
('S6', '106', 'FC1', '2024-07-03', '14:00:00', 'individual', 'ST1', NULL),('S7', '107', 'FC1', '2024-07-04', '15:00:00', 'group', 'ST2', 'P40'),('S8', '108', 'FC1', '2024-07-04', '16:00:00', 'group', 'ST3', 'P41'),
('S9', '201', 'FC2', '2024-07-01', '09:00:00', 'group', 'ST4', 'P42'),('S10', '202', 'FC2', '2024-07-01', '10:00:00', 'individual', 'ST5', NULL),
('S11', '203', 'FC2', '2024-07-02', '11:00:00', 'group', 'ST1', 'P43'),('S12', '204', 'FC2', '2024-07-02', '12:00:00', 'group', 'ST2', 'P44'),('S13', '205', 'FC2', '2024-07-03', '13:00:00', 'group', 'ST3', 'P45'),
('S14', '206', 'FC2', '2024-07-03', '14:00:00', 'individual', 'ST4', NULL),('S15', '207', 'FC2', '2024-07-04', '15:00:00', 'group', 'ST5', 'P46'),('S16', '208', 'FC2', '2024-07-04', '16:00:00', 'group', 'ST1', 'P47'),
('S17', '301', 'FC3', '2024-07-01', '09:00:00', 'group', 'ST2', 'P48'),('S18', '302', 'FC3', '2024-07-01', '10:00:00', 'individual', 'ST3', NULL),
('S19', '303', 'FC3', '2024-07-02', '11:00:00', 'group', 'ST4', 'P49'),('S20', '304', 'FC3', '2024-07-02', '12:00:00', 'group', 'ST5', 'P50'),('S21', '305', 'FC3', '2024-07-03', '13:00:00', 'group', 'ST1', 'P36'),
('S22', '306', 'FC3', '2024-07-03', '14:00:00', 'individual', 'ST2', NULL),('S23', '307', 'FC3', '2024-07-04', '15:00:00', 'group', 'ST3', 'P37'),('S24', '308', 'FC3', '2024-07-04', '16:00:00', 'group', 'ST4', 'P38'),
('S25', '401', 'FC4', '2024-07-01', '09:00:00', 'group', 'ST5', 'P39'),('S26', '402', 'FC4', '2024-07-01', '10:00:00', 'individual', 'ST1', NULL),
('S27', '403', 'FC4', '2024-07-02', '11:00:00', 'group', 'ST2', 'P40'),('S28', '404', 'FC4', '2024-07-02', '12:00:00', 'group', 'ST3', 'P41'),('S29', '405', 'FC4', '2024-07-03', '13:00:00', 'group', 'ST4', 'P42'),
('S30', '406', 'FC4', '2024-07-03', '14:00:00', 'individual', 'ST5', NULL),('S31', '407', 'FC4', '2024-07-04', '15:00:00', 'group', 'ST1', 'P43'),('S32', '408', 'FC4', '2024-07-04', '16:00:00', 'group', 'ST2', 'P44'),
('S33', '501', 'FC5', '2024-07-01', '09:00:00', 'group', 'ST3', 'P45'),('S34', '502', 'FC5', '2024-07-01', '10:00:00', 'individual', 'ST4', NULL),
('S35', '503', 'FC5', '2024-07-02', '11:00:00', 'group', 'ST5', 'P46'),('S36', '504', 'FC5', '2024-07-02', '12:00:00', 'group', 'ST1', 'P47'),('S37', '505', 'FC5', '2024-07-03', '13:00:00', 'group', 'ST2', 'P48'),
('S38', '506', 'FC5', '2024-07-03', '14:00:00', 'individual', 'ST3', NULL),('S39', '507', 'FC5', '2024-07-04', '15:00:00', 'group', 'ST4', 'P49'),('S40', '508', 'FC5', '2024-07-04', '16:00:00', 'group', 'ST5', 'P50'),
('S41', '101', 'FC1', '2024-07-05', '09:00:00', 'group', 'ST1', 'P36'),('S42', '201', 'FC2', '2024-07-05', '10:00:00', 'group', 'ST2', 'P37'),('S43', '301', 'FC3', '2024-07-05', '11:00:00', 'group', 'ST3', 'P38'),
('S44', '401', 'FC4', '2024-07-05', '12:00:00', 'group', 'ST4', 'P39'),('S45', '501', 'FC5', '2024-07-05', '13:00:00', 'group', 'ST5', 'P40');

-- SessionParticipation (100+ participations, linking members to sessions)
INSERT INTO SessionParticipation (SessionId, PersonId) VALUES
('S1', 'P1'),('S1', 'P2'),('S1', 'P3'),('S2', 'P4'),('S2', 'P5'),('S3', 'P6'),('S3', 'P7'),('S3', 'P8'),('S4', 'P9'),('S4', 'P10'),
('S5', 'P11'),('S5', 'P12'),('S6', 'P13'),('S6', 'P14'),('S7', 'P15'),('S7', 'P16'),('S8', 'P17'),('S8', 'P18'),('S9', 'P19'),('S9', 'P20'),
('S10', 'P21'),('S10', 'P22'),('S11', 'P23'),('S11', 'P24'),('S12', 'P25'),('S12', 'P26'),('S13', 'P27'),('S13', 'P28'),('S14', 'P29'),('S14', 'P30'),
('S15', 'P31'),('S15', 'P32'),('S16', 'P33'),('S16', 'P34'),('S17', 'P35'),('S17', 'P1'),('S18', 'P2'),('S18', 'P3'),('S19', 'P4'),('S19', 'P5'),
('S20', 'P6'),('S20', 'P7'),('S21', 'P8'),('S21', 'P9'),('S22', 'P10'),('S22', 'P11'),('S23', 'P12'),('S23', 'P13'),('S24', 'P14'),('S24', 'P15'),
('S25', 'P16'),('S25', 'P17'),('S26', 'P18'),('S26', 'P19'),('S27', 'P20'),('S27', 'P21'),('S28', 'P22'),('S28', 'P23'),('S29', 'P24'),('S29', 'P25'),
('S30', 'P26'),('S30', 'P27'),('S31', 'P28'),('S31', 'P29'),('S32', 'P30'),('S32', 'P31'),('S33', 'P32'),('S33', 'P33'),('S34', 'P34'),('S34', 'P35'),
('S35', 'P1'),('S35', 'P2'),('S36', 'P3'),('S36', 'P4'),('S37', 'P5'),('S37', 'P6'),('S38', 'P7'),('S38', 'P8'),('S39', 'P9'),('S39', 'P10'),
('S40', 'P11'),('S40', 'P12'),('S41', 'P13'),('S41', 'P14'),('S42', 'P15'),('S42', 'P16'),('S43', 'P17'),('S43', 'P18'),('S44', 'P19'),('S44', 'P20'),
('S45', 'P21'),('S45', 'P22'); 


-- --ADHOC DATA MANIPULATION-----
-- QUESTION 10  Practical variation in session type distribution
-- Make Aerobics (ST1) the most frequent, Yoga (ST3) the least, others uneven

UPDATE Session SET SessionTypeId = 'ST1' WHERE SessionId IN ('S1','S2','S3','S4','S5','S6','S7','S8','S9','S10','S11','S12');
UPDATE Session SET SessionTypeId = 'ST2' WHERE SessionId IN ('S13','S14','S15','S16','S17','S18','S19','S20');
UPDATE Session SET SessionTypeId = 'ST3' WHERE SessionId IN ('S21','S22','S23');
UPDATE Session SET SessionTypeId = 'ST4' WHERE SessionId IN ('S24','S25','S26','S27','S28');
UPDATE Session SET SessionTypeId = 'ST5' WHERE SessionId IN ('S29','S30','S31','S32','S33','S34','S35');

-- QUESTION 5 ADHOC INSERTION OF RECORDS   ------

INSERT INTO Person (PersonId, FirstName, LastName, BirthDate, Email, Phone)
VALUES ('P100', 'Test', 'Inactive', '1990-01-01', 'inactive@email.com', '555-9999');

INSERT INTO Member (PersonId, MembershipType)
VALUES ('P100', 'Standard');

-- QUESTION9 : Manipulate Session data for more varied group session assignments
-- Assign a mix of PersonIds from P51, P53, P55, P57, P59, P61, P63, P65 to group sessions

UPDATE Session SET TrainerId = 'P51' WHERE SessionId = 'S18';
UPDATE Session SET TrainerId = 'P53' WHERE SessionId = 'S19';
UPDATE Session SET TrainerId = 'P55' WHERE SessionId = 'S20';
UPDATE Session SET TrainerId = 'P57' WHERE SessionId = 'S21';
UPDATE Session SET TrainerId = 'P59' WHERE SessionId = 'S22';
UPDATE Session SET TrainerId = 'P61' WHERE SessionId = 'S23';
UPDATE Session SET TrainerId = 'P63' WHERE SessionId = 'S24';
UPDATE Session SET TrainerId = 'P65' WHERE SessionId = 'S25';


-- QUESTION : 7 Adhoc insertion 

UPDATE Member SET MembershipType = 'Premium' WHERE PersonId = 'P1';
INSERT INTO SessionParticipation (SessionId, PersonId) VALUES
('S3', 'P1'),
('S4', 'P1');
INSERT INTO SessionParticipation (SessionId, PersonId) VALUES
('S6', 'P1'),
('S7', 'P1');


-- Make sure these are Premium members
UPDATE Member SET MembershipType = 'Premium' WHERE PersonId IN ('P4', 'P7', 'P10', 'P13');

-- Add participations (avoid duplicates)
INSERT IGNORE INTO SessionParticipation (SessionId, PersonId) VALUES
('S1', 'P4'), ('S2', 'P4'), ('S3', 'P4'), ('S4', 'P4'), ('S5', 'P4'),
('S1', 'P7'), ('S2', 'P7'), ('S3', 'P7'), ('S4', 'P7'), ('S5', 'P7'),
('S1', 'P10'), ('S2', 'P10'), ('S3', 'P10'), ('S4', 'P10'), ('S5', 'P10'),
('S1', 'P13'), ('S2', 'P13'), ('S3', 'P13'), ('S4', 'P13'), ('S5', 'P13');


-- Quesion 6 : Add sessions for Q1 2025, mostly for FC1
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S200', '101', 'FC1', '2025-01-10', '09:00:00', 'group', 'ST1', 'P36'),
('S201', '102', 'FC1', '2025-01-15', '10:00:00', 'group', 'ST2', 'P37'),
('S202', '103', 'FC1', '2025-02-05', '11:00:00', 'group', 'ST3', 'P38'),
('S203', '104', 'FC1', '2025-02-20', '12:00:00', 'group', 'ST4', 'P39'),
('S204', '105', 'FC1', '2025-03-01', '13:00:00', 'group', 'ST5', 'P40'),
('S205', '201', 'FC2', '2025-01-12', '09:00:00', 'group', 'ST1', 'P41'),
('S206', '202', 'FC2', '2025-02-18', '10:00:00', 'group', 'ST2', 'P42');


-- Add sessions for FC2, FC3, FC4 in Q1 2025
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S210', '201', 'FC2', '2025-01-12', '09:00:00', 'group', 'ST2', 'P37'),
('S211', '202', 'FC2', '2025-02-18', '10:00:00', 'group', 'ST3', 'P38'),
('S212', '203', 'FC2', '2025-03-05', '11:00:00', 'group', 'ST4', 'P39'),

('S220', '301', 'FC3', '2025-01-20', '09:00:00', 'group', 'ST1', 'P40'),
('S221', '302', 'FC3', '2025-02-25', '10:00:00', 'group', 'ST2', 'P41'),

('S230', '401', 'FC4', '2025-03-10', '09:00:00', 'group', 'ST3', 'P42');

-- Question5 : Add more inactive members (no session participation)
INSERT INTO Person (PersonId, FirstName, LastName, BirthDate, Email, Phone) VALUES
('P101', 'Jane', 'Doe', '1992-02-02', 'jane.doe@email.com', '555-8888'),
('P102', 'Mark', 'Stone', '1988-05-15', 'mark.stone@email.com', '555-7777'),
('P103', 'Priya', 'Singh', '1995-09-09', 'priya.singh@email.com', '555-6666'),
('P104', 'Carlos', 'Mendez', '1990-12-12', 'carlos.mendez@email.com', '555-5555'),
('P105', 'Linda', 'Nguyen', '1993-03-03', 'linda.nguyen@email.com', '555-4444');

INSERT INTO Member (PersonId, MembershipType) VALUES
('P101', 'Premium'),
('P102', 'Standard'),
('P103', 'Student'),
('P104', 'Premium'),
('P105', 'Standard');

-- Add more sessions for the current week (week of 2025-06-29) for more variation in SessionsPerWeek
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S450', '106', 'FC1', '2025-06-29', '09:00:00', 'group', 'ST1', 'P36'),
('S451', '106', 'FC1', '2025-07-01', '10:00:00', 'group', 'ST2', 'P37'),
('S452', '106', 'FC1', '2025-07-02', '11:00:00', 'group', 'ST3', 'P38'),
('S453', '106', 'FC1', '2025-07-03', '12:00:00', 'group', 'ST4', 'P39'),

('S454', '202', 'FC2', '2025-06-30', '09:00:00', 'group', 'ST1', 'P39'),
('S455', '202', 'FC2', '2025-07-03', '10:00:00', 'group', 'ST2', 'P40'),
('S456', '202', 'FC2', '2025-07-04', '11:00:00', 'group', 'ST3', 'P41'),

('S457', '302', 'FC3', '2025-07-01', '09:00:00', 'group', 'ST3', 'P41'),
('S458', '302', 'FC3', '2025-07-02', '10:00:00', 'group', 'ST4', 'P42'),

('S459', '408', 'FC4', '2025-07-01', '09:00:00', 'group', 'ST5', 'P43'),
('S460', '408', 'FC4', '2025-07-03', '10:00:00', 'group', 'ST1', 'P44'),
('S461', '408', 'FC4', '2025-07-04', '11:00:00', 'group', 'ST2', 'P45'),
('S462', '408', 'FC4', '2025-07-05', '12:00:00', 'group', 'ST3', 'P46'),

('S463', '505', 'FC5', '2025-07-02', '09:00:00', 'group', 'ST4', 'P47'),
('S464', '505', 'FC5', '2025-06-03', '10:00:00', 'group', 'ST5', 'P48');


-- Add sessions for FC5 (IronWorks) for the current week
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S800', '501', 'FC5', '2025-06-29', '09:00:00', 'group', 'ST1', 'P36'),
('S801', '503', 'FC5', '2025-07-01', '10:00:00', 'group', 'ST2', 'P37'),
('S802', '505', 'FC5', '2025-07-02', '11:00:00', 'group', 'ST3', 'P38'),
('S803', '507', 'FC5', '2025-07-03', '12:00:00', 'group', 'ST4', 'P39');


-- Add sessions for FC4 (FlexGym) for the current week
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S804', '404', 'FC4', '2025-07-01', '09:00:00', 'group', 'ST5', 'P40'),
('S805', '406', 'FC4', '2025-07-02', '10:00:00', 'group', 'ST1', 'P41');



-- FC5-503: 2 sessions
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S900', '503', 'FC5', '2025-06-29', '09:00:00', 'group', 'ST1', 'P36'),
('S901', '503', 'FC5', '2025-07-01', '10:00:00', 'group', 'ST2', 'P37');

-- FC5-505: 2 sessions
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S902', '505', 'FC5', '2025-06-30', '11:00:00', 'group', 'ST3', 'P38'),
('S903', '505', 'FC5', '2025-07-02', '12:00:00', 'group', 'ST4', 'P39');

-- FC4-404: 2 sessions
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S904', '404', 'FC4', '2025-07-01', '09:00:00', 'group', 'ST5', 'P40'),
('S905', '404', 'FC4', '2025-07-03', '10:00:00', 'group', 'ST1', 'P41');

-- FC4-406: 2 sessions
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S906', '406', 'FC4', '2025-07-02', '11:00:00', 'group', 'ST2', 'P42'),
('S907', '406', 'FC4', '2025-07-04', '12:00:00', 'group', 'ST3', 'P43');

-- FC5-507: 2 sessions
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S908', '507', 'FC5', '2025-07-01', '09:00:00', 'group', 'ST4', 'P44'),
('S909', '507', 'FC5', '2025-07-03', '10:00:00', 'group', 'ST5', 'P45');




-- QUESTION1 :  -- Add sessions in June 2025
INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S1000', '101', 'FC1', '2025-06-10', '09:00:00', 'group', 'ST1', 'P36'),
('S1001', '102', 'FC1', '2025-06-15', '10:00:00', 'group', 'ST2', 'P37'),
('S1002', '201', 'FC2', '2025-06-20', '11:00:00', 'group', 'ST3', 'P38'),
('S1003', '202', 'FC2', '2025-06-25', '12:00:00', 'group', 'ST4', 'P39');


-- Add participations for members in June 2025 sessions
INSERT INTO SessionParticipation (SessionId, PersonId) VALUES
('S1000', 'P1'),
('S1000', 'P2'),
('S1001', 'P1'),
('S1001', 'P3'),
('S1002', 'P2'),
('S1002', 'P4'),
('S1003', 'P1'),
('S1003', 'P2'),
('S1003', 'P3');


INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S1000', '101', 'FC1', '2025-06-10', '09:00:00', 'group', 'ST1', 'P36'),
('S1001', '102', 'FC1', '2025-06-15', '10:00:00', 'group', 'ST2', 'P37'),
('S1002', '201', 'FC2', '2025-06-20', '11:00:00', 'group', 'ST3', 'P38'),
('S1003', '202', 'FC2', '2025-06-25', '12:00:00', 'group', 'ST4', 'P39');


INSERT INTO Session (
    SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId
) VALUES (
    'S2000', '101', 'FC1', '2025-07-03', '09:00:00', 'group', 'ST1', 'P36'
);

INSERT INTO SessionParticipation (SessionId, PersonId)
VALUES ('S2000', 'P1');

INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S2001', '101', 'FC1', '2025-07-05', '10:00:00', 'group', 'ST1', 'P36'),
('S2002', '101', 'FC1', '2025-07-10', '11:00:00', 'group', 'ST1', 'P36');





INSERT INTO Session (SessionId, RoomNumber, FitnessCenterId, SessionDate, StartTime, SessionMode, SessionTypeId, TrainerId) VALUES
('S2000', '101', 'FC1', '2025-07-03', '09:00:00', 'group', 'ST1', 'P36'),
('S2001', '102', 'FC1', '2025-07-07', '10:00:00', 'group', 'ST2', 'P37'),
('S2002', '201', 'FC2', '2025-07-12', '11:00:00', 'group', 'ST3', 'P38'),
('S2003', '202', 'FC2', '2025-07-18', '12:00:00', 'group', 'ST4', 'P39');


INSERT INTO SessionParticipation (SessionId, PersonId) VALUES
('S2000', 'P10'),
('S2000', 'P11'),
('S2000', 'P12'),

('S2001', 'P10'),
('S2001', 'P13'),

('S2002', 'P11'),
('S2002', 'P12'),
('S2002', 'P13'),

('S2003', 'P10'),
('S2003', 'P11');