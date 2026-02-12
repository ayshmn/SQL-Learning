CREATE DATABASE Courses_Institute;
USE Courses_Institute;

CREATE TABLE Instructors(
Instructor_id INT auto_increment PRIMARY KEY,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Email VARCHAR(100) UNIQUE
);

CREATE TABLE Courses(
Course_id INT PRIMARY KEY,
Course_Name VARCHAR(100) NOT NULL,
Price Decimal(10,2) CHECK (Price>=0),
Instructor_id INT,
FOREIGN KEY(Instructor_id) REFERENCES Instructors(Istructor_id)
);

CREATE TABLE Enrollment(
Enrollment_id INT PRIMARY KEY,
Student_id INT,
Course_id INT,
Enrollment_date DATE DEFAULT (CURRENT_DATE),
Grade INT CHECK (Grade BETWEEN 0 AND 100),
FOREIGN KEY(Course_id) REFERENCES Courses(Course_id)
);

INSERT INTO Instructors (First_Name, Last_Name, Email)
VALUES
('Ayesha','M','ayesha@gmail.com'),
('Azeem','M','azeem@gamil.com'),
('Ameena','M','ameena@yahoo.com');

SELECT * FROM Instructors;

INSERT INTO Courses(Course_id, Course_Name, Price, Instructor_id)
VALUES
(01, 'Python', 20000.00, 1),
(02, 'SQL Mastery', 30000.00, 2),
(03, 'Web Developement', 60000.00, 2),
(04, 'Data Analysis', 20000.00, 1),
(05, 'Data Engineering', 50000.00, 1);

SELECT * FROM Courses;

INSERT INTO Enrollment (Enrollment_id, Student_id, Course_id, Grade)
VALUES
(101, 001, 01, 90),
(102, 002, 02, 80),
(103, 003, 03, 70),
(104, 004, 04, 60);

SELECT * FROM Enrollment;

UPDATE Courses
SET Price = Price * 1.10
WHERE Course_id = 2; 

DELETE FROM Enrollment
WHERE Enrollment_id = 101;

SELECT * FROM courses
WHERE Price BETWEEN 20000 AND 50000;

SELECT * FROM Instructors
WHERE Email Like '%gmail.com';

SELECT * FROM courses
WHERE Instructor_id IN (1,3,5);

SELECT * FROM Courses 
ORDER BY Price DESC;