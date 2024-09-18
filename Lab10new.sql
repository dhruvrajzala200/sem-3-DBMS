
SELECT *FROM STUDENT_INFO

--PART-A

--1. Create a view Personal with all columns.
	CREATE VIEW PRSNL AS SELECT *FROM STUDENT_INFO
	SELECT *FROM PRSNL

--2. Create a view Student_Details having columns Name, Branch & SPI.
	CREATE VIEW STUDENTDETAILS AS SELECT NAME,Branch,SPI FROM STUDENT_INFO
	SELECT *FROM STUDENTDETAILS

--3. Create a view AcademicData having columns RNo, Name, Branch.
	CREATE VIEW ACADEMICDATA AS SELECT RNO,NAME,BRANCH FROM STUDENT_INFO
	SELECT *FROM ACADEMICDATA

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2.
	CREATE VIEW STUDENT_BACKLOG AS SELECT *FROM STUDENT_INFO WHERE BACKLOG>1
	SELECT *FROM STUDENT_BACKLOG 

--5. Create a view Student_Pattern having RNo, Name & Branch columns 
--in which Name consists of four letters.
	CREATE VIEW STUDENT_PATTERN AS SELECT RNO,NAME,BRANCH FROM STUDENT_INFO WHERE NAME LIKE '____'
	SELECT *FROM STUDENT_PATTERN

--6. Insert a new record to AcademicData view. (107, Meet, ME)
	INSERT INTO ACADEMICDATA VALUES (107,'MEET','ME')
	SELECT *FROM ACADEMICDATA

--7. Update the branch of Amit from CE to ME in Student_Details view.
	UPDATE STUDENT_DETAILS SET BRANCH='ME' WHERE BRANCH='CE'
	SELECT *FROM STUDENT_INFO

--8. Delete a student whose roll number is 104 from AcademicData view
	DELETE FROM ACADEMICDATA WHERE RNO=104
	--Part – B:
--1. Create a view that displays information of all students whose SPI is above 8.5
	CREATE VIEW DISPLAYINFO AS SELECT NAME FROM STUDENT_INFO WHERE SPI>8.5
	SELECT *FROM DISPLAYINFO

--2. Create a view that displays 0 backlog students.
	CREATE VIEW ZEROBL AS SELECT NAME FROM STUDENT_INFO WHERE BACKLOG=0
	SELECT *FROM ZEROBL

--3. Create a view Computerview that displays CE branch data only.	CREATE VIEW COMPUTERVIEW AS SELECT NAME FROM STUDENT_INFO WHERE BRANCH='CE'	SELECT *FROM COMPUTERVIEW--Part – C:

--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
	CREATE VIEW RESULT_EC AS SELECT NAME,SPI  FROM STUDENT_INFO WHERE SPI<5 AND BRANCH='EC'
	SELECT *FROM RESULT_EC

--2. Update the result of student MAHESH to 4.90 in Result_EC view.
	UPDATE RESULT_EC SET SPI=4.90 WHERE NAME='MAHESH'

--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having --bklogs more than 5
	CREATE VIEW STU_BACKLOG AS SELECT RNO,NAME,BACKLOG FROM STUDENT_INFO WHERE NAME='M%' AND BACKLOG>5
	SELECT *FROM STU_BACKLOG

.
--4. Drop Computerview form the database
	DROP VIEW COMPUTERVIEW
