CREATE DATABASE Courses_Institute;
USE Courses_Institute;

--Task 1
  
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
FOREIGN KEY(Instructor_id) REFERENCES Instructors(Instructor_id)
);

CREATE TABLE Enrollment(
Enrollment_id INT PRIMARY KEY,
Student_id INT,
Course_id INT,
Enrollment_date DATE DEFAULT (CURRENT_DATE),
Grade INT CHECK (Grade BETWEEN 0 AND 100),
FOREIGN KEY(Course_id) REFERENCES Courses(Course_id)
);

--Task 2
  
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

--Task 3

SELECT * FROM courses
WHERE Price BETWEEN 20000 AND 50000;

SELECT * FROM Instructors
WHERE Email Like '%gmail.com';

SELECT * FROM courses
WHERE Instructor_id IN (1,3,5);

SELECT * FROM Courses 
ORDER BY Price DESC;

--Task 4

SELECT SUM(
       (SELECT Price
        FROM courses
        WHERE Courses.Course_id = Enrollment.Course_id)
        ) AS Total_Revenue
        FROM Enrollment;

SELECT Instructor_id, COUNT(*) AS Total_Courses
FROM courses
GROUP BY Instructor_id;

SELECT Instructor_id, COUNT(*) AS Total_Courses
FROM courses
GROUP BY Instructor_id
HAVING COUNT(*) > 2;

SELECT Course_id, AVG(Grade) AS Avg_Grade
FROM Enrollment 
GROUP BY Course_id;

--Task 5

SELECT First_Name, Course_Name
FROM  Instructors i
INNER JOIN Courses c
ON i.Instructor_id = c.Course_id
INNER JOIN Enrollment e
ON e.Course_id = c.Course_id;

SELECT 
Istructor_id, First_Name, Course_Name
FROM Instructors i
LEFT JOIN Courses c
ON i.Instructor_id = c.Instructor_id;

--Task 6

SELECT *
FROM Courses
WHERE Price < (
SELECT AVG(Price)
FROM Courses
);

WITH Revenue AS (
SELECT 
c.Course_id, c.Course_Name, c.Price * COUNT(*) AS Total_Revenue
FROM Courses c
JOIN Enrollment e
ON c.Course_id = e.Course_id
GROUP BY c.Course_id, c.Course_Name, c.Price
)
SELECT * 
FROM Revenue
WHERE Total_Revenue >= 50000;
