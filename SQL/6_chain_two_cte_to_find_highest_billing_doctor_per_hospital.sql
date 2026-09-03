-- Active: 1786371769645@@127.0.0.1@5432@hospital_management
WITH avg_bill AS(
    SELECT
        hospital_branch,
        first_name,
        last_name,
        doctors.doctor_id,
        Round(AVG(amount), 2) as avg_billing
    FROM doctors
    INNER JOIN appointments ON appointments.doctor_id = doctors.doctor_id
    INNER JOIN billing ON billing.patient_id = appointments.patient_id
    GROUP BY hospital_branch,first_name,last_name,doctors.doctor_id
),
   rank_doctor AS(
     SELECT
        *,
        RANK() OVER (PARTITION BY hospital_branch ORDER BY avg_billing DESC) AS revenue_rank
    FROM avg_bill

)
    SELECT
        *
    FROM rank_doctor
    WHERE revenue_rank = 1