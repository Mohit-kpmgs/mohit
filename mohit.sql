CREATE DATABASE sql_concepts;
USE sql_concepts;
SHOW DATABASES;

CREATE TABLE dept_tab (
    deptno VARCHAR(5),
    dname VARCHAR(100),
    mgr_id VARCHAR(10),
    location_id VARCHAR(10),
    CONSTRAINT pk_dept_tab PRIMARY KEY (deptno)
);

CREATE TABLE emp_tab (
    empno VARCHAR(5),
    ename VARCHAR(50) NOT NULL,
    job VARCHAR(50),
    manager VARCHAR(10),
    hiredate DATE,
    salary VARCHAR(20),
    comission VARCHAR(10),
    deptno VARCHAR(10),
    CONSTRAINT pk_emp_tab PRIMARY KEY (empno),
    CONSTRAINT fk_emp_tab FOREIGN KEY (deptno) REFERENCES dept_tab(deptno)
);

CREATE TABLE country_tab(
    country_id VARCHAR(15),
    country_name VARCHAR(50),
    CONSTRAINT pk_country_tab PRIMARY KEY (country_id)
);

CREATE TABLE states_tab(
    state_id VARCHAR(10),
    state_name VARCHAR(50),
    country_id VARCHAR(5),
    CONSTRAINT pk_states_tab PRIMARY KEY (state_id),
    CONSTRAINT fk_states_tab FOREIGN KEY (country_id) REFERENCES country_tab(country_id)
);

SHOW TABLES;
DESC emp_tab;

INSERT INTO dept_tab VALUES('20', 'purchasing', '114', '1700');
INSERT INTO dept_tab VALUES('40', 'Human Resources', '203', '2400');
INSERT INTO dept_tab VALUES('70', 'Public Relations', '204', '2700');
INSERT INTO dept_tab VALUES('80', 'Sales', '100', '1700');
INSERT INTO dept_tab VALUES('90', 'Executives', '108', '1700');
INSERT INTO dept_tab VALUES('100', 'Finance', '200', '1700');
INSERT INTO dept_tab VALUES('110', 'Accounting', '205', '1700');
INSERT INTO dept_tab VALUES('120', 'Treasury', NULL, '1700');
INSERT INTO dept_tab VALUES('130', 'Corporate tax', NULL, '1700');
INSERT INTO dept_tab VALUES('140', 'Control and edit', NULL, '1700');
INSERT INTO dept_tab VALUES('150', 'Shareholder Services', '114', '1700');

SELECT * FROM dept_tab;
SELECT COUNT(*) FROM dept_tab;
SHOW TABLES;
DESC dept_tab;

INSERT INTO emp_tab VALUES ('E001', 'John Doe', 'Manager', 'Jane Smith', '1980-05-15', '75000', '5000', '20');
INSERT INTO emp_tab VALUES ('E002', 'Alice Johnson', 'Developer', 'John Doe', '1990-10-25', '60000', '3000', '40');
INSERT INTO emp_tab VALUES ('E003', 'Bob Brown', 'Analyst', 'Alice Johnson', '1985-03-10', '55000', '2000', '70');
INSERT INTO emp_tab VALUES ('E004', 'Cathy White', 'Support', 'Bob Brown', '1992-07-30', '45000', '1500', '80');
INSERT INTO emp_tab VALUES ('E005', 'David Green', 'HR', 'John Doe', '1988-11-22', '50000', '2500', '90');

SELECT * FROM emp_tab;

INSERT INTO country_tab VALUES('1', 'USA');
INSERT INTO country_tab VALUES('2', 'India');
INSERT INTO country_tab VALUES('3', 'USA');

SELECT * FROM country_tab;

INSERT INTO states_tab VALUES('1', 'California', '1');
INSERT INTO states_tab VALUES('2', 'Texas', '2');
INSERT INTO states_tab VALUES('3', 'Karnataka', '3');

SELECT * FROM states_tab;

SELECT empno, 10*(salary+100) AS 'Updated salary' FROM emp_tab;
SELECT CONCAT(ename, ' belongs to ', deptno, ' department number') AS 'employee department data' FROM emp_tab;
SELECT COUNT(DISTINCT deptno) FROM emp_tab;

SELECT empno, ename, salary FROM emp_tab WHERE salary > '4200';
SELECT empno, ename, salary FROM emp_tab WHERE ename = 'John Doe';
SELECT empno, ename, salary FROM emp_tab WHERE ename = 'John Doe' AND salary > '4200';
SELECT empno, ename, salary FROM emp_tab WHERE ename <> 'John Doe';
SELECT empno, ename, salary FROM emp_tab WHERE salary BETWEEN '2000' AND '4500';
SELECT empno, ename, salary FROM emp_tab WHERE deptno IN ('30', '50');
SELECT empno, ename, salary FROM emp_tab WHERE deptno NOT IN ('30', '50');

SELECT empno, ename, salary FROM emp_tab WHERE ename IN ('John Doe', 'David Green');
SELECT empno, ename, salary FROM emp_tab WHERE ename NOT IN ('John Doe', 'David Green');
SELECT empno, ename, salary FROM emp_tab WHERE ename LIKE '%i%';

SELECT empno, ename, salary FROM emp_tab WHERE deptno IN ('30', '40') AND salary > '4200';
SELECT empno, ename, salary FROM emp_tab WHERE deptno IN ('30', '40') OR salary > '4200';
SELECT empno, ename, salary FROM emp_tab WHERE deptno NOT IN ('30', '40') AND salary > '4200';

SELECT empno, ename, salary FROM emp_tab WHERE deptno = '30' OR (deptno IN ('30', '40') AND salary > '4200');
