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


-- QUE 15 --
select first_name, last_name, birth_date from patients where height >160 and weight > 70;

-- QUE 16 ---

