CREATE DATABASE zidio_connect;
USE zidio_connect;

-- USERS TABLE
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('STUDENT', 'RECRUITER', 'ADMIN') NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- STUDENT PROFILE TABLE
CREATE TABLE student_profiles (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    skills TEXT,
    education TEXT,
    profile_pic_url TEXT,
    resume_filename VARCHAR(255),
    FOREIGN KEY (student_id) REFERENCES users(id)
);

-- RECRUITER PROFILE TABLE
CREATE TABLE recruiter_profiles (
    recruiter_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    industry VARCHAR(100),
    about_company TEXT,
    contact_email VARCHAR(100),
    FOREIGN KEY (recruiter_id) REFERENCES users(id)
);

-- JOBS TABLE
CREATE TABLE jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    recruiter_id INT,
    title VARCHAR(150),
    description TEXT,
    location VARCHAR(100),
    job_type ENUM('INTERNSHIP', 'FULL_TIME'),
    stipend VARCHAR(50),
    duration VARCHAR(50),
    deadline DATE,
    posted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (recruiter_id) REFERENCES users(id)
);

-- APPLICATIONS TABLE
CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    student_id INT,
    applied_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('APPLIED', 'SHORTLISTED', 'REJECTED') DEFAULT 'APPLIED',
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (student_id) REFERENCES users(id)
);

SHOW TABLES;





