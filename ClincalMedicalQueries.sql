-- Jolian Habib - 211613526
-- Q1: List all appointments that were cancelled or marked as 'NoShow' in the past 3 months.
SELECT * 
FROM Appointment
WHERE Status IN ('Cancelled', 'NoShow')
  AND AppointmentDate >= CURRENT_DATE - INTERVAL '3 months';


-- Q2: List all appointments that are scheduled to take place in Room 105.
SELECT AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime
FROM Appointment
WHERE Room = 'Room 105';

-- Q3: List all male patients.
SELECT PatientID, FirstName, LastName, DateOfBirth
FROM Patient
WHERE Gender = 'M';


-- Q4: Show all doctors with more than 10 years of experience.
SELECT d.StaffID,
       cs.FirstName || ' ' || cs.LastName AS DoctorName,
       d.YearsOfExperience
FROM Doctor d
JOIN ClinicalStaff cs ON d.StaffID = cs.StaffID
WHERE d.YearsOfExperience > 10;


-- Q5: Show all prescriptions with patient and doctor names.
SELECT pr.PrescriptionID,
       pr.MedicationName,
       p.FirstName || ' ' || p.LastName AS PatientName,
       cs.FirstName || ' ' || cs.LastName AS DoctorName
FROM Prescription pr
JOIN Appointment a ON pr.AppointmentID = a.AppointmentID
JOIN Patient p ON a.PatientID = p.PatientID
JOIN ClinicalStaff cs ON a.DoctorID = cs.StaffID;


-- Q6: List departments and the names of staff members who work in them.
SELECT d.DepartmentName,
       cs.FirstName || ' ' || cs.LastName AS StaffName,
       cs.StaffRole
FROM StaffDepartment sd
JOIN ClinicalStaff cs ON sd.StaffID = cs.StaffID
JOIN Department d ON sd.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName, StaffName;


-- Q7: How many appointments does each doctor have.
SELECT cs.FirstName || ' ' || cs.LastName AS DoctorName,
       COUNT(*) AS AppointmentCount
FROM Appointment a
JOIN ClinicalStaff cs ON a.DoctorID = cs.StaffID
GROUP BY cs.StaffID, cs.FirstName, cs.LastName
ORDER BY AppointmentCount DESC, DoctorName;


-- Q8: How many doctors have each specialty.
SELECT Specialty,
       COUNT(*) AS DoctorCount
FROM Doctor
GROUP BY Specialty
ORDER BY DoctorCount DESC;


-- Q9: How many appointments has each doctor completed.
SELECT cs.FirstName || ' ' || cs.LastName AS DoctorName,
       COUNT(*) AS CompletedAppointments
FROM Appointment a
JOIN ClinicalStaff cs ON a.DoctorID = cs.StaffID
WHERE a.Status = 'Completed'
GROUP BY cs.StaffID,cs.FirstName, cs.LastName
ORDER BY CompletedAppointments DESC, cs.FirstName, cs.LastName;



-- Q10: Which doctors have more than 1 appointments scheduled.
SELECT cs.FirstName || ' ' || cs.LastName AS DoctorName,
       COUNT(*) AS ScheduledAppointments
FROM Appointment a
JOIN ClinicalStaff cs ON a.DoctorID = cs.StaffID
WHERE a.Status = 'Scheduled'
GROUP BY cs.StaffID, cs.FirstName, cs.LastName
HAVING COUNT(*) > 1
ORDER BY ScheduledAppointments DESC;


-- Q11: Which departments have more than 2 staff members assigned.
SELECT d.DepartmentName,
       COUNT(*) AS StaffCount
FROM StaffDepartment sd
JOIN Department d ON sd.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(*) > 2
ORDER BY StaffCount DESC;


-- Q12: Which doctors prescribed more than 2 medications.
SELECT cs.StaffID,
       cs.FirstName || ' ' || cs.LastName AS DoctorName,
       COUNT(*) AS TotalPrescriptions
FROM Prescription p
JOIN Appointment a ON p.AppointmentID = a.AppointmentID
JOIN ClinicalStaff cs ON a.DoctorID = cs.StaffID
GROUP BY cs.StaffID, cs.FirstName, cs.LastName
HAVING COUNT(*) > 2
ORDER BY TotalPrescriptions DESC;


-- Q13: List doctors who have the highest number of appointments. 
SELECT cs.StaffID,
       cs.FirstName || ' ' || cs.LastName AS DoctorName
FROM ClinicalStaff cs
WHERE cs.StaffID IN (
    SELECT DoctorID
    FROM Appointment
    GROUP BY DoctorID
    HAVING COUNT(*) = (
        SELECT MAX(AppCount)
        FROM (
            SELECT COUNT(*) AS AppCount
            FROM Appointment
            GROUP BY DoctorID
        )
    )
);


-- Q14: Which patients never received a prescription.
SELECT p.PatientID,
       p.FirstName || ' ' || p.LastName AS PatientName
FROM Patient p
WHERE p.PatientID NOT IN (
    SELECT a.PatientID
    FROM Appointment a
    JOIN Prescription pr ON a.AppointmentID = pr.AppointmentID
);


-- Q15: Which departments do not have any doctors.
SELECT d.DepartmentName
FROM Department d
WHERE d.DepartmentID NOT IN (
    SELECT sd.DepartmentID
    FROM StaffDepartment sd
    JOIN ClinicalStaff cs ON sd.StaffID = cs.StaffID
    WHERE cs.StaffRole = 'Doctor'
);


-- Q16: Use the first trigger insert past date it is not sucsses.
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, AppointmentTime, Room, Status, Note)
VALUES ('123456789', '100000001', '2024-01-01', '09:00', 'Room 101', 'Scheduled', 'Test past appointment');

-- it is sucssed we insert appointment on future date.
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, AppointmentTime, Room)
VALUES ('200000003', '100000001', CURRENT_DATE + INTERVAL '1 day', '10:30', 'Room 102');




-- Q17: Use the second trigger. 
UPDATE MedicalRecord
SET Diagnosis = 'Mild migraine with stress-related symptoms'
WHERE RecordID = 1;

-- test:
SELECT Diagnosis, UpdatedAt
FROM MedicalRecord
WHERE RecordID = 1;



