CREATE TABLE STUDENTS
(
 STUDENT_ID INT,
 NAME VARCHAR(255),
 SURNAME VARCHAR(255),
 BIRTHDATE DATE,
 GENDER CHAR,
 CLASS INT,
 POINT DECIMAL(6,2)
 )

 SELECT * FROM STUDENTS

 alter table students
 alter column class varchar(255)

 SELECT* FROM STUDENTS

 /*  List all the records in the student chart */
      
	   SELECT* FROM STUDENTS

  /* List the name surname and class of the student in the student table*/

    SELECT NAME, SURNAME , CLASS
	FROM STUDENTS

/*	3: List the gender Female (F) records in the student table */
  
     SELECT NAME, GENDER
	 FROM STUDENTS
	 WHERE GENDER = 'F'

  /* 4 : List the names of each class in the way of being seen once in the student table */
      
	     
		 SELECT DISTINCT CLASS
		 FROM  STUDENTS

  /* 5: List the students with Female gender and the class 10Math in the student table */
     
	    SELECT NAME, GENDER,  CLASS
		FROM STUDENTS
		WHERE GENDER = 'F' and  CLASS = '10math'
		
 /*6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table*/

           select NAME,SURNAME,CLASS
		   from STUDENTS
		   where CLASS = '10mat' or class =  '10sci'

		   select NAME,SURNAME,CLASS
		   from STUDENTS
		   where CLASS in ('10mat' ,'10sci')


	/*7: List the students name surname and school number in the student table*/

	     SELECT STUDENT_ID,NAME, SURNAME
		 FROM STUDENTS


	/*8: List the students name and surname by combining them as name surname in the student table*/
	     
		SELECT  CONCAT (NAME,' ', SURNAME) AS NAME_SURNAME
		FROM STUDENTS


	/*9: List the students with the names starting with “A” letter in the student table*/

	     SELECT NAME
		 FROM STUDENTS
		 WHERE NAME LIKE 'A%'


	/* 10: List the book names and pages count with number of pages between 50 and 200 in the book table */

	       



     /*	11: List the students with names Emma Sophia and Robert in the student table */

	        SELECT NAME
		   FROM STUDENTS
		   WHERE NAME IN ('EMMA' ,' SOPHIA', 'ROBERT')


/*	12: List the students with names starting with A D and K in the student table */
        
		   SELECT NAME
		   FROM STUDENTS
		   WHERE NAME LIKE   'A%' OR NAME LIKE  'D%' OR NAME LIKE 'K%'


/*	13 List the names surnames classes and genders of males in 9Math or females in 9His in the student table */
 
           SELECT NAME, SURNAME, CLASS, GENDER
		   FROM STUDENTS
		   WHERE (GENDER = 'M'  AND CLASS = '9MATH')
		   OR
		    (GENDER = 'F' AND CLASS = '9HIS')


/*	14: List the males whose classes are 10Math or 10Bio */

           SELECT  CLASS, GENDER
		   FROM STUDENTS
		   WHERE CLASS = '10MAT' OR CLASS =  '10BIO' AND GENDER = 'M'
		  

		  SELECT  GENDER, CLASS
		  FROM STUDENTS
		  WHERE (GENDER = 'M' AND (  CLASS = '10MAT' OR CLASS = '10BIO'))


	/*  15: List the students with birth year 1989 in the student table*/

	             SELECT NAME 
				 FROM STUDENTS
				 WHERE YEAR(BIRTHDATE) = 1989

				 