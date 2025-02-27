create database sql_concepts;
use sql_concepts;
show databases;

create table dept_tab (
deptno varchar(5),
dname VARCHAR(100),
mgr_id VARCHAR(10),
location_id VARCHAR (10),
CONSTRAINT pk_dept_tab PRIMARY KEY (deptno));
