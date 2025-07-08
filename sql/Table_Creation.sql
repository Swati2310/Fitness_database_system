-- FitnessCenter Table
CREATE TABLE FitnessCenter (
    CenterId VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    City VARCHAR(100) NOT NULL
);

-- Room Table
CREATE TABLE Room (
    FitnessCenterId VARCHAR(50),
    RoomNumber VARCHAR(20),
    Capacity INT NOT NULL,
    PRIMARY KEY (FitnessCenterId, RoomNumber),
    FOREIGN KEY (FitnessCenterId) REFERENCES FitnessCenter(CenterId)
);

-- Person Table
CREATE TABLE Person (
    PersonId VARCHAR(50) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL
);

-- Member Table
CREATE TABLE Member (
    PersonId VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
);

-- Trainer Table
CREATE TABLE Trainer (
    PersonId VARCHAR(50) PRIMARY KEY,
    Diploma VARCHAR(100),
    FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
);

-- SessionType Table
CREATE TABLE SessionType (
    SessionTypeId VARCHAR(50) PRIMARY KEY,
    Description VARCHAR(200)
);

-- Session Table
CREATE TABLE Session (
    SessionId VARCHAR(50) PRIMARY KEY,
    RoomNumber VARCHAR(20),
    FitnessCenterId VARCHAR(50),
    SessionDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    SessionMode VARCHAR(20) NOT NULL,
    SessionTypeId VARCHAR(50),
    TrainerId VARCHAR(50),
    FOREIGN KEY (FitnessCenterId, RoomNumber) REFERENCES Room(FitnessCenterId, RoomNumber),
    FOREIGN KEY (SessionTypeId) REFERENCES SessionType(SessionTypeId),
    FOREIGN KEY (TrainerId) REFERENCES Trainer(PersonId)
);

-- SessionParticipation Table
CREATE TABLE SessionParticipation (
    SessionId VARCHAR(50),
    PersonId VARCHAR(50),
    PRIMARY KEY (SessionId, PersonId),
    FOREIGN KEY (SessionId) REFERENCES Session(SessionId),
    FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
);