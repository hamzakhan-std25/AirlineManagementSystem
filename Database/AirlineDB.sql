CREATE DATABASE IF NOT EXISTS AirlineDB;
USE AirlineDB;

CREATE TABLE Loyalty_Program (
    Loyalty_ID INT PRIMARY KEY AUTO_INCREMENT,
    Program_Name VARCHAR(100),
    Miles_Earned INT,
    Membership_Level VARCHAR(50)
);

CREATE TABLE Passenger (
    Passenger_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Passport_No VARCHAR(50) NOT NULL,
    Loyalty_ID INT,
    FOREIGN KEY (Loyalty_ID) REFERENCES Loyalty_Program(Loyalty_ID)
);

CREATE TABLE Airport (
    Airport_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    Code VARCHAR(10)
);

CREATE TABLE Flight (
    Flight_ID INT PRIMARY KEY AUTO_INCREMENT,
    Airline_Name VARCHAR(100),
    Source INT,
    Destination INT,
    Departure_Time DATETIME,
    Arrival_Time DATETIME,
    FOREIGN KEY (Source) REFERENCES Airport(Airport_ID),
    FOREIGN KEY (Destination) REFERENCES Airport(Airport_ID)
);

CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Passenger_ID INT,
    Flight_ID INT,
    Booking_Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Booking_ID INT UNIQUE,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    Payment_Method VARCHAR(50),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);

CREATE TABLE Seat (
    Seat_ID INT PRIMARY KEY AUTO_INCREMENT,
    Flight_ID INT,
    Seat_Number VARCHAR(10),
    Class VARCHAR(50),
    Availability_Status VARCHAR(20),
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
    UNIQUE (Flight_ID, Seat_Number)
);

CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Contact_Number VARCHAR(20),
    Assigned_Flight_ID INT,
    FOREIGN KEY (Assigned_Flight_ID) REFERENCES Flight(Flight_ID)
);

CREATE TABLE Baggage (
    Baggage_ID INT PRIMARY KEY AUTO_INCREMENT,
    Booking_ID INT,
    Weight DECIMAL(5,2),
    Baggage_Tag VARCHAR(50),
    Baggage_Status VARCHAR(50),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);

-- insert some data
 
INSERT INTO Loyalty_Program (Program_Name, Miles_Earned, Membership_Level)
VALUES ('SkyRewards', 10000, 'Silver');

INSERT INTO Passenger (Name, Email, Phone, Passport_No, Loyalty_ID)
VALUES 
('Khan', 'khan@example.com', '03001234567', 'PK987654', 1),
('Ali Raza', 'ali@example.com', '03111234567', 'PK123321', 1),
('Sara Noor', 'sara@example.com', '03219876543', 'PK567890', 1);
