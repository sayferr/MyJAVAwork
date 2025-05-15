--CREATE DATABASE Teachers_Univer <--  §Ñ§Ü§ä§Ú§Ó§Ú§â§å§Û§ä§Ö §ã§ß§Ñ§é§Ñ§Ý§à §ï§ä§à

-- Faculties
CREATE TABLE Faculties (
    Id INT PRIMARY KEY IDENTITY NOT NULL,
    [Name] NVARCHAR(100) NOT NULL
);
ALTER TABLE Faculties
ADD CONSTRAINT CK_Faculties_name_NotEmpty CHECK ([Name] <> '');
ALTER TABLE Faculties
ADD CONSTRAINT UQ_Faculties_name UNIQUE ([Name]);

-- Departments
CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY NOT NULL,
    financing MONEY NOT NULL CONSTRAINT CK_Departments_financing CHECK (financing >= 0) CONSTRAINT DF_Departments_financing DEFAULT(0),
    [Name] NVARCHAR(100) NOT NULL CONSTRAINT CK_Departments_name_NotEmpty CHECK ([Name] <> ''),
    facultyId INT NOT NULL
);
ALTER TABLE Departments
ADD CONSTRAINT UQ_Departments_name UNIQUE ([Name]);
ALTER TABLE Departments
ADD CONSTRAINT FK_Departments_facultyId FOREIGN KEY (facultyId)
REFERENCES Faculties(Id);

-- Subject
CREATE TABLE Subject (
    Id INT PRIMARY KEY IDENTITY NOT NULL,
    [Name] NVARCHAR(100) NOT NULL CONSTRAINT CK_Subject_Name CHECK ([Name] <> '')
);
ALTER TABLE Subject
ADD CONSTRAINT UQ_Subject_Name UNIQUE([Name]);

-- Teachers
CREATE TABLE Teachers (
    Id INT PRIMARY KEY IDENTITY NOT NULL,
    [Name] NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Teachers_Name CHECK ([Name] <> ''),
    Surname NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Teachers_Surname CHECK (Surname <> ''),
    Salary MONEY NOT NULL CONSTRAINT CK_Teachers_Salary CHECK (Salary > 0)
);

-- Groups
CREATE TABLE Groups (
    Id INT PRIMARY KEY IDENTITY NOT NULL,
    [Name] NVARCHAR(10) NOT NULL CONSTRAINT CK_Groups_name_NotEmpty CHECK ([Name] <> ''),
    [Year] INT NOT NULL CONSTRAINT CK_Groups_year CHECK ([Year] BETWEEN 1 AND 5),
    departmentId INT NOT NULL,
    StudentCount INT NOT NULL CONSTRAINT DF_Groups_StudentCount DEFAULT(0)
);
ALTER TABLE Groups
ADD CONSTRAINT UQ_Groups_name UNIQUE ([Name]);
ALTER TABLE Groups
ADD CONSTRAINT FK_Groups_departmentId FOREIGN KEY (departmentId)
REFERENCES Departments(Id);

-- Lectures
CREATE TABLE Lectures (
    Id INT PRIMARY KEY IDENTITY NOT NULL,
    DayofWeek INT NOT NULL CONSTRAINT CK_Lectures_DayofWeek CHECK (DayofWeek BETWEEN 1 and 7),
    LectureRoom NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Lectures_LectureRoom CHECK (LectureRoom <> ''),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL
);
ALTER TABLE Lectures
ADD CONSTRAINT FK_Lectures_SubjectId FOREIGN KEY (SubjectId)
REFERENCES Subject(Id);
ALTER TABLE Lectures
ADD CONSTRAINT FK_Lectures_TeacherId FOREIGN KEY (TeacherId)
REFERENCES Teachers(Id);

-- GroupsLectures
CREATE TABLE GroupsLectures (
    Id INT PRIMARY KEY IDENTITY NOT NULL,
    groupId INT NOT NULL,
    lectureId INT NOT NULL
);
ALTER TABLE GroupsLectures
ADD CONSTRAINT FK_GroupsLectures_groupId FOREIGN KEY (groupId)
REFERENCES Groups(Id);
ALTER TABLE GroupsLectures
ADD CONSTRAINT FK_GroupsLectures_lectureId FOREIGN KEY (lectureId)
REFERENCES Lectures(Id);
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
INSERT INTO Faculties([Name])
VALUES('Computer since'), ('Economics');

INSERT INTO Departments(financing, [Name], facultyId)
VALUES(10000, 'Software Development', 1), (30000, 'Business Analysis', 2)

INSERT INTO Teachers([Name], Surname, Salary)
VALUES('Dave', 'McQueen', 40000), ('Jack', 'Underhill', 70000), ('Kamilla', 'Stokova', 25000)

INSERT INTO Subject([Name])
VALUES('Database Theory'), ('Java Programming'), ('Game Developer')

INSERT INTO Lectures(DayofWeek, LectureRoom, SubjectId, TeacherId)
VALUES(1, 'D201', 1, 1),
      (2, 'A101', 2, 2),
	  (3, 'A111', 3, 3),
	  (4, 'B304', 2, 1),
	  (5, 'D201', 2, 3)

INSERT INTO Groups([Name], Year, departmentId, StudentCount)
VALUES('P107', 3, 1, 30),
      ('T273', 5, 2, 14),
	  ('A143', 4, 1, 25)

INSERT INTO GroupsLectures(groupId, lectureId)
VALUES(1, 1),
      (2, 2),
	  (3, 3),
	  (1, 4),
	  (3, 5)
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

--1
SELECT COUNT(DISTINCT T.id) AS 'Teachers count'
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN GroupsLectures GL ON L.Id =GL.lectureId
JOIN Groups G ON GL.groupId = G.Id
JOIN Departments D ON G.departmentId = D.Id
WHERE D.Name = 'Software Development';

--2
SELECT COUNT(*) AS 'lecture count'
FROM Lectures L
JOIN Teachers T ON L.TeacherId = T.Id
WHERE T.Name = 'Dave' AND T.Surname = 'McQueen';

--3
SELECT COUNT(*) 
FROM Lectures L
WHERE L.LectureRoom = 'D201';

--4
SELECT COUNT(*)
FROM Lectures L
GROUP BY L.LectureRoom;

--5
SELECT SUM(G.StudentCount) AS 'Vse Students'
FROM Groups G
JOIN GroupsLectures GL ON G.Id = GL.groupId
JOIN Teachers T ON GL.lectureId = T.Id
WHERE T.[Name] = 'Jack' AND T.Surname = 'Underhill';

--6
SELECT AVG(T.Salary) AS 'Salary T'
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN GroupsLectures GL ON L.Id = GL.lectureId
JOIN Groups G ON GL.groupId = G.Id
JOIN Departments D ON G.departmentId = D.Id
JOIN Faculties F ON D.facultyId = F.Id
WHERE F.[Name] = 'Computer since';
--7
SELECT MIN(StudentCount) AS 'Min ST', MAX(StudentCount) AS 'Max ST'
FROM Groups;

--8
SELECT AVG(financing) AS 'Average FIN'
FROM Departments;

--9
SELECT T.[Name] + T.Surname AS 'Full name T'
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN Subject S ON L.SubjectId = S.Id
GROUP BY T.[Name], T.Surname;

--10
SELECT DayofWeek, COUNT(*) AS 'Lectures Count'
FROM Lectures
GROUP BY DayofWeek;

--11
SELECT L.LectureRoom, COUNT(DISTINCT D.Id) AS 'Departments count'
FROM Lectures L
JOIN GroupsLectures GL ON L.Id = GL.lectureId
JOIN Groups G ON GL.groupId = G.Id
JOIN Departments D ON G.departmentId = D.Id
GROUP BY L.LectureRoom;

--12
SELECT F.[Name], COUNT(DISTINCT S.Id) AS 'Count S'
FROM Faculties F 
JOIN Departments D ON F.Id = D.facultyId
JOIN Groups G ON D.Id = G.departmentId
JOIN GroupsLectures GL ON G.Id = GL.groupId
JOIN Lectures L ON GL.lectureId = L.Id
JOIN Subject S ON L.SubjectId = S.Id
GROUP BY F.[Name];

--13
SELECT T.[Name] + T.Surname AS 'Teachers full name', L.LectureRoom, COUNT(*) AS 'Count LR'
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
GROUP BY T.[Name], T.Surname, L.LectureRoom; 