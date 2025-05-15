-- ���էѧݧ֧ߧڧ� ��ѧҧݧڧ� (��ߧѧ�ѧݧ� �٧ѧӧڧ�ڧާ����), �٧ѧ���ܧѧۧ�� ��ܧ�ڧ�� �� ����� �����էܧ�
DROP TABLE IF EXISTS GroupsLectures;
DROP TABLE IF EXISTS Lectures;
DROP TABLE IF EXISTS GroupsCurators;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Faculties;
DROP TABLE IF EXISTS Curators;
DROP TABLE IF EXISTS Teachers;
DROP TABLE IF EXISTS Subject;

-- ���ѧҧݧڧ�� Faculties
CREATE TABLE Faculties (
    Id INT PRIMARY KEY IDENTITY,
    Financing MONEY NOT NULL CONSTRAINT CK_Faculties_Financing CHECK (Financing >= 0) CONSTRAINT DF_Faculties_Financing DEFAULT(0),
    [Name] NVARCHAR(100) NOT NULL CONSTRAINT CK_Faculties_name_NotEmpty CHECK ([Name] <> '') CONSTRAINT UQ_Faculties_name UNIQUE ([Name])
);

-- ���ѧҧݧڧ�� Departments
CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY,
    Financing MONEY NOT NULL CONSTRAINT CK_Departments_Financing CHECK (Financing >= 0) CONSTRAINT DF_Departments_Financing DEFAULT(0),
    [Name] NVARCHAR(100) NOT NULL CONSTRAINT CK_Departments_name_NotEmpty CHECK ([Name] <> '') CONSTRAINT UQ_Departments_name UNIQUE ([Name]),
    FacultyId INT NOT NULL,
    CONSTRAINT FK_Departments_FacultyId FOREIGN KEY (FacultyId) REFERENCES Faculties(Id)
);

-- ���ѧҧݧڧ�� Curators
CREATE TABLE Curators (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Curators_name_NotEmpty CHECK ([Name] <> ''),
    Surname NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Curators_surname_NotEmpty CHECK (Surname <> '')
);

-- ���ѧҧݧڧ�� Groups
CREATE TABLE Groups (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(10) NOT NULL CONSTRAINT CK_Groups_name_NotEmpty CHECK ([Name] <> '') CONSTRAINT UQ_Groups_name UNIQUE ([Name]),
    [Year] INT NOT NULL CONSTRAINT CK_Groups_Year CHECK ([Year] BETWEEN 1 AND 5),
    DepartmentId INT NOT NULL,
    CONSTRAINT FK_Groups_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

-- ���ѧҧݧڧ�� GroupsCurators
CREATE TABLE GroupsCurators (
    Id INT PRIMARY KEY IDENTITY,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL,
    CONSTRAINT FK_GroupsCurators_CuratorId FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
    CONSTRAINT FK_GroupsCurators_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

-- ���ѧҧݧڧ�� Subject
CREATE TABLE Subject (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100) NOT NULL CONSTRAINT CK_Subject_name CHECK ([Name] <> '') CONSTRAINT UQ_Subject_name UNIQUE ([Name])
);

-- ���ѧҧݧڧ�� Teachers
CREATE TABLE Teachers (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Teachers_name CHECK ([Name] <> ''),
    Surname NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Teachers_surname CHECK (Surname <> ''),
    Salary MONEY NOT NULL CONSTRAINT CK_Teachers_Salary CHECK (Salary > 0)
);

-- ���ѧҧݧڧ�� Lectures
CREATE TABLE Lectures (
    Id INT PRIMARY KEY IDENTITY,
    LectureRoom NVARCHAR(MAX) NOT NULL CONSTRAINT CK_Lectures_LectureRoom_NotEmpty CHECK (LectureRoom <> ''),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL,
    CONSTRAINT FK_Lectures_SubjectId FOREIGN KEY (SubjectId) REFERENCES Subject(Id),
    CONSTRAINT FK_Lectures_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

-- ���ѧҧݧڧ�� GroupsLectures
CREATE TABLE GroupsLectures (
    Id INT PRIMARY KEY IDENTITY,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL,
    CONSTRAINT FK_GroupsLectures_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    CONSTRAINT FK_GroupsLectures_LectureId FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
);

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
INSERT INTO Faculties (Financing, [Name]) VALUES (100000, '���ѧܧ�ݧ��֧� ����'), (150000, '���ѧܧ�ݧ��֧� ���ѧ�֧ާѧ�ڧܧ�');

INSERT INTO Departments (Financing, [Name], FacultyId)
VALUES (50000, '���ѧ�֧է�� ����ԧ�ѧާާڧ��ӧѧߧڧ�', 1), (70000, '���ѧ�֧է�� �ѧߧѧݧڧ�ڧܧ�', 2);

INSERT INTO Curators ([Name], Surname)
VALUES ('���ӧѧ�', '���ӧѧߧ��'), ('���֧��', '���֧����');

INSERT INTO Groups ([Name], [Year], DepartmentId)
VALUES ('P107', 1, 1), ('B103', 2, 2),('A205', 3, 3);

INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES (1, 1), (2, 2);

INSERT INTO Subject ([Name])
VALUES ('���ѧ٧� �էѧߧߧ��'), ('���ѧ�֧ާѧ�ڧ�֧�ܧڧ� �ѧߧѧݧڧ�');

INSERT INTO Teachers ([Name], Surname, Salary)
VALUES ('���ݧ֧ܧ�֧�', '���ާڧ�ߧ��', 50000), ('���ѧ�ڧ�', '���ӧѧߧ�ӧ�', 60000);

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId)
VALUES ('A101', 1, 1), ('B103', 2, 2);

INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES (1, 1), (2, 2);
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--1. ����ӧ֧��� �ӧ�� �ӧ�٧ާ�اߧ�� ��ѧ�� ������ ���֧��էѧӧѧ�֧ݧ֧� �� �ԧ����
SELECT T.name AS 'Tecahers name', T.surname AS 'Tecahers surname', G.[name] AS 'Groups name'
FROM Teachers T
CROSS JOIN Groups G;

--2. ����ӧ֧��� �ߧѧ٧ӧѧߧڧ� ��ѧܧ�ݧ��֧���, ���ߧ� ��ڧߧѧߧ�ڧ��ӧѧߧڧ� �ܧѧ�֧է� �ܧ������ ���֧ӧ��ѧ֧� ���ߧ� ��ڧߧѧߧ�ڧ��ӧѧߧڧ� ��ѧܧ�ݧ��֧��.
SELECT F.[name] AS 'Faculties name'
FROM Faculties F
JOIN Departments D ON F.Id = D.FacultyId
WHERE D.Financing > F.Financing;

--3. ����ӧ֧��� ��ѧާڧݧڧ� �ܧ��ѧ����� �ԧ���� �� �ߧѧ٧ӧѧߧڧ� �ԧ����, �ܧ������ ��ߧ� �ܧ��ڧ����.
SELECT C.surname, G.[name] AS 'Group name'
FROM Curators C
JOIN GroupsCurators GC ON C.Id = GC.CuratorId
JOIN Groups G ON GC.CuratorId = G.Id;

--4. ����ӧ֧��� �ڧާ֧ߧ� �� ��ѧާڧݧڧ� ���֧��էѧӧѧ�֧ݧ֧�, �ܧ������ ��ڧ�ѧ�� �ݧ֧ܧ�ڧ� �� �ԧ����� ��P107��.
SELECT T.[name], T.surname
FROM Teachers T
JOIN Lectures L ON T.Id = l.TeacherId
JOIN GroupsLectures GL ON L.Id = GL.LectureId
JOIN Groups G ON GL.GroupId = G.Id
WHERE G.[name] = 'P107';

--5. ����ӧ֧��� ��ѧާڧݧڧ� ���֧��էѧӧѧ�֧ݧ֧� �� �ߧѧ٧ӧѧߧڧ� ��ѧܧ�ݧ��֧��� �ߧ� �ܧ������ ��ߧ� ��ڧ�ѧ�� �ݧ֧ܧ�ڧ�.
SELECT DISTINCT T.surname, F.[name] AS 'Faculty name'
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN GroupsLectures GL ON L.Id = GL.LectureId
JOIN Groups G ON GL.GroupId = G.Id
JOIN Departments D ON  G.DepartmentId = D.Id
JOIN Faculties F ON D.FacultyId = F.Id;

--6. ����ӧ֧��� �ߧѧ٧ӧѧߧڧ� �ܧѧ�֧է� �� �ߧѧ٧ӧѧߧڧ� �ԧ����, �ܧ������ �� �ߧڧ� ���ߧ������.
SELECT D.[name] AS 'Departmen name', G.[name] AS 'Groups name'
FROM Departments D
JOIN Groups G ON D.Id = G.DepartmentId;

--7. ����ӧ֧��� �ߧѧ٧ӧѧߧڧ� �էڧ��ڧ�ݧڧ�, �ܧ������ ��ڧ�ѧ֧� ���֧��էѧӧѧ�֧ݧ� ��Samantha Adams��
SELECT S.[name] AS 'Subject name'
FROM Subject S
JOIN Lectures L ON S.Id = L.SubjectId
JOIN Teachers T ON L.TeacherId = T.Id
WHERE T.[name] = 'Samantha' AND T.surname = 'Adams'

--8. ����ӧ֧��� �ߧѧ٧ӧѧߧڧ� �ܧѧ�֧է�, �ߧ� �ܧ������ ��ڧ�ѧ֧��� �էڧ��ڧ�ݧڧߧ� ��Database Theory��(���ѧ٧� �էѧߧߧ��)
SELECT DISTINCT D.[name] AS 'Departments name'
FROM Departments D
JOIN Groups G ON D.Id = G.DepartmentId
JOIN GroupsLectures GL ON G.Id = GL.GroupId
JOIN Lectures L ON GL.LectureId = L.Id
JOIN Subject S ON L.SubjectId = S.Id
WHERE S.[name] = '���ѧ٧� �էѧߧߧ��'

--9. ����ӧ֧��� �ߧѧ٧ӧѧߧڧ� �ԧ����, �ܧ������ ���ߧ������ �� ��ѧܧ�ݧ��֧�� ��Computer Science��(���ѧܧ�ݧ��֧� ����).
SELECT G.[name] AS 'Group name'
FROM Groups G
JOIN Departments D ON D.Id = G.DepartmentId
JOIN Faculties F ON D.FacultyId = F.Id
WHERE F.[name] = '���ѧܧ�ݧ��֧� ����'

--10 �ӧ�ӧ֧��� �ߧѧ٧ӧѧߧڧ� �ԧ���� 5-�ԧ� �ܧ����, �� ��ѧܧا� �ߧѧ٧ӧѧߧڧ� ��ѧܧ�ݧ��֧���, �� �ܧ������ ��ߧ� ���ߧ������ 
SELECT G.[name] AS 'Group name', F.[name] AS 'Faculty name'
FROM Groups G 
JOIN Departments D ON G.DepartmentId = D.Id
JOIN Faculties F ON D.FacultyId = F.Id
WHERE G.[year] = 5;

--11 �ӧ�ӧ֧��� ���ݧߧ�� �ڧާ֧ߧ� ���֧��էѧӧ�֧ݧ֧� �� �ݧ֧ܧ�ڧ� �ܧ������ ��ߧ� ��ڧ�ѧ��(�ߧѧ٧ӧѧߧڧ� �էڧ��ڧ�ݧڧ� �� �ԧ����), ���ڧ�֧� ����ҧ�ѧ�� ��ݧ�ܧ� ��� �ݧ֧ܧ�ڧ�, 
--�ܧ������ ��ڧ�ѧ���� �� �ѧ�էڧ���ڧ� "B103"
SELECT T.[name] AS 'Teacher name', T.surname AS 'Teacher surname', S.[name] AS 'Subject name', G.[name] AS 'Group name'
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN Subject S ON L.SubjectId = S.Id
JOIN GroupsLectures GL ON L.Id = GL.LectureId
JOIN Groups G ON GL.GroupId = G.Id
WHERE L.LectureRoom = 'B103';