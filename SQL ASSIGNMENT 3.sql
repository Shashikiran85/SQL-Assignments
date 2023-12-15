CREATE TABLE EMPLOYEEDETAILS
(
 Empid int,
 FullName Varchar(255),
 Managerid int,
 DateofJoining Date,
 City Varchar(255)
 )

Insert Into EmployeeDetails Values (121,'John Snow', 321, '2019-01-31', 'Toronto'),  
                                    (321 , 'Walter White',986, '2020-01-30','California'),
                                    (421, 'Kuldeep Rana', 876 , '2021-11-27','New Delhi')


Select * from EMPLOYEEDETAILS

Create Table EMPLOYEESALARY
(
Empid int,
Project Varchar(255),
Salary Money,
Variable Money
)
Select * from EMPLOYEESALARY

Insert into Employeesalary values ( 121, 'P1' , 8000 , 500),
                                   ( 321, 'P2' , 10000 ,1000),
								   (421 , 'P1' , 12000 , 0)

/*Q1)SQL Query to fetch records that are present in one table but not in another table.*/

           Select * from EMPLOYEEDETAILS
		   Select * from EMPLOYEESALARY

		   select Ed.*  from EMPLOYEEDETAILS Ed
		   left Join EMPLOYEESALARY  Es
		   on Ed.Empid = Es.Empid
		   where Es.Empid is null


/*Q2)SQL query to fetch all the employees who are not working on any project.*/		
          Select * from EMPLOYEEDETAILS
		   Select * from EMPLOYEESALARY

		   SELECT  TAB1.*
		   FROM EMPLOYEEDETAILS TAB1
		   LEFT JOIN EMPLOYEESALARY TAB2
		   ON TAB2.Empid = TAB1.Empid
		   WHERE TAB2.Empid IS NULL


	/*Q3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.*/

	        SELECT * 
			FROM EMPLOYEEDETAILS
			WHERE YEAR(DateofJoining) = 2020

	/*Q4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.*/

	        Select * from EMPLOYEEDETAILS
		   Select * from EMPLOYEESALARY

		   SELECT   EMPLOYEEDETAILS.*
		   FROM EMPLOYEEDETAILS 
		   INNER JOIN  EMPLOYEESALARY
		   ON EMPLOYEESALARY.Empid = EMPLOYEEDETAILS.Empid

    /*Q5)Write an SQL query to fetch a project-wise count of employees.*/

	      SELECT PROJECT,COUNT(*)  NO_OF_EMPLOYEES
		  FROM EMPLOYEESALARY
		  GROUP BY Project

/*  Q6)Fetch employee names and salaries even if the salary value is not present for the employee.*/
         
		  Select * from EMPLOYEEDETAILS
		   Select * from EMPLOYEESALARY

		  Select  TAB1.FullName, TAB2.Salary
		  from EMPLOYEEDETAILS TAB1
		  LEFT JOIN EMPLOYEESALARY TAB2
		  ON TAB2.Empid = TAB1.Empid

/*	Q7)Write an SQL query to fetch all the Employees who are also managers.*/

         SELECT E1.*  
		 FROM EMPLOYEEDETAILS E1
		 INNER JOIN EMPLOYEEDETAILS E2 
		 ON E2.Empid = E1.Managerid

	/* Q8)Write an SQL query to fetch duplicate records from EmployeeDetails.*/

	      SELECT E1.*
		  FROM EMPLOYEEDETAILS E1
		  INNER JOIN EMPLOYEEDETAILS E2 
		  ON E1.Empid=E2.Empid AND  E2.FullName = E1.FullName AND E1.DateofJoining = E2.DateofJoining
		  WHERE E1.Empid<>E2.Empid

		  SELECT Empid, FullName, DateofJoining, COUNT(*) AS DUPLICATE_RECORDS
		  FROM EMPLOYEEDETAILS
		  GROUP BY Empid, FullName, DateofJoining
		  HAVING COUNT(*)>1


         
		 
 /*  Q9)Write an SQL query to fetch only odd rows from the table.*/
		  
		  Select * from EMPLOYEEDETAILS
		   Select * from EMPLOYEESALARY

		    WITH RANKEDTABLE AS (
			
			SELECT * ,
			ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS ROWNUM
			FROM EMPLOYEEDETAILS)

			SELECT * FROM RANKEDTABLE
			WHERE  ROWNUM % 2 <> 0

			
/*	Q10)Write a query to find the 3rd highest salary from a table without top or limit keyword.*/

       SELECT MAX( Salary ) AS THIRD_HIGHEST_SALARY
	   FROM EMPLOYEESALARY E1
	    WHERE 3 = ( SELECT 
		             COUNT (DISTINCT SALARY)
	             FROM EMPLOYEESALARY E2
				 WHERE E1.SALARY<= E2.SALARY)


 WITH T AS
(
 SELECT *
 FROM EMPLOYEESALARY
 WHERE SALARY < ( SELECT MAX(SALARY) FROM EMPLOYEESALARY) )
 SELECT * FROM T
 WHERE Salary <( SELECT MAX(SALARY) FROM T)


-------------------------------------------------------------------------------------------------------------------------------------------

/*Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.*/

          Select Empid, FullName
		  from EMPLOYEEDETAILS
		  WHERE Managerid =986
		 

 /*Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.*/

          SELECT  DISTINCT PROJECT
		  FROM EMPLOYEESALARY

 /*	Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.*/

   SELECT COUNT(EMPID) AS NO_OF_EMPLOYEES
   FROM EMPLOYEESALARY
   WHERE Project = 'P1'


  /* Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.*/
        
		 SELECT MAX(SALARY) MAXIMUM_SALARY, MIN(SALARY) MINIMUM_SALARY , AVG(SALARY) AVERAGE_SALARY
		 FROM EMPLOYEESALARY


/*Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.*/
   
          SELECT Empid
		  FROM EMPLOYEESALARY
		  WHERE Salary  BETWEEN 9000 AND 15000


 /* Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.*/

           Select * from EMPLOYEEDETAILS
		   Select * from EMPLOYEESALARY

		   SELECT Empid, FULLNAME
		   FROM EMPLOYEEDETAILS
		   WHERE Managerid = 321 AND CITY  = 'TORONTO'


/*Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.*/

           SELECT Empid, FullName 
		   FROM EMPLOYEEDETAILS
		   WHERE CITY = 'CALIFORNIA' OR Managerid =321


/*Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.*/
     
	       SELECT * FROM EMPLOYEESALARY
		   SELECT * FROM EMPLOYEEDETAILS

		   SELECT  *
		   FROM EMPLOYEESALARY ES 
		   JOIN EMPLOYEEDETAILS ED
		   ON ED.Empid = ES.Empid
		   WHERE PROJECT <> 'P1'


 /*Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.*/

            SELECT Empid, Salary + VARIABLE TOTAL_SALARY
			FROM EMPLOYEESALARY


 /*Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.*/
             
			      SELECT *
				  FROM EMPLOYEEDETAILS
				  WHERE FullName LIKE '__hn%'
--------------------------------------------------------------------------------------------------------------------------------------

/* Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.*/

  SELECT * FROM EMPLOYEEDETAILS
  SELECT * FROM EMPLOYEESALARY

  

      SELECT Empid
	  FROM EMPLOYEEDETAILS
	  UNION
      SELECT Empid
	  FROM EMPLOYEESALARY

	  /*Ques.2 Write an SQL query to fetch common records between two tables.*/
	    
		 SELECT * 
		 FROM EMPLOYEEDETAILS ED     
		 JOIN EMPLOYEESALARY ES 
		 ON ES.Empid = ED.Empid

	
	/*Ques.3. Write an SQL query to fetch records that are present in one table but not in another table.*/

	           SELECT *
			   FROM EMPLOYEEDETAILS ED
			   LEFT JOIN
			   EMPLOYEESALARY ES 
			   ON ES.Empid = ED.Empid
			   WHERE ES.Empid IS NULL


	/*Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary	*/	 
	
	          SELECT EMPLOYEEDETAILS.Empid
			  FROM EMPLOYEEDETAILS
			  JOIN EMPLOYEESALARY
			  ON  EMPLOYEEDETAILS.Empid = EMPLOYEESALARY.Empid

			  SELECT Empid
			  FROM EMPLOYEEDETAILS
			  UNION
			  SELECT Empid
			  FROM EMPLOYEESALARY


	/*Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.*/

	                   SELECT ED.Empid
					   FROM EMPLOYEEDETAILS ED
	                   LEFT JOIN  EMPLOYEESALARY ES
					   ON ES.Empid = ED.Empid
					   WHERE ES.Empid IS NULL

SELECT Empid
 FROM EMPLOYEEDETAILS
 WHERE Empid NOT IN (
                     SELECT Empid FROM EMPLOYEESALARY)


	 /* Ques.6. Write an SQL query to fetch the employee’s full names and replace the space*/

	                  SELECT REPLACE( FULLNAME , ' ', '') AS FULL_NAME
					  FROM EMPLOYEEDETAILS
					  
		/* Ques.7. Write an SQL query to fetch the position of a given character(s) in a field.*/

		    SELECT CHARINDEX('S', FullName) AS POSITION
                   FROM EMPLOYEEDETAILS;


		/*Ques.8. Write an SQL query to display both the EmpId and ManagerId together.*/
		   
		      SELECT * FROM EMPLOYEEDETAILS

			   SELECT CONCAT(EMPID,'-',Managerid) EMPID_MANGERID
			   FROM EMPLOYEEDETAILS

	/*	Ques.9. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.*/

	           SELECT SUBSTRING(FULLNAME, 1, CHARINDEX(' ',FULLNAME)) AS FIRST_NAME
			   FROM EMPLOYEEDETAILS


	/*	Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.*/
	            
				 SELECT UPPER(FULLNAME) AS  FULL_NAME,
				        LOWER (CITY) AS CITY
				   FROM EMPLOYEEDETAILS

--------------------------------------------------------------------------------------------------------------------------

  /* Ques.1. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.*/

           SELECT LEN(FULLNAME) - LEN(REPLACE(FULLNAME, 'N','')) TOTAL_OCCURRENCE
		   FROM EMPLOYEEDETAILS

	/*Ques.2. Write an SQL query to update the employee names by removing leading and trailing spaces.*/

	  SELECT * FROM EMPLOYEEDETAILS

	    UPDATE  EMPLOYEEDETAILS
		SET FullName = LTRIM(RTRIM(FULLNAME))


	/*	Ques.3. Fetch all the employees who are not working on any project.*/

	       SELECT * FROM EMPLOYEESALARY
		   SELECT * FROM EMPLOYEEDETAILS

		   SELECT ES.Empid, ED.FULLNAME 
		   FROM EMPLOYEESALARY ES
		   LEFT JOIN EMPLOYEEDETAILS ED
		   ON ED.Empid = ES.Empid
		   WHERE ES.Empid IS NULL

		   SELECT Empid
		   FROM EMPLOYEEDETAILS
		   WHERE Empid NOT IN ( SELECT Empid
		                        FROM EMPLOYEESALARY)



	/*Ques.4. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.*/

	   SELECT * 
	   FROM EMPLOYEESALARY
	   WHERE SALARY >= 5000 
	          AND
	         Salary <= 10000


	/*Ques.5. Write an SQL query to find the current date-time.*/

	  SELECT GETDATE() AS CURRENT_DATE_TIME


	/*  Ques.6. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.*/
	     
		   SELECT Empid, FullName
		   FROM EMPLOYEEDETAILS
		   WHERE YEAR(DateofJoining) =2020


	/*Ques.7. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table*/

	            SELECT ED.*
				FROM EMPLOYEEDETAILS ED
				INNER JOIN  EMPLOYEESALARY ES
				ON ED.Empid = ES.Empid

  /*   Ques.8. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.*/

              SELECT  Project, COUNT(*) NOS_OF_EMPLOYEE
			  FROM EMPLOYEESALARY
			  GROUP BY Project
			  ORDER BY NOS_OF_EMPLOYEE DESC

			
/*	Ques.9. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.*/

              SELECT * FROM EMPLOYEEDETAILS
			  SELECT * FROM EMPLOYEESALARY


			  SELECT FullName, SALARY
			   FROM EMPLOYEEDETAILS ED
			  LEFT  JOIN EMPLOYEESALARY ES
			   ON ED.Empid = ES.Empid


			/*Write an SQL query to join 3 tables.*/
			  
			   SELECT *
			   FROM TABLE1 T1 
			   JOIN TABLE2 T2 ON 
			   T2. COMMON COLUMN = T1.COMMONCOLUMN
			   JOIN TABLE3. T3 ON
			   T2.COMMONCOLUMN = T3.COMMONCOLUMN

			   -----------------------------------------------------------------------------------------------------------------------------
			   CREATE TABLE EmployeeInfo
			   (
			    EmpID int,
				EmpFname varchar(255),
				EmpLname varchar(255),
				Department char(155),
				Project varchar(255),
				Address Varchar(255),
				DOD date,
				Gender char(155)
				)

				Insert into EmployeeInfo values ( 1,'Sanjay','Mehra','HR', 'P1','Hyderabad(HYD)','1976-12-01','M'),
				                                ( 2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','1968-05-02','F'),
												( 3,'Rohan','Diwan', 'Account','P3','Mumbai(BOM)','1980-01-01','M'),
												(4, 'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','1992-05-02','F'),
												(5,'Ankit','Kapoor','Admin','P2','Delhi(Del)','1994-07-03','M')

		        select * from EmployeeInfo


				Create table EmployeePosition
				(
				 EmpID int,
				 EmpPosition Varchar(155),
				 DateofJoining Date,
				 Salary Money
				 )

				 Insert into EmployeePosition values (1, 'Manager', '2022-05-01', 500000),
				                                     (2, 'Executive','2022-05-02', 75000),
													 (3, 'Manager','2022-05-01', 90000),
													 (2, 'Lead','2022-05-02',85000),
													 (1, 'Executive','2022-05-01',300000)

				select * from EmployeePosition

			/*	Q1)Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.*/
			     
				   SELECT UPPER(EMPFNAME) EmpName
				   FROM EmployeeInfo


		/*	Q2)Write a query to fetch the number of employees working in the department ‘HR’.*/

		            SELECT Department, COUNT(*) NO_OF_EMPLOYEES
					FROM EmployeeInfo
					WHERE Department = 'HR'
					GROUP BY Department


		/*Q3)Write a query to get the current date.*/
		      
			   SELECT GETDATE()

			   SELECT CONVERT (DATE, GETDATE()) CURRENTDATE


		/*Q4)Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.*/
		    
			 SELECT SUBSTRING(EMPLNAME, 1,4) EMPLNAME_FIRST_4_CHARACTER
			 FROM EmployeeInfo


	/*	Q5)Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table */
	    
		  SELECT SUBSTRING (ADDRESS ,1 ,CHARINDEX('(', ADDRESS)-1) AS PLACE_NAME
		  FROM EMPLOYEEINFO
		    

	/* Q6)Write a query to create a new table that consists of data and structure copied from the other table */

	 SELECT * FROM EMPLOYEEINFO

	 SELECT * INTO EMPLOYEE_CPOY 
	 FROM  EmployeeInfo

	 SELECT * FROM EMPLOYEE_CPOY

/* Q7)Write q query to find all the employees whose salary is between 50000 to 100000. */ 

     SELECT EMPID,Salary
	 FROM EmployeePosition
	 WHERE Salary  BETWEEN 50000 AND 100000

	     SELECT * FROM EmployeePosition


 /* Q8)Write a query to find the names of employees that begin with ‘S’ */

    SELECT EMPFNAME, EmpLname
	FROM EmployeeInfo
	WHERE EmpFname LIKE 'S%'


	/*Q9)Write a query to fetch top N records.*/

	     SELECT TOP N*
		 FROM EMPLOYEEINFO
	
/*Q10)Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.*/

          SELECT * FROM EMPLOYEEINFO

		  SELECT (EmpFname + ' ' + EmpLname) AS FullName
		  FROM EmployeeInfo


	/*Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender*/

	 
	 
	      SELECT GENDER, COUNT(*) NO_OF_EMPLOYEES
	       FROM EmployeeInfo
	        WHERE DOB BETWEEN '1970-05-02' AND ' 1975-12-31'
	         GROUP BY Gender


/*	Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.*/
    
	     
		 SELECT * 
		 FROM EmployeeInfo
		 ORDER BY EmpLname DESC, Department ASC

		 SELECT * FROM EmployeeInfo


	/* Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.*/

	       SELECT *
		   FROM EmployeeInfo
		   WHERE EmpLname LIKE'____A%'

		    SELECT *
		    FROM EmployeeInfo
			WHERE RIGHT (EmpLname, 1) ='A' AND LEN (EMPLNAME) =5


	/*Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.*/

	       	 SELECT *
			 FROM EmployeeInfo
			 WHERE EmpFname NOT IN ('SANJAY' ,  'SONIA')


	 /* Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.*/

	          SELECT *
			  FROM EmployeeInfo
			  WHERE Address = 'DELHI(DEL)'


	/* Q16. Write a query to fetch all employees who also hold the managerial position.*/

	          SELECT * FROM EmployeeInfo
			  SELECT * FROM EmployeePosition

			  SELECT EP.EmpID, EI.EmpFname
			  FROM EmployeePosition EP
			  JOIN EmployeeInfo EI
			  ON EI.EmpID = EP.EMPID
			  WHERE EmpPosition = 'Manager'


	/*Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order*/

	         SELECT Department, COUNT(*) COUNT_OF_EMPLOYEES
			 FROM EmployeeInfo
			 GROUP BY Department
			 ORDER BY COUNT_OF_EMPLOYEES ASC
			  
			  SELECT * FROM EmployeeInfo

	/*Q18. Write a query to calculate the even and odd records from a table.*/
	      
		    WITH RECORDS AS 
			(
			SELECT*,  ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) ROW_NUM
			  FROM EmployeeInfo)

			   SELECT *
			   FROM RECORDS
			   WHERE ROW_NUM %2 = 0;  /*-------EVEN RECORDS---*/


			   SELECT *
			   FROM RECORDS 
			   WHERE ROW_NUM %2<> 0;-----------------ODD RECORDS


	/*Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.*/


	         SELECT * FROM EmployeeInfo
			  SELECT * FROM EmployeePosition


			  SELECT *
			  FROM EmployeeInfo EI 
			  JOIN  EmployeePosition EP 
			  ON EP.EmpID = EI.EmpID
			  WHERE EP.EmpID = EI.EmpID


	/*Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.*/

	            
	            select TOP 2 Salary MAXIMUM_SALARY
				FROM EmployeePosition
				ORDER BY Salary DESC
				
				Select TOP 2 Salary MINIMUM_SALARY
				FROM EmployeePosition
				ORDER BY Salary 




 /*Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.*/

                 DECLARE @N INT
				 SET @N =2


                 SELECT DISTINCT Salary
				 FROM EmployeePosition
				 ORDER BY Salary DESC

				 OFFSET @N-1 ROWS FETCH NEXT  1 ROW ONLY


				 SELECT * FROM EmployeePosition


	/*Q22. Write a query to retrieve duplicate records from a table.*/
	    
		  SELECT * FROM EmployeePosition
		  SELECT * FROM EmployeeInfo

           SELECT EI.EmpID, EI.EmpFname,EI.EmpLname
		   FROM EmployeeInfo EI
		   JOIN EmployeePosition EP
		   ON EP.EmpID = EI.EmpID
		   GROUP BY EI.EmpID,EI.EmpFname, EI.EmpLname
		   HAVING COUNT(*)>1

		   SELECT EmpID,EmpFname,EmpLname
		   FROM EmployeeInfo
		   GROUP BY EmpID,EmpFname,EmpLname
		   HAVING COUNT(*)>1


	/*Q23. Write a query to retrieve the list of employees working in the same department.*/

	         SELECT E1.EmpID,E1.EmpFname,E1.EmpLname,E1.Department
			 FROM EmployeeInfo E1
			 JOIN EmployeeInfo E2
			 ON E1.Department =E2.Department
			 WHERE E1.EMPID <> E2.EMPID
			 
	   
	 /*   Q24. Write a query to retrieve the last 3 records from the EmployeeInfo table.   */ 

	            SELECT TOP 3*
				FROM EmployeeInfo
				ORDER BY EmpID DESC
				

	/*Q25. Write a query to find the third-highest salary from the EmpPosition table.*/

	       SELECT * FROM EmployeePosition

		   DECLARE @X INT
		   SET @X= 3

		   SELECT Salary
		   FROM EmployeePosition
		   ORDER BY SALARY DESC
           OFFSET(@X -1) ROWS FETCH NEXT 1 ROW ONLY

		   SELECT  SALARY  FROM
		   (
		   SELECT SALARY,ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS RANKED_SALARY
		          FROM  EmployeePosition) AS THIRD_HIGHES_SALARY
				  WHERE RANKED_SALARY = 3


	/*Q26. Write a query to display the first and the last record from the EmployeeInfo table.*/

	        


			SELECT * FROM
			(
			SELECT TOP 1 *FROM EmployeeInfo ORDER BY EMPID ASC
			UNION ALL
			SELECT TOP 1 * FROM EMPLOYEEINFO ORDER BY EMPID DESC
			) AS FIRST_AND_lAST_RECORD
			

	/* Q27. Write a query to add email validation to your database */
	 
	       CREATE FUNCTION [dbo].[CTS_Emailvalidation]
		      (
		     @EmailID NVARCHAR(MAX)
			 )
			 RETURNS BIT 
			 AS
			 BEGIN
			
			 DECLARE @ISEMAIL BIT =0

			 IF (@EmailID LIKE  '%[A-Z,0-9]@[A-Z]%.[A-Za-z]%[A-Za-z]'
			     AND @EmailID NOT LIKE '%@%@%'
			     AND  @EmailID NOT LIKE '%(%'
			     AND  @EmailID NOT LIKE '%)%'
			     AND  @EmailID NOT LIKE '%{%'
			     AND  @EmailID NOT LIKE '%}%'
                 AND  @EmailID NOT LIKE '%[%'
			     AND  @EmailID NOT LIKE '%]%' )

			       BEGIN 
			       SET @ISEMAIL = 1
			       END
			       RETURN @ISEMAIL
			       END
--------------------------------------
SELECT * 
 FROM table
 WHERE EMAIL LIKE '[A-Za-z0-9]%@[A-Za-z0-9]%.[A-Za-z0-9]%'



	/*Q28. Write a query to retrieve Departments who have less than 2 employees working in it.*/
	 
	     SELECT * FROM EmployeeInfo

		 SELECT Department, COUNT(*) NO_OF_EMPLOYEES
		 FROM EmployeeInfo
		 GROUP BY Department
		 HAVING COUNT(*) <2


	/*	 Q29. Write a query to retrieve EmpPostion along with total salaries paid for each of them */

	      SELECT EmpPosition, SUM(SALARY) TOTAL_SALARIES
		  FROM EmployeePosition
		  GROUP BY EmpPosition


		 /* Q30. Write a query to fetch 50% records from the EmployeeInfo table. */

		   SELECT TOP 50 PERCENT*
		   FROM EmployeeInfo

		   