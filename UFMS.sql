-- Active: 1697829636522@@127.0.0.1@3306@ufms
CREATE DATABASE ufms

 CREATE Table Students(
    StudentID int PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
DateOfBirth date,
Gender enum("Male","Female"),
ContactNumber VARCHAR(30),
Email VARCHAR(20),
Address VARCHAR(30),
AdmissionDate DATE
 )

 CREATE TABLE Courses(
    CourseCode VARCHAR(10) PRIMARY key,
CourseName VARCHAR(30),
Department VARCHAR(30),
Credits FLOAT,
Semester VARCHAR(10)
 )

 CREATE Table Semesters(
SemesterName VARCHAR(10) PRIMARY KEY,
StartDate DATE,
EndDate DATE
 )

 CREATE Table Enrollment(
    EnrollmentID int Primary Key,
StudentID int,
CourseCode VARCHAR(10),
SemesterName VARCHAR(10),
EnrollmentDate DATE,
Foreign Key (StudentID) REFERENCES Students(StudentID) on delete CASCADE,
Foreign Key (CourseCode) REFERENCES Courses(CourseCode) on delete CASCADE,
Foreign Key (SemesterName) REFERENCES Semesters(SemesterName) on delete CASCADE
 )

CREATE Table IF NOT EXISTS Fees(
 FeeID int Primary Key,
StudentID int,
SemesterName VARCHAR(10),
CourseCode VARCHAR(10),
TotalFee int,
PaymentStatus enum("Paid","Unpaid"),
Foreign Key (StudentID) REFERENCES Students(StudentID) on delete CASCADE,
Foreign Key (CourseCode) REFERENCES Courses(CourseCode) on delete CASCADE,
Foreign Key (SemesterName) REFERENCES Semesters(SemesterName) on delete CASCADE 
)

CREATE Table if not exists FeeTransactions(
TransactionID int Primary Key NOT NULL,
StudentID int,
SemesterName VARCHAR(10),
TransactionDate date,
TransactionAmount int,
TransactionMethod varchar(10),
Foreign Key (StudentID) REFERENCES Students(StudentID) on delete CASCADE,
Foreign Key (SemesterName) REFERENCES Semesters(SemesterName) on delete CASCADE
)

CREATE Table if not exists Scholarships(
    ScholarshipID int Primary Key,
StudentID int,
Amount int NOT NULL,
ExpiryDate date,
cgpa FLOAT,
Foreign Key (StudentID) REFERENCES Students(StudentID) on delete CASCADE
)


INSERT INTO Students
VALUES
(1, 'Abdul', 'Rahman', '1992-05-15', 'Male', '01812345678', 'abdul.rahman@ex.com', '123 Dhaka Road, Dhaka', '2022-09-01'),
(2, 'Fatima', 'Akhtar', '1994-08-20', 'Female', '01789654321', 'fatima.akhtar@ex.com', '456 Ctg Street, Ctg', '2022-09-02'),
(3, 'Rahim', 'Ali', '1991-11-18', 'Male', '01555789123', 'rahim.ali@ex.com', '789 Sylhet Lane, Sylhet', '2022-09-03'),
(4, 'Ayesha', 'Chowdhury', '1993-04-25', 'Female', '01111222333', 'ayeshachowdhury@.com', '101 Rajshahi Ave, Rajshahi', '2022-09-04'),
(5, 'Ismail', 'Khan', '1994-09-08', 'Male', '01999888777', 'ismail.khan@ex.com', '222 Khulna Street, Khulna', '2022-09-05'),
(6, 'Nadia', 'Begum', '1995-02-14', 'Female', '01444333222', 'nadia.begum@ex.com', '333 Barisal Road, Barisal', '2022-09-06'),
(7, 'Shafiq', 'Ahmed', '1990-07-30', 'Male', '01777666555', 'shafiq.ahmed@ex.com', '444 Comilla Lane, Comilla', '2022-09-07'),
(8, 'Tahmina', 'Khatun', '1992-12-22', 'Female', '01333444555', 'tahminakhatun@.com', '555 Feni Street, Feni', '2022-09-08'),
(9, 'Aminul', 'Islam', '1993-06-03', 'Male', '01222111000', 'aminul.islam@ex.com', '666 Tangail Road, Tangail', '2022-09-09'),
(10, 'Nazia', 'Jahan', '1994-01-10', 'Female', '01999555111', 'nazia.jahan@ex.com', '777 Bogura Street, Bogura', '2022-09-10'),
(11, 'Sohel', 'Akhtar', '1993-03-12', 'Male', '01712345678', 'sohel.akhtar@ex.com', '789 Jessore Road, Jessore', '2022-09-11'),
(12, 'Amina', 'Begum', '1995-06-18', 'Female', '01988654321', 'amina.begum@ex.com', '456 Mymensingh St, Mymensingh', '2022-09-12'),
(13, 'Kamal', 'Hossain', '1991-10-22', 'Male', '01888789123', 'kamalhossain@.com', 'Narayanganj Ave, Narayanganj', '2022-09-13'),
(14, 'Fahima', 'Chowdhury', '1994-02-05', 'Female', '01555222333', 'fahimachowdhury@.com', '222 Kushtia, Kushtia', '2022-09-14'),
(15, 'Rafiq', 'Khan', '1995-07-28', 'Male', '01699888777', 'rafiq.khan@.com', '333 Rajbari Street, Rajbari', '2022-09-15'),
(16, 'Nasima', 'Begum', '1992-01-03', 'Female', '01777333222', 'nasima.begum@ex.com', '444 Noakhali Road, Noakhali', '2022-09-16'),
(17, 'Jamil', 'Ahmed', '1990-04-17', 'Male', '01999666555', 'jamil.ahmed@ex.com', '555 Rangpur Lane, Rangpur', '2022-09-17'),
(18, 'Shirin', 'Khatun', '1992-11-30', 'Female', '01833444555', 'shirin.khatun@ex.com', '666 Barisal Street, Barisal', '2022-09-18'),
(19, 'Mominul', 'Islam', '1994-04-08', 'Male', '01722111000', 'mominul.islam@ex.com', '777 Khulna Road, Khulna', '2022-09-19'),
(20, 'Taslima', 'Jahan', '1991-09-26', 'Female', '01955555111', 'taslima.jahan@ex.com', '888 Chandpur Street, Chandpur', '2022-09-20')


INSERT INTO Courses
VALUES
('CSE101', 'Introduction to CSE', 'CSE', 3.0, 'Fall'),
('CSE202', 'Data Structures', 'CSE', 3.0, 'Spring'),
('CSE303', 'Algorithms', 'CSE', 3.0, 'Summer'),
('CSE404', 'Database Management Systems', 'CSE', 3.0, 'Fall'),
('CSE505', 'Machine Learning', 'CSE', 3.0, 'Spring'),
('CSEL101', 'Computer Science Lab I', 'CSE', 1.5, 'Fall'),
('CSEL202', 'Data Structures Lab', 'CSE', 1.5, 'Spring'),
('CSEL303', 'Algorithms Lab', 'CSE', 1.5, 'Summer'),
('TEX101', 'Introduction to TexE', 'TEX', 3.0, 'Fall'),
('TEX202', 'Tex Manufacturing Processes', 'TEX', 3.0, 'Spring'),
('TEX303', 'Textile Quality Control', 'TEX', 3.0, 'Summer'),
('TEX404', 'Tex Design and Innovation', 'TEX', 3.0, 'Fall'),
('TEX505', 'Advanced Text Engineering', 'TEX', 3.0, 'Spring'),
('TEXL101', 'Textile Engineering Lab I', 'TEX', 1.5, 'Fall'),
('TEXL202', 'Textile Manufacturing Lab', 'TEX', 1.5, 'Spring'),
('TEXL303', 'Textile Quality Lab', 'TEX', 1.5, 'Summer'),
('EEE101', 'Introduction to EEE', 'EEE', 3.0, 'Fall'),
('EEE202', 'Circuit Analysis', 'EEE', 3.0, 'Spring'),
('EEE303', 'Electronics', 'EEE', 3.0, 'Summer'),
('EEE404', 'Power Systems', 'EEE', 3.0, 'Fall'),
('EEE505', 'Renewable Energy Systems', 'EEE', 3.0, 'Spring'),
('EEEL101', 'Electrical Engineering Lab I', 'EEE', 1.5, 'Fall'),
('EEEL202', 'Circuit Analysis Lab', 'EEE', 1.5, 'Spring'),
('EEEL303', 'Electronics Lab', 'EEE', 1.5, 'Summer'),
('BBA101', 'Introduction to BA', 'BBA', 3.0, 'Fall'),
('BBA202', 'Marketing Management', 'BBA', 3.0, 'Spring'),
('BBA303', 'Financial Accounting', 'BBA', 3.0, 'Summer'),
('BBA404', 'Human Resource Management', 'BBA', 3.0, 'Fall'),
('BBA505', 'Strategic Management', 'BBA', 3.0, 'Spring'),
('LAW101', 'Introduction to Law', 'LAW', 3.0, 'Fall'),
('LAW202', 'Criminal Law', 'LAW', 3.0, 'Spring'),
('LAW303', 'Constitutional Law', 'LAW', 3.0, 'Summer'),
('LAW404', 'International Law', 'LAW', 3.0, 'Fall'),
('LAW505', 'Legal Ethics', 'LAW', 3.0, 'Spring')

INSERT INTO Semesters (SemesterName, StartDate, EndDate)
VALUES
('Fall2020', '2020-09-01', '2020-12-20'),
('Spring2021', '2021-01-10', '2021-05-10'),
('Summer2021', '2021-06-01', '2021-08-15'),
('Fall2021', '2021-09-01', '2021-12-20'),
('Spring2022', '2022-01-10', '2022-05-10'),
('Summer2022', '2022-06-01', '2022-08-15'),
('Fall2022', '2022-09-01', '2022-12-20'),
('Spring2023', '2023-01-10', '2023-05-10'),
('Summer2023', '2023-06-01', '2023-08-15'),
('Fall2023', '2023-09-01', '2023-12-20'),
('Spring2024', '2024-01-10', '2024-05-10'),
('Summer2024', '2024-06-01', '2024-08-15'),
('Fall2024', '2024-09-01', '2024-12-20')

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseCode, SemesterName, EnrollmentDate)
VALUES
(101, 1, 'CSE101', 'Fall2020', '2020-09-02'),
(102, 2, 'TEX202', 'Spring2021', '2021-01-15'),
(103, 3, 'EEE303', 'Summer2021', '2021-06-05'),
(104, 4, 'BBA202', 'Fall2021', '2021-09-12'),
(105, 5, 'LAW303', 'Spring2022', '2022-02-20'),
(106, 6, 'CSE404', 'Summer2022', '2022-06-10'),
(107, 7, 'TEX404', 'Fall2022', '2022-09-25'),
(108, 8, 'EEE505', 'Spring2023', '2023-01-05'),
(109, 9, 'BBA404', 'Summer2023', '2023-06-15'),
(110, 10, 'LAW505', 'Fall2023', '2023-09-30'),
(111, 1, 'CSE202', 'Fall2020', '2020-09-02'),
(112, 2, 'TEX303', 'Spring2021', '2021-01-15'),
(113, 3, 'EEE202', 'Summer2021', '2021-06-05'),
(114, 4, 'BBA303', 'Fall2021', '2021-09-12'),
(115, 5, 'LAW202', 'Spring2022', '2022-02-20'),
(116, 6, 'CSE303', 'Summer2022', '2022-06-10'),
(117, 7, 'TEX505', 'Fall2022', '2022-09-25'),
(118, 8, 'EEE404', 'Spring2023', '2023-01-05'),
(119, 9, 'BBA505', 'Summer2023', '2023-06-15'),
(120, 10, 'LAW404', 'Fall2023', '2023-09-30')


INSERT INTO Fees (FeeID, StudentID, SemesterName, CourseCode,TotalFee, PaymentStatus)
VALUES
(201, 1, 'Fall2020', 'CSE101',5900, 'Paid'),
(202, 2, 'Spring2021', 'TEX202', 6700, 'Unpaid'),
(203, 3, 'Summer2021', 'EEE303',6300, 'Paid'),
(204, 4, 'Fall2021', 'BBA202',7100, 'Paid'),
(205, 5, 'Spring2022', 'LAW303',6350, 'Unpaid'),
(206, 6, 'Summer2022', 'CSE404',6750, 'Paid'),
(207, 7, 'Fall2022', 'TEX404', 7250, 'Paid'),
(208, 8, 'Spring2023', 'EEE505',7500, 'Unpaid'),
(209, 9, 'Summer2023', 'BBA404', 6300, 'Paid'),
(210, 1, 'Fall2023', 'LAW505', 6700, 'Paid'),
(211, 1, 'Fall2020', 'CSE202', 6350, 'Unpaid'),
(212, 2, 'Spring2021', 'TEX303', 6750, 'Paid'),
(213, 3, 'Summer2021', 'EEE202',7250, 'Paid'),
(214, 4, 'Fall2021', 'BBA303',7500, 'Unpaid'),
(215, 5, 'Spring2022', 'LAW202', 6300, 'Paid'),
(216, 6, 'Summer2022', 'CSE303',6700, 'Paid'),
(217, 7, 'Fall2022', 'TEX505',6350, 'Unpaid'),
(218, 8, 'Spring2023', 'EEE404', 6750, 'Paid'),
(219, 9, 'Summer2023', 'BBA505', 7250, 'Paid'),
(220, 10, 'Fall2023', 'LAW404', 7500, 'Unpaid');

INSERT INTO FeeTransactions (TransactionID, StudentID, SemesterName, TransactionDate, TransactionAmount, TransactionMethod)
VALUES
(301, 1, 'Fall2020', '2020-09-15', 5000, 'bkash'),
(302, 2, 'Spring2021', '2021-02-02', 6000, 'rocket'),
(303, 3, 'Summer2021', '2021-07-10', 5500, 'bank'),
(304, 4, 'Fall2021', '2021-10-25', 6500, 'nagad'),
(305, 5, 'Spring2022', '2022-03-12', 5250, 'bkash'),
(306, 6, 'Summer2022', '2022-06-30', 5750, 'rocket'),
(307, 7, 'Fall2022', '2022-09-15', 6250, 'bank'),
(308, 8, 'Spring2023', '2023-01-28', 7000, 'nagad'),
(309, 9, 'Summer2023', '2023-07-05', 5500, 'bkash'),
(310, 10, 'Fall2023', '2023-10-20', 6000, 'rocket'),
(311, 11, 'Fall2020', '2020-09-15', 5250, 'bank'),
(312, 12, 'Spring2021', '2021-02-02', 5750, 'nagad'),
(313, 13, 'Summer2021', '2021-07-10', 6250, 'bkash'),
(314, 14, 'Fall2021', '2021-10-25', 7000, 'rocket'),
(315, 15, 'Spring2022', '2022-03-12', 5500, 'bank'),
(316, 16, 'Summer2022', '2022-06-30', 6000, 'nagad'),
(317, 17, 'Fall2022', '2022-09-15', 5250, 'bkash'),
(318, 18, 'Spring2023', '2023-01-28', 5750, 'rocket'),
(319, 19, 'Summer2023', '2023-07-05', 6250, 'bank'),
(320, 20, 'Fall2023', '2023-10-20', 7000, 'nagad');

INSERT INTO Scholarships (ScholarshipID, StudentID, Amount, ExpiryDate,cgpa)
VALUES
(401, 1, 2000, '2022-12-31',3.90),
(402, 2, 1500, '2022-11-15',3.00),
(403, 3, 3000, '2023-02-28',2.90),
(404, 4, 2500, '2022-10-20',2.00),
(405, 5, 1800, '2023-01-10',2.25),
(406, 6, 2200, '2022-09-05',2.50),
(407, 7, 1700, '2023-04-15',3.10),
(408, 8, 2800, '2022-12-01',3.25),
(409, 9, 2100, '2023-03-20',2.75),
(410, 10, 1900, '2022-11-30',3.30);


-- Get the details of discounts and scholarships applied to a student in a specific semester
SELECT Students.FirstName, Students.LastName, Semesters.SemesterName, FeeTransactions.TransactionDate, FeeTransactions.TransactionAmount, FeeTransactions.TransactionMethod,scholarships.amount
FROM FeeTransactions
JOIN Students ON FeeTransactions.StudentID = Students.StudentID
JOIN Semesters ON FeeTransactions.SemesterName = Semesters.SemesterName
left Join Scholarships on FeeTransactions.StudentID = Scholarships.StudentID
WHERE Semesters.SemesterName = 'Spring2021' AND Students.StudentID = 2;



-- Get all students who have paid their fees
SELECT Students.FirstName, Students.LastName,Fees.CourseCode,Fees.PaymentStatus,Courses.Credits
FROM Fees
JOIN Courses ON Fees.CourseCode = Courses.CourseCode
JOIN Students ON Fees.StudentID = Students .StudentID
WHERE Fees.PaymentStatus = 'Paid';



--Get a specific student who have enrolled several courses
SELECT Enrollment.`StudentID`,Enrollment.CourseCode,Fees.`PaymentStatus`,courses.`Credits`,fees.`TotalFee`
FROM Enrollment
JOIN Fees ON Enrollment.CourseCode = Fees.CourseCode
join courses on Enrollment.`CourseCode`= courses.`CourseCode`
WHERE Enrollment.StudentID=2;



-- Get Students Enrolled in a Specific Course in a Given Semester
SELECT Students.FirstName, Students.LastName, Enrollment.SemesterName, Courses.CourseName
FROM Enrollment
JOIN Students ON Enrollment.StudentID = Students.StudentID
JOIN Courses ON Enrollment.CourseCode = Courses.CourseCode
WHERE Enrollment.CourseCode = 'CSE101' AND Enrollment.SemesterName = 'Fall2020';



-- Get Unpaid Fees for a Specific Semester
SELECT Students.FirstName, Students.LastName, Fees.SemesterName, Fees.TotalFee
FROM Fees
JOIN Students ON Fees.StudentID = Students.StudentID
WHERE Fees.PaymentStatus = 'Unpaid' AND Fees.SemesterName = 'Spring2021';



-- Get Students with Scholarship and Their Remaining Scholarship Amount
SELECT Students.FirstName, Students.LastName, Scholarships.Amount AS totalFee, Scholarships.ExpiryDate, Fees.TotalFee - FeeTransactions.TransactionAmount AS RemainingScholarship
FROM Students
JOIN Scholarships ON Students.StudentID = Scholarships.StudentID
JOIN FeeTransactions ON Students.StudentID = FeeTransactions.StudentID
JOIN fees on students.`StudentID`=fees.`StudentID`;


-- Get Students with the Highest Total Fee Paid
SELECT Students.FirstName, Students.LastName, FeeTransactions.TransactionAmount
FROM Students
JOIN FeeTransactions ON Students.StudentID = FeeTransactions.StudentID
ORDER BY FeeTransactions.TransactionAmount DESC;


-- Get Courses with the Lowest Enrollment
SELECT Courses.CourseName, COUNT(Enrollment.StudentID) AS EnrollmentCount
FROM Courses
LEFT JOIN Enrollment ON Courses.CourseCode = Enrollment.CourseCode
GROUP BY Courses.CourseName
ORDER BY EnrollmentCount ASC;

-- Search for Students Enrolled in All Courses of a Specific Department
SELECT Students.FirstName, Students.LastName, Scholarships.ExpiryDate
FROM Students
JOIN Scholarships ON Students.StudentID = Scholarships.StudentID
WHERE Scholarships.ExpiryDate BETWEEN '2022-01-01' AND '2022-12-31';

-- Trigger to Check and Update PaymentStatus in Fees Table after Fee Transaction:
CREATE TRIGGER UpdatePaymentStatus
AFTER INSERT ON FeeTransactions
FOR EACH ROW
BEGIN
    UPDATE Fees
    SET PaymentStatus = 'Paid'
    WHERE StudentID = NEW.StudentID AND SemesterName = NEW.SemesterName;
END;
--  INSERT INTO fees(FeeID, StudentID, SemesterName, CourseCode,TotalFee)
--  VALUES(221, 11, 'Fall2023', 'LAW404', 7500);

--  SELECT * FROM fees

--  INSERT INTO feetransactions(TransactionID, StudentID, SemesterName, TransactionDate, TransactionAmount, TransactionMethod)
--  VALUES(322, 8, 'Spring2023', '2023-10-21', 7500, 'bkash');

-- Trigger to Set Default Payment Status in Fees Table on New Enrollment
CREATE TRIGGER SetDefaultPaymentStatus
AFTER INSERT ON Enrollment
FOR EACH ROW
BEGIN
    INSERT INTO Fees (StudentID, SemesterName, CourseCode, TuitionFee, RegistrationFee, ExamFee, OtherFees, TotalFee, PaymentStatus)
    VALUES (NEW.StudentID, NEW.SemesterName, NEW.CourseCode, 0, 0, 0, 0, 0, 'Unpaid');
END;

-- Trigger to Increment StudentID in Students Table
CREATE TRIGGER IncrementStudentID
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    SET NEW.StudentID = (SELECT MAX(StudentID) + 1 FROM Students);
END;

-- INSERT into students(FirstName,
-- LastName,
-- DateOfBirth,
-- Gender,
-- ContactNumber,
-- Email,
-- Address,
-- AdmissionDate)
-- VALUES('Tahsin', 'Reja', '1991-09-26', 'Male', '01955555111', 'tahsin.reja@ex.com', '888 bogura Street, barisal', '2022-09-21')

-- SELECT * from students

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '@1234#'