Select * From FitnessCenter;
Select * From Member;
Select * From Person;
Select * From Room;
Select * From Session;
Select * From SessionParticipation;
Select * From SessionType;
Select * from Trainer;
-- 1. Add Contact Info to Person Table
ALTER TABLE Person ADD COLUMN Email VARCHAR(100);
ALTER TABLE Person ADD COLUMN Phone VARCHAR(20);

-- 2. Add MembershipType to Member Table

ALTER TABLE Member ADD COLUMN MembershipType VARCHAR(50);

INSERT INTO Person (PersonId, FirstName, LastName, BirthDate, Email, Phone) VALUES
('P1', 'Alice', 'Smith', '1990-01-01', 'alice.smith@email.com', '555-1234'),
('P2', 'Bob', 'Johnson', '1985-05-12', 'bob.johnson@email.com', '555-5678');
-- etc.

INSERT INTO Member (PersonId, MembershipType) VALUES
('P1', 'Premium'),
('P2', 'Standard');
-- etc.