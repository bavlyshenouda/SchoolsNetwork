--drop database Schools_Network
--create database Schools_Network

create Table Schools (
id int primary key identity,
name varchar(40),
mission varchar(50),
vision varchar(50),
fees decimal(10,2),
school_address varchar(50),
general_info varchar(50),
phone_number varchar(10),
main_language varchar(50),
school_type varchar(50),  --change column name to school_type instead of type because type is keyword
email varchar(50) unique
)

create Table Levels(
id int primary key check( id in(1,2,3))
)

create Table Elementaries (
school_id int primary key,
level_id int,
foreign key (school_id) references Schools on delete cascade on update cascade,
foreign key (level_id ) references Levels on delete cascade on update cascade
)

create Table School_Supplies(
school_id int,
supply varchar(50), 
primary key(school_id,supply),
foreign key (school_id) references Elementaries on delete cascade on update cascade
)

create Table Middles (
school_id int primary key,
level_id integer ,
foreign key (school_id) references Schools on delete cascade on update cascade,
foreign key (level_id ) references Levels on delete cascade on update cascade
)

create Table Highs (

school_id int primary key,
level_id int ,
foreign key (school_id) references Schools on delete cascade on update cascade,
foreign key (level_id ) references Levels on delete cascade on update cascade 
)

create table Parents(
username varchar(20) primary key,
first_name varchar(20),
last_name varchar(20),
parent_password varchar(20),
email varchar(50) unique,
parent_address varchar(50),
home_phone_number varchar(10) 
)

create table Children(
ssn int primary key,
name varchar(50),
birth_date date,
age as (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)),
gender char(1) check (gender in ('f','m')),
parent_username varchar(20),
foreign key(parent_username) references Parents on delete cascade on update cascade
)

create table Students(
ssn int primary key,
username varchar(20),
student_password varchar(20),
grade int,
level_id int,
school_id int,
foreign key(ssn) references Children on delete cascade on update cascade,
foreign key(level_id) references Levels on delete cascade on update cascade,
foreign key(school_id) references Schools on delete set null on update cascade
)

create table Parents_Mobile(
parent_username varchar(20),
mobile_number varchar(13),
primary key(parent_username,mobile_number),
foreign key(parent_username) references Parents on delete cascade on update cascade
)

create Table Parent_Review_Schools(
parent_username varchar(20),
school_id int,
review varchar(500),
primary key(parent_username,school_id),
foreign key (parent_username)references Parents on delete cascade on update cascade,
foreign key (school_id) references Schools on delete cascade on update cascade
)

create table Parents_Apply_Children_Schools(
child_ssn int,
school_id int,
parent_username varchar(20),
accepted bit,
primary key(child_ssn,school_id),
foreign key(school_id) references Schools on delete no action on update no action,
foreign key(child_ssn) references Children on delete no action on update no action,
foreign key(parent_username) references Parents on delete no action on update no action
)

create Table Courses(
code varchar(15) primary key,
name varchar(50) ,	
course_description varchar(500),   --change column name to courses_description instead of description because description is keyword
grade int ,
level_id int ,
foreign key(level_id) references Levels on delete cascade on update cascade

)

create table Teachers(
id int primary key identity,
first_name varchar(10),
middle_name varchar(10),
last_name varchar(10),
gender char(1) check (gender in ('f','m')),
birth_date date,
email varchar(50) unique,
teacher_address varchar(50),
salary decimal(10,2),
username varchar(20),
teacher_password varchar(20),
years_of_experience int,
school_id int,
course_code varchar(15),
foreign key(course_code) references Courses on delete cascade on update cascade,
foreign key(school_id) references Schools on delete set null on update cascade
)

create table Parents_Rate_Teachers(
parent_username varchar(20),
teacher_id int,
rate int check (rate in (1,2,3,4,5)),
primary key(parent_username,teacher_id),
foreign key(teacher_id) references Teachers on delete cascade on update cascade,
foreign key(parent_username) references Parents on delete cascade on update cascade
)


create table Supervisors_Supervise_Teachers(
supervisor_id int,
teacher_id int,
primary key(supervisor_id,teacher_id),
foreign key(supervisor_id) references Teachers on delete cascade on update cascade,
foreign key(teacher_id) references Teachers on delete no action on update no action

)

create table Administrators(
id int primary key identity,
first_name varchar(10),
middle_name varchar(10),
last_name varchar(10),
gender char(1) check (gender in ('f','m')),
birth_date date,
email varchar(50) unique,
teacher_address varchar(50),
salary decimal(10,2),
username varchar(20),
teacher_password varchar(20),
school_id int,
foreign key(school_id) references Schools on delete set null on update cascade
)

Create table Clubs(
name VARCHAR(20),
purpose VARCHAR(150),
school_id int,
Primary key(name,school_id),
FOREIGN KEY(school_id) REFERENCES Highs ON DELETE CASCADE ON UPDATE CASCADE
)

Create table Club_Participants(
club_name VARCHAR(20),
school_id int,
student_ssn int,
Primary key(club_name,school_id,student_ssn),
FOREIGN KEY(club_name,school_id) REFERENCES Clubs ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(student_ssn) REFERENCES Students ON DELETE NO ACTION ON UPDATE NO ACTION
)


create Table Courses_Prequisite_Courses(
code varchar(15),	
prequisite_code varchar(15),    --change column name to prequisite_code to differentiate between them
primary key (code,prequisite_code),
foreign key (code) references Courses,
foreign key (prequisite_code) references Courses on delete cascade on update cascade
)

Create table Assignments (
number int,
course_code VARCHAR(15),
teacher_id int,
post_date date,
due_date date,
content VARCHAR(1000), --TO BE CONSIDERED
Primary key(number,course_code,teacher_id),
FOREIGN KEY(course_code) REFERENCES Courses ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(teacher_id) REFERENCES Teachers ON DELETE NO ACTION ON UPDATE NO ACTION
)


create table Assignment_Grades(
student_ssn int ,
assigment_number int,
course_code VARCHAR(15),
teacher_id int,
answer varchar(500),
grade int,
Primary key(student_ssn,assigment_number,course_code,teacher_id),
FOREIGN KEY(student_ssn) REFERENCES Students ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(assigment_number,course_code,teacher_id) REFERENCES Assignments ON DELETE NO ACTION ON UPDATE NO ACTION
)

Create table Questions(
number int identity,
course_code VARCHAR(15),
student_ssn int,
answer VARCHAR(200),
question VARCHAR(200),
teacher_id int,
Primary key(number,course_code,student_ssn),
FOREIGN KEY(student_ssn) REFERENCES Students ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(course_code) REFERENCES Courses ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY(teacher_id) REFERENCES Teachers ON DELETE No Action ON UPDATE No Action
)


create table Reports(
date_released date,
teacher_id int,
student_ssn int,
teacher_comment varchar(300),
parent_username varchar(20),
parent_reply varchar(300),
primary key(date_released,teacher_id,student_ssn),
foreign key(teacher_id) references Teachers on delete cascade on update cascade,
foreign key(student_ssn) references Students on delete NO ACTION on update NO ACTION,
foreign key(parent_username) references Parents on delete cascade on update cascade
)

create table Announcements(
id int primary key identity,
announcement_description varchar(100),
announcement_type varchar(20),
date_released date,
title varchar(30),
administrator_id int,
foreign key(administrator_id) references Administrators on delete cascade on update cascade
)

create table Activities(
id int primary key identity,
activity_description varchar(100),
activity_type varchar(20),
date_released date,
equipment varchar(50),
activity_location varchar(50),
administrator_id int,
foreign key(administrator_id) references Administrators on delete cascade on update cascade
)

create table Administrators_Assign_Activities_Teachers(
activity_id int primary key,
administator_id int,
teacher_id int,
foreign key(activity_id) references Activities on delete cascade on update cascade,
foreign key(administator_id) references Administrators on delete NO ACTION on update NO ACTION,
foreign key(teacher_id) references Teachers on delete NO ACTION on update NO ACTION
)

create table Students_Join_Activities(
student_ssn int,
activity_id int,
primary key(student_ssn,activity_id),
foreign key(student_ssn) references Students on delete cascade on update cascade,
foreign key(activity_id) references Activities on delete NO ACTION on update NO ACTION
)