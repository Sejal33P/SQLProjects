use PhysicianPractice;

--Q.1
SELECT b.PatientKey, b.billingcharge
from phys.Billing b 
WHERE b.BillingCharge > '$1000' 
UNION
SELECT b.PatientKey, b.billingcharge
from phys.Billing b
WHERE b.BillingCharge < '$10'
--Returns 31,051 rows

--Q.2
SELECT b.PatientKey, b.billingcharge
from phys.Billing b 
WHERE b.BillingCharge > '$1000' 
INTERSECT
SELECT b.PatientKey, b.billingcharge
from phys.Billing b
WHERE b.BillingCharge < '$10'
--Returns 0 rows

--Q.3
SELECT b.PatientKey, b.billingcharge
from phys.Billing b 
WHERE b.BillingCharge > '$1000' 
EXCEPT
SELECT b.PatientKey, b.billingcharge
from phys.Billing b
WHERE b.BillingCharge < '$10'
-- Returns 11,208 rows

--Q.4
SELECT DISTINCT p.PatientKey, p.LastName, p.FirstName
FROM Phys.Patient p
JOIN temp.PhysicianAverageA1c taa ON p.PCPPhysicianKey = taa.PCPPhysicianKey
JOIN Phys.LaboratoryTests lt ON lt.PatientKey = p.PatientKey
WHERE(lt.Description = 'Hemoglobin A1c' AND lt.Value > taa.AverageA1cByPCP);
--Returns 1330 rows

--Q.5
SELECT p.PCPPhysicianKey, AVG(lt.value) as 'Average A1c by PCP'
from Phys.Patient p
JOIN Phys.LaboratoryTests lt ON lt.PatientKey = p.PatientKey
WHERE lt.Description = 'Hemoglobin A1c'
GROUP BY p.PCPPhysicianKey
ORDER BY p.PCPPhysicianKey
--Returns 20 rows

--Q.6
SELECT DISTINCT p.PatientKey, p.LastName, p.FirstName
FROM Phys.Patient p
JOIN (SELECT p.PCPPhysicianKey, AVG(lt.value) as 'AverageA1cByPCP'
		from Phys.Patient p
		JOIN Phys.LaboratoryTests lt ON lt.PatientKey = p.PatientKey
		WHERE lt.Description = 'Hemoglobin A1c'
		GROUP BY p.PCPPhysicianKey) AS taa ON p.PCPPhysicianKey = taa.PCPPhysicianKey
JOIN Phys.LaboratoryTests lt ON lt.PatientKey = p.PatientKey
WHERE (lt.Description = 'Hemoglobin A1c' AND lt.Value > taa.AverageA1cByPCP);
-- Returns 1330 Rows