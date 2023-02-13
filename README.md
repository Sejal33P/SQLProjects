# SQLProjects

Project 1 (P2): SelectDistinctWhere
1. Find the Physicians born in 1964. How many are there?
2. Find the first names and last names of patients born in 1964 who are single. How many are
there?
3. Find the diagnosis dates for patients with Diabetes. How many patients are there?  (Hint: 
these are two separate questions.  To do the second half, you will need a slightly different 
SELECT.  For the second half, don’t just count the diagnoses; Count patients.)
 4. Find the diagnosis dates for patients with Diabetes or Hypertension. How many patients are 
there?  (Hint: these are also two separate questions.)
5. Find the first names of patients with a last name of Brown? How could you determine if any of
them have the same first name as each other? (For example, two people named John Brown.  
We’re not looking for people named Brown Brown.)
6. Find the physicians with a last name beginning with Sa and either have a Null Middle Name 
or were born after January 1st, 1960? How many are there?
7. For the data set in the patient table, do first and last name uniquely identify a person? How 
about first and last name and middle name? How about last name and date of birth?  How about 
first name, last name, and date of birth?  

Project 2 (P3): Multiple Tables
1. Find the practices with patients named Carlson with Diabetes and a Hemoglobin A1c value greater than 5 and less than 9.  How many practices are there in the results?  (Each patient has a PCP, each PCP is assigned to zero or more practices.)
2. Find the office visits for those patients (the patients from question 1).  How many office visits are there in the results?
3. Find all of the lab results (not just A1c) for those patients (the patients from question 1: Carlsons with Diabetes and an A1c >5 and  <9).  How many lab results are there in the results?  (Hint:  self-join)
4. Find the patients who are older than their PCP.  How many patients are there in the results?

Project 3 (P4): Expressions and Aggregates
Expressions
1. List the names and ages of all patients (not just Carlsons). 
2. List all of the physicians with  the names of the physicians in one column formatted as: LastName, FirstName

Aggregates
1.  Find the minimum and maximum Hemoglobin A1c result in the entire table of results.  
2.  Find the minimum and maximum Hemoglobin A1c result for each patient. Show the patient key, first name, last name, min A1c, and max A1c.
3. Find the average of all Hemoglobin A1c results for each condition.  We should get one average for each condition, and each condition should be listed once.  
4.  We are now going to clean up the query from question #2.  In query #2, you were listing minimum and maximum and PatientKey.  For #4, copy the query from #2 and modify the query to add a title in each result column that doesn't have a title (use aliases).  Select columns as needed so that you display PatientKey, LastName, and FirstName columns in the selected results along with the min,max,average, and count of A1c tests (the count for each patient).  Order the results alphabetically.  Only include patients with at least two A1c tests.

Project 4 (P5): Sets and Subqueries
Set
1. Find the patients who have a billing charge over $1000 or a billing charge under $10. How many patients are there?
2. Find the patients who have both a billing charge over $1000 and a billing charge under $10. How many patients are there?
3. Find the patients who do have a billing charge over $1000 but who do not have a billing charge under $10.  How many patients are there?

Subquery
1. Write a query that lists every patient who has at least one A1c result that is higher than the average A1c results for each patient's PCP.  Use temp.PhysicianAverageA1c for this.  Don't list patients more than once.  
2. Write a query that lists the average A1c value for all patients assigned to each PCP.  That's one average for each PCP. 
3. Take your answer to #4, and instead of using temp.PhysicianAverageA1c, use your query from #2 as a subquery.  Don't use any temp tables or views.  Don't list patients more than once. 

Project 5 (P6): Database Updates
Step 1 – Creating Tables
You will use  StudentExperimentalDatabase, not PhysicianPractice.  Create three tables:
1.  FeinbergPatient – primary key, first name, last name, date of birth, phone number.  Add other columns if you desire, but do not feel the need to replicate the patient table that we have already seen.
2. FeinbergNurse – primary key, first name, last name, state licensed in, license number, phone number
3. FeinbergVisit – primary key, nursing notes, foreign key referring to nurse, foreign key referring to patient, when the visit started, when the visit ended.  Use foreign key constraints for the foreign keys.
Step 2 – Insert Data
Insert some data into each table.  
Step 3 – Query the Data
Write a query to select information about the visits, including some information about the nurses and the patients.
Step 4 – Submit your Queries

Project 6 (P8): Conceptual DB
1.  A physician has an encounter with a patient, in which a primary diagnosis is made and a single procedure is performed.  Design a model to support the recording of these events.  Use lookup tables for the diagnoses and procedures.  Interviewing physician staff has uncovered some information: you can't perform a procedure without a diagnosis, and an encounter without a procedure isn't really an encounter.

2.  Physicians write prescriptions for patients. The prescription is for 0 or more refills.  We record each fill and refill.  Since we all share the same database, each fill and refill can occur at different pharmacies, but we want to know which one(s).  Design a database model to support these events.

Project 7 (P9): Logisctics DB
Create and submit a model to store blood tests results.  The results have three specializations.  We have learned three different ways to handle these specializations.

Project 8 (P10): Physical DB
Forward engineer previous model

Restaurant Management Model
I. SCENARIO:
Our database was created to manage a restaurant called Dine Fine. The restaurant operates entirely online, and the customers have the option of asking for a take-away or getting the meal delivered. The menu includes a variety of burgers, pizzas, sandwiches, smoothies and shakes and gives the customer an option of paying through credit card, cash, or a gift card.
II. MODEL WALKTHROUGH
a. The Central Entity
For this model, Placed_Order is the central entity. The relationship between order placed by a customer and restaurant staff, delivery staff with his/her vehicle as well as the food and beverages ordered are established through this central entity. The details about when the order was placed and delivered along with the status of the order i.e., whether it was delivered, refunded, or cancelled can be tracked through this entity.
Points to note- Customer to Placed_Order relation is a mandatory one to many, since acustomer’s information will be obtained only after he/she places their first order. Beverage/Pizza/Burger/Sandwich to Placed_Order is an optional many to many relationship since one food or beverage item can be a part of many orders and vice versa.
b. The Three Specializations
The three different kinds of specializations are displayed in this model. Separate subtype tables are the three food items named burger, pizza, and sandwich. This specialization was preferred for this scenario to distinguish between the different food items. Each food type contains a
variety of food options to choose from.
The second specialization is a combination of subtype tables and one supertype table. The supertype table is the employee table and the subtypes tables stemming from them are cashier, kitchen staff and delivery staff. All the employees have many common attributes including name, contact details, address and the subtypes have a few individual attributes. For e.g., delivery staff has a license number in them which is unique for them.
The third specialization is the use of one table with the absence of subtype tables. This has been demonstrated as a Placed_Order table. Instead of separating orders into delivery or takeout, they have been combined as most of the attributes will be the same.
c. Limitation
A limitation to this model is that each delivery staff is assigned to 1 vehicle that is their own. Thedelivery staff won’t be available to work if his vehicle is out for maintenance or breaks down.
