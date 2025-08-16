USE university_db;

-- Create Departments table
CREATE TABLE IF NOT EXISTS Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Create Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);

CREATE TABLE IF NOT EXISTS Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE IF NOT EXISTS Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE IF NOT EXISTS Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    building_name VARCHAR(100) NOT NULL,
    room_number VARCHAR(20) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    classroom_id INT,
    day VARCHAR(20) NOT NULL,
    time_slot VARCHAR(20) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- Create Teaches table to link Instructors and Courses
CREATE TABLE IF NOT EXISTS Teaches (
    teaches_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_id INT,
    course_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Instructors
INSERT IGNORE INTO Instructors (first_name, last_name, email, department_id) VALUES
('Neha', 'Rathore', 'neha.rathore@university.com', 1),
('Arjun', 'Mehta', 'arjun.mehta@university.com', 1),
('Sanya', 'Kapoor', 'sanya.kapoor@university.com', 2),
('Kabir', 'Sharma', 'kabir.sharma@university.com', 3),
('Ishita', 'Bansal', 'ishita.bansal@university.com', 4);

-- Insert Departments
INSERT IGNORE INTO Departments (department_name) VALUES
('Computer Science'),
('Physics'),
('Mathematics');

-- Insert Students
INSERT IGNORE INTO Students (first_name, last_name, email, department_id) VALUES
('Alice', 'Johnson', 'alice@example.com', 1),
('Bob', 'Smith', 'bob@example.com', 1),
('Charlie', 'Brown', 'charlie@example.com', 2);

-- Insert Courses
INSERT IGNORE INTO Courses (course_name, credits) VALUES
('Data Structures', 4),
('Quantum Mechanics', 3),
('Calculus', 3);

-- Enroll Students in Courses
INSERT IGNORE INTO Enrollment (student_id, course_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(1, 3);
