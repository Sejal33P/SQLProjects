
-- Week 2 Assignment. Sejal Purohit

Use PhysicianPractice;

--Question 1
SELECT * from Phys.Physician
         where BirthDate >= '1/1/1964' and 
		 BirthDate <= '12/31/1964';
--Returns 3 rows 
--There are 3 physicians born in 1964.

--Question 2
SELECT FirstName, 
	   LastName
	   from Phys.Patient 
	   where MaritalStatus = 'S' and 
	   BirthDate >= '1/1/1964' and
	   BirthDate <= '12/31/1964';

--Returns 339 rows
--There are 339 patients born in 1964 who are single.

--Question 3
--Part 1 
SELECT  FirstDiagnosed 
		from Phys.PatientCondition
		where PCondition = 'Diabetes';
--Returns 4190 rows

--Part 2
SELECT Distinct PatientKey 
		from Phys.PatientCondition 
		where PCondition = 'Diabetes';
--Returns 4189 rows
--There are 4189 patients with diabetes diagnosed on different dates

--Question 4
--Part  1
SELECT FirstDiagnosed 
	   from Phys.PatientCondition 
	   where PCondition = 'Hypertension' or 
	   PCondition = 'Diabetes';
--Returns 10,014 rows

--Part2
SELECT Distinct PatientKey 
       from Phys.PatientCondition 
	   where PCondition = 'Hypertension' or 
	   PCondition = 'Diabetes';
--Returns 5824 rows
--There are 5824 patients with hypertension and diabetes

--Question 5
--Part 1
SELECT FirstName 
	   from Phys.Patient
	   where LastName = 'Brown';
--Returns 82 rows

--Part2
SELECT Distinct FirstName
	   from Phys.Patient 
	   where LastName = 'Brown';
--Returns 82 rows; No one has the same first name for the last name Brown.

--Question 6
SELECT * from Phys.Physician
		 where LastName like 'Sa%' and 
		 (MiddleName is NULL or BirthDate > '1/1/1960');
--Returns 10 rows. 
--There are 10 people with  a last name beginning with Sa and either have a Null Middle Name or were born after January 1st, 1960

--Question 7
-- Part 1
SELECT FirstName,
	   LastName
	   from phys.patient;
-- returns 18383 rows

SELECT Distinct FirstName,
	   LastName 
	   from Phys.Patient;
-- returns 18301 rows. No, firstname and last name do not uniquely identify every person.

--part2
SELECT FirstName,
	   MiddleName,
	   LastName 
	   from Phys.patient;
-- returns 18383 rows

SELECT Distinct FirstName,
				MiddleName,
				LastName 
				from Phys.Patient;
-- returns 18369 rows. No, firstname, middlename and last name do not uniquely identify every person.

--part 3
SELECT LastName, 
       BirthDate 
	   from Phys.patient;
-- returns 18383 rows

SELECT Distinct LastName, 
	   BirthDate 
	   from Phys.Patient;
-- returns 18309 rows. No, last name and date of birth do not uniquely identify every person.

--part 4
SELECT FirstName,
	   Lastname, 
	   BirthDate 
	   from Phys.patient;
-- returns 18383 rows

SELECT Distinct FirstName,
	   LastName, 
	   BirthDate 
	   from Phys.Patient;
-- returns 18383 rows. Yes the first name, last name, and date of birth uniquely identify a person as same number of rows are being returned.
