# Medical Clinic Database System
A complete relational database system designed for managing clinical operations in a medical clinic. The project includes full SQL schema creation, sample data insertion, triggers, constraints, and analytical queries.

## Project Overview
This project implements a full medical clinic management database using PostgreSQL. The schema captures the core entities and relationships found in real clinical environments, including:
- Clinical staff (doctors, nurses, admin, pharmacists…)
- Departments and department heads
- Patients and demographic information
- Appointments and scheduling constraints
- Prescriptions and medication tracking
- Medical records with automatic update timestamps
The database enforces data integrity and business rules through constraints, foreign keys, and triggers.

## Files Included
ClinicalMedicalTableAndData.sql   → Full database schema + table creation + all sample data + triggers.
ClincalMedicalQueries.sql         → Analytical and reporting SQL queries + trigger tests.

## Entity–Relationship Diagram (ERD)
![ERD Diagram](ERD.png)

Key relationships include:
- Each patient can have multiple appointments.
- Each appointment links to exactly one doctor.
- Each doctor belongs to multiple departments.
- Each appointment may produce one medical record (1-to-1).
- Each appointment can have multiple prescriptions.

## How to Run the Project

1. Create the Database
CREATE DATABASE MedicalClinicDB;

2. Execute Schema and Data
Run: ClinicalMedicalTableAndData.sql
This file creates: all tables, inserts all sample data, builds triggers, and applies constraints.

3. Run the Queries
Run: ClincalMedicalQueries.sql
Contains: appointment analytics, department statistics, doctor workload, prescription reports, trigger tests.

## Triggers Included
1) Reject past appointments  
Prevents inserting appointments dated before today.

2) Auto-update MedicalRecord.UpdatedAt  
Automatically updates the timestamp whenever a medical record is inserted or updated.

## Database Integrity
Includes:
- CHECK constraints (roles, email format, gender, status…)
- ENUM types
- Foreign keys with cascading rules
- Unique constraints (doctor schedule, medical records)
- Default values
- NOT NULL constraints

## Example Query Topics
- Appointments in ranges
- Department staffing levels
- Doctors and workload
- Patients without prescriptions
- Prescriptions per doctor
- Completed appointments
- Most active doctors
- Trigger demonstrations

## Technologies
- PostgreSQL 15+
- pgAdmin 4
- SQL (DDL, DML, DQL, triggers)

## Author
Jolian Habib
Software & Information Technologies — Afeka College
Medical Clinic Database System
