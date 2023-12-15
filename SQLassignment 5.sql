CREATE DATABASE VTU_UNIVERSITY

CREATE TABLE COLLEGE_TABLE
(
COLLEGE_ID INT PRIMARY KEY,
COLLEGE_NAME VARCHAR(255),
COLLEGE_AREA VARCHAR(255)
)

CREATE TABLE DEPARTMENT_TABLE
(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(255),
DEPT_FACILITY VARCHAR(255)
)

CREATE TABLE PROFESSOR_TABLE
(
PROFESSOR_ID INT PRIMARY KEY,
PROFESSOR_NAME VARCHAR(255),
PROFESSOR_SUBJECT VARCHAR(255)
)

CREATE TABLE STUDENT_TABLE
(
STUDENT_ID INT PRIMARY KEY,
STUDENT_NAME VARCHAR(255),
STUDENT_STREAM VARCHAR(255)
)


/*3. Apply foreign key on Department key from College_table*/

  ALTER TABLE DEPARTMENT_TABLE
  ADD CONSTRAINT FK_DEPARTMENT_COLLEGE
  FOREIGN KEY (DEPT_ID)
  REFERENCES COLLEGE_TABLE (COLLEGE_ID)

 /* 4. Apply foreign Key on Student_Table from Professor_Table*/

          ALTER TABLE STUDENT_TABLE
		  ADD CONSTRAINT FK_STUDENT_PROFESSOR
		  FOREIGN KEY (STUDENT_ID)
		  REFERENCES PROFESSOR_TABLE (PROFESSOR_ID)

	/* 5. Insert atleast 10 Records  in each table */

	SELECT * FROM COLLEGE_TABLE

	INSERT INTO COLLEGE_TABLE VALUES ( 1 , 'K.L.E', 'BELGAVI'),
	                                 ( 2, 'GOGTE' , 'BELGAVI'),
									 (3, 'B.V.B' , 'HUBLI'),
									  (4, 'S.D.M', 'DHARWAD'),
									  (5, 'P.S.E.T', 'BANGALORE'),
									  (6, 'M.I.T', 'MANIPAL'),
									  (7, 'A.J.I.T','MANGALORE'),
									  (8, 'N.I.T.T.E','BANGALORE'),
									  (9, 'DR.B.R.A', 'BANGALORE'),
									  (10, 'SIDGANGA', 'TUMKUR')


    SELECT * FROM DEPARTMENT_TABLE

	INSERT INTO DEPARTMENT_TABLE VALUES (1, 'MECHANICAL', 'WORKSHOP'),
	                                    (2, 'C.S'  , 'COMPUTER LAB'),
										 (3, 'ELECTRICAL','LECTURE HALL'),
										 (4, 'CIVIL', 'SITE'),
										 (5, 'E & C', 'LAB'),
										 (6, 'AERONOTICAL','CONFERENCE HALL'),
										 (7, 'BIO.TECH', 'PHARMA'),
										 (8, 'MECHATRONICS', 'RESEARCH CENTER'),
										 (9, 'INDUSTRIALPRODUCTION','WORKSHOP'),
										 (10, 'MARINE ', ' AUDITORIUM')

		SELECT * FROM PROFESSOR_TABLE

	INSERT INTO PROFESSOR_TABLE VALUES (1 ,'A.K ANGADI', 'S.O.M'),
	                                   (2, 'V.K.G', 'MATERIALS'),
									   (3, 'S.M.BHAT', 'VIBRATIONS'),
									   (4, 'GAONKAR','THERMAL'),
									   (5, 'SHETTY', 'MATHMATICS'),
									   (6, 'GOURISH', 'STRUCTURAL'),
									   (7, 'CHAROO SINGH', 'DOTNET'),
									   (8, ' JOSEPH' , 'AVIATION'),
									   (9, 'SINHA', ' ROBOTICS'),
									   (10, 'KHAN', 'ANSYS')

		SELECT * FROM STUDENT_TABLE
		INSERT INTO STUDENT_TABLE VALUES (1, 'SHASHI', 'MECHANICAL'),
		                                 (2, ' RAVI', 'MECHANICAL'),
										 (3, 'POOJA', 'C.S'),
										 (4, 'SUDARSHAN','STRUCTURAL'),
										 (5, 'SHREEJA','MCA'),
										 (6, 'MANJUNATH', 'CIVIL'),
										 (7,'VIDYASHRERE', 'BIO.TECH'),
										 (8, 'RAGHVENDRA', 'CIVIL'),
										 (9, 'SANDEEP', 'TELECOM'),
										 (10, 'PRAVEEN','ELECTRICAL')



	/*	1.	Give the information of College_ID and College_name from College_Table */

	         SELECT  COLLEGE_ID, COLLEGE_NAME
			 FROM COLLEGE_TABLE


	/*	2.	Show  Top 5 rows from Student table. */

	         SELECT TOP 5 *
			 FROM  STUDENT_TABLE

	/*     3.	What is the name of  professor  whose ID  is 5 */

	            SELECT PROFESSOR_NAME
				FROM PROFESSOR_TABLE
				WHERE PROFESSOR_ID =5


	/*	 4.	Convert the name of the Professor into Upper */

	     SELECT UPPER(PROFESSOR_NAME)
		 FROM PROFESSOR_TABLE

		 UPDATE PROFESSOR_TABLE
		 SET PROFESSOR_NAME = UPPER(PROFESSOR_NAME)


	/*	 5.	Show me the names of those students whose name is start with a */

	         SELECT STUDENT_NAME
			 FROM STUDENT_TABLE
			 WHERE STUDENT_NAME LIKE 'A%'


	/*	6.	Give the name of those colleges whose end with a */

	         SELECT COLLEGE_NAME
			 FROM COLLEGE_TABLE
			 WHERE COLLEGE_NAME LIKE '%A'


	/*	7.	 Add one Salary Column in Professor_Table */
	 
	           SELECT * FROM PROFESSOR_TABLE

			   ALTER TABLE PROFESSOR_TABLE
			   ADD  SALARY MONEY

	/*	8.	Add one Contact Column in Student_table */

	         SELECT * FROM STUDENT_TABLE

			 ALTER TABLE STUDENT_TABLE
			 ADD CONTACT VARCHAR (255)


	/*   9.	Find the total Salary of Professor */

	         SELECT SUM(SALARY) TOTAL_SALARY
			 FROM PROFESSOR_TABLE

			 
	/*	10.	Change datatype of any one column of any one Table*/

	  SELECT * FROM COLLEGE_TABLE

	  ALTER TABLE COLLEGE_TABLE
	  ALTER COLUMN COLLEGE_AREA CHAR(155)




	/*  1.	Show first 5 records from Students table and Professor table Combine*/

	        SELECT TOP 5 * 
			FROM  STUDENT_TABLE ST
			JOIN   PROFESSOR_TABLE PT 
			ON ST.STUDENT_ID = PT.PROFESSOR_ID


			SELECT TOP 5 STUDENT_ID,STUDENT_NAME,STUDENT_STREAM,contact, null as salary
			FROM STUDENT_TABLE
			UNION ALL
			SELECT TOP 5 PROFESSOR_ID,PROFESSOR_NAME,PROFESSOR_SUBJECT,null as contact,Salary
            FROM PROFESSOR_TABLE


	/*	2.	Apply Inner join on all 4 tables together */

	         SELECT CT.COLLEGE_ID,CT.COLLEGE_NAME,CT.COLLEGE_AREA,
			        DT.DEPT_ID, DT.DEPT_NAME,DT.DEPT_FACILITY,
					PT.PROFESSOR_ID,PT.PROFESSOR_NAME,PT.SALARY,
					ST.STUDENT_ID,STUDENT_NAME,ST.STUDENT_STREAM,ST.CONTACT
			 FROM COLLEGE_TABLE CT 
			 INNER JOIN DEPARTMENT_TABLE DT ON DT.DEPT_ID = CT.COLLEGE_ID
			 INNER JOIN PROFESSOR_TABLE PT ON PT.PROFESSOR_ID= DT.DEPT_ID
			 INNER JOIN STUDENT_TABLE ST ON  ST.STUDENT_ID = PT.PROFESSOR_ID

	/*  3.	Show Some null values from Department table and Professor table. */

	        SELECT * 
			FROM  DEPARTMENT_TABLE
			WHERE DEPT_NAME IS NULL OR DEPT_FACILITY IS NULL

			 SELECT *
			 FROM PROFESSOR_TABLE
			 WHERE PROFESSOR_NAME IS  NULL OR  PROFESSOR_SUBJECT IS NULL OR SALARY IS NULL


		
	/*	4.	Create a View from College Table  and give those records whose college name starts with C */

	       CREATE VIEW COLLEGESTARTINC AS
		      SELECT * 
			  FROM COLLEGE_TABLE
			  WHERE COLLEGE_NAME LIKE 'C%'


	/*	5.	Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it */

	        CREATE PROCEDURE SPGET_PROFESSOR_DETAILS
			 @PROFESSOR_ID INT 
			 AS
			 BEGIN
			 SELECT * 
			 FROM PROFESSOR_TABLE
			 WHERE PROFESSOR_ID = @PROFESSOR_ID
			 END

			 SPGET_PROFESSOR_DETAILS @PROFESSOR_ID =1



	/*   6.	Rename the College_Table to College_Tables_Data .*/
	   
	      EXEC sp_rename 'College_Table' , 'College_Tables_Data'

		  select * from COLLEGE_TABLE
		   select * from College_Tables_data