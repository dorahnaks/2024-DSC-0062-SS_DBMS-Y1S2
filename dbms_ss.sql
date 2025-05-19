CREATE DATABASE dbms_final_exam;
USE dbms_final_exam;


-- QUESTION 3
CREATE TABLE animal (
	animal_id INT AUTO_INCREMENT PRIMARY KEY,
    animal_name VARCHAR(255),
    species VARCHAR(255),
    habitat_id INT
);

CREATE TABLE habitat (
	habitat_id INT AUTO_INCREMENT PRIMARY KEY,
    habitat_name VARCHAR(255),
    environment VARCHAR(255)
);

CREATE TABLE feeding_schedule (
	schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    food VARCHAR(255),
    feeding_time VARCHAR(255)
);

INSERT INTO animal (animal_name, species, habitat_id) VALUES
('Leo', 'Lion', 1) , ('Stripes', 'Tiger', 2), ('Polly', 'Parrot', 3), ('Slithers', 'Snake', 4);

INSERT INTO habitat (habitat_name, environment) VALUES
('Savannah', 'Grassland') , ('Tiger Trail', 'Forest') , 
('Bird Paradise', 'Tropical') , ('Reptile House', 'Temperate');

INSERT INTO feeding_schedule (animal_id, food, feeding_time) VALUES 
(1, 'Meat', '14:00') , (2, 'Chicken', '12:00') , (3, 'Seeds', '08:00') , 
(3, 'Fruits', '15:00') , (4, 'Mice', '20:00');

-- PART A
SELECT a.habitat_id, a.animal_name , h.habitat_name
FROM animal as a
JOIN habitat as h
ON a.habitat_id = h.habitat_id;

-- PART B
SELECT food, COUNT(food) AS Total_num_of_feeding
FROM feeding_schedule
GROUP BY food;

-- PART C
SELECT a.animal_id, a.animal_name , f.animal_id,COUNT(f.animal_id) as num_of_times_fed
FROM animal as a
JOIN feeding_schedule as f 
ON a.animal_id = f.animal_id
GROUP BY a.animal_id;


-- QUESTION 1 PART E
CREATE TABLE student (
	StudentName VARCHAR(255),
    StudentID INT,
    Birthdate VARCHAR(255),
    Year VARCHAR(255),
    MobileNo VARCHAR(255)
);

CREATE TABLE Finance (
	StudentID INT,
    Tuition_Fee INT,
    Administration_Fee INT,
    Exam_Fee INT,
    Medical_Fee INT
);

INSERT INTO student (StudentName,  StudentID, Birthdate, Year,  MobileNo) VALUES
('Jane', 235, '12/1/1987', 'Y1S2', '0722245321'), ('Nicholas', 26, '22/7/2002', 'Y1S1', '0720458674'),
('Cyrus', 1, '15/6/1989', 'Y2S1', '0704231345'), ('Neema', 2, '29/11/2008', 'Y2S1', '0733876987'), 
('Caroline', 3, '18/10/2002', 'Y1S1', '0732568448'), ('Judith', 29, '17/6/2003', 'Y4S2', '0711234567'), 
('Grace', 127, '14/1/2000', 'Y1S2', '0733765987');

INSERT INTO Finance (StudentID, Tuition_Fee, Administration_Fee, Exam_Fee, Medical_Fee) VALUES
(235, 30000, 5000, 3000, 4000) , (26, 40000, 5000, 2000, 4000) , (1, 34000, 5000, 3000, 4000) ,
(2, 23000, 5000, 3000, 4000), (3, 20000, 5000, 3000, 4000) , (29, 35000, 5000, 2000, 4000) ,
(127, 28000, 5000, 3000, 4000);

-- PART II
SELECT s.StudentID, s.StudentName,  s.Year, f.Tuition_Fee
FROM  student as s, Finance as f
WHERE Year = 'Y1S1';

-- PART III
SELECT s.StudentName, s.StudentID, s.Year
FROM  student as s
JOIN (
	SELECT f.StudentID, f.Tuition_Fee
	FROM Finance as f
	WHERE Tuition_Fee >= 30000
)tuition_abv
ON tuition_abv.StudentID = s.StudentID;

-- PART IV
INSERT INTO student (StudentName, Birthdate, Year,  MobileNo) VALUES
('Dan', '20/4/2001', 'Y1S2', '0723456123');

-- PART V
UPDATE student
SET StudentName ='Nelson'
WHERE StudentID = 26;

-- PART VI
SELECT MAX(Tuition_Fee) AS Highest_Amount, MIN(Tuition_Fee) AS lowest_Amount
FROM Finance;

-- QUESTION 4 PART B
CREATE TABLE Student_2 (
	code VARCHAR(255),
    Stud_id INT,
    Name VARCHAR(255)
);

CREATE TABLE Course (
	Code VARCHAR(255),
    Title VARCHAR(255)
);

INSERT INTO Student_2 (code, Stud_id, Name) VALUES
('IMIS', 001, 'Damaris') , ('BIT', 002, 'Okal') , 
('BIT', 003, 'Kahuria') , ('CIT', 004, 'Mwangi');

INSERT INTO Course (Code, Title) VALUES
('IMIS', 'Info. Systems') , ('BIT', 'Bachelor of IT') ,
('CIT', 'Cert in IT') , ('DIT', 'Dip in IT');

-- PART I
SELECT s.code, s.Stud_id, Name AS students
FROM Student_2 AS s
RIGHT JOIN (
	SELECT Code, Title
    FROM Course 
)tbl_course
ON s.code = tbl_course.Code;

-- PART II
INSERT INTO Student_2 (code, Stud_id, Name) VALUES
('IMIS', 001, 'Damaris') , ('BIT', 002, 'Okal') , 
('BIT', 003, 'Kahuria') , ('CIT', 004, 'Mwangi');

-- PART III
UPDATE student
SET Name ='NewName'
WHERE StudentID = 002;

-- PART IV
DELETE FROM students;


-- PART C
SELECT Code, Title
FROM Course 
ORDER BY Code