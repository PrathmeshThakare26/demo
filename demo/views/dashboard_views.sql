USE zidio_connect;

-- -------------------------------------------
-- 👩‍🎓 STUDENT DASHBOARD VIEW
-- Shows students their applied jobs and status
-- -------------------------------------------
CREATE OR REPLACE VIEW student_dashboard_view AS
SELECT 
    u.id AS student_id,
    s.name,
    s.course,
    s.skills,
    j.title AS job_applied,
    j.location,
    j.job_type,
    j.stipend,
    a.status AS application_status,
    a.applied_at
FROM users u
JOIN student_profiles s ON u.id = s.student_id
JOIN applications a ON u.id = a.student_id
JOIN jobs j ON a.job_id = j.job_id
WHERE u.role = 'STUDENT';

-- -------------------------------------------
-- 🧑‍💼 RECRUITER DASHBOARD VIEW
-- Shows jobs posted by recruiter and no. of applicants
-- -------------------------------------------
CREATE OR REPLACE VIEW recruiter_dashboard_view AS
SELECT 
    u.id AS recruiter_id,
    r.company_name,
    j.job_id,
    j.title AS job_posted,
    j.location,
    j.job_type,
    j.stipend,
    j.posted_at,
    COUNT(a.application_id) AS total_applications
FROM users u
JOIN recruiter_profiles r ON u.id = r.recruiter_id
JOIN jobs j ON u.id = j.recruiter_id
LEFT JOIN applications a ON j.job_id = a.job_id
WHERE u.role = 'RECRUITER'
GROUP BY j.job_id;

-- -------------------------------------------
-- 🛠️ ADMIN OVERVIEW VIEW
-- Displays global stats for admin panel
-- -------------------------------------------
CREATE OR REPLACE VIEW admin_overview_view AS
SELECT 
    (SELECT COUNT(*) FROM users WHERE role = 'STUDENT') AS total_students,
    (SELECT COUNT(*) FROM users WHERE role = 'RECRUITER') AS total_recruiters,
    (SELECT COUNT(*) FROM users WHERE role = 'ADMIN') AS total_admins,
    (SELECT COUNT(*) FROM jobs) AS total_jobs,
    (SELECT COUNT(*) FROM applications) AS total_applications,
    (SELECT COUNT(*) FROM users WHERE is_active = TRUE) AS active_users,
    (SELECT COUNT(*) FROM users WHERE is_active = FALSE) AS blocked_users;
    
SELECT * FROM student_dashboard_view;
SELECT * FROM recruiter_dashboard_view;
SELECT * FROM admin_overview_view;

