use dummy;
create table employee(
empid int primary key,
empname varchar(20) not null,
dept varchar(20) not null,
contactno int not null,
emailid varchar(20),
empheadid int not null
);
select * from employee;
insert into employee(empid,empname,dept,contactno,emailid,empheadid) values
(103,'Neha','E-101',1234567890,'neha@gmail.com',101),
(104,'Rahul','E-102',1234567890,'rahul@yahoo.com',105),
(105,'Abhishek','E-101',1234567890,'abhishek@gmail.com',102);

select * from employee where empname like 'P%';
select * from employee where emailid like '%gmail%';
select * from employee where dept in('E-104','E-102');
select * from employee where empname like '%a';
select * from employee where empname like '__h%';

create table  worker(
WORKER_ID int primary key,
FIRST_NAME varchar(20) not null,	
LAST_NAME varchar(20) not null,	
SALARY decimal(10,2),	
JOINING_DATE timestamp,	
DEPARTMENT varchar(20) not null
);
insert into worker(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
(001,'Monika','Arora',100000,'2014-02-20 09:00:00','HR'),
(002,'Niharika','Verma',80000,'2014-06-11 09:00:00','Admin'),
(003,'Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
(004,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
(005,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
(006,'Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
(007,'Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),
(008,'Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin');
select * from worker;
select w.FIRST_NAME from worker as w;
select upper(FIRST_NAME) from worker;
select distinct(DEPARTMENT) from worker;
select mid(FIRST_NAME,1,3) from worker;
select position('a'in FIRST_NAME) from worker where FIRST_NAME='Amitabh';
select rtrim(FIRST_NAME) from worker;
select ltrim(DEPARTMENT) from worker;
select distinct(DEPARTMENT),length(DEPARTMENT) from worker;
select replace(FIRST_NAME,'a','A') from worker;
select concat(FIRST_NAME,' ',LAST_NAME) as FULL_NAME from worker;
select FIRST_NAME from worker order by FIRST_NAME asc;
select FIRST_NAME,DEPARTMENT from worker order by FIRST_NAME asc,DEPARTMENT desc;
select * from worker where FIRST_NAME in('Vipul','Satish');
select * from worker where FIRST_NAME not in('Vipul','Satish');
select * from worker where DEPARTMENT='Admin';
select * from worker where FIRST_NAME like '%a%';
select * from worker where FIRST_NAME like '%a';
select * from worker where FIRST_NAME like '%h' and length(FIRST_NAME)=6;
select * from worker where SALARY between 100000 and 500000;
select * from worker where year(JOINING_DATE)=2014 and month(JOINING_DATE)=2;
select DEPARTMENT,count(*) from worker where DEPARTMENT='Admin' group by DEPARTMENT;
select FIRST_NAME,LAST_NAME,SALARY from worker where SALARY between 50000 and 100000;
select DEPARTMENT,count(*) as total from worker group by DEPARTMENT order by total desc;

create table bonus(
WORKER_REF_ID int,
BONUS_DATE timestamp,
BONUS_AMOUNT decimal(10,2)
);
insert into bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT) values
(1,'2016-02-20 00:00:00',5000),
(2,'2016-06-11 00:00:00',3000),
(3,'2016-02-20 00:00:00',4000),
(1,'2016-02-20 00:00:00',4500),
(2,'2016-06-11 00:00:00',3500);
select * from bonus;

create table title(
WORKER_REF_ID int,
WORKER_TITLE varchar(20) not null,
AFFECTED_FROM timestamp
);
insert into title(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM)values
(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst.Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00');
select * from title;

select w.WORKER_ID,w.FIRST_NAME,W.LAST_NAME,t.WORKER_TITLE from worker w join title t on w.WORKER_ID=t.WORKER_REF_ID;
select * from worker where mod(WORKER_ID,2)=1;
select * from worker where mod(WORKER_ID,2)=0;
select now();
select * from worker limit 10;
select distinct(SALARY) from worker order by SALARY desc limit 1 offset 4;
select w.* from worker w join worker w1 on w.SALARY=w1.SALARY and w.WORKER_ID!=w1.WORKER_ID;
select distinct SALARY from worker order by SALARY desc limit 1 offset 1;
select * from worker where worker_id<=(select count(*)/2 from worker); 
select DEPARTMENT,count(*) from worker group by DEPARTMENT having count(*)<5;
select DEPARTMENT,count(*) from worker group by DEPARTMENT;
select * from worker order by WORKER_ID desc limit 1;
select first_name,salary,department from worker where (department,salary) in(select DEPARTMENT,max(SALARY) from worker group by DEPARTMENT);
select distinct SALARY from worker order by SALARY desc limit 3;
select DEPARTMENT,sum(SALARY) from worker group by DEPARTMENT;
select * from worker where SALARY=(select max(SALARY) from worker);
