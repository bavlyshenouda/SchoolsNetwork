
--School
insert into Schools (name,mission,vision,email,general_info,main_language,phone_number,school_type,school_address,fees)
values ('MSE','INSPIRE OUR CHILDREN','BILUD NEW GENERATION','contact@mse.edu.eg','1st LEADING SCHOOL','ENGLISH','0225489673','INTERNATIONAL','5th DISTRICT',10.00)
insert into Schools (name,mission,vision,email,general_info,main_language,phone_number,school_type,school_address,fees)
values ('BMS','INSPIRE OUR CHILDREN','BILUD NEW GENERATION','contact@bms.edu.eg','1st LEADING SCHOOL','ARABIC','0252865492','NATIONAL','NASR CITY',99.00)
insert into Schools (name,mission,vision,email,general_info,main_language,phone_number,school_type,school_address,fees)
values ('MIS','INSPIRE OUR CHILDREN','BILUD NEW GENERATION','contact@mis.edu.eg','1st LEADING SCHOOL','ENGLISH','0299865487','INTERNATIONAL','MAADI',965.25)
insert into Schools (name,mission,vision,email,general_info,main_language,phone_number,school_type,school_address,fees)
values ('MSL','INSPIRE OUR CHILDREN','BILUD NEW GENERATION','contact@msl.edu.eg','1st LEADING SCHOOL','ENGLISH','0225489673','INTERNATIONAL','5th DISTRICT',10.00)
insert into Schools (name,mission,vision,email,general_info,main_language,phone_number,school_type,school_address,fees)
values ('BMP','INSPIRE OUR CHILDREN','BILUD NEW GENERATION','contact@bmp.edu.eg','1st LEADING SCHOOL','ARABIC','0252865492','NATIONAL','NASR CITY',99.00)
insert into Schools (name,mission,vision,email,general_info,main_language,phone_number,school_type,school_address,fees)
values ('MES','INSPIRE OUR CHILDREN','BILUD NEW GENERATION','contact@mes.edu.eg','1st LEADING SCHOOL','ENGLISH','0299865487','INTERNATIONAL','MAADI',965.25)
insert into Schools (name,mission,vision,email,general_info,main_language,phone_number,school_type,school_address,fees)
values ('BIM','INSPIRE OUR CHILDREN','BILUD NEW GENERATION','contact@bim.edu.eg','1st LEADING SCHOOL','ENGLISH','0225489673','INTERNATIONAL','5th DISTRICT',10.00)
insert into Schools (name,mission,vision,email,general_info,main_language,phone_number,school_type,school_address,fees)
values ('TTL','INSPIRE OUR CHILDREN','BILUD NEW GENERATION','contact@ttl.edu.eg','1st LEADING SCHOOL','ARABIC','0252865492','NATIONAL','NASR CITY',99.00)
insert into Schools (name,mission,vision,email,general_info,main_language,phone_number,school_type,school_address,fees)
values ('TAL','INSPIRE OUR CHILDREN','BILUD NEW GENERATION','contact@tal.edu.eg','1st LEADING SCHOOL','ENGLISH','0299865487','INTERNATIONAL','MAADI',965.25)

--Levels
insert into Levels values (1)
insert into Levels values (2)
insert into Levels values (3)

--Elementaries
insert into Elementaries values(1,1)
insert into Elementaries values(2,1)
insert into Elementaries values(3,1)
insert into Elementaries values(5,1)
insert into Elementaries values(7,1)
insert into Elementaries values(8,1)


--Supplies
insert into School_Supplies values (1,'pens')
insert into School_Supplies values (2,'nothing')
insert into School_Supplies values (3,'pencil')
insert into School_Supplies values (5,'rubbers')
insert into School_Supplies values (7,'bags')
insert into School_Supplies values (8,'nothing')


--Middles
insert into Middles values (1,2)
insert into Middles values (2,2)
insert into Middles values (3,2)
insert into Middles values (4,2)
insert into Middles values (5,2)
insert into Middles values (6,2)
insert into Middles values (7,2)
insert into Middles values (8,2)
insert into Middles values (9,2)

--Highs
insert into Highs values(1,3)
insert into Highs values(3,3)
insert into Highs values(4,3)
insert into Highs values(5,3)
insert into Highs values(6,3)
insert into Highs values(7,3)
insert into Highs values(9,3)

--Parents
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('reham_saad','12345','Rehab city','26598746','Reham','Ayman','reham.saad@gmail.com')
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('ayman_saad','698412','Rehab city','97423541','Ayman','saad','ayman.saad@gmail.com')
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('alfred_saad','123456','5th DISTRICT','265987461','alfred','Ayman','alfred.saad@gmail.com')
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('bavly_saad','6984126','Rehab city','974235412','bavly','saad','bavly.saad@gmail.com')
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('peter_saad','123457','5th DISTRICT','265987463','peter','Ayman','peter.saad@gmail.com')
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('ayman_latif','6984127','Rehab city','974235414','Ayman','saad','ayman.latif@gmail.com')
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('reham_latif','123458','5th DISTRICT','265987465','Reham','Ayman','rere.saad@gmail.com')
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('loloz_saad','6984128','Rehab city','974235416','lina','saad','lolo.saad@gmail.com')
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('riri_saad','123459','5th DISTRICT','265987467','Reham','Ayman','riri.saad@gmail.com')
insert into Parents(username,parent_password,parent_address,home_phone_number,first_name,last_name,email)
values('aym_saad','6984129','Rehab city','974235418','Ayman','saad','aym.saad@gmail.com')


--Children 
insert into Children(ssn,name,gender,birth_date,parent_username)
values (36594,'Reem Ayman','f','1-11-1999','ayman_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (96548,'Mohamed Ahmed','m','1-12-2010','reham_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (96549,'Salma Ahmed','f','9-5-2001','reham_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (56849,'Nour Hesham','m','2000-07-28','reham_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (10,'Reem Ayman','f','1-11-1999','peter_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (11,'Mohamed Ahmed','m','1-12-2010','peter_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (12,'Salma Ahmed','f','9-5-2001','bavly_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (13,'Nour Hesham','m','2000-07-28','riri_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (14,'Reem Ayman','f','1-11-1999','riri_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (15,'Mohamed Ahmed','m','1-12-2010','reham_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (16,'Salma Ahmed','f','9-5-2001','alfred_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (17,'Nour Hesham','m','2000-07-28','alfred_saad')
insert into Children(ssn,name,gender,birth_date,parent_username)
values (18,'oour Hesham','m','2000-07-28','alfred_saad')

delete from Students where ssn=10
--Students
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (36594,'reem_ayman','365pkjg',12,3,1)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (96549,'salma_ahmed','365pkjg',11,3,3)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (56849,null,null,11,3,1)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values(10,'riri_ayman','365pkjga',12,3,1)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (11,'moh_ahmed','365pkjgaa',11,3,3)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (12,null,null,11,3,1)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (13,'ree_ayman','365pkjgaaa',12,3,5)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (14,'soso_ahmed','365pkjgaaa',11,3,6)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (15,null,null,11,3,1)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (16,'sasa_ahmed','lololo',11,3,3)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (17,'1sasa_ahmed','1lololo',2,1,2)
insert into Students(ssn,username,student_password,grade,level_id,school_id)
values (18,'2sasa_ahmed','2lololo',2,1,2)


--Parents_Mobile
insert into Parents_Mobile(parent_username,mobile_number)
values('reham_saad','01223654875')
insert into Parents_Mobile(parent_username,mobile_number)
values('reham_saad','01223698475')
insert into Parents_Mobile(parent_username,mobile_number)
values('peter_saad','01023654875')
insert into Parents_Mobile(parent_username,mobile_number)
values('ayman_saad','01123698475')

--Parent_Review_School
insert into Parent_Review_Schools(parent_username,review,school_id)
values ('reham_saad','very good education quality',3)
insert into Parent_Review_Schools(parent_username,review,school_id)
values('ayman_saad','not as good as expected',1)






insert into Parent_Review_Schools(parent_username,review,school_id)
values ('peter_saad','very good education quality',3)
insert into Parent_Review_Schools(parent_username,review,school_id)
values('peter_saad','not as good as expected',1)


insert into Parent_Review_Schools(parent_username,review,school_id)
values ('alfred_saad','very good education quality',3)
insert into Parent_Review_Schools(parent_username,review,school_id)
values('riri_saad','not as good as expected',5)










--Parents_Apply_Children_Schools
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('reham_saad',96548,1)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('reham_saad',96548,2)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('reham_saad',96548,3)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('reham_saad',96549,1)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('reham_saad',96549,2)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('ayman_saad',36594,1)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('ayman_saad',36594,3)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('peter_saad',10,1)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('peter_saad',10,3)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('peter_saad',11,1)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('peter_saad',11,3)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('bavly_saad',12,1)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('riri_saad',13,5)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('riri_saad',14,6)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('reham_saad',15,1)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('bavly_saad',12,3)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('riri_saad',13,3)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('riri_saad',14,3)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('reham_saad',15,3)
insert into Parents_Apply_Children_Schools(parent_username,child_ssn,school_id)
values ('alfred_saad',16,3)







--Courses
insert into Courses values('Math01','Basic algebra','basic mathmatical operations',1,1)
insert into Courses values('Math02','Basic Geometry','basic knowladge of triangles',2,1)
insert into Courses values('ENG10','Advanced English','Grammar',7,2)
insert into Courses values('PHY02','Physics','Electricity',8,2)
insert into Courses values('Math10','Mechanics','Forces and Energy',11,3)
insert into Courses values('Math11','Mechanics','Forces and Energy',11,3)
insert into Courses values('Bio02','Biology','Ecology',12,3)
insert into Courses values('Acc01','Accounting','Basic accounting',12,3)

--Teachers
insert into Teachers values('Ahmad','Osama','Kamal','m','5-12-1980','ahmad_osos@gmail.com','12 Kamal Street',null,null,null,3,1,'Math01')
insert into Teachers values('Emad','Emil','Fakhrey','m','6-11-1982','omda_200@gmail.com','16 Ahmad Street',1000,'emad_emil','emadomda',2,2,'Math02')
insert into Teachers values('Saad','Zaghlol','Fahmy','m','2-01-1982','saad_zahglol@gmail.com','120 Saad Zaghlol Street',3500,'saad_zaghlol','mafishfaida',7,1,'ENG10')
insert into Teachers values('Ahmad','Orabi','Fahmy','m','12-05-1988','ahmad_orabi@gmail.com','180 Ahmad Orabi Street',3500,'ahmad_orabi','1234oraby',7,3,'PHY02')
insert into Teachers values('Mostafa','Kamel','Osama','m','1-08-1985','mostafa_1900@gmail.com','190 Mostafa Kamel Street',2500,'mostafa_kamel','kamel55',5,3,'Math10')
insert into Teachers values('Mohammed','Ali','Basiony','m','2-08-1988','mohammed_mac@gmail.com','387 Mohammed Ali Street',6000,'mohammed_ali','alibaba',6,3,'Math11')
insert into Teachers values('Gamila','Bohreed','Osama','f','6-12-1988','gamila88@gmail.com','350 Gamila Bohreed Street',2500,'gamila_bohreed','5493gamila',5,1,'Bio02')
insert into Teachers values('Safia','Zaghlol','Saad','f','11-07-1989','safia_sofi@gmail.com','145 Saad Zaghlol Street',2500,'safia_zaghlol','sofi123',5,1,'Acc01')
insert into Teachers values('Joyes','Zaghlol','Saad','f','11-07-1989','joyes_sofi@gmail.com','145 Saad Zaghlol Street',2500,'safia_zaghlol','sofi123',5,5,'Acc01')
insert into Teachers values('rere','mohamed','Kamal','f','5-12-1980','rere123@gmail.com','14 Kamal Street',8500,'rere_mohamed','rrrr1234',17,1,'Math10')
insert into Teachers values('nada','mohamed','Kamal','f','6-12-1980','nada123@gmail.com','13 Kamal Street',null,null,null,7,1,null)


--Parents_Rate_Teachers
insert into Parents_Rate_Teachers
values('reham_saad',5,5)
insert into Parents_Rate_Teachers
values('reham_saad',6,4)
insert into Parents_Rate_Teachers
values('alfred_saad',5,3)




insert into Parents_Rate_Teachers
values('ayman_saad',7,3)
insert into Parents_Rate_Teachers
values('ayman_saad',8,5)



--Supervisors_Supervise_Teachers
insert into Supervisors_Supervise_Teachers
values (10,1)
insert into Supervisors_Supervise_Teachers
values (10,8)


--Administrators
insert into Administrators
values ('michael','adel','ezzat','m','3-6-1996','miky@gmail.com','sporting,alex',5000,'michael_adel','123456mae',1)

insert into Administrators
values ('sorial','sameh','samy','m','7-21-1996','soso@yahoo.com','shatby,alex',7000,'sorial_sameh','12pharm34',1)

insert into Administrators
values ('bavly','emad','kamel','m','11-30-1996','bebo@hotmail.com','mostafaKamel,alex',6000,'bavly_emad','basket123',2)

insert into Administrators
values ('joyce','tawfik','magdy','f','7-11-1996','joja@gmail.com','nasr city,cairo',2000,'joyce_tawfik','joj@1996',2)

insert into Administrators
values ('tasnim','elkouly','ahmed','f','1-6-1980','tasnim23@gmail.com','atba,cairo',5000,'tasnim_elkhouly','1234567',3)

insert into Administrators
values ('nancy','foaud','ashraf','f','12-12-1978','nanosa@gmail.com','elsheikhzayed,abodhaby',10000,'nancy_foaud','nan123ajr',3)


--Clubs
insert into Clubs
values('DivingDolphin','to learn students diving',1)

insert into Clubs
values('Chess GrandMaster','to play chess',1)

insert into Clubs
values('Puzzle Master','to solve mathematician puzzles in fast way',3)

insert into Clubs
values('Athlete','to participate in gymnastique sports',3)

--Club_Participants
insert into Club_Participants
values ('DivingDolphin',1,36594)

insert into Club_Participants
values ('Chess GrandMaster',1,36594)

insert into Club_Participants
values ('Puzzle Master',3,96549)

--Courses_Prequisite_Courses
insert into Courses_Prequisite_Courses values('Math02','Math01')
insert into Courses_Prequisite_Courses values('Math10','Math02')
insert into Courses_Prequisite_Courses values('Math11','Math02')

--Assignments
insert into Assignments values(1,'Math11',6, '10-10-2016','10-15-2016', 'Questions 1: what is 2+2')
insert into Assignments values(2,'Math11',6, '11-10-2016','11-15-2016', 'Questions 2: what is 3*4')
insert into Assignments values(1,'Math10',5, '10-1-2016','10-6-2016', 'Questions 1: what is 8/2')
insert into Assignments values(2,'Math10', 5,'12-4-2016','12-9-2016', 'Questions 2: 3+x=8 Solve for x')
insert into Assignments values(1,'Bio02', 7,'9-30-2016','10-12-2016', 'Questions 1: give an example for a bird')
insert into Assignments values(2,'Bio02', 7,'10-30-2016','11-12-2016', 'Questions 2: can cats fly?')
insert into Assignments values(3,'Bio02', 7,'11-30-2016','12-12-2016', 'Questions 3: how many bones in human body?')
insert into Assignments values(1,'Eng10', 3,'10-5-2016','10-15-2016', 'Questions 1: is "fly" a verb or noun?')

--Assignment_Grades

insert into Assignment_Grades
values (96549,1,'Math10',5,'4.5',5)
insert into Assignment_Grades
values (96549,2,'Math10',5,'5',10)
insert into Assignment_Grades
values (96549,1,'Math11',6,'4',10)
insert into Assignment_Grades
values (96549,2,'Math11',6,'12',10)
insert into Assignment_Grades
values (36594,1,'Bio02',7,'bat',9)
insert into Assignment_Grades
values (36594,2,'Bio02',7,'probably not',8)
insert into Assignment_Grades
values (36594,3,'Bio02',7,'203',10)

 

--Questions
Insert into  Questions(
course_code ,
student_ssn,
answer ,
question,
teacher_id
)values('Math10',36594,'yes its prime','is 2 a prime number',5);


Insert into  Questions(
course_code ,
student_ssn,
answer ,
question,
teacher_id
)values('Math11',36594,'no its not prime','is 4 a prime number',6);

Insert into  Questions(
course_code ,
student_ssn,
answer ,
question,
teacher_id
)values('Bio02',96549,'no it is mammel','is dog a bird',7);

Insert into  Questions(
course_code ,
student_ssn,
question,
teacher_id
)values('Math02',17,'what is your name?',2);

Insert into  Questions(
course_code ,
student_ssn,
question,
teacher_id
)values('Math02',18,'why we learn Math?',2);


--Reports
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-03-2016',5,36594,'needs improvement');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-04-2016',5,36594,'needs improvement');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-05-2016',5,36594,'Better');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-03-2016',5,96549,'Excellent performance');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-04-2016',5,96549,'Excellent performance');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-05-2016',5,96549,'Your performance began to decline');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-03-2016',6,36594,'needs improvement');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-04-2016',6,36594,'needs improvement');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-05-2016',6,36594,'Better');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-03-2016',6,96549,'Excellent performance');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-04-2016',6,96549,'Excellent performance');
insert into Reports(date_released ,teacher_id ,student_ssn ,teacher_comment )
values('02-05-2016',6,96549,'Your performance began to decline');



--Announcements
insert into Announcements(
announcement_description ,
announcement_type ,
date_released ,
title ,
administrator_id )values('A Trip to dream park costs 200','trips','04-05-2016','Register Online And Save!',1);

insert into Announcements(
announcement_description ,
announcement_type ,
date_released ,
title ,
administrator_id )values('A Trip to Geroland costs 200','trips','04-02-2016','Register Online And Save!',1);

insert into Announcements(
announcement_description ,
announcement_type ,
date_released ,
title ,
administrator_id )values('A Trip to Geroland costs 200','trips','2016-11-23','Register Online And Save!',1);


insert into Announcements(
announcement_description ,
announcement_type ,
date_released ,
title ,
administrator_id )values('Funday','events','2016-01-02','Lets have some fun',2);

insert into Announcements(
announcement_description ,
announcement_type ,
date_released ,
title ,
administrator_id )values('Glabia party','events','2015-05-21','Dress as  an Egyptian',3);


insert into Activities(
activity_description,
activity_type ,
date_released ,
equipment,
activity_location ,
administrator_id ) values('Football','Sports','2010-02-02','Ball','Play Ground',1)


insert into Activities(
activity_description,
activity_type ,
date_released ,
equipment,
activity_location ,
administrator_id ) values('Football','Sports','2010-01-02','Ball','Play Ground',2)

insert into Activities(
activity_description,
activity_type ,
date_released ,
equipment,
activity_location ,
administrator_id ) values('Basketball','Sports','2010-02-02','Ball','Play Ground',2)

insert into Activities(
activity_description,
activity_type ,
date_released ,
equipment,
activity_location ,
administrator_id ) values('Basketball','Sports','2010-02-02','Ball','Play Ground',1)

insert into Activities(
activity_description,
activity_type ,
date_released ,
equipment,
activity_location ,
administrator_id ) values('Fitness','Sports','2010-04-02','Trade mill','Gym',1)

insert into Activities(
activity_description,
activity_type ,
date_released ,
equipment,
activity_location ,
administrator_id ) values('Fitness','Sports','2010-04-02','Trade mill','Gym',2)




insert into Administrators_Assign_Activities_Teachers(
activity_id ,
administator_id ,
teacher_id 
)values (1,1,1)
insert into Administrators_Assign_Activities_Teachers(
activity_id ,
administator_id ,
teacher_id 
)values (2,3,2)
insert into Administrators_Assign_Activities_Teachers(
activity_id ,
administator_id ,
teacher_id 
)values (3,5,3)
insert into Administrators_Assign_Activities_Teachers(
activity_id ,
administator_id ,
teacher_id 
)values (4,1,1)

insert into Students_Join_Activities(
student_ssn ,
activity_id 

) values(36594,1)
insert into Students_Join_Activities(
student_ssn ,
activity_id 
) values(96549,3)