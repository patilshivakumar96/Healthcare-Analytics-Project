-- 1. Total Patients
SELECT COUNT(*) AS total_patients FROM Patient;

-- 2. Total Doctors
select count(*) as total_doctors from doctor;

-- 3. Total Visits
SELECT COUNT(*) AS total_visits FROM Visit;

-- 4. Average Age of Patients
SELECT round(AVG(Age),2) AS Average_Age
FROM Patient;

-- 5. Top 5 Diagnosed Conditions 
SELECT Diagnosis, COUNT(*) AS count
FROM Visit
GROUP BY Diagnosis
ORDER BY count DESC
LIMIT 5;

-- 6. Follow-Up Rate
select round(count(*) / (select count(*)
from visit) * 100,2) as 'follow up rate'
from visit
where follow_up_required = 'yes';


-- 7. Treatment Cost Per Visit (Avg.)
select round(avg(treatment_cost),2) as 'average treatment cost'
from treatments;


-- 8. Total Lab Tests Conducted
SELECT COUNT(*) as 'total lab results'
FROM lab_result;

-- 9. Percentage of Abnormal Lab Results // need to correct
select round(count(*)/ (select count(*) from lab_result)*100, 2) as 'Percentage of Abnormal Lab Results'
from lab_result
where test_result= 'abnormal';

-- 10. Doctor Workload (Avg Patients Per Doctor) 
select round(count(visit_id)/(select count(doctor_id) from doctor),2) as ' doctor workload'
from visit;




