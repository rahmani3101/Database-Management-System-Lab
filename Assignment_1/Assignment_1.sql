CREATE DATABASE University;

USE University;

CREATE TABLE Student (
    StudentId INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Phone NUMERIC(10,0),
    Email VARCHAR(50),
    DateOfBirth DATE,
    DateOfAdmission DATE,
    DateOfPassing DATE,
    DeptName VARCHAR(50),
    CourseName VARCHAR(50),
    BatchName VARCHAR(10),
    StudentStatus VARCHAR(10) CHECK (StudentStatus IN ('active', 'left', 'completed'))
);

INSERT INTO Student (StudentId, Name, Address, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, DeptName, CourseName, BatchName, StudentStatus)
VALUES 
(1, 'John Doe', '123 Elm St', 1234567890, 'john.doe@example.com', '1998-01-01', '2022-01-01', '2023-01-01', 'Computer Science', 'AI', 'CSE-AI', 'active'),
(2, 'Jane Smith', '456 Maple St', 2345678901, 'jane.smith@example.com', '1997-02-02', '2021-01-01', '2023-01-01', 'Computer Science', 'AI', 'CSE-AI', 'active'),
(3, 'Alice Johnson', '789 Oak St', 3456789012, 'alice.johnson@example.com', '1999-03-03', '2020-01-01', '2023-01-01', 'Mathematics', 'Statistics', 'MATH-STAT', 'left'),
(4, 'Bob Brown', '135 Pine St', 4567890123, 'bob.brown@example.com', '1996-04-04', '2019-01-01', '2022-01-01', 'Physics', 'Quantum Physics', 'PHYS-QP', 'completed'),
(5, 'Charlie White', '246 Cedar St', 5678901234, 'charlie.white@example.com', '2000-05-05', '2018-01-01', '2022-01-01', 'Biology', 'Microbiology', 'BIO-MICRO', 'completed'),
(6, 'Emily Davis', '357 Birch St', 6789012345, 'emily.davis@example.com', '1998-06-06', '2022-01-01', '2024-01-01', 'Chemistry', 'Organic Chemistry', 'CHEM-ORG', 'active'),
(7, 'David Clark', '468 Walnut St', 7890123456, 'david.clark@example.com', '1997-07-07', '2021-01-01', '2024-01-01', 'Computer Science', 'AI', 'CSE-AI', 'active'),
(8, 'Sophia Lewis', '579 Spruce St', 8901234567, 'sophia.lewis@example.com', '1999-08-08', '2020-01-01', '2023-01-01', 'English', 'Literature', 'ENG-LIT', 'left'),
(9, 'James Walker', '680 Aspen St', 9012345678, 'james.walker@example.com', '2001-09-09', '2022-01-01', '2023-01-01', 'History', 'Modern History', 'HIST-MOD', 'active'),
(10, 'Olivia Hall', '791 Redwood St', 1230984567, 'olivia.hall@example.com', '1998-10-10', '2020-01-01', '2023-01-01', 'Computer Science', 'AI', 'CSE-AI', 'active');


UPDATE Student
SET StudentStatus = 'completed'
WHERE BatchName = 'CSE-AI';


DELETE FROM Student
WHERE DeptName = '';


SELECT * FROM Student;

SELECT * FROM Student
WHERE StudentStatus <> 'completed';

TRUNCATE TABLE Student;

SELECT * FROM Student;

DROP TABLE Student;
