CREATE DATABASE EDUCATION
USE EDUCATION 

CREATE TABLE INSTRUCTORS ( 
    InstructorID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
);

INSERT INTO INSTRUCTORS VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21'); 

SELECT * FROM INSTRUCTORS




CREATE TABLE CATEGORIES ( 
    CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(50) 
);

INSERT INTO CATEGORIES VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business');

SELECT * FROM CATEGORIES




CREATE TABLE COURSES ( 
    CourseID INT PRIMARY KEY, 
    Title VARCHAR(100), 
    InstructorID INT, 
    CategoryID INT, 
    Price DECIMAL(6,2), 
    PublishDate DATE, 
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 

INSERT INTO COURSES VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01'); 

SELECT * FROM COURSES
SWLECR





CREATE TABLE STUDENTS ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
);

INSERT INTO STUDENTS VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10');

SELECT * FROM STUDENTS



CREATE TABLE ENROLLMENTS ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollDate DATE, 
    CompletionPercent INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
);

INSERT INTO ENROLLMENTS VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3);

SELECT * FROM ENROLLMENTS

---------------------------------------------------------------------------
--1
SELECT COUNT (*) FROM STUDENTS;
--2
SELECT COUNT (*) FROM ENROLLMENTS;
--3
SELECT  AVG (Rating) AS AvgRating,CourseID FROM ENROLLMENTS
GROUP BY CourseID
--4
SELECT COUNT (CourseID) AS Total_Courses, InstructorID FROM COURSES
GROUP BY InstructorID
--5
SELECT COUNT (CourseID) AS Total_Courses, CategoryID FROM COURSES
GROUP BY CategoryID
--6
SELECT COUNT (StudentID) AS Total_Students, CourseID FROM Enrollments
GROUP BY CourseID
--7
SELECT  AVG (Price) AS AveragePrice,CategoryID FROM COURSES
GROUP BY CategoryID
--8
SELECT MAX (Price) FROM COURSES
--9
SELECT MIN (Rating) AS MinRating, MAX (Rating) AS MaxRating, AVG (Rating) AS AvgRating FROM Enrollments
--10
SELECT COUNT (StudentID) AS Total_Students, Rating FROM Enrollments
GROUP BY Rating
HAVING Rating = 5