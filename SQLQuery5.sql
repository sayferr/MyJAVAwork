-- §µ§Õ§Ñ§Ý§Ö§ß§Ú§Ö §ä§Ñ§Ò§Ý§Ú§è (§ã§ß§Ñ§é§Ñ§Ý§Ñ §Ù§Ñ§Ó§Ú§ã§Ú§Þ§à§ã§ä§Ú), §Ù§Ñ§á§å§ã§Ü§Ñ§Û§ä§Ö §ã§Ü§â§Ú§á§ä §Ó §ï§ä§à§Þ §á§à§â§ñ§Õ§Ü§Ö
DROP TABLE IF EXISTS GroupsLectures;
DROP TABLE IF EXISTS Lectures;
DROP TABLE IF EXISTS GroupsCurators;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Faculties;
DROP TABLE IF EXISTS Curators;
DROP TABLE IF EXISTS Teachers;
DROP TABLE IF EXISTS Subject;

-- §´§Ñ§Ò§Ý§Ú§è§Ñ Faculties
CREATE TABLE Faculties (
    Id INT PRIMARY KEY IDENTITY,
    Financing MONEY NOT NULL CONSTRAINT CK_Faculties_Financing CHECK (Financing >= 0) CONSTRAINT DF_Faculties_Financing DEFAULT(0),
    [Name] NVARCHAR(100) NOT NULL CONSTRAINT CK_Faculties_name_NotEmpty CHECK ([Name] <> '') CONSTRAINT UQ_Faculties_name UNIQUE ([Name])
);

-- §´§Ñ§Ò§Ý§Ú§è§Ñ Departments
CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY,
    Financing MONEY NOT NULL CONSTRAINT CK_Departments_Financing CHECK (Financing >= 0) CONSTRAINT DF_Departments_Financing DEFAULT(0),
    [Name] NVARCHAR(100) NOT NULL CONSTRAINT CK_Departments_name_NotEmpty CHECK ([Name] <> '') CONSTRAINT UQ_Departments_name UNIQUE ([Name]),
    FacultyId INT NOT NULL,
    CONSTRAINT FK_Departments_FacultyId FOREIGN KEY (FacultyId) REFERENCES Faculties(Id)
);

-- §´§Ñ§Ò§Ý§Ú§è§Ñ Curators
CREATE TABLE Curators (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Curators_name_NotEmpty CHECK ([Name] <> ''),
    Surname NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Curators_surname_NotEmpty CHECK (Surname <> '')
);

-- §´§Ñ§Ò§Ý§Ú§è§Ñ Groups
CREATE TABLE Groups (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(10) NOT NULL CONSTRAINT CK_Groups_name_NotEmpty CHECK ([Name] <> '') CONSTRAINT UQ_Groups_name UNIQUE ([Name]),
    [Year] INT NOT NULL CONSTRAINT CK_Groups_Year CHECK ([Year] BETWEEN 1 AND 5),
    DepartmentId INT NOT NULL,
    CONSTRAINT FK_Groups_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

-- §´§Ñ§Ò§Ý§Ú§è§Ñ GroupsCurators
CREATE TABLE GroupsCurators (
    Id INT PRIMARY KEY IDENTITY,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL,
    CONSTRAINT FK_GroupsCurators_CuratorId FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
    CONSTRAINT FK_GroupsCurators_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

-- §´§Ñ§Ò§Ý§Ú§è§Ñ Subject
CREATE TABLE Subject (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100) NOT NULL CONSTRAINT CK_Subject_name CHECK ([Name] <> '') CONSTRAINT UQ_Subject_name UNIQUE ([Name])
);

-- §´§Ñ§Ò§Ý§Ú§è§Ñ Teachers
CREATE TABLE Teachers (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Teachers_name CHECK ([Name] <> ''),
    Surname NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Teachers_surname CHECK (Surname <> ''),
    Salary MONEY NOT NULL CONSTRAINT CK_Teachers_Salary CHECK (Salary > 0)
);

-- §´§Ñ§Ò§Ý§Ú§è§Ñ Lectures
CREATE TABLE Lectures (
    Id INT PRIMARY KEY IDENTITY,
    LectureRoom NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Lectures_LectureRoom_NotEmpty CHECK (LectureRoom <> ''),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL,
    CONSTRAINT FK_Lectures_SubjectId FOREIGN KEY (SubjectId) REFERENCES Subject(Id),
    CONSTRAINT FK_Lectures_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

-- §´§Ñ§Ò§Ý§Ú§è§Ñ GroupsLectures
CREATE TABLE GroupsLectures (
    Id INT PRIMARY KEY IDENTITY,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL,
    CONSTRAINT FK_GroupsLectures_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    CONSTRAINT FK_GroupsLectures_LectureId FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
);

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
INSERT INTO Faculties (Financing, [Name]) VALUES (100000, '§¶§Ñ§Ü§å§Ý§î§ä§Ö§ä §ª§´'), (150000, '§¶§Ñ§Ü§å§Ý§î§ä§Ö§ä §®§Ñ§ä§Ö§Þ§Ñ§ä§Ú§Ü§Ú');

INSERT INTO Departments (Financing, [Name], FacultyId)
VALUES (50000, '§¬§Ñ§æ§Ö§Õ§â§Ñ §á§â§à§Ô§â§Ñ§Þ§Þ§Ú§â§à§Ó§Ñ§ß§Ú§ñ', 1), (70000, '§¬§Ñ§æ§Ö§Õ§â§Ñ §Ñ§ß§Ñ§Ý§Ú§ä§Ú§Ü§Ú', 2);

INSERT INTO Curators ([Name], Surname)
VALUES ('§ª§Ó§Ñ§ß', '§ª§Ó§Ñ§ß§à§Ó'), ('§±§Ö§ä§â', '§±§Ö§ä§â§à§Ó');

INSERT INTO Groups ([Name], [Year], DepartmentId)
VALUES ('P107', 1, 1), ('B103', 2, 2),('A205', 3, 3);

INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES (1, 1), (2, 2);

INSERT INTO Subject ([Name])
VALUES ('§¢§Ñ§Ù§í §Õ§Ñ§ß§ß§í§ç'), ('§®§Ñ§ä§Ö§Þ§Ñ§ä§Ú§é§Ö§ã§Ü§Ú§Û §Ñ§ß§Ñ§Ý§Ú§Ù');

INSERT INTO Teachers ([Name], Surname, Salary)
VALUES ('§¡§Ý§Ö§Ü§ã§Ö§Û', '§³§Þ§Ú§â§ß§à§Ó', 50000), ('§®§Ñ§â§Ú§ñ', '§ª§Ó§Ñ§ß§à§Ó§Ñ', 60000);

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId)
VALUES ('A101', 1, 1), ('B103', 2, 2);

INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES (1, 1), (2, 2);
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--1. §£§í§Ó§Ö§ã§ä§Ú §Ó§ã§Ö §Ó§à§Ù§Þ§à§Ø§ß§í§Ö §á§Ñ§â§í §ã§ä§â§à§Ü §á§â§Ö§á§à§Õ§Ñ§Ó§Ñ§ä§Ö§Ý§Ö§Û §Ú §Ô§â§å§á§á
SELECT T.name AS 'Tecahers name', T.surname AS 'Tecahers surname', G.[name] AS 'Groups name'
FROM Teachers T
CROSS JOIN Groups G;

--2. §£§í§Ó§Ö§ã§ä§Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §æ§Ñ§Ü§å§Ý§î§ä§Ö§ä§à§Ó, §æ§à§ß§Õ §æ§Ú§ß§Ñ§ß§ã§Ú§â§à§Ó§Ñ§ß§Ú§ñ §Ü§Ñ§æ§Ö§Õ§â §Ü§à§ä§à§â§í§ç §á§â§Ö§Ó§í§ê§Ñ§Ö§ä §æ§à§ß§Õ §æ§Ú§ß§Ñ§ß§ã§Ú§â§à§Ó§Ñ§ß§Ú§ñ §æ§Ñ§Ü§å§Ý§î§ä§Ö§ä§Ñ.
SELECT F.[name] AS 'Faculties name'
FROM Faculties F
JOIN Departments D ON F.Id = D.FacultyId
WHERE D.Financing > F.Financing;

--3. §£§í§Ó§Ö§ã§ä§Ú §æ§Ñ§Þ§Ú§Ý§Ú§Ú §Ü§å§â§Ñ§ä§à§â§à§Ó §Ô§â§å§á§á §Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §Ô§â§å§á§á, §Ü§à§ä§à§â§í§Ö §à§ß§Ú §Ü§å§â§Ú§â§å§ð§ä.
SELECT C.surname, G.[name] AS 'Group name'
FROM Curators C
JOIN GroupsCurators GC ON C.Id = GC.CuratorId
JOIN Groups G ON GC.CuratorId = G.Id;

--4. §£§í§Ó§Ö§ã§ä§Ú §Ú§Þ§Ö§ß§Ñ §Ú §æ§Ñ§Þ§Ú§Ý§Ú§Ú §á§â§Ö§á§à§Õ§Ñ§Ó§Ñ§ä§Ö§Ý§Ö§Û, §Ü§à§ä§à§â§í§Ö §é§Ú§ä§Ñ§ð§ä §Ý§Ö§Ü§è§Ú§Ú §å §Ô§â§å§á§á§í ¡°P107¡±.
SELECT T.[name], T.surname
FROM Teachers T
JOIN Lectures L ON T.Id = l.TeacherId
JOIN GroupsLectures GL ON L.Id = GL.LectureId
JOIN Groups G ON GL.GroupId = G.Id
WHERE G.[name] = 'P107';

--5. §£§í§Ó§Ö§ã§ä§Ú §æ§Ñ§Þ§Ú§Ý§Ú§Ú §á§â§Ö§á§à§Õ§Ñ§Ó§Ñ§ä§Ö§Ý§Ö§Û §Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §æ§Ñ§Ü§å§Ý§î§ä§Ö§ä§à§Ó §ß§Ñ §Ü§à§ä§à§â§í§ç §à§ß§Ú §é§Ú§ä§Ñ§ð§ä §Ý§Ö§Ü§è§Ú§Ú.
SELECT DISTINCT T.surname, F.[name] AS 'Faculty name'
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN GroupsLectures GL ON L.Id = GL.LectureId
JOIN Groups G ON GL.GroupId = G.Id
JOIN Departments D ON  G.DepartmentId = D.Id
JOIN Faculties F ON D.FacultyId = F.Id;

--6. §£§í§Ó§Ö§ã§ä§Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §Ü§Ñ§æ§Ö§Õ§â §Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §Ô§â§å§á§á, §Ü§à§ä§à§â§í§Ö §Ü §ß§Ú§Þ §à§ä§ß§à§ã§ñ§ä§ã§ñ.
SELECT D.[name] AS 'Departmen name', G.[name] AS 'Groups name'
FROM Departments D
JOIN Groups G ON D.Id = G.DepartmentId;

--7. §£§í§Ó§Ö§ã§ä§Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §Õ§Ú§ã§è§Ú§á§Ý§Ú§ß, §Ü§à§ä§à§â§í§Ö §é§Ú§ä§Ñ§Ö§ä §á§â§Ö§á§à§Õ§Ñ§Ó§Ñ§ä§Ö§Ý§î ¡°Samantha Adams¡±
SELECT S.[name] AS 'Subject name'
FROM Subject S
JOIN Lectures L ON S.Id = L.SubjectId
JOIN Teachers T ON L.TeacherId = T.Id
WHERE T.[name] = 'Samantha' AND T.surname = 'Adams'

--8. §£§í§Ó§Ö§ã§ä§Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §Ü§Ñ§æ§Ö§Õ§â, §ß§Ñ §Ü§à§ä§à§â§í§ç §é§Ú§ä§Ñ§Ö§ä§ã§ñ §Õ§Ú§ã§è§Ú§á§Ý§Ú§ß§Ñ ¡°Database Theory¡±(§¢§Ñ§Ù§í §Õ§Ñ§ß§ß§í§ç)
SELECT DISTINCT D.[name] AS 'Departments name'
FROM Departments D
JOIN Groups G ON D.Id = G.DepartmentId
JOIN GroupsLectures GL ON G.Id = GL.GroupId
JOIN Lectures L ON GL.LectureId = L.Id
JOIN Subject S ON L.SubjectId = S.Id
WHERE S.[name] = '§¢§Ñ§Ù§í §Õ§Ñ§ß§ß§í§ç'

--9. §£§í§Ó§Ö§ã§ä§Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §Ô§â§å§á§á, §Ü§à§ä§à§â§í§Ö §à§ä§ß§à§ã§ñ§ä§ã§ñ §Ü §æ§Ñ§Ü§å§Ý§î§ä§Ö§ä§å ¡°Computer Science¡±(§¶§Ñ§Ü§å§Ý§î§ä§Ö§ä §ª§´).
SELECT G.[name] AS 'Group name'
FROM Groups G
JOIN Departments D ON D.Id = G.DepartmentId
JOIN Faculties F ON D.FacultyId = F.Id
WHERE F.[name] = '§¶§Ñ§Ü§å§Ý§î§ä§Ö§ä §ª§´'

--10 §Ó§í§Ó§Ö§ã§ä§Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§Ö §Ô§â§å§á§á 5-§Ô§à §Ü§å§â§ã§Ñ, §Ñ §ä§Ñ§Ü§Ø§Ö §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §æ§Ñ§Ü§å§Ý§î§ä§Ö§ä§à§Ó, §Ü §Ü§à§ä§à§â§í§Þ §à§ß§Ú §à§ä§ß§à§ã§ñ§ä§ã§ñ 
SELECT G.[name] AS 'Group name', F.[name] AS 'Faculty name'
FROM Groups G 
JOIN Departments D ON G.DepartmentId = D.Id
JOIN Faculties F ON D.FacultyId = F.Id
WHERE G.[year] = 5;

--11 §Ó§í§Ó§Ö§ã§ä§Ú §á§à§Ý§ß§í§Ö §Ú§Þ§Ö§ß§Ñ §á§â§Ö§á§à§Õ§Ñ§Ó§ä§Ö§Ý§Ö§Û §Ú §Ý§Ö§Ü§è§Ú§Ú §Ü§à§ä§à§â§í§Ö §à§ß§Ú §é§Ú§ä§Ñ§ð§ä(§ß§Ñ§Ù§Ó§Ñ§ß§Ú§Ö §Õ§Ú§ã§è§Ú§á§Ý§Ú§ß §Ú §Ô§â§å§á§á), §á§â§Ú§é§Ö§Þ §à§ä§à§Ò§â§Ñ§ä§î §ä§Ý§î§Ü§à §ä§Ö §Ý§Ö§Ü§è§Ú§Ú, 
--§Ü§à§ä§à§â§í§Ö §é§Ú§ä§Ñ§ð§ä§ã§ñ §Ó §Ñ§å§Õ§Ú§ä§à§â§Ú§Ú "B103"
SELECT T.[name] AS 'Teacher name', T.surname AS 'Teacher surname', S.[name] AS 'Subject name', G.[name] AS 'Group name'
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN Subject S ON L.SubjectId = S.Id
JOIN GroupsLectures GL ON L.Id = GL.LectureId
JOIN Groups G ON GL.GroupId = G.Id
WHERE L.LectureRoom = 'B103';