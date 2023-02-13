Use PhysicianPractice

-- Ans 1
Select p.LastName, pc.PCondition, lt.Description, lt.Value, pp.practicename
from Phys.PhysicianPractice pp join Phys.PhysicianAssignedToPractice pap
on pp.PhysicianPracticeKey = pap.PhysicianPracticeKey
join Phys.Patient p
on p.PCPPhysicianKey = pap.PhysicianKey
Join Phys.PatientCondition pc 
on p.PatientKey = pc.PatientKey
Join Phys.LaboratoryTests lt 
on p.PatientKey = lt.PatientKey
Where p.LastName = 'Carlson' and pc.PCondition= 'Diabetes' and lt.Description = 'Hemoglobin A1c' and lt.Value between '5' and '9';
-- There are two practice names for patient name Carlson suffering from diabetes and A1c value between 5 and 9

-- Ans 2
Select p.LastName, pc.PCondition, lt.Description, lt.Value, pp.practicename, ov.DateofVisit
from Phys.PhysicianPractice pp 
join Phys.PhysicianAssignedToPractice pap
on pp.PhysicianPracticeKey = pap.PhysicianPracticeKey
join Phys.Patient p
on p.PCPPhysicianKey = pap.PhysicianKey
Join Phys.PatientCondition pc 
on p.PatientKey = pc.PatientKey
Join Phys.LaboratoryTests lt 
on p.PatientKey = lt.PatientKey
join Phys.OfficeVisit ov 
on p.PatientKey = ov.PatientKey
Where p.LastName = 'Carlson' and pc.PCondition= 'Diabetes' and lt.Description = 'Hemoglobin A1c' and lt.Value between '5' and '9';
-- There are 84 visits from the patients in Answer 1

-- Ans 3
Select p.LastName, pc.PCondition, lt2.Description, lt2.OrderDate, pp.practicename
from Phys.PhysicianPractice pp 
join Phys.PhysicianAssignedToPractice pap
on pp.PhysicianPracticeKey = pap.PhysicianPracticeKey
join Phys.Patient p
on p.PCPPhysicianKey = pap.PhysicianKey
Join Phys.PatientCondition pc 
on p.PatientKey = pc.PatientKey
Join Phys.LaboratoryTests lt 
on p.PatientKey = lt.PatientKey
Join Phys.LaboratoryTests lt2
on p.PatientKey = lt2.PatientKey
Where p.LastName = 'Carlson' and pc.PCondition= 'Diabetes' 
and lt.Description = 'Hemoglobin A1c' and lt.Value between '5' and '9';
-- Returns 53 rows. There are 53 lab results in the table.

-- Ans 4
select Phys.Physician.FirstName,
	   Phys.Physician.LastName, 
	   Phys.Physician.BirthDate,
	   Phys.Patient.FirstName, 
	   Phys.Patient.LastName, 
	   Phys.Patient.BirthDate 
	   from Phys.Physician, Phys.Patient
where Phys.Patient.PCPPhysicianKey = Phys.Physician.PhysicianKey 
	   and Phys.Patient.BirthDate < Phys.Physician.BirthDate
--Returns 9069 rows. 9069 patients who are older than their PCP.