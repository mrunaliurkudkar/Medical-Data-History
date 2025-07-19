create schema project_medical_history_data;
select * from admissions;
alter table admissions rename column attending_doctor_id to doctor_id ;
select * from doctors;
select * from patients;
select * from province_names;

-- QUE 1 ---
select first_name, last_name, gender from patients where gender = 'M';

-- QUE 2----
select first_name, last_name from patients where allergies is null;

-- QUE 3 ---
Select first_name from patients where first_name like 'c%';

-- QUE 4 ---
select first_name,last_name from patients where weight between 100 and  120;

-- QUE 5 ---
update patients set allergies = 'NKA' where allergies is null;

-- QUE 6 --
select concat(first_name, '', last_name) as full_name from patients;

-- QUE 7 ---
select p.first_name, p.last_name, pr.province_name from patients as p join province_names as pr
on p.province_id = pr.province_id;

-- QUE 8 ---
SELECT COUNT(*) FROM patients WHERE year(birth_date)=2010;

-- QUE 9 ---
select first_name, last_name, height from patients order by height desc limit 1;

-- QUE 10 ---
select * from patients where patient_id in (1,45,534,879,1000);

-- QUE 11 --
select count(*) as total_admission from admissions;

-- QUE 12-- 
select * from admissions where admission_date= discharge_date;

-- QUE 13 --
select count(*) from admissions where patient_id = 579;

-- QUE 14 ---
select distinct city from patients where province_id = 'NS';

-- QUE 15 --
select first_name, last_name, birth_date from patients where height >160 and weight > 70;

-- QUE 16 ---
select distinct year(birth_date) as birth_year from patients 
order by birth_year asc ;

-- QUE 17 --
Select first_name from patients group by first_name having count(*) =1;

-- QUE 18 ---
select first_name, patient_id from patients where first_name like '%s' and first_name like 's%' and length(first_name)>= 6;

-- QUE 19 ---
select p.patient_id, p.first_name, p.last_name from patients as p join admissions as a on p.patient_id = a.patient_id
where a.diagnosis = 'dementia';

-- QUE 20 --
select first_name from patients order by length(first_name), first_name;

-- QUE 21 --
select
sum (case when gender = 'M' then 1 else 0 end) as male_count,
sum (case when gender = 'F' then 1 else 0 end) as female_count
from patients;

-- QUE 22 --
SELECT 
  SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
  SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM patients;

-- QUE 23 --
select patient_id, diagnosis from admissions group by patient_id, diagnosis having count(*)>1;

-- QUE 24 --
select city, count(*) as total_patients from patients group by city order by total_patients desc, city asc;

-- QUE 25 --
select first_name, last_name,'Patient' as role from patients
union
select first_name, last_name, 'Doctor' as role from doctors;

-- QUE 26 --
Select allergies, count(*) as count from patients where allergies is not null group by allergies order by count desc;

-- QUE 27--
select first_name, last_name, birth_date from patients where year(birth_date) between 1970 and 1979 order by birth_date;

-- QUE 28 --
select concat(upper(last_name), ',', lower(first_name)) as full_name from patients order by lower(first_name) desc;

-- QUE 29 --
SELECT province_id, SUM(height) AS total_height
FROM patients
GROUP BY province_id
HAVING SUM(height) >= 7000;

-- QUE 30 --
select max(weight) - min(weight) as weight_difference from patients where last_name = 'Maroni';

-- QUE 31--
select day(admission_date) as day, count(*) as admission_count from admissions group by day order by admission_count desc;

-- QUE 32 --
SELECT FLOOR(weight / 10) * 10 AS weight_group, COUNT(*) AS total_patients
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;

-- QUE 33 --
SELECT patient_id, weight, height,
  CASE 
    WHEN (weight / POWER(height / 100.0, 2)) >= 30 THEN 1 
    ELSE 0 
  END AS isObese
FROM patients;

-- QUE 34 --
SELECT p.patient_id, p.first_name, p.last_name, d.specialty
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy' AND d.first_name = 'Lisa';

-- QUE 35 --
SELECT DISTINCT p.patient_id,
       CONCAT(
           p.patient_id,
           LENGTH(p.last_name),
           YEAR(p.birth_date)
       ) AS temp_password
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id;








