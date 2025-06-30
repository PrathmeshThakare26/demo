USE zidio_connect;

-- 👥 USER ROLE DISTRIBUTION

SELECT role, COUNT(*) AS total_users
FROM users
GROUP BY role;

-- 🚦 ACTIVE vs BLOCKED USERS

SELECT 
    CASE 
        WHEN is_active = TRUE THEN 'Active'
        ELSE 'Blocked'
    END AS user_status,
    COUNT(*) AS total
FROM users
GROUP BY is_active;

-- 📋 JOB POSTINGS BY RECRUITER

SELECT 
    r.company_name,
    COUNT(j.job_id) AS total_jobs
FROM recruiter_profiles r
JOIN jobs j ON r.recruiter_id = j.recruiter_id
GROUP BY r.company_name;

-- 📥 APPLICATION STATUS COUNT

SELECT status, COUNT(*) AS total_applications
FROM applications
GROUP BY status;

-- 📈 APPLICATIONS PER JOB

SELECT 
    j.title AS job_title,
    COUNT(a.application_id) AS total_applications
FROM jobs j
LEFT JOIN applications a ON j.job_id = a.job_id
GROUP BY j.title;

-- 🕒 JOBS NEARING DEADLINE (Next 7 Days)
SELECT 
    job_id, 
    title,
    deadline,
    DATEDIFF(deadline, CURRENT_DATE()) AS days_left
FROM jobs
WHERE deadline BETWEEN CURRENT_DATE() AND DATE_ADD(CURRENT_DATE(), INTERVAL 7 DAY);

-- 👤 STUDENTS WITHOUT ANY APPLICATIONS

SELECT 
    u.id AS student_id,
    s.name
FROM users u
JOIN student_profiles s ON u.id = s.student_id
LEFT JOIN applications a ON u.id = a.student_id
WHERE u.role = 'STUDENT' AND a.application_id IS NULL;

UPDATE jobs 
SET deadline = DATE_ADD(CURDATE(), INTERVAL 3 DAY) 
WHERE job_id = 1;

