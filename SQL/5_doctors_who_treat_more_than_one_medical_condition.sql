-- Active: 1786371769645@@127.0.0.1@5432@hospital_management
SELECT
    doctors.doctor_id,
    first_name,
    last_name,
    COUNT(DISTINCT treatment_type) AS num_treatments
FROM doctors
INNER JOIN appointments ON appointments.doctor_id = doctors.doctor_id
INNER JOIN treatments ON appointments.appointment_id = treatments.appointment_id
GROUP BY doctors.doctor_id, first_name, last_name
HAVING COUNT(DISTINCT treatment_type) > 1
