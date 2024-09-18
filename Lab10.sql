CREATE TABLE STUDENT_INFO(

 RNO INT,
 NAME VARCHAR(20),
 BRANCH VARCHAR(2),
 SPI FLOAT,
 BACKLOG INT
)

INSERT INTO STUDENT_INFO VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 1),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', 'EC', 4.50, 3)

----PART-A
SELECT *FROM STUDENT_INFO
--1. Create a view Personal with all columns.
	CREATE VIEW PERSONAL AS SELECT *FROM STUDENT_INFO
	SELECT *FROM PERSONAL

--2. Create a view Student_Details having columns Name, Branch & SPI. 
	CREATE VIEW STUDENT_DETAILS AS SELECT NAME,BRANCH,SPI FROM STUDENT_INFO
	SELECT *FROM STUDENT_DETAILS
	
--3. Create a view AcademicData having columns RNo, Name, Branch.
	CREATE VIEW VW_ADATA AS SELECT RNO,NAME,BRANCH FROM STUDENT_INFO
	SELECT *FROM VW_ADATA

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2.
	CREATE VIEW VW_BCK AS SELECT NAME,BACKLOG FROM STUDENT_INFO WHERE BACKLOG>2
	SELECT *FROM VW_BCK

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters.
	CREATE VIEW VW_PATT AS SELECT RNO,NAME,BRANCH FROM STUDENT_INFO WHERE LEN(NAME)=4
	SELECT *FROM VW_PATT

--6. Insert a new record to AcademicData view. (107, Meet, ME)

--7. Update the branch of Amit from CE to ME in Student_Details view.

--8. Delete a student whose roll number is 104 from AcademicData view.
