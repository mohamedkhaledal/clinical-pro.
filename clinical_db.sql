create database clinic_mangement_system;
use clinic_mangement_system;
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  role ENUM('patient', 'doctor', 'nurse', 'employee') NOT NULL,
  UNIQUE(username)
);

-- Table: patients
CREATE TABLE patients (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  name VARCHAR(50) NOT NULL,
  age INT,
  gender VARCHAR(10),
  contact_number VARCHAR(15),
  address VARCHAR(100),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: doctors
CREATE TABLE doctors (
  doctor_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  name VARCHAR(50) NOT NULL,
  specialization VARCHAR(50),
  contact_number VARCHAR(15),
  address VARCHAR(100),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: nurses
CREATE TABLE nurses (
  nurse_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  name VARCHAR(50) NOT NULL,
  contact_number VARCHAR(15),
  address VARCHAR(100),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: employees
CREATE TABLE employees (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  name VARCHAR(50) NOT NULL,
  contact_number VARCHAR(15),
  address VARCHAR(100),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: visits
CREATE TABLE visits (
  visit_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  doctor_id INT,
  nurse_id INT,
  employee_id INT,
  visit_date DATE,
  visit_type ENUM('initial', 'follow-up') NOT NULL,
  notes VARCHAR(200),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
  FOREIGN KEY (nurse_id) REFERENCES nurses(nurse_id),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);