USE University;

CREATE TABLE Student (
    StudentId INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Phone NUMERIC(10,0),
    Email VARCHAR(50),
    DateOfBirth DATE,
    DateOfAdmission DATE,
    DateOfPassing DATE
);



select *from Student


ALTER TABLE Student
ADD PresentAddress VARCHAR(200);

--create 4 master table

-- a. Department table
CREATE TABLE Department (
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- b. Course table
CREATE TABLE Course (
    CourseId INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- c. Batch table
CREATE TABLE Batch (
    BatchId INT PRIMARY KEY,
    BatchName VARCHAR(50)
);

-- d. StudentStatus table
CREATE TABLE StudentStatus (
    StatusId INT PRIMARY KEY,
    StatusDesc VARCHAR(50)
);


ALTER TABLE Student
ADD DeptId INT,
    CourseId INT,
    BatchId INT,
    StatusId INT;


INSERT INTO Department (DeptId, DeptName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry');


INSERT INTO Course (CourseId, CourseName) VALUES
(1, 'Artificial Intelligence'),
(2, 'Statistics'),
(3, 'Quantum Physics'),
(4, 'Organic Chemistry');


INSERT INTO Batch (BatchId, BatchName) VALUES
(1, 'CSE-AI'),
(2, 'MATH-STAT'),
(3, 'PHYS-QP'),
(4, 'CHEM-ORG');

--9

INSERT INTO StudentStatus (StatusId, StatusDesc) VALUES
(1, 'active'),
(2, 'left'),
(3, 'completed'),
(4, 'suspended');

--10
INSERT INTO Student (StudentId, Name, Address, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId)
VALUES
(1, 'John Doe', '123 Elm St', 1234567890, 'john.doe@example.com', '1998-01-01', '2022-01-01', '2023-01-01', '123 Elm St', 1, 1, 1, 1),
(2, 'Jane Smith', '456 Maple St', 2345678901, 'jane.smith@example.com', '1997-02-02', '2021-01-01', '2023-01-01', '456 Maple St', 1, 1, 1, 3),
(3, 'Alice Johnson', '789 Oak St', 3456789012, 'alice.johnson@example.com', '1999-03-03', '2020-01-01', '2023-01-01', '789 Oak St', 2, 2, 2, 2),
(4, 'Bob Brown', '135 Pine St', 4567890123, 'bob.brown@example.com', '1996-04-04', '2019-01-01', '2022-01-01', '135 Pine St', 3, 3, 3, 3),
(5, 'Charlie White', '246 Cedar St', 5678901234, 'charlie.white@example.com', '2000-05-05', '2018-01-01', '2022-01-01', '246 Cedar St', 4, 4, 4, 3),
(6, 'Emily Davis', '357 Birch St', 6789012345, 'emily.davis@example.com', '1998-06-06', '2022-01-01', '2024-01-01', '357 Birch St', 1, 1, 1, 1),
(7, 'David Clark', '468 Walnut St', 7890123456, 'david.clark@example.com', '1997-07-07', '2021-01-01', '2024-01-01', '468 Walnut St', 2, 2, 2, 1),
(8, 'Sophia Lewis', '579 Spruce St', 8901234567, 'sophia.lewis@example.com', '1999-08-08', '2020-01-01', '2023-01-01', '579 Spruce St', 3, 3, 3, 2),
(9, 'James Walker', '680 Aspen St', 9012345678, 'james.walker@example.com', '2001-09-09', '2022-01-01', '2023-01-01', '680 Aspen St', 1, 1, 1, 1),
(10, 'Olivia Hall', '791 Redwood St', 1230984567, 'olivia.hall@example.com', '1998-10-10', '2020-01-01', '2023-01-01', '791 Redwood St', 1, 1, 1, 3);

--11
SELECT s.StudentId, s.Name, d.DeptName
FROM Student s
INNER JOIN Department d ON s.DeptId = d.DeptId;

SELECT c.CourseId, c.CourseName
FROM Course c
LEFT JOIN Student s ON c.CourseId = s.CourseId
WHERE s.CourseId IS NULL;

--13
SELECT s.StudentId, s.Name, s.StatusId
FROM Student s
LEFT JOIN StudentStatus ss ON s.StatusId = ss.StatusId
WHERE ss.StatusId IS NULL;

--14
SELECT s.StudentId, s.Name, s.StatusId, d.DeptName, b.BatchName
FROM Student s
INNER JOIN Department d ON s.DeptId = d.DeptId
INNER JOIN Batch b ON s.BatchId = b.BatchId
INNER JOIN StudentStatus ss ON s.StatusId = ss.StatusId
WHERE ss.StatusDesc = 'completed' 
  AND d.DeptName = 'Computer Science' 
  AND b.BatchName = 'CSE-AI';
