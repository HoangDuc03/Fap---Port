USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'DBProject')
BEGIN
	ALTER DATABASE DBProject SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE DBProject SET ONLINE;
	DROP DATABASE DBProject;
END

GO

CREATE DATABASE DBProject
GO

USE DBProject
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO 

---------------------- Create tables ------------------
create table Majors (
Name nvarchar(255),
Code varchar(30) Primary key,
)
create table Rooms(
Code int primary key,
Name varchar(30)
)
create table Departments (
ID INT IDENTITY(1,1),
Code INT Primary key,
Name varchar(255)
)

create table Courses (
ID INT IDENTITY(1,1),
Code INT Primary key,
Name nvarchar(255),
[Sign] varchar(10),
Slot INT,
SlotOfDay int,
CodeDP INT,
FOREIGN KEY (CodeDP) REFERENCES Departments(Code)
)

create table Groups (
ID INT IDENTITY(1,1),
Code Int primary key,
Name varchar(255),
CodeCourse INT,
[Start] date,
FOREIGN KEY (CodeCourse) REFERENCES Courses(Code)
)
create table InforStudents (
Name nvarchar(255),
Code varchar(10) Primary key,
Gender bit,
Mail varchar(255),
NumberPhone varchar(10),
CCCD varchar(12),
Address nvarchar(255),
Major varchar(30) FOREIGN KEY (Major) REFERENCES Majors(Code),
Semester int
)
create table Students (
Code varchar(10) FOREIGN KEY (Code) REFERENCES InforStudents(Code),
CodeGroup INT FOREIGN KEY (CodeGroup) REFERENCES Groups(Code),
Primary key(Code, CodeGroup)
)


Create table Semesters(
CodeCourse INT FOREIGN KEY (CodeCourse) REFERENCES Courses(Code),
Major varchar(30) FOREIGN KEY (Major) REFERENCES Majors(Code),
CourseChange INT FOREIGN KEY (CodeCourse) REFERENCES Courses(Code),
term int,
Primary key(CodeCourse,Major,CourseChange)
)
create table Lecturers(
	Name nvarchar(255),
	Code varchar(10) Primary key,
	Gender bit,
	Mail varchar(255),
	NumberPhone varchar(10),
	CCCD varchar(12),
	Address nvarchar(255),
	Department int FOREIGN KEY (Department) REFERENCES Departments(Code),
	[Contract] bit,
	Csf date,     -- Contract starts from
	Duration date,
)
Create table Slots(
CodeGroup int FOREIGN KEY (CodeGroup) REFERENCES Groups(Code),
[Day] date,
SlotStart int,
CodeLecturer varchar(10) FOREIGN KEY (CodeLecturer) REFERENCES Lecturers(Code),
SlotNumber int,
Room int Foreign key(Room) references Rooms(Code),
primary key (CodeGroup,SlotNumber)
)

create table Attendances(
	CodeStudent varchar(10) FOREIGN KEY (CodeStudent) REFERENCES InforStudents(Code),
	CodeGroup INT ,
	SlotNumber int ,
	[Status] bit,
	Describe varchar(30),
	[Time] Datetime,
	FOREIGN KEY (CodeGroup,SlotNumber) REFERENCES Slots(CodeGroup,SlotNumber),
	
)
create table Logins (
ID INT IDENTITY(1,1),
UserName varchar(255) Primary key,
PassWord varchar(255),
Role INT -- 0: Student   1: Lecturer     2:admin
)