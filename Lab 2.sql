--1
SELECT *FROM Deposite
--2
SELECT *FROM Borrow
--3
SELECT *FORM Customers
--4
SELECT  ACTNO,CNAME,AMOUNT FROM Deposite
--5
SELECT LOANNO,AMOUNT FROM BORROW
--6
SELECT *FROM BORROW
WHERE BNAME='ANDHERI'
--7
SELECT ACTNO,AMOUNT FROM DEPOSITE
WHERE ACTNO=106
--8
SELECT CNAME FROM BORROW
WHERE AMOUNT>5000
--9
SELECT CNAME FROM DEPOSITE
WHERE  ADATE>'1995-12-1'
--10
SELECT CNAME FROM DEPOSITE
WHERE ACTNO<105
--12
SELECT CNAME,BNAME FROM DEPOSITE WHERE AMOUNT>4000 AND ACTNO<105
--11
SELECT CNAME FROM CUSTOMERS WHERE CITY='NAGPUR' OR CITY='DELHI'
--13
SELECT CNAME FROM BORROW WHERE AMOUNT>=3000 OR AMOUNT<=8000
--14
SELECT CNAME FROM DEPOSITE WHERE NOT BNAME='ANDHERI'
--15
SELECT ACTNO,CNAME,AMOUNT,ACTNO FROM DEPOSITE WHERE BNAME IN('AJNI','KAROLBAGH','M.G.ROAD') AND ACTNO<104 

--PART B

--1
SELECT TOP 5 CNAME FROM DEPOSITE
--2
SELECT TOP 3 CNAME,AMOUNT FROM DEPOSITE WHERE AMOUNT>1000
--3
SELECT TOP 5 LOANNO,CNAME FROM BORROW WHERE BNAME<>'ANDHERI'
--4
SELECT DISTINCT CITY FROM CUSTOMERS
--5
SELECT DISTINCT BNAME FROM BRANCH


--PART C 

--1
SELECT TOP 50 PERCENT *FROM BORROW
--2
SELECT TOP 10 PERCENT AMOUNT FROM DEPOSITE
--3
SELECT TOP 25 PERCENT CNAME,AMOUNT FROM DEPOSITE WHERE AMOUNT>5000
--4
SELECT DISTINCT TOP 25 PERCENT AMOUNT FROM BORROW
--5
SELECT DISTINCT CNAME,CITY FROM CUSTOMERS
--6
SELECT  *,(AMOUNT+AMOUNT*0.1) AS 'EXTRA AMOUNT' FROM BORROW
--7
SELECT *FROM BORROW WHERE LOANNO%2=0