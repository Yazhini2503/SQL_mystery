-- CREATING DATABASE
CREATE DATABASE clinical_trial_mystery;

-- USING DATABASE
USE clinical_trial_mystery;

-- CREATING TABLE FOR PATIENT
CREATE TABLE patients(
    patient_id INT PRIMARY KEY,
    name VARCHAR(500),
    age INT,
    phase INT,
    status VARCHAR(100)
);

-- INSERTING DATA FOR PATEINT
INSERT INTO patients(patient_id,name,age,phase,status)
VALUES
(1, 'Alice Johnson', 34, 1, 'Completed'),
(2, 'Bob Smith', 45, 1, 'Completed'),
(3, 'Charlie Brown', 52, 2, 'Completed'),
(4, 'Diana Prince', 38, 2, 'Dropped Out'),
(5, 'Ethan Hunt', 29, 3, 'Completed'),
(6, 'Fiona Davis', 41, 3, 'Completed'),
(7, 'George Lucas', 55, 3, 'Completed'), 
(8, 'Hannah Adams', 49, 3, 'Completed'), 
(9, 'Isla Thompson', 35, 1, 'Completed'), 
(10, 'Jack White', 50, 1, 'Completed'), 
(11, 'Kara Miller', 28, 2, 'Completed'),
(12, 'Liam Scott', 42, 2, 'Completed'),
(13, 'Mia Turner', 47, 3, 'Completed'),
(14, 'Nathan Hall', 39, 3, 'Dropped Out'),
(15, 'Olivia King', 36, 3, 'Completed'),
(16, 'Peter Wright', 53, 3, 'Completed'), 
(17, 'Quinn Reed', 45, 3, 'Completed'), 
(18, 'Ryan Bennett', 31, 3, 'Completed');
 

-- CREATING TABLE FOR TRIAL RESULTS
CREATE TABLE trial_results(
    result_id INT PRIMARY KEY,
    patient_id INT,
    phase INT,
    drug_response INT,
    placebo_response INT,
    adverse_effect VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- INSERTING DATA FOR TRIAL RESULTS
INSERT INTO trial_results(result_id,patient_id,phase,drug_response,placebo_response,adverse_effect)
VALUES
(1, 1, 1, 7, NULL, 'Mild headache'),
(2, 2, 1, 5, NULL, 'Fatigue'),
(3, 3, 2, 8, NULL, NULL),
(4, 4, 2, 3, NULL, 'Dizziness'),
(5, 5, 3, 6, 7, NULL),
(6, 6, 3, 4, 5, 'Nausea'),
(7, 7, 3, 9, NULL, NULL ),
(8, 8, 3, 5, NULL, 'Sever rash'),
(9, 9, 1, 6, NULL, 'Fatigue'),
(10, 10, 1, 5, NULL, 'Nausea' ),
(11, 11, 2, 7, NULL, NULL),
(12, 12, 2, 3, NULL, 'Dizziness'),
(13, 13, 3, 8, 6, NULL),
(14, 14, 3, 5, 7, 'Insomnia'),
(15, 15, 3, 9, NULL, NULL),
(16, 16, 3, 4, NULL, 'Severe headache'),
(17, 17, 3, 6, NULL, 'Blurred vision'),
(18, 18, 3, 8, NULL, NULL);

-- CREATING TABLE REPORTS
CREATE TABLE reports(
    report_id INT PRIMARY KEY,
    phase INT,
    status VARCHAR(100),
    location VARCHAR(100)
);

-- INSERTING DATA INTO REPORTS
INSERT INTO reports(report_id,phase,status,location)
VALUES
(1, 1, 'Available', 'Archive Room A'),
(2, 2, 'Available', 'Main Database'),
(3, 3, 'Available', 'Trial Office'),
(4, 4, 'Missing', 'Unknown'),
(5, 1, 'Available', 'Lab Storage'),
(6, 2, 'Available', 'Digital Database'),
(7, 3, 'Available', 'Regulatory Office'),
(8, 4, 'Missing', 'Unknown'),
(9, 4, 'Available', 'Research Vault'),
(10, 4, 'Available', 'Clinical Archive');

-- CREATING TABLE STAFF
CREATE TABLE staff(
    staff_id INT PRIMARY KEY,
    name VARCHAR(500),
    role VARCHAR(100),
    department VARCHAR(100)
);

-- INSERTING DATA INTO STAFF
INSERT INTO staff(staff_id,name,role,department)
VALUES
(1 ,'Dr. Emily Carter', 'Doctor', 'Oncology'),
(2, 'Dr. Michael Evans', 'Researcher', 'Pharmacology'),
(3, 'Dr. Olivia Brown', 'Doctor', 'Neurology'),
(4, 'Dr. David Wilson', 'Researcher', 'Data Science'),
(5, 'Dr. Sophia Harris', 'Doctor', 'Cardiology'),
(6, 'Dr. William Parker', 'Researcher', 'Pharmacokinetics'), 
(7, 'Dr. Ava Mitchell', 'Doctor', 'Infectious Diseases'), 
(8, 'Dr. Benjamin Clarke', 'Researcher', 'Epidemiology'), 
(9, 'Dr. Chloe Adams', 'Doctor', 'Neurology'), 
(10, 'Dr. Daniel Foster', 'Researcher', 'Genomics');