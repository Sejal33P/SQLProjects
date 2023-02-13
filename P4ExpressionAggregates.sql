Use PhysicianPractice;

-- Expressions
-- Q1. Names and ages of all patients
SELECT (p.FirstName + ' ' + p.LastName) AS Name, DATEDIFF(year, p.BirthDate, GETDATE()) AS Age
FROM Phys.Patient p;
-- Returns 18,383 rows 

-- Q2. List all of the physicians 
select (ph.lastname + ', ' + ph.firstname) as Name
from phys.Physician ph;
-- Returns 101 rows

-- Aggregates
-- Q1. Minimum and maximum Hemoglobin A1c result
SELECT MIN(lt.value) as Minimum, MAX(lt.value) as Maximum
FROM phys.LaboratoryTests lt
WHERE lt.Description = 'Hemoglobin A1c';
-- Returns minimum value of 3.10133060592811 and maximum value of 12.0743701657101

-- Q2. Minimum and maximum Hemoglobin A1c result for each patient
select lt2.PatientKey, p2.FirstName, p2.LastName, 
MIN(lt2.value) as 'Minimum A1c', MAX(lt2.value) as 'Maximum A1c'
from phys.LaboratoryTests lt2
JOIN phys.Patient p2 ON lt2.PatientKey = p2.PatientKey 
where lt2.Description = 'Hemoglobin A1c'
group by lt2.PatientKey, p2.FirstName, p2.LastName;
--Returns 2650 Rows

-- Q3. Average of all Hemoglobin A1c results for each condition
SELECT pc.PCondition, AVG(lt3.value) as 'Average A1c Value'
FROM phys.PatientCondition pc
join phys.LaboratoryTests lt3 on pc.PatientKey = lt3.PatientKey
WHERE lt3.Description = 'Hemoglobin A1c'
GROUP BY pc.PCondition;
--Returns 6 Rows

-- Q4. q2 cleanup + count, min, max, avg, ordered alphabetically
select lt2.PatientKey, p2.LastName, p2.FirstName, 
MIN(lt2.value) as 'Minimum A1c', MAX(lt2.value) as 'Maximum A1c', AVG(lt2.Value) as 'Average A1c', COUNT(lt2.value) as 'Count of A1c Tests'
from phys.LaboratoryTests lt2
JOIN phys.Patient p2 ON lt2.PatientKey = p2.PatientKey 
where lt2.Description = 'Hemoglobin A1c'
group by lt2.PatientKey, p2.LastName, p2.FirstName
having COUNT(lt2.value) >=  2
order by p2.LastName, p2.FirstName;
-- Returns 2568 Rows
