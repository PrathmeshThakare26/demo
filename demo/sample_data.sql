USE zidio_connect;

-- USERS
INSERT INTO users (email, password, role, is_active) VALUES
('komal@student.com', '123456', 'STUDENT', TRUE),
('raj.verma@student.com', 'password1', 'STUDENT', TRUE),
('nikita.singh@student.com', 'password2', 'STUDENT', TRUE),
('deepak.jain@student.com', 'password3', 'STUDENT', TRUE),
('aarushi.kumar@student.com', 'password4', 'STUDENT', TRUE),
('hr@zidiotech.com', 'recruiter123', 'RECRUITER', TRUE),
('talent@codecurve.in', 'codecurve@2025', 'RECRUITER', TRUE),
('team@alphaedge.com', 'alpha123', 'RECRUITER', TRUE),
('admin@zidio.in', 'admin@zidio', 'ADMIN', TRUE);


-- STUDENT PROFILES
INSERT INTO student_profiles (student_id, name, course, skills, education, profile_pic_url, resume_filename) VALUES
(1, 'Komal Deogade', 'B.Tech CSBS', 'Java, SQL, Power BI', 'Bachelor of Technology', 'https://i.pravatar.cc/150?img=1', 'resume_komal.pdf'),
(2, 'Raj Verma', 'BCA', 'Python, Excel, Tableau', 'Bachelors in Computer Applications', 'https://i.pravatar.cc/150?img=2', 'resume_raj.pdf'),
(3, 'Nikita Singh', 'B.Sc IT', 'C++, MySQL, HTML', 'B.Sc Information Tech', 'https://i.pravatar.cc/150?img=3', 'resume_nikita.pdf'),
(4, 'Deepak Jain', 'B.Tech IT', 'Node.js, MongoDB', 'Bachelor of Technology', 'https://i.pravatar.cc/150?img=4', 'resume_deepak.pdf'),
(5, 'Aarushi Kumar', 'B.Com', 'Marketing, Communication', 'Bachelor of Commerce', 'https://i.pravatar.cc/150?img=5', 'resume_aarushi.pdf');

-- RECRUITER PROFILES
INSERT INTO recruiter_profiles (recruiter_id, company_name, industry, about_company, contact_email) VALUES
(6, 'Zidio Tech Pvt Ltd', 'Information Technology', 'Innovative EdTech solutions and internship programs.', 'hr@zidiotech.com'),
(7, 'CodeCurve Solutions', 'Software Development', 'Full-stack development company focusing on startups.', 'talent@codecurve.in'),
(8, 'AlphaEdge Global', 'Data Analytics', 'Data-driven business solutions and analytics training.', 'team@alphaedge.com');

-- JOBS
INSERT INTO jobs (recruiter_id, title, description, location, job_type, stipend, duration, deadline) VALUES
(6, 'Java Backend Intern', 'Work on Spring Boot APIs and MySQL integration.', 'Remote', 'INTERNSHIP', '₹6000', '2 Months', '2025-08-15'),
(6, 'Frontend Developer', 'Build UI using React.js and TailwindCSS.', 'Nagpur', 'FULL_TIME', '₹3.5 LPA', 'Permanent', '2025-09-01'),
(7, 'Data Analyst Intern', 'Analyze trends using Excel and Power BI.', 'Remote', 'INTERNSHIP', '₹8000', '3 Months', '2025-08-20'),
(8, 'Marketing Intern', 'Create campaigns and manage social media.', 'Bangalore', 'INTERNSHIP', '₹5000', '1 Month', '2025-07-30');

-- APPLICATIONS
INSERT INTO applications (job_id, student_id, applied_at, status) VALUES
(1, 1, NOW(), 'APPLIED'),
(1, 2, NOW(), 'SHORTLISTED'),
(2, 3, NOW(), 'REJECTED'),
(3, 4, NOW(), 'APPLIED'),
(3, 1, NOW(), 'APPLIED'),
(4, 5, NOW(), 'SHORTLISTED');

SELECT * FROM users;
SELECT * FROM student_profiles;
SELECT * FROM recruiter_profiles;
SELECT * FROM jobs;
SELECT * FROM applications;

INSERT INTO users (email, password, role, is_active) 
VALUES ('rahul.shah@student.com', 'pass123', 'STUDENT', TRUE);




