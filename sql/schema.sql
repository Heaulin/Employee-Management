CREATE DATABASE employees_db;

USE employees_db;

CREATE TABLE departments(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) UNIQUE NOT NULL
);


CREATE TABLE roles (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL NOT NULL,
  department_id INT NOT NULL,
  FOREIGN KEY (department_id) REFERENCES departments(id)
);


CREATE TABLE employee (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(30) UNIQUE NOT NULL,
  last_name VARCHAR(30) UNIQUE NOT NULL,
  role_id INT NOT NULL,
  manager_id INT, 
  FOREIGN KEY (role_id) REFERENCES departments(id)
  FOREIGN KEY (manager_id) REFERENCES employees(id)
);

SELECT employee.id, 
employee.first_name, 
employee.last_name, 
role.title, 
role.salary, 
department.name 
AS 'department', CONCAT(manager.first_name, '', manager.last_name) AS 'manager'
FROM employee
LEFT JOIN role ON employee.role_id = role.id
LEFT JOIN department ON role.department_id = department.id
LEFT JOIN employee manager ON manager.id = employee.manager_id