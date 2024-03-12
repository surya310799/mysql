create database MyDB;
create table mydb.students(id int,stud_Name varchar(20), email varchar(30), phone int(10), address varchar(200));
desc mydb.students;
alter table mydb.students add dob date;
alter table mydb.students add skills varchar(50);
alter table mydb.students modify stud_Name varchar(25);
alter table mydb.students rename column dob to date_of_birth;
alter table mydb.students drop column skills;
drop table mydb.students;
insert into mydb.students (id,stud_Name,email,phone,address) values(1,'xxx','xxx@gmail.com',1234567890,'yyy');
insert into mydb.students (id,stud_Name,email,phone,address) values(2,'yyy','yyy@gmail.com',0987654321,'zzz');
select * from mydb.students;
set sql_safe_updates=0;
update mydb.students set dob='1999-01-22' where id=1;
update mydb.students set dob='1999-05-18' where id=2;
delete from mydb.students where id in (1,2);
truncate mydb.students;
set autocommit=0;
insert into mydb.students (id,stud_Name,email,phone,address) values(1,'xxx','xxx@gmail.com',1234567890,'yyy');
savepoint A;
insert into mydb.students (id,stud_Name,email,phone,address) values(2,'yyy','yyy@gmail.com',0987654321,'zzz');
savepoint B;
select * from mydb.students;
rollback to A;
rollback;
insert into mydb.students (id,stud_Name,email,phone,address) values(1,'xxx','xxx@gmail.com',1234567890,'yyy');
insert into mydb.students (id,stud_Name,email,phone,address) values(2,'yyy','yyy@gmail.com',0987654321,'zzz');
commit;
rollback;
alter table mydb.students modify stud_Name varchar(20) not null;
alter table mydb.students modify id int unique;
alter table mydb.students modify phone bigint(10) unique;
insert into mydb.students (id,stud_Name,email,phone,address) values(4,'aaa','yyy@gmail.com',0987654321,'zzz');
create table mydb.supliers (suplier_id int, suplier_name varchar(20), phone_no int);
create table mydb.products (product_id int, product_name varchar(35), suplier_id int);
alter table mydb.supliers modify phone_no bigint;
desc mydb.supliers;
desc mydb.products;
insert into mydb.supliers (suplier_id,suplier_name,phone_no) values(101,'Asus',6374215990);
insert into mydb.supliers (suplier_id,suplier_name,phone_no) values(102,'Realme',9940257439);
insert into mydb.supliers (suplier_id,suplier_name,phone_no) values(103,'LG',9626365758);
insert into mydb.supliers (suplier_id,suplier_name,phone_no) values(104,'Dell',1100233400);
insert into mydb.supliers (suplier_id,suplier_name,phone_no) values(105,'HP',2223941110);
select * from mydb.supliers;
insert into mydb.products (product_id,product_name,suplier_id) values(1,'ASUS ExpertBook B1',101);
insert into mydb.products (product_id,product_name,suplier_id) values(2,'Realme Buds 2',102);
insert into mydb.products (product_id,product_name,suplier_id) values(3,'LG Ultragear IPS Gaming Monitor',103);
select * from mydb.products;
alter table mydb.products modify suplier_id int primary key;
alter table mydb.supliers add constraint suplier_id_pk primary key (suplier_id);
/*alter table mydb.supliers drop primary key suplier_id_pk;*/
alter table mydb.products add constraint suplier_id_fk foreign key (suplier_id) references mydb.supliers(suplier_id);
/*alter table mydb.products drop foreign key suplier_id_fk;*/
alter table mydb.products add constraint check_product_id check (product_id between 1 and 100);
insert into mydb.products (product_id,product_name,suplier_id) values(101,'Keyboard',201);
/* inner join */
select mydb.supliers.suplier_id, mydb.products.suplier_id, mydb.supliers.suplier_name, mydb.products.product_name from mydb.supliers inner join mydb.products on mydb.supliers.suplier_id=mydb.products.suplier_id;
/* left outer join */
select mydb.supliers.suplier_id, mydb.products.suplier_id, mydb.supliers.suplier_name, mydb.products.product_name from mydb.supliers left outer join mydb.products on mydb.supliers.suplier_id=mydb.products.suplier_id;
/* right outer join */
select mydb.supliers.suplier_id, mydb.products.suplier_id, mydb.supliers.suplier_name, mydb.products.product_name from mydb.supliers right outer join mydb.products on mydb.supliers.suplier_id=mydb.products.suplier_id;
/* full outer join*/
select mydb.supliers.suplier_id, mydb.products.suplier_id, mydb.supliers.suplier_name, mydb.products.product_name from mydb.supliers left outer join mydb.products on mydb.supliers.suplier_id=mydb.products.suplier_id
union
select mydb.supliers.suplier_id, mydb.products.suplier_id, mydb.supliers.suplier_name, mydb.products.product_name from mydb.supliers right outer join mydb.products on mydb.supliers.suplier_id=mydb.products.suplier_id;
/* self join*/
create table mydb.customers (cust_id int, cust_name varchar(20), city varchar(20), cust_mail varchar(35), phone bigint);
desc mydb.customers;
select * from mydb.customers;
insert into mydb.customers (cust_id,cust_name,city,cust_mail,phone) values(1,'Sai Surya','Chennai','saisurya@gmail.com',6234923451);
insert into mydb.customers (cust_id,cust_name,city,cust_mail,phone) values(2,'Sai suresh','Thiruthani','saisuresh@gmail.com',9748926378);
insert into mydb.customers (cust_id,cust_name,city,cust_mail,phone) values(3,'Karnesh Kumar','Chennai','karneshkumar@gmail.com',6748246144);
insert into mydb.customers (cust_id,cust_name,city,cust_mail,phone) values(4,'Yogesh','Chennai','yogesh@gmail.com',9781264141);
insert into mydb.customers (cust_id,cust_name,city,cust_mail,phone) values(5,'Gokulakrishnan','Vellore','Gokulakrishnan@gmail.com',6781241241);

select distinct mydb.a.cust_name, mydb.a.city from customers a , customers b where mydb.a.city=mydb.b.city and mydb.a.cust_id<>mydb.b.cust_id;

/* cross join or cartesian join*/
select mydb.s.suplier_name, mydb.p.product_name from mydb.supliers s cross join mydb.products p;

/* union and union all */
select mydb.supliers.suplier_id, mydb.products.suplier_id, mydb.supliers.suplier_name, mydb.products.product_name from mydb.supliers left outer join mydb.products on mydb.supliers.suplier_id=mydb.products.suplier_id
union
select mydb.supliers.suplier_id, mydb.products.suplier_id, mydb.supliers.suplier_name, mydb.products.product_name from mydb.supliers right outer join mydb.products on mydb.supliers.suplier_id=mydb.products.suplier_id;
select mydb.supliers.suplier_id, mydb.products.suplier_id, mydb.supliers.suplier_name, mydb.products.product_name from mydb.supliers left outer join mydb.products on mydb.supliers.suplier_id=mydb.products.suplier_id
union all
select mydb.supliers.suplier_id, mydb.products.suplier_id, mydb.supliers.suplier_name, mydb.products.product_name from mydb.supliers right outer join mydb.products on mydb.supliers.suplier_id=mydb.products.suplier_id;
/* minus */
select supliers.suplier_id, supliers.suplier_name from supliers where suplier_id in (select suplier_id from products);
/*intersect*/
select supliers.suplier_id, supliers.suplier_name from supliers where suplier_id not in (select suplier_id from products);

/* Aggregate function */
select * from supliers;
select count(suplier_id) from supliers;
select min(suplier_id) from supliers;
select max(suplier_id) from supliers;
select sum(suplier_id) from supliers;
select avg(suplier_id) from supliers;

create table mydb.employee (emp_id int, emp_name varchar(20), job varchar(20), date_of_joining date, dept_id int, salary int, performance_score int);
desc mydb.employee;
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(1,'arun','engineer','2022-06-23',100,23000,5);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(12,'laya','developer','2022-03-23',101,35000,4);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(3,'charles','architect','2020-07-21',102,85000,5);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(13,'monisha','developer','2022-03-23',101,37000,4);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(14,'navya','developer','2020-02-22',101,40000,3);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(6,'francis','engineer','2022-05-23',100,23000,4);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(7,'ganesh','architect','2020-03-22',102,75000,5);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(8,'hema','tester',null,103,27000,3);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(9,'ishu','tester',null,103,27000,5);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(11,'kalai','developer','2020-03-27',101,35000,5);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(15,'ovya','developer','2021-01-21',101,37000,5);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(16,'priya','developer','2024-04-23',101,37000,3);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(17,'queen','engineer','2022-03-22',100,25000,3);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(18,'ramya','engineer','2022-03-22',100,25000,3);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(20,'lalitha','developer','2024-05-23',101,35000,3);
insert into mydb.employee (emp_id, emp_name, job, date_of_joining, dept_id, salary, performance_score) values(21,'leela','developer','2024-05-23',101,35000,3);
select * from mydb.employee;
create table mydb.department (dept_id int primary key, dept_name varchar(20));
desc mydb.employee;
desc mydb.department;
alter table mydb.employee add constraint emp_id_pk primary key (emp_id);
SET FOREIGN_KEY_CHECKS=0;
alter table mydb.employee add constraint dept_id_fk foreign key (dept_id) references mydb.department(dept_id);
insert into mydb.department (dept_id,dept_name) values(100,'engineer');
insert into mydb.department (dept_id,dept_name) values(101,'developer');
insert into mydb.department (dept_id,dept_name) values(102,'architect');
insert into mydb.department (dept_id,dept_name) values(103,'tester');
select * from mydb.department;
select * from mydb.employee;
/* Aggregate function with group by */
select dept_id, count(emp_id) from mydb.employee group by dept_id;
select dept_id, min(salary) from mydb.employee group by dept_id;
select dept_id, max(salary) from mydb.employee group by dept_id;
select dept_id, sum(salary) from mydb.employee group by dept_id;
select dept_id, avg(salary) from mydb.employee group by dept_id;

select * from mydb.employee where emp_name like '%a';
select * from mydb.employee where emp_name like 'l%';
select * from mydb.employee where emp_name like '%a%';

select * from mydb.employee where dept_id like '__1';

select * from mydb.employee order by emp_id asc;
select * from mydb.employee order by emp_id desc;
select * from mydb.employee order by emp_id;  /* default order is assending */
/* nvl to handle null*/
/* select date_of_joining, nvl(date_of_joining,'1999-01-01') from mydb.employee;  *//* for sql */
select date_of_joining, ifnull(date_of_joining,'1999-01-01') from mydb.employee; 

select emp_name,job, concat(emp_name,'-',job) from mydb.employee;
select emp_name, upper(emp_name) from mydb.employee;
select emp_name, lower(emp_name) from mydb.employee;
select salary,right(salary,2) from mydb.employee;
select salary,left(salary,2) from mydb.employee;
select salary,trim(leading 2 from salary) from mydb.employee;
select salary,trim(trailing 0 from salary) from mydb.employee;
select salary,trim(both 0 from salary) from mydb.employee;
select salary, rpad(salary,7,'/-') from mydb.employee;
select salary, replace(salary,23,55) from mydb.employee;
select date_of_joining, substr(date_of_joining,6,2) from mydb.employee;/* string name, starting position, ending position*/
select emp_name, instr(emp_name,'a') from mydb.employee;
select emp_name, reverse(emp_name) from mydb.employee;
select emp_name, length(emp_name) from mydb.employee;
select emp_name, concat(upper(substr(emp_name,1,1)),substr(emp_name,2,length(emp_name))) from mydb.employee;/*string 1st letter only upper */
select * from mydb.employee;
select emp_name, regexp_instr(emp_name, 'a|e|i|o|u',1,1,0) from mydb.employee;
select emp_name, instr(emp_name, 'a') from mydb.employee;
select emp_name, regexp_replace(emp_name, 'a|e|i|o|u','*') from mydb.employee;
select emp_name, regexp_replace(emp_name, 'a|e|i|o|u','*',2,1) from mydb.employee;
select emp_name, regexp_substr(emp_name, 'a|e|i|o|u',2,1) from mydb.employee;
select salary, cast(salary as decimal) from mydb.employee;
select cast(10 as decimal(4,2)) from dual;
/* Analytical function */
select *, dense_rank() over(order by salary desc) from mydb.employee;
select *, dense_rank() over(partition by dept_id order by salary desc) as dept_wise_salary from mydb.employee;
select *, rank() over(order by salary desc) from mydb.employee;
select *, rank() over(partition by dept_id order by salary desc) as dept_wise_salary from mydb.employee;
select *, first_value(salary) over(order by salary desc) from mydb.employee;
select *, first_value(salary) over(partition by dept_id order by salary desc) from mydb.employee;
select *, last_value(salary) over(partition by dept_id order by salary desc range between unbounded preceding and unbounded following) from mydb.employee;
select * from mydb.products;
select * from mydb.orders;
create table mydb.orders (order_id int,product_id int,product_name varchar(20),qty int,order_date date);
alter table mydb.orders modify product_name varchar(40);
insert into mydb.orders (order_id,product_id,product_name,qty,order_date) values(1,101,'ASUS ExpertBook B1',1,'2022-02-22');
insert into mydb.orders (order_id,product_id,product_name,qty,order_date) values(2,101,'ASUS ExpertBook B1',1,'2023-02-22');
insert into mydb.orders (order_id,product_id,product_name,qty,order_date) values(3,102,'Realme Buds 2',1,'2022-05-23');
insert into mydb.orders (order_id,product_id,product_name,qty,order_date) values(4,102,'Realme Buds 2',1,'2023-05-23');
insert into mydb.orders (order_id,product_id,product_name,qty,order_date) values(5,103,'LG Ultragear IPS Gaming Monitor',1,'2022-07-27');
insert into mydb.orders (order_id,product_id,product_name,qty,order_date) values(6,103,'LG Ultragear IPS Gaming Monitor',1,'2023-07-27');

select *, lead(order_date) over(partition by product_id order by order_date asc) from mydb.orders;
/* display 3rd lowest salary*/
select * from(select emp_name,salary, dense_rank() over(order by salary asc)as r from mydb.employee) a where r=3;

/* case statement*/
select emp_name, salary, case when salary between 23000 and 30000 then 'associate'
when salary between 31000 and 41000 then 'consultant'
when salary between 42000 and 52000 then 'senior'
when salary between 52000 and 85000 then 'super senior' else 'NA'
end levels from mydb.employee;