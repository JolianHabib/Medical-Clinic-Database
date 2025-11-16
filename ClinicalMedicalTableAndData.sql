--Jolian Habib - 211613526
CREATE DATABASE MedicalClinicDB;

CREATE TABLE ClinicalStaff (
    StaffID VARCHAR(9) PRIMARY KEY 
	      CHECK (LENGTH(StaffID)=9),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(10) NOT NULL 
	      CHECK (LENGTH(phone)= 10),
    Email VARCHAR(120) UNIQUE CHECK (Email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    HireDate DATE DEFAULT CURRENT_DATE,
	Status VARCHAR(20) DEFAULT 'Active'
          CHECK (Status IN ('Active', 'OnLeave', 'Retired', 'Terminated')) ,-- Valid staff status options
	StaffRole VARCHAR(30) NOT NULL
          CHECK(StaffRole IN ('Doctor','Nurse','Receptionist','Administrator','LabTechnician','Pharmacist' ))
);


INSERT INTO ClinicalStaff (StaffID, FirstName, LastName, Phone, Email, HireDate, Status, StaffRole) VALUES
('100000001', 'John', 'Doe', '0521234567', 'john.doe@clinic.com', '2020-05-10', 'Active', 'Doctor'),
('100000002', 'Emily', 'Clark', '0521234568', 'emily.clark@clinic.com', '2019-03-21', 'Active', 'Nurse'),
('100000003', 'Michael', 'Smith', '0521234569', 'michael.smith@clinic.com', '2018-08-12', 'Active', 'Doctor'),
('100000004', 'Sarah', 'Jones', '0521234570', 'sarah.jones@clinic.com', '2022-01-01', 'OnLeave', 'Receptionist'),
('100000005', 'Robert', 'Brown', '0521234571', 'robert.brown@clinic.com', '2017-06-30', 'Retired', 'Doctor'),
('100000006', 'Jessica', 'Lee', '0521234572', 'jessica.lee@clinic.com', '2023-04-15', 'Active', 'Administrator'),
('100000007', 'David', 'Williams', '0521234573', 'david.williams@clinic.com', '2019-11-20', 'Active', 'LabTechnician'),
('100000008', 'Laura', 'Taylor', '0521234574', 'laura.taylor@clinic.com', '2020-09-05', 'Active', 'Nurse'),
('100000009', 'Chris', 'Johnson', '0521234575', 'chris.johnson@clinic.com', '2021-03-18', 'Terminated', 'Receptionist'),
('100000010', 'Sophia', 'Martin', '0521234576', 'sophia.martin@clinic.com', '2016-07-14', 'Active', 'Pharmacist'),

('100000011', 'Daniel', 'Moore', '0521234577', 'daniel.moore@clinic.com', '2022-10-11', 'Active', 'Doctor'),
('100000012', 'Grace', 'Anderson', '0521234578', 'grace.anderson@clinic.com', '2021-02-01', 'Active', 'Nurse'),
('100000013', 'Brian', 'Thomas', '0521234579', 'brian.thomas@clinic.com', '2015-12-12', 'OnLeave', 'Doctor'),
('100000014', 'Olivia', 'Jackson', '0521234580', 'olivia.jackson@clinic.com', '2020-04-25', 'Active', 'LabTechnician'),
('100000015', 'James', 'White', '0521234581', 'james.white@clinic.com', '2023-05-02', 'Active', 'Doctor'),
('100000016', 'Anna', 'Harris', '0521234582', 'anna.harris@clinic.com', '2019-01-13', 'Retired', 'Nurse'),
('100000017', 'Steven', 'Martin', '0521234583', 'steven.martin@clinic.com', '2018-10-07', 'Active', 'Doctor'),
('100000018', 'Ella', 'Lopez', '0521234584', 'ella.lopez@clinic.com', '2023-06-30', 'Active', 'Pharmacist'),
('100000019', 'Kevin', 'Hill', '0521234585', 'kevin.hill@clinic.com', '2020-11-09', 'OnLeave', 'Doctor'),
('100000020', 'Mia', 'Scott', '0521234586', 'mia.scott@clinic.com', '2017-03-27', 'Active', 'Nurse'),

('100000021', 'Jason', 'Green', '0521234587', 'jason.green@clinic.com', '2021-08-22', 'Active', 'Doctor'),
('100000022', 'Emma', 'Baker', '0521234588', 'emma.baker@clinic.com', '2019-04-17', 'Active', 'Doctor'),
('100000023', 'Henry', 'Nelson', '0521234589', 'henry.nelson@clinic.com', '2022-09-03', 'Active', 'LabTechnician'),
('100000024', 'Zoe', 'Carter', '0521234590', 'zoe.carter@clinic.com', '2020-01-29', 'Retired', 'Nurse'),
('100000025', 'Aaron', 'Mitchell', '0521234591', 'aaron.mitchell@clinic.com', '2018-06-18', 'Terminated', 'Doctor'),
('100000026', 'Lily', 'Perez', '0521234592', 'lily.perez@clinic.com', '2021-12-10', 'Active', 'Administrator'),
('100000027', 'Noah', 'Roberts', '0521234593', 'noah.roberts@clinic.com', '2023-02-14', 'Active', 'Pharmacist'),
('100000028', 'Chloe', 'Turner', '0521234594', 'chloe.turner@clinic.com', '2022-03-05', 'Active', 'Nurse'),
('100000029', 'Ethan', 'Phillips', '0521234595', 'ethan.phillips@clinic.com', '2017-11-21', 'OnLeave', 'Doctor'),
('100000030', 'Ava', 'Campbell', '0521234596', 'ava.campbell@clinic.com', '2019-07-08', 'Active', 'Receptionist');



CREATE TABLE Department (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    HeadStaffID VARCHAR(9) 
	        REFERENCES ClinicalStaff(StaffID)
                   ON UPDATE CASCADE
                   ON DELETE SET NULL,
    Description TEXT
 );

INSERT INTO Department (DepartmentName, HeadStaffID, Description) VALUES
('Cardiology', '100000001', 'Deals with heart-related medical conditions.'),
('Pediatrics', '100000003', 'Medical care for infants, children, and adolescents.'),
('General Medicine', '100000011', 'Handles routine and preventive medical care.'),
('Orthopedics', '100000017', 'Treats disorders of bones, joints, ligaments, and muscles.'),
('Neurology', '100000029', 'Specialized in treating nervous system disorders.'),
('Emergency', '100000025', 'Manages emergency cases and trauma patients.'),
('Dermatology', '100000013', 'Focuses on skin, hair, and nail conditions.'),
('ENT (Ear, Nose, Throat)', '100000021', 'Manages hearing, voice, and sinus conditions.'),
('Radiology', '100000007', 'Performs imaging services like X-rays and MRIs.'),
('Pharmacy', '100000018', 'Dispenses medication and advises on drug use.'),

('Nursing Services', '100000012', 'Manages nursing staff and patient care coordination.'),
('Administration', '100000006', 'Handles general operations, scheduling, and HR.'),
('Reception Services', '100000004', 'Manages front desk, appointments, and phone calls.'),
('Laboratory', '100000014', 'Performs diagnostic tests and medical analysis.'),
('Physiotherapy', '100000019', 'Supports patients with mobility and rehabilitation.'),
('Gynecology', '100000005', 'Focuses on women’s reproductive health.'),
('Urology', '100000013', 'Treats urinary and male reproductive issues.'),
('Oncology', '100000017', 'Deals with cancer diagnosis and treatment.'),
('Mental Health', '100000027', 'Supports psychological and psychiatric care.'),
('IT & Records', '100000026', 'Manages electronic records and clinic IT systems.');



CREATE TABLE StaffDepartment (
    StaffID VARCHAR(9) NOT NULL
          REFERENCES ClinicalStaff(StaffID)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE, 
    DepartmentID INT NOT NULL
          REFERENCES Department(DepartmentID)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT,
    PRIMARY KEY (StaffID, DepartmentID)
);


-- Doctors
INSERT INTO StaffDepartment VALUES ('100000001', 1);  -- John → Cardiology
INSERT INTO StaffDepartment VALUES ('100000003', 2);  -- Michael → Pediatrics
INSERT INTO StaffDepartment VALUES ('100000011', 3);  -- Daniel → General Medicine
INSERT INTO StaffDepartment VALUES ('100000017', 4);  -- Steven → Orthopedics
INSERT INTO StaffDepartment VALUES ('100000029', 5);  -- Ethan → Neurology
INSERT INTO StaffDepartment VALUES ('100000025', 6);  -- Aaron → Emergency
INSERT INTO StaffDepartment VALUES ('100000013', 7);  -- Brian → Dermatology
INSERT INTO StaffDepartment VALUES ('100000021', 8);  -- Jason → ENT
INSERT INTO StaffDepartment VALUES ('100000005', 16); -- Robert → Gynecology
INSERT INTO StaffDepartment VALUES ('100000017', 18); -- Steven → Oncology
INSERT INTO StaffDepartment VALUES ('100000022', 16); -- Emma → Gynecology
INSERT INTO StaffDepartment VALUES ('100000019', 3); -- Kevin → General Medicine
INSERT INTO StaffDepartment VALUES ('100000015', 16); -- James → Gynecology

-- Nurses
INSERT INTO StaffDepartment VALUES ('100000002', 11); -- Emily → Nursing
INSERT INTO StaffDepartment VALUES ('100000008', 11); -- Laura → Nursing
INSERT INTO StaffDepartment VALUES ('100000012', 11); -- Grace → Nursing
INSERT INTO StaffDepartment VALUES ('100000020', 11); -- Mia → Nursing
INSERT INTO StaffDepartment VALUES ('100000024', 11); -- Zoe → Nursing

-- Receptionists
INSERT INTO StaffDepartment VALUES ('100000004', 13); -- Sarah → Reception
INSERT INTO StaffDepartment VALUES ('100000009', 13); -- Chris → Reception
INSERT INTO StaffDepartment VALUES ('100000030', 13); -- Ava → Reception

-- Admin / IT
INSERT INTO StaffDepartment VALUES ('100000006', 12); -- Jessica → Admin
INSERT INTO StaffDepartment VALUES ('100000026', 20); -- Lily → IT & Records

-- Lab Technicians
INSERT INTO StaffDepartment VALUES ('100000007', 9);  -- David → Radiology
INSERT INTO StaffDepartment VALUES ('100000014', 14); -- Olivia → Laboratory

-- Pharmacists
INSERT INTO StaffDepartment VALUES ('100000010', 10); -- Sophia → Pharmacy
INSERT INTO StaffDepartment VALUES ('100000018', 10); -- Ella → Pharmacy
INSERT INTO StaffDepartment VALUES ('100000027', 19); -- Noah → Mental Health

-- Mixed
INSERT INTO StaffDepartment VALUES ('100000001', 18); -- John also works in Oncology
INSERT INTO StaffDepartment VALUES ('100000003', 3);  -- Michael → General Medicine




CREATE TABLE Doctor (
    StaffID VARCHAR(9) PRIMARY KEY
        REFERENCES ClinicalStaff(StaffID)
               ON UPDATE CASCADE
               ON DELETE CASCADE,
    LicenseNumber VARCHAR(40) NOT NULL UNIQUE,
    Specialty VARCHAR(100) NOT NULL,
    YearsOfExperience INT CHECK (YearsOfExperience >= 0)
);

INSERT INTO Doctor (StaffID, LicenseNumber, Specialty, YearsOfExperience) VALUES
('100000001', 'DOC-IL-202001', 'Cardiology', 12),
('100000003', 'DOC-IL-202002', 'Pediatrics', 9),
('100000011', 'DOC-IL-202003', 'General Medicine', 7),
('100000017', 'DOC-IL-202004', 'Orthopedics', 14),
('100000029', 'DOC-IL-202005', 'Neurology', 8),
('100000025', 'DOC-IL-202006', 'Emergency Medicine', 10),
('100000013', 'DOC-IL-202007', 'Dermatology', 15),
('100000021', 'DOC-IL-202008', 'ENT (Ear, Nose, Throat)', 6),
('100000005', 'DOC-IL-202009', 'Gynecology', 18),
('100000022', 'DOC-IL-202010', 'Gynecology', 5),
('100000019', 'DOC-IL-202011', 'Physiotherapy', 4),
('100000015', 'DOC-IL-202012', 'Family Medicine', 3);


CREATE TYPE gender_enum AS ENUM ('M', 'F');

CREATE TABLE Patient (
    PatientID VARCHAR(9) PRIMARY KEY
           CHECK (LENGTH(PatientID) = 9),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL
           CHECK (DateOfBirth <= CURRENT_DATE),
    Gender gender_enum NOT NULL,
    Phone CHAR(10) NOT NULL
           CHECK (LENGTH(Phone) = 10),
    Email VARCHAR(120) UNIQUE,
    RegistrationDate DATE DEFAULT CURRENT_DATE
);



INSERT INTO Patient (PatientID, FirstName, LastName, DateOfBirth, Gender, Phone, Email, RegistrationDate) VALUES
('200000001', 'David', 'Cohen', '1985-03-14', 'M', '0541234567', 'david.cohen@example.com', '2023-01-10'),
('200000002', 'Sarah', 'Levi', '1990-06-21', 'F', '0541234568', 'sarah.levi@example.com', '2022-11-05'),
('200000003', 'Michael', 'Katz', '1978-09-09', 'M', '0541234569', 'michael.katz@example.com', '2024-02-15'),
('200000004', 'Rachel', 'Peretz', '1995-12-02', 'F', '0541234570', 'rachel.peretz@example.com', '2024-03-01'),
('200000005', 'Daniel', 'Shapiro', '1982-07-17', 'M', '0541234571', 'daniel.shapiro@example.com', '2023-12-18'),
('200000006', 'Leah', 'Avraham', '1989-01-25', 'F', '0541234572', 'leah.avraham@example.com', '2023-08-22'),
('200000007', 'Jonathan', 'Mizrahi', '1975-04-30', 'M', '0541234573', 'jonathan.mizrahi@example.com', '2022-09-14'),
('200000008', 'Yael', 'Ben-David', '1998-10-11', 'F', '0541234574', 'yael.ben.david@example.com', '2024-01-29'),
('200000009', 'Eitan', 'Cohen', '1986-05-19', 'M', '0541234575', 'eitan.cohen@example.com', '2023-05-17'),
('200000010', 'Maya', 'Harel', '1993-08-06', 'F', '0541234576', 'maya.harel@example.com', '2023-07-25'),

('200000011', 'Noam', 'Sharon', '1991-11-03', 'M', '0541234577', 'noam.sharon@example.com', '2024-02-20'),
('200000012', 'Tamar', 'Baruch', '1987-02-14', 'F', '0541234578', 'tamar.baruch@example.com', '2023-10-12'),
('200000013', 'Yosef', 'Goldberg', '1979-09-25', 'M', '0541234579', 'yosef.goldberg@example.com', '2022-12-09'),
('200000014', 'Hila', 'Amar', '1997-06-18', 'F', '0541234580', 'hila.amar@example.com', '2023-03-04'),
('200000015', 'Ariel', 'Efrati', '1983-01-09', 'M', '0541234581', 'ariel.efrati@example.com', '2023-06-21'),
('200000016', 'Shira', 'Carmi', '1992-04-22', 'F', '0541234582', 'shira.carmi@example.com', '2024-04-05'),
('200000017', 'Amir', 'Sasson', '1984-12-13', 'M', '0541234583', 'amir.sasson@example.com', '2023-09-11'),
('200000018', 'Noga', 'Rosen', '1996-05-27', 'F', '0541234584', 'noga.rosen@example.com', '2022-11-30'),
('200000019', 'Yonatan', 'Levi', '1977-10-15', 'M', '0541234585', 'yonatan.levi@example.com', '2023-08-03'),
('200000020', 'Lior', 'Kaplan', '1994-07-08', 'F', '0541234586', 'lior.kaplan@example.com', '2024-05-16'),

('200000021', 'Itay', 'Weiss', '1981-03-02', 'M', '0541234587', 'itay.weiss@example.com', '2023-01-19'),
('200000022', 'Or', 'Halperin', '1988-11-29', 'F', '0541234588', 'or.halperin@example.com', '2023-02-25'),
('200000023', 'Erez', 'Shalev', '1976-08-05', 'M', '0541234589', 'erez.shalev@example.com', '2023-04-13'),
('200000024', 'Gal', 'Shoham', '1995-01-21', 'F', '0541234590', 'gal.shoham@example.com', '2024-06-10'),
('200000025', 'Oren', 'Maoz', '1980-05-28', 'M', '0541234591', 'oren.maoz@example.com', '2023-12-02'),
('200000026', 'Dana', 'Peleg', '1986-09-07', 'F', '0541234592', 'dana.peleg@example.com', '2022-10-15'),
('200000027', 'Ronen', 'Elyashiv', '1978-04-18', 'M', '0541234593', 'ronen.elyashiv@example.com', '2024-01-06'),
('200000028', 'Aviv', 'Mor', '1999-02-24', 'F', '0541234594', 'aviv.mor@example.com', '2023-05-23'),
('200000029', 'Nadav', 'Biran', '1985-06-12', 'M', '0541234595', 'nadav.biran@example.com', '2023-07-14'),
('200000030', 'Adi', 'Segal', '1991-09-16', 'F', '0541234596', 'adi.segal@example.com', '2024-02-08');




CREATE TABLE Appointment (
    AppointmentID SERIAL PRIMARY KEY, 
    PatientID VARCHAR(9) NOT NULL
        REFERENCES Patient(PatientID)
               ON UPDATE CASCADE
               ON DELETE RESTRICT,
    DoctorID VARCHAR(9) NOT NULL
        REFERENCES Doctor(StaffID)
               ON UPDATE CASCADE
               ON DELETE RESTRICT,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Room VARCHAR(30),
    Status VARCHAR(20) DEFAULT 'Scheduled'
        CHECK(Status IN ('Scheduled','Completed','Cancelled','NoShow')),
    Note TEXT,
    UNIQUE (DoctorID, AppointmentDate, AppointmentTime)

);


INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, AppointmentTime, Room, Status, Note) VALUES
('200000001', '100000001', '2025-08-07', '09:00:00', 'Room 101', 'Scheduled', 'Routine heart check-up'),
('200000002', '100000003', '2025-08-07', '09:30:00', 'Room 202', 'Scheduled', 'Pediatric vaccination'),
('200000003', '100000011', '2025-08-07', '10:00:00', 'Room 105', 'Scheduled', 'General health consultation'),
('200000004', '100000017', '2025-08-07', '10:30:00', 'Room 301', 'Completed', 'Follow-up after knee surgery'),
('200000005', '100000029', '2025-08-07', '11:00:00', 'Room 204', 'Cancelled', 'Rescheduled due to conflict'),
('200000006', '100000025', '2025-08-07', '11:30:00', 'ER-1', 'Scheduled', 'Chest pain - urgent check'),
('200000007', '100000013', '2025-08-07', '12:00:00', 'Room 402', 'Scheduled', 'Skin rash diagnosis'),
('200000008', '100000021', '2025-08-07', '12:30:00', 'Room 208', 'Scheduled', 'Sinus infection check-up'),
('200000009', '100000005', '2025-08-07', '13:00:00', 'Room 303', 'Completed', 'Routine gynecological exam'),
('200000010', '100000022', '2025-08-07', '13:30:00', 'Room 305', 'NoShow', 'Patient did not arrive'),

('200000011', '100000001', '2025-08-08', '09:00:00', 'Room 101', 'Scheduled', 'Blood pressure follow-up'),
('200000012', '100000003', '2025-08-08', '09:30:00', 'Room 202', 'Completed', 'Child annual physical exam'),
('200000013', '100000011', '2025-08-08', '10:00:00', 'Room 105', 'Scheduled', 'Prescription renewal'),
('200000014', '100000017', '2025-08-08', '10:30:00', 'Room 301', 'Scheduled', 'Back pain evaluation'),
('200000015', '100000029', '2025-08-08', '11:00:00', 'Room 204', 'Scheduled', 'Migraine assessment'),
('200000016', '100000025', '2025-08-08', '11:30:00', 'ER-1', 'Completed', 'Minor accident treatment'),
('200000017', '100000013', '2025-08-08', '12:00:00', 'Room 402', 'Scheduled', 'Mole removal consultation'),
('200000018', '100000021', '2025-08-08', '12:30:00', 'Room 208', 'Cancelled', 'Patient requested delay'),
('200000019', '100000005', '2025-08-08', '13:00:00', 'Room 303', 'Scheduled', 'Pregnancy check-up'),
('200000020', '100000022', '2025-08-08', '13:30:00', 'Room 305', 'Scheduled', 'Routine women’s health check'),

('200000021', '100000001', '2025-08-09', '09:00:00', 'Room 101', 'Completed', 'Post-surgery heart monitoring'),
('200000022', '100000003', '2025-08-09', '09:30:00', 'Room 202', 'Scheduled', 'Pediatric ear infection check'),
('200000023', '100000011', '2025-08-09', '10:00:00', 'Room 105', 'Scheduled', 'Annual health screening'),
('200000024', '100000017', '2025-08-09', '10:30:00', 'Room 301', 'Scheduled', 'Post-fracture follow-up'),
('200000025', '100000029', '2025-08-09', '11:00:00', 'Room 204', 'NoShow', 'Did not show for neuro check'),
('200000026', '100000025', '2025-08-09', '11:30:00', 'ER-1', 'Scheduled', 'Stomach pain evaluation'),
('200000027', '100000013', '2025-08-09', '12:00:00', 'Room 402', 'Completed', 'Psoriasis treatment session'),
('200000028', '100000021', '2025-08-09', '12:30:00', 'Room 208', 'Scheduled', 'Hearing test and consultation'),
('200000029', '100000005', '2025-08-09', '13:00:00', 'Room 303', 'Scheduled', 'Routine gynecological screening'),
('200000030', '100000022', '2025-08-09', '13:30:00', 'Room 305', 'Scheduled', 'Fertility consultation');


CREATE TABLE Prescription (
    PrescriptionID SERIAL PRIMARY KEY,
    AppointmentID INT NOT NULL
        REFERENCES Appointment(AppointmentID)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Instructions TEXT,
    Fulfilled BOOLEAN DEFAULT FALSE
);


INSERT INTO Prescription (AppointmentID, MedicationName, Dosage, StartDate, EndDate, Instructions, Fulfilled) VALUES
(1, 'Aspirin', '100mg once daily', '2025-08-07', '2025-08-14', 'Take with food', FALSE),
(2, 'Paracetamol', '500mg every 6 hours', '2025-08-07', '2025-08-10', 'Only when fever occurs', TRUE),
(3, 'Amoxicillin', '500mg every 8 hours', '2025-08-07', '2025-08-14', 'Complete full course', TRUE),
(4, 'Ibuprofen', '400mg as needed', '2025-08-07', '2025-08-12', 'Avoid on empty stomach', FALSE),
(5, 'Lisinopril', '10mg daily', '2025-08-07', '2025-09-07', 'Monitor blood pressure', TRUE),
(6, 'Omeprazole', '20mg before breakfast', '2025-08-07', '2025-08-21', 'Do not crush tablets', FALSE),
(7, 'Hydrocortisone Cream', 'Apply twice daily', '2025-08-07', '2025-08-17', 'Use on affected skin only', TRUE),
(8, 'Cetirizine', '10mg at night', '2025-08-07', '2025-08-14', 'Avoid alcohol', FALSE),
(9, 'Iron Supplement', '65mg daily', '2025-08-07', '2025-09-07', 'Take with orange juice', TRUE),
(10, 'Doxycycline', '100mg twice daily', '2025-08-07', '2025-08-13', 'Stay out of direct sunlight', TRUE),

(11, 'Metformin', '500mg twice daily', '2025-08-08', '2025-11-08', 'With meals', FALSE),
(12, 'Salbutamol Inhaler', '2 puffs as needed', '2025-08-08', '2025-10-08', 'Shake well before use', TRUE),
(13, 'Vitamin D', '1000 IU daily', '2025-08-08', '2025-09-08', 'Take with fat-containing meal', FALSE),
(14, 'Gabapentin', '300mg at bedtime', '2025-08-08', '2025-08-28', 'May cause dizziness', TRUE),
(15, 'Sumatriptan', '50mg when migraine starts', '2025-08-08', NULL, 'Do not exceed 200mg per day', FALSE),
(16, 'Antacid Suspension', '10ml after meals', '2025-08-08', '2025-08-18', 'Shake well before use', TRUE),
(17, 'Tretinoin Cream', 'Apply nightly', '2025-08-08', '2025-09-08', 'Avoid sun exposure', FALSE),
(18, 'Multivitamin', '1 tablet daily', '2025-08-08', '2025-10-08', 'Take in the morning', TRUE),
(19, 'Folic Acid', '400mcg daily', '2025-08-08', '2025-10-08', 'Important for pregnancy', TRUE),
(20, 'Nifedipine', '30mg once daily', '2025-08-08', '2025-11-08', 'Do not bite or chew capsule', FALSE),

(21, 'Clopidogrel', '75mg daily', '2025-08-09', '2025-11-09', 'Monitor for bruising', TRUE),
(22, 'Azithromycin', '500mg once daily', '2025-08-09', '2025-08-13', 'Take on empty stomach', TRUE),
(23, 'Levothyroxine', '50mcg daily', '2025-08-09', '2025-11-09', 'Take before breakfast', FALSE),
(24, 'Insulin Glargine', '10 units at night', '2025-08-09', NULL, 'Refrigerate; inject subcutaneously', TRUE),
(25, 'Ranitidine', '150mg twice daily', '2025-08-09', '2025-08-19', 'Avoid spicy food', FALSE);



CREATE TABLE MedicalRecord (
    RecordID SERIAL PRIMARY KEY,
    AppointmentID INT NOT NULL
            REFERENCES Appointment(AppointmentID)
                     ON UPDATE CASCADE
                     ON DELETE CASCADE,
    Diagnosis VARCHAR(200) NOT NULL,   
    TreatmentPlan TEXT,                     
    ClinicalNotes TEXT,                     
    FollowUpDate  DATE,                    
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE (AppointmentID)
);



INSERT INTO MedicalRecord (AppointmentID, Diagnosis, TreatmentPlan, ClinicalNotes, FollowUpDate, CreatedAt) VALUES
(14, 'Back Pain', 'Started therapy and scheduled follow-up.', 'Patient responded well to treatment.', NULL, '2025-07-11 17:49:47'),
(22, 'Asthma', 'Follow-up required for lab test results.', 'Patient expressed concerns about side effects.', '2025-08-21', '2025-08-04 17:49:47'),
(2, 'Arthritis', 'Started therapy and scheduled follow-up.', 'Patient responded well to treatment.', '2025-09-30', '2025-07-10 17:49:47'),
(8, 'Sinus Infection', 'Prescribed medication and lifestyle changes.', 'Recommended further diagnostic imaging.', '2025-09-24', '2025-08-03 17:49:47'),
(24, 'Gastritis', 'Advised rest and hydration, prescribed antibiotics.', 'Recommended further diagnostic imaging.', '2025-08-31', '2025-07-23 17:49:47'),
(3, 'Migraine', 'Referred to specialist and follow-up in two weeks.', 'Needs regular monitoring.', '2025-08-12', '2025-07-13 17:49:47'),
(11, 'UTI', 'Pain management and physiotherapy advised.', 'Advised patient to maintain a symptom diary.', '2025-08-30', '2025-08-01 17:49:47'),
(7, 'Pneumonia', 'Prescribed antidepressants and counseling sessions.', 'Patient responded well to treatment.', '2025-08-24', '2025-08-02 17:49:47'),
(20, 'Thyroid Disorder', 'Prescribed medication and lifestyle changes.', 'Recommended further diagnostic imaging.', NULL, '2025-08-01 17:49:47'),
(25, 'Gastritis', 'Advised rest and hydration, prescribed antibiotics.', 'Symptoms improved significantly.', '2025-09-10', '2025-07-19 17:49:47'),
(15, 'Acid Reflux', 'Follow-up required for lab test results.', 'Symptoms improved significantly.', NULL, '2025-07-16 17:49:47'),
(10, 'Tonsillitis', 'Referred to specialist and follow-up in two weeks.', 'Recommended further diagnostic imaging.', '2025-08-26', '2025-07-23 17:49:47'),
(27, 'Anemia', 'Started therapy and scheduled follow-up.', 'Patient expressed concerns about side effects.', NULL, '2025-07-22 17:49:47'),
(17, 'Bronchitis', 'Prescribed antidepressants and counseling sessions.', 'Needs regular monitoring.', NULL, '2025-07-14 17:49:47'),
(4, 'Common Cold', 'Referred to specialist and follow-up in two weeks.', 'Advised patient to maintain a symptom diary.', NULL, '2025-07-26 17:49:47'),
(6, 'Hypertension', 'Prescribed medication and lifestyle changes.', 'Patient responded well to treatment.', '2025-09-17', '2025-08-01 17:49:47'),
(12, 'Depression', 'Follow-up required for lab test results.', 'Recommended further diagnostic imaging.', '2025-08-30', '2025-07-24 17:49:47'),
(1, 'Diabetes Mellitus', 'Pain management and physiotherapy advised.', 'Patient expressed concerns about side effects.', '2025-09-07', '2025-07-29 17:49:47'),
(13, 'Eczema', 'Started therapy and scheduled follow-up.', 'Symptoms improved significantly.', NULL, '2025-07-30 17:49:47'),
(5, 'High Cholesterol', 'Started therapy and scheduled follow-up.', 'Recommended further diagnostic imaging.', '2025-09-14', '2025-07-21 17:49:47'),
(9, 'Skin Rash', 'Provided inhaler and allergy management plan.', 'Advised patient to maintain a symptom diary.', NULL, '2025-07-28 17:49:47'),
(21, 'Allergic Rhinitis', 'Advised rest and hydration, prescribed antibiotics.', 'Recommended further diagnostic imaging.', '2025-09-01', '2025-07-17 17:49:47'),
(18, 'Flu', 'Pain management and physiotherapy advised.', 'Needs regular monitoring.', NULL, '2025-07-15 17:49:47'),
(19, 'Anxiety', 'Follow-up required for lab test results.', 'Patient responded well to treatment.', NULL, '2025-07-13 17:49:47'),
(16, 'Insomnia', 'Prescribed antidepressants and counseling sessions.', 'Advised patient to maintain a symptom diary.', '2025-08-22', '2025-08-01 17:49:47');


-- first trigger.
-- Trigger reject any new appointment if AppointmentDate is in the past.
CREATE OR REPLACE FUNCTION trg_prevent_past_appointments()
RETURNS TRIGGER 
AS 

$$
BEGIN
  IF NEW.AppointmentDate < CURRENT_DATE THEN
    RAISE EXCEPTION 'Appointment date cannot be in the past';
  END IF;
  RETURN NEW;

END;
$$ 
LANGUAGE 'plpgsql';

CREATE TRIGGER trg_no_past_appointments
BEFORE INSERT ON Appointment
FOR EACH ROW
EXECUTE FUNCTION trg_prevent_past_appointments();


-- second trigger.
-- Trigger automatically sets UpdatedAt to the current timestamp.
CREATE OR REPLACE FUNCTION trg_medicalrecord_set_updatedat()
RETURNS TRIGGER 
AS

$$
BEGIN
  NEW.UpdatedAt := CURRENT_TIMESTAMP;
  RETURN NEW;
  
END
$$ 
LANGUAGE 'plpgsql';


CREATE TRIGGER trg_set_updatedat
BEFORE INSERT OR UPDATE
ON MedicalRecord
FOR EACH ROW
EXECUTE FUNCTION trg_medicalrecord_set_updatedat();





