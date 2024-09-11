CREATE TABLE Dept (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Dept(DepartmentID)
);

INSERT INTO Dept (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

INSERT INTO Person (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');


SELECT *FROM PERSON
SELECT *FROM Dept

----------------------------------PART-A------------------------------------------

--1. Find all persons with their department name & code.
	SELECT PERSONNAME ,DEPARTMENTNAME ,DEPARTMENTCODE FROM PERSON RIGHT OUTER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID

--2. Find the person's name whose department is in C-Block.
	SELECT PERSONNAME FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID
	
--3. Retrieve person name, salary & department name who belongs to Jamnagar city.
	SELECT PERSONNAME,SALARY, DEPARTMENTNAME FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID
	WHERE CITY='JAMNAGAR'

--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
	SELECT PERSONNAME,SALARY,DEPARTMENTNAME FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID WHERE CITY <> 'RAJKOT'

--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
	SELECT PERSONNAME FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID WHERE DEPARTMENTNAME='CIVIL' AND JoiningDate>01-08-2001

--6. Find details of all persons who belong to the computer department
	SELECT PERSONID,PERSONNAME,DEPARTMENTCODE,SALARY,JOININGDATE,CITY FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID WHERE DEPARTMENTCODE='CE'

--7. Display all the person's name with the department whose joining date difference with 
--the current date is more than 365 days.
	SELECT PERSONNAME,DEPARTMENTNAME FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID  WHERE DATEDIFF(DAY,JoiningDate,GETDATE())>365
	
--8. Find department wise person counts.\
	SELECT DEPARTMENTNAME,COUNT(PERSONNAME) FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY DepartmentName

--9. Give department wise maximum & minimum salary with department name.
	SELECT DEPARTMENTNAME,MAX(SALARY) AS MAX_SALARY,MIN(SALARY) AS MIN_SALARY FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID  GROUP BY DepartmentName

--10. Find city wise total, average, maximum and minimum salary.
	SELECT CITY, SUM(SALARY) AS TOTAL,MAX(SALARY) AS MAX_S,MIN(SALARY) AS MIN_S,AVG(SALARY) AS AVG
	FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY CITY

--11. Find the average salary of a person who belongs to Ahmedabad city.
	SELECT AVG(SALARY) FROM PERSON WHERE CITY='Ahmedabad'
	GROUP BY PersonName

--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department.
--(In single column)
	SELECT CONCAT(PERSONNAME ,' LIVES IN ' , CITY , ' AND WORKS IN ' , DEPARTMENTNAME , ' DEPARTMENT')
	FROM PERSON INNER JOIN DEPT ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID


----------------------------------PART-B------------------------------------------

--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column)
	SELECT CONCAT(PERSONNAME,' EARNS ',SALARY,' FROM ',DEPARTMENTNAME,' DEPARTMENTNAME MONTHLY ')
	FROM PERSON INNER JOIN DEPT ON PERSON.DepartmentID=DEPT.DEPARTMENTID

--2. Find city & department wise total, average & maximum salaries.
	SELECT DEPARTMENTNAME,CITY,MAX(SALARY) AS MAX_SALARY,AVG(SALARY) AS AVG_SAALRY,SUM(SALARY) AS TOTAL_SALARY
	FROM PERSON INNER JOIN DEPT ON PERSON.DepartmentID=DEPT.DEPARTMENTID GROUP BY DEPARTMENTNAME,CITY

--3. Find all persons who do not belong to any department.
	SELECT PERSONNAME FROM PERSON WHERE DepartmentID IS NULL

--4. Find all departments whose total salary is exceeding 100000.	SELECT DEPARTMENTNAME,SUM(SALARY) AS TOTAL_SALARY		FROM PERSON INNER JOIN DEPT ON PERSON.DepartmentID=DEPT.DEPARTMENTID	GROUP BY DEPARTMENTNAME HAVING SUM(SALARY)>100000	
----------------------------------PART-C--------------------------------------------1. List all departments who have no person.
	SELECT DEPARTMENTNAME FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DEPARTMENTID
	GROUP BY DEPARTMENTNAME HAVING COUNT(PERSONNAME)=0

--2. List out department names in which more than two persons are working.
	SELECT DEPARTMENTNAME FROM PERSON INNER JOIN DEPT 
	ON PERSON.DepartmentID=DEPT.DEPARTMENTID GROUP BY DEPARTMENTNAME
	HAVING COUNT(PERSONNAME)=2

--3. Give a 10% increment in the computer department employee’s salary. (Use Update)
	UPDATE PERSON SET SALARY=SALARY+SALARY*0.1
	FROM PERSON INNER JOIN DEPT ON PERSON.DepartmentID=DEPT.DEPARTMENTID
	WHERE DEPARTMENTNAME='COMPUTER'
	SELECT *FROM PERSON