--SYSTEM ADMINISTRATOR PROCEDURES
--1.CREARTE A SCHOOL
create procedure create_school
@mission varchar(50),
@name varchar(40),
@vision varchar(50),
@fees decimal(10,2),
@school_address varchar(50),
@general_info varchar(50),
@phone_number varchar(10),
@main_language varchar(50),
@school_type varchar(50),  
@email varchar(50),
@elementary bit,
@middle bit,
@high bit
as
begin
insert into Schools (mission,name,vision,fees,school_address,general_info,phone_number,main_language,school_type,email)
values (@mission,@name,@vision,@fees,@school_address,@general_info,@phone_number,@main_language,@school_type,@email)
declare @id int
select @id =id from Schools where name=@name
if @elementary = 1
insert into Elementaries(school_id,level_id) values (@id,1)
if @middle = 1
insert into Middles(school_id,level_id) values (@id,1)
if @high = 1
insert into Highs(school_id,level_id) values (@id,1)
end

GO
--1.ADD SUPPLIES
create procedure add_supplies
@school_name varchar(40),
@supplies varchar(50)
as
begin
declare @school_id int
select @school_id=id from Schools where name=@school_name
if @school_id in (select school_id from Elementaries)
insert into School_Supplies (school_id,supply)
values (@school_id,@supplies)
else print 'Not an Elementary School'
end

GO
--2.ADD COURSES
create procedure add_course
@code varchar(15) ,
@name varchar(50) ,	
@course_description varchar(500), 
@grade int 
as
begin
if @grade < 7
insert into Courses (code,name,course_description,grade,level_id)
values (@code,@name,@course_description,@grade,1)
else if @grade > 6 and @grade < 10
insert into Courses (code,name,course_description,grade,level_id)
values (@code,@name,@course_description,@grade,2)
else
insert into Courses (code,name,course_description,grade,level_id)
values (@code,@name,@course_description,@grade,3)

end
GO
--2.ADD PRERQUISTE COURSES
create procedure prerquiste_course
@code varchar(15),
@prerquiste_code varchar(15)
as
begin
insert into Courses_Prequisite_Courses (code,prequisite_code)
values (@code,@prerquiste_code)
end

GO
--3.ADD ADMINISTRATORS TO THE SCHOOLS
create procedure add_admin
@first_name varchar(10),
@middle_name varchar(10),
@last_name varchar(10),
@gender char(1),
@birth_date date,
@email varchar(50),
@admin_address varchar(50),
@username varchar(20),
@admin_password varchar(20),
@school_name varchar(40)
as
begin
declare @school_id int
declare @school_type varchar(50)
select @school_id = id, @school_type=school_type from Schools where name = @school_name
if @school_type = 'international'
insert into Administrators (first_name,middle_name,last_name,gender,birth_date,email,teacher_address,username,teacher_password,school_id,salary)
values (@first_name,@middle_name,@last_name,@gender,@birth_date,@email,@admin_address,@username,@admin_password,@school_id,5000)
else 
insert into Administrators (first_name,middle_name,last_name,gender,birth_date,email,teacher_address,username,teacher_password,school_id,salary)
values (@first_name,@middle_name,@last_name,@gender,@birth_date,@email,@admin_address,@username,@admin_password,@school_id,3000)
end
GO
--4.DELETE A SCHOOL GIVEN ITS NAME
create procedure delete_school
@school_name varchar(40)
as
begin
declare @school_id int
select @school_id= id from Schools where name = @school_name
update Administrators set username = null, teacher_password = null where @school_id=school_id
update Teachers set username = null, teacher_password = null where @school_id=school_id
update Students set username = null , student_password = null where @school_id=school_id
delete from Schools where name = @school_name
end
GO
						-----------------------------------------------------------------
--SYSTEM USER PROCEDURES
--1.SEARCH FOR A SCHOOL BY ITS NAME,ADDRESS OR TYPE 
create procedure search_school
@school_name varchar(40),
@school_address varchar(50),
@school_type varchar(50)
as 
begin
select * from Schools where name like '%'+@school_name+'%' or school_address like '%'+@school_address+'%' or @school_type = school_type
end
GO
--2.LIST ALL SCHOOLS OF THE SYSTEM ORDERED BY THE LEVEL
create procedure list_all_schools
as
begin 
select s.id,s.name,s.email,s.fees,s.general_info,s.main_language,s.mission,s.phone_number,s.school_address,s.school_type,s.vision,Elementaries.level_id from Schools s inner join Elementaries on s.id=school_id
union
(select s1.id, s1.name,s1.email,s1.fees,s1.general_info,s1.main_language,s1.mission,s1.phone_number,s1.school_address,s1.school_type,s1.vision,Middles.level_id from Schools s1 inner join Middles on s1.id=school_id
union
(select s3.id, s3.name,s3.email,s3.fees,s3.general_info,s3.main_language,s3.mission,s3.phone_number,s3.school_address,s3.school_type,s3.vision,Highs.level_id from Schools s3 inner join Highs on s3.id=school_id))
order by level_id asc
end

GO
--HELPER VIEW ANNOUNCEMENTS OF THE SCHOOL
create procedure all_announcements 
@school_id int
as
begin 
select A.announcement_description,A.title,A.date_released,A.announcement_type from Announcements A inner join Administrators ad on a.administrator_id=ad.id where ad.school_id=@school_id
end
GO
--3.VIEW INFORMATIONS ABOUT A CERTAIN SCHOOL
create procedure certain_school
@school_name varchar(40)
as
begin
declare @id int
select @id = id from Schools where name = @school_name
select * from Schools where name = @school_name
select * from Teachers where school_id=@id
select Parent_Review_Schools.review from Parent_Review_Schools where Parent_Review_Schools.school_id=@id
end
GO
--HELPER VIEW ALL REVIEWS OF A SCHOOL
create procedure all_reviews
@school_id int 
as
begin
select Parent_Review_Schools.review from Parent_Review_Schools where @school_id=Parent_Review_Schools.school_id
end
GO
								------------------------------------------------------------------


--SCHOOL ADMINISTRATOR
--HELPER PROCEDURE GETS THE ID OF THE SCHOOL BY THE ADMINISTATOR ID
create procedure get_school_id
@admin_id int,
@school_id int output
as
begin
select @school_id=school_id from Administrators where id=@admin_id
end
GO

create procedure Admin_Login
@username varchar(20),
@password varchar(20),
@out int output
as
begin
if (@username in(select username from Administrators)) and exists (select * from Administrators a where a.username=@username and a.teacher_password=@password)
select @out=id from Administrators where username=@username and teacher_password=@password
else set @out=0
end
GO
--1.VIEW THE TEACHERS WITHOUT UERNAME AND PASSWORD
create procedure view_teachers
@admin_id int
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
select * from Teachers where school_id=@school_id and username is null and teacher_password is null and salary is null
end
GO
--1.VEFIRY TEACHERS WITHOUT USERNAME AND PASSWORD 
create procedure verify_teacher
@admin_id int,
@teacher_id int,
@username varchar(20),
@password varchar(20)
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
declare @exp int
select @exp=years_of_experience  from Teachers where id=@teacher_id
update Teachers set username=@username , teacher_password=@password , salary=500*@exp where id=@teacher_id and school_id=@school_id
end
GO
--2.VIEW THE STUDENTS WITHOUT UERNAME AND PASSWORD
CREATE procedure view_students
@admin_id int
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
select C.*,S.grade,S.level_id as 'Level' from Students S inner join Children C on S.ssn=C.ssn where S.school_id=@school_id and username is null and student_password is null 
end
GO
--2.VEFIRY STUDENTS WITHOUT USERNAME AND PASSWORD 
create procedure verify_student
@admin_id int,
@student_ssn int,
@username varchar(20),
@password varchar(20)
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
update Students set username=@username , student_password=@password where ssn=@student_ssn and school_id=@school_id
end
GO
--3.ADD NEW ADMINISTRATORS TO MY SCHOOL
create procedure add_admin_by_school_admin
@my_id int,
@first_name varchar(10),
@middle_name varchar(10),
@last_name varchar(10),
@gender char(1),
@birth_date date,
@email varchar(50),
@admin_address varchar(50),
@username varchar(20),
@admin_password varchar(20)
as
begin
declare @school_id int
declare @school_type varchar(50)
select @school_id=school_id from Administrators where id=@my_id
select @school_type=school_type from Schools where id=@school_id
if @school_type = 'international'
insert into Administrators (first_name,middle_name,last_name,gender,birth_date,email,teacher_address,username,teacher_password,school_id,salary)
values (@first_name,@middle_name,@last_name,@gender,@birth_date,@email,@admin_address,@username,@admin_password,@school_id,5000)
else 
insert into Administrators (first_name,middle_name,last_name,gender,birth_date,email,teacher_address,username,teacher_password,school_id,salary)
values (@first_name,@middle_name,@last_name,@gender,@birth_date,@email,@admin_address,@username,@admin_password,@school_id,3000)
end
GO



--4.DELETE STUDENT OF THE SCHOOL
create procedure delete_student
@student_ssn int
as
begin
delete from Club_Participants where student_ssn=@student_ssn
delete from Assignment_Grades where student_ssn=@student_ssn
delete from Questions where student_ssn=@student_ssn
delete from Reports where student_ssn=@student_ssn
delete from Students_Join_Activities where student_ssn=@student_ssn
delete from Students where ssn=@student_ssn
end
GO
--4.DELETE TEACHER OF THE SCHOOL
create procedure delete_teacher
@teacher_id int 
as
begin
delete from Administrators_Assign_Activities_Teachers  where teacher_id=@teacher_id
delete from Parents_Rate_Teachers where teacher_id=@teacher_id
delete from Supervisors_Supervise_Teachers where teacher_id=@teacher_id or supervisor_id=@teacher_id
delete from Assignment_Grades where teacher_id=@teacher_id
delete from Assignments where teacher_id=@teacher_id
delete from Reports where teacher_id=@teacher_id
delete from Teachers where id=@teacher_id 
end
GO
--4.VIEW ADMINISTRATOR OF THE SCHOOL
create procedure view_admins
@admin_id int
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
select * from Administrators where school_id=@school_id
end
GO
--4.DELETE ADMINISTRATOR OF THE SCHOOL
create procedure delete_admin
@admin_id int 
as
begin
delete from Administrators where id=@admin_id 
end
GO
--5.EDIT MY SCHOOL INFORMATION (OTHER ASSUMPTION)
create procedure edit_school
@admin_id int,
@mission varchar(50),
@name varchar(40),
@vision varchar(50),
@fees decimal(10,2),
@school_address varchar(50),
@general_info varchar(50),
@phone_number varchar(10),
@main_language varchar(50),
@school_type varchar(50),  
@email varchar(50),
@out int output
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
if  exists (select * from Schools where @school_id<>id and email=@email)
 begin 
 set @out=0
end
else
begin
update Schools set mission=@mission, name=@name, vision=@vision, fees=@fees, school_address=@school_address,
general_info=@general_info, phone_number=@phone_number, main_language=@main_language, school_type=@school_type,
email=@email where id=@school_id
set @out=1
end
end
GO
--5.EDIT MY SCHOOL INFORMATION
create procedure edit_school_info
@admin_id int,
@mission varchar(50),
@name varchar(40),
@vision varchar(50),
@fees decimal(10,2),
@school_address varchar(50),
@general_info varchar(50),
@phone_number varchar(10),
@main_language varchar(50),
@school_type varchar(50),  
@email varchar(50),
@elementary bit,
@middle bit,
@high bit
as
begin 
declare @school_id int
exec get_school_id @admin_id , @school_id output 
update Schools set mission=@mission, name=@name, vision=@vision, fees=@fees, school_address=@school_address,
general_info=@general_info, phone_number=@phone_number, main_language=@main_language, school_type=@school_type,
email=@email where id=@school_id
declare @exist int
select @exist=level_id from Elementaries where school_id=@school_id
if @exist is not null
if @elementary=1
update Elementaries set level_id=1 where school_id=@school_id
else delete from Elementaries where school_id=@school_id
else if @elementary=1
insert into Elementaries (school_id,level_id) values (@school_id,1)

declare @exist1 int
select @exist1=level_id from Middles where school_id=@school_id
if @exist1 is not null
if @middle=1
update Middles set level_id=1 where school_id=@school_id
else delete from Middles where school_id=@school_id
else if @middle=1
insert into Middles(school_id,level_id) values (@school_id,2)

declare @exist2 int
select @exist2=level_id from Highs where school_id=@school_id
if @exist2 is not null
if @high=1
update Highs set level_id=1 where school_id=@school_id
else delete from High where school_id=@school_id
else if @high=1
insert into Highs(school_id,level_id) values (@school_id,3)
end
GO
--5.EDIT ELEMENTARY SCHOOL SUPPLIES
create procedure edit_school_supplies
@admin_id int,
@supplies varchar(50)
as
begin 
declare @school_id int
exec get_school_id @admin_id, @school_id output
if @school_id in (select school_id from School_Supplies)
update School_Supplies set supply=@supplies where school_id=@school_id
else print 'Not an Elementary School'
end
GO

--6.POST ANNOUNCEMENT 
CREATE procedure post_announcement
@announcement_description varchar(100),
@announcement_type varchar(20),
@title varchar(30),
@administrator_id int
as
begin
insert into Announcements (announcement_description,announcement_type,date_released,title,administrator_id)
values (@announcement_description,@announcement_type,getdate(),@title,@administrator_id)
end
GO
--6.VIEW ANNOUCEMENTS
create procedure view_announcements
@admin_id int
as
begin
select * from Announcements a where a.administrator_id=@admin_id
end
GO
--7.CREATE ACTIVITY
create procedure create_activity
@activity_description varchar(100),
@activity_type varchar(20),
@date_released date,
@equipment varchar(50),
@activity_location varchar(50),
@administrator_id int
as 
begin
insert into Activities(activity_description,activity_type,date_released,equipment,activity_location,administrator_id)
values (@activity_description,@activity_type,@date_released,@equipment,@activity_location,@administrator_id)
end
GO
--7. VIEW ALL UNASSIGHNED ACTIVITIES
CREATE procedure view_unassigned_activities
@admin_id int
as
begin
select A.* from Activities A left outer join Administrators_Assign_Activities_Teachers AA on A.id=AA.activity_id
where AA.activity_id is null and A.administrator_id=@admin_id

end
GO
--7.VIEW UNASSIGNED TEACHERS TO ACTIVITY
CREATE procedure teachers_activities
@admin_id int
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
select * from Teachers where school_id=@school_id and username is not null
end
GO
--7.ASSIGN TEACHER TO ACTIVITY
create procedure assign_activity_teacher
@admin_id int,
@activity_id int,
@teacher_id int
as
begin
insert into Administrators_Assign_Activities_Teachers(administator_id,teacher_id,activity_id)
values(@admin_id,@teacher_id,@activity_id)
end
GO
--8.CHANGE TEACHER ASSIGNED TO AN ACTIVITY
create procedure change_teacher_activity
@teacher_id int,
@admin_id int,
@activity_id int
as
begin
update Administrators_Assign_Activities_Teachers set teacher_id=@teacher_id where administator_id=@admin_id and
activity_id=@activity_id
end
GO

--9.ASSIGN COURSE TO TEACHER
create procedure assgin_course_teacher
@teacher_id int,
@admin_id int,
@course_code varchar(15)
as
begin
declare @school_level int
declare @school_id int
exec get_school_id @admin_id , @school_id output 
declare @course_level int
select @course_level=level_id from Courses where code=@course_code
if @course_level=1
select @school_level=level_id from Elementaries where @school_id=school_id
if @school_level is not null
update Teachers set course_code=@course_code where id=@teacher_id
else print 'School does not offer this course' 
if @course_level=2
select @school_level=level_id from Middles where @school_id=school_id
if @school_level is not null
update Teachers set course_code=@course_code where id=@teacher_id
else print 'School does not offer this course' 
if @course_level=3
select @school_level=level_id from Highs where @school_id=school_id
if @school_level is not null
update Teachers set course_code=@course_code where id=@teacher_id
else print 'School does not offer this course' 
end
GO
--9.VIEW TEACHER WHO ARE NO ASSIGNED TO COURSE
create procedure teacher_no_course
@admin_id int
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
select * from Teachers where school_id=@school_id and course_code is null and username is not null
end
GO
--9.VIEW COURSES THAT SCHOOL OFFER
create procedure course_school_offer
@admin_id int
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
select C.* from Courses C inner join Elementaries e on e.level_id=C.level_id where e.school_id=@school_id
union(select C1.* from Courses C1 inner join Middles m on m.level_id=C1.level_id where m.school_id=@school_id
union (select C2.* from Courses C2 inner join Highs h on h.level_id=C2.level_id where h.school_id=@school_id)
)
end
GO
--10.ASSIGN SUPERVISORS TO TEACHER
create procedure assign_supervisor
@teacher_id int,
@supervisor_id int
as
begin
declare @exp int 
select @exp=years_of_experience from Teachers where id = @supervisor_id
if @exp>15 
insert into Supervisors_Supervise_Teachers (teacher_id,supervisor_id)
values (@teacher_id,@supervisor_id)                                                 
else print 'No enough years of experience'
end
GO
--HELPER PROCEDURE TO GET THE PARENT_USERNAME
create procedure get_parent_username
@child_ssn int,
@parent_username varchar(20) output
as
begin
select @parent_username=parent_username from Children where ssn=@child_ssn
end
GO
--11.VIEW ALL APPLICANTTS OF THE SCHOOL
CREATE procedure view_applicants
@admin_id int
as
begin 
declare @school_id int
exec get_school_id @admin_id , @school_id output 
select c.* from Parents_Apply_Children_Schools T inner join Children C on t.child_ssn=c.ssn and school_id=@school_id where  T.accepted is null
end
GO
--11.ACCEPT OR REJECT THE APPLICTIONS
create procedure accept_reject_app
@child_ssn int,
@admin_id int,
@accept bit
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
declare @parent_username varchar(20)
exec get_parent_username @child_ssn , @parent_username output
update Parents_Apply_Children_Schools set accepted=@accept where child_ssn=@child_ssn and school_id=@school_id and parent_username=@parent_username
end
GO
--HELPER
create procedure show_school
@admin_id int
as
begin
declare @school_id int
exec get_school_id @admin_id , @school_id output 
select * from Schools where id = @school_id
end
GO
--PARENT

--1
CREATE PROCEDURE Sign_up 
@first_name varchar(20),@lastname varchar(20),@emai varchar(50),@addres varchar(50),
@home_numbe varchar(10), @usernam varchar(20), @passwor varchar(20),@o int output As
BEGIN
if(not exists(select * from parents p where p.username=@usernam )and not exists(select * from parents p where 
p.email=@emai))
begin
INSERT into parents (username,
first_name ,
last_name,
parent_password ,
email ,
parent_address,
home_phone_number ) VALUES( @usernam,@first_name,@lastname,@passwor,@emai,@addres,@home_numbe)
select @o=1
end
else
select @o=0;
END;
GO
--1
CREATE PROCEDURE inmobile @usernam varchar(20),@mobilenumber varchar(13) ,@o int Output as 
begin
if (not exists (select * from parents_mobile p where p.parent_username=@usernam and  p.mobile_number=@mobilenumber))
begin
insert into parents_mobile(parent_username ,
mobile_number )values(@usernam ,@mobilenumber)
select @o=1;
end
else 
select @o=0;
 
end


GO
--2
create procedure apply @parent_username varchar(20),@school_id int,@child_ssn int,@child_name varchar(50)
,@child_birthdate date,@gender  char(1) as
begin
if(not exists(select * from children c where c.ssn=@child_ssn ) )
insert into children(ssn ,
name ,
birth_date,
gender  ,
parent_username )values(@child_ssn,@child_name,@child_birthdate ,@gender,@parent_username)
insert into parents_apply_children_schools(child_ssn,
school_id ,
parent_username)values(@child_ssn ,@school_id , @parent_username);
end
GO
--3
create procedure accepted_schools @parent_username varchar(20) as
begin
SELECT C.ssn,C.name, s.*
 from Schools S INNER JOIN Parents_Apply_Children_Schools  A ON S.id=A.school_id  INNER JOIN Children C  ON  A.child_ssn 
=C.ssn where A.parent_username=@parent_username And A.accepted=1
 end
 GO
 --4
 -- if the student is already present this means that he is changing the school
 create procedure choose_school @parent_username varchar(20),@school_id int,@child_ssn int as
begin
   IF(EXISTS (SELECT * from students s where s.ssn=@child_ssn)) 
    UPDATE students  set school_id=@school_id,username =null,student_password =null where ssn=@child_ssn
    ELSE  INSERT INTO students (ssn ,grade ,level_id ,school_id ) values  (@child_ssn,1,1,@school_id)
    
    end
GO
--5
	create procedure show_report @parent_username varchar(20) as 
begin
    SELECT r.student_ssn ,c.name,cc.name,r.date_released  ,t.id,t.first_name,t.middle_name,
	t.last_name,r.teacher_comment ,r.parent_reply FROM reports R INNER JOIN children C ON
 R.student_ssn=c.ssn inner join teachers t on t.id=r.teacher_id inner join 
 courses cc on cc.code=t.course_code where C.parent_username=@parent_username

 end
 GO
 --6
 create PROCEDURE reply_reports @parent_username varchar (20),@teacher_id int,@student_ssn int,
@parent_reply varchar(300),@date_released date  as
begin
UPDATE reports  set parent_reply=@parent_reply,parent_username=@parent_username where teacher_id=@teacher_id
and student_ssn=@student_ssn and date_released=@date_released

end
GO
--7
create procedure childrens_Schools @parent_username varchar(20) as
begin
select ss.* from schools ss inner join students s on ss.id=s.school_id inner join children c on c.ssn =s.ssn where 
c.parent_username=@parent_username order by ss.name

end
GO
--8
create procedure view_announcement @parent_username varchar(20) as
begin
select a.id ,
a.announcement_description,
a.announcement_type ,
a.date_released ,
a.title from Announcements a inner join Administrators m on a.administrator_id=m.id 
inner join students s on  m.school_id=s.school_id inner join children c on c.ssn=s.ssn inner join schools ss on ss.id=s.school_id

where c.parent_username=@parent_username and DATEDIFF(day,a.date_released,GETDATE ( ))<11  group by a.id ,
a.announcement_description,
a.announcement_type ,
a.date_released ,
a.title
end
GO

create procedure teacher_c @paren_username varchar(20) as 
begin 
select t.id,
t.first_name ,
t.middle_name,
t.last_name ,
t.gender ,
t.birth_date ,
t.email ,
t.teacher_address ,
t.salary,
t.username ,

t.years_of_experience,
t.school_id ,
t.course_code from teachers t inner join  courses c on t.course_code=c.code inner join Students s on c.level_id=s.level_id 
and t.school_id=s.school_id 
inner join children chi on chi.ssn=s.ssn where chi.parent_username=@paren_username group by
t.id,
t.first_name ,
t.middle_name,
t.last_name ,
t.gender ,
t.birth_date ,
t.email ,
t.teacher_address ,
t.salary,
t.username ,

t.years_of_experience,
t.school_id ,
t.course_code
end

GO
--9
create procedure rate_teacher @parent_username varchar(20),@teacher_id int,@rate int ,@o int output
  as
begin

if(not exists (select * from Parents_Rate_Teachers p where p.parent_username =@parent_username and 
p.teacher_id=@teacher_id)  and @rate<=5 and @rate>=1)
begin
insert into Parents_Rate_Teachers( parent_username ,teacher_id ,rate ) values (@parent_username ,@teacher_id ,@rate );
select @o=1;
end 
else
select @o=0;
end

GO
GO
--10
create procedure write_review @parent_username varchar(20),@school_id int,@review varchar(500) as
begin
if(not exists (select * from Parent_Review_Schools p where p.parent_username=@parent_username and p.school_id 
=@school_id))
insert INTO Parent_Review_Schools(parent_username ,
school_id ,review ) values(@parent_username ,@school_id ,@review )
else update  Parent_Review_Schools set review =@review where parent_username = @parent_username and school_id=@school_id
end
GO
--11
create procedure delete_review @parent_username varchar(20),@school_idd int as
begin
delete from Parent_Review_Schools  where parent_username=@parent_username and school_id=@school_idd
end
GO
--12
create PROCEDURE  vg_trate @teacher_idd int,@result int output as
begin
select @result =avg(rate)  from Parents_Rate_Teachers  where teacher_id=@teacher_idd   ;

end
GO
--13
create PROCEDURE top_10 @parent_username varchar(20) ,@r_e bit as
begin
 

     if(@r_e=0)    
   SELECT Top 10 sc.id ,count(review) from   schools sc left outer join Parent_Review_Schools e on sc.id=e.school_id WHERE  sc.id not in
          (select ss.id from schools ss inner join students s on ss.id=s.school_id inner join children c on c.ssn =s.ssn where c.parent_username=@parent_username ) 
		  group by sc.id order by count(review) desc
       else                                                
      SELECT TOP 10   s.id ,count(ssn)from    schools s left outer join students st   on s.id=st.school_id  WHERE s.id not in 
	   (select ss.id from schools ss inner join students s on ss.id=s.school_id inner join children c on c.ssn =s.ssn where c.parent_username=@parent_username ) 
	  group by s.id order by count(ssn) desc  
	  end

GO
--14
create procedure invsn as
begin 
select  s.id from schools s inner join Parent_Review_Schools r on s.id=r.school_id  where s.school_type='INTERNATIONAL'
 group by s.id having count(review) >
 all(select count (review) from  Parent_Review_Schools t inner join schools ss on ss.id=t.school_id  
 where ss.school_type='NATIONAL' group by t.school_id)
end
go
--login
create procedure log_in @username varchar(20),@password varchar(20),@o int Output 
as begin

if(exists(select *  from Parents p where p.username=@username and p.parent_password=@password))
select @o=1;
else 
select @o=0;
end

 go
create procedure showmyreviewss @parent_username varchar(20) as
begin
select* from Parent_Review_Schools p where p.parent_username=@parent_username
end  



 GO                           ---------------------------------------------------------------------------------
--TEACHER PROCEDURES
create proc Teacher_Signup    --1   sign up using name , adress,email , gender
@first_name varchar(30),
@middle_name varchar(30),
@last_name varchar(30),
@birth_date datetime,
@adress varchar(50),
@email varchar(30),
@gender char(1)
as
insert into Teachers (first_name,middle_name,last_name,birth_date,teacher_address,email,gender)
values (@first_name,@middle_name,@last_name,@birth_date,@adress,@email,@gender)

------
go

create proc Teacher_Signup1    --1   sign up using name , adress,email , gender, exp
@first_name varchar(30),
@middle_name varchar(30),
@last_name varchar(30),
@birth_date datetime,
@adress varchar(50),
@email varchar(30),
@gender char(1),
@exp int,
@o int output
as
begin
if exists (select * from Teachers where email=@email)
begin
set @o=0
end
else
begin
insert into Teachers (first_name,middle_name,last_name,birth_date,teacher_address,email,gender,years_of_experience)
values (@first_name,@middle_name,@last_name,@birth_date,@adress,@email,@gender,@exp)
set @o=1
end
end
go

create proc Teacher_CoursesName    --2   View a list of courses’ names I teach
@id integer
as
select c.level_id, c.grade , c.name
from Teachers t inner join Courses c on t.course_code=c.code
where t.id=@id
order by c.level_id , c.grade 
      
--------
go


create proc Teacher_PostAssignments    --3 Post assignments for the course(s)
@teacher_id integer,
@code varchar(15),
@assignment_number integer,
@posting_date datetime,
@content   varchar(1000),	
@due_date  datetime
as
insert into Assignments (number,course_code,teacher_id,post_date,due_date,content)
values (@assignment_number,@code,@teacher_id ,@posting_date,@due_date,@content)


INSERT INTO Assignment_Grades(teacher_id,assigment_number,course_code,student_ssn)
SELECT @teacher_id,@assignment_number, @code,ssn  from Students s inner join Courses c on s.grade=c.grade
                                       where c.code=@code  

--------
go

create proc Teacher_viewSolution   --4 View the students’ solutions for the assignments
@teacher_id integer,
@code varchar (15),
@assignment_number integer
as
select a.student_ssn , a.answer
from  Courses c inner join Assignment_Grades a on c.code=a.course_code 
where c.code=@code and a.assigment_number=@assignment_number and a.teacher_id=@teacher_id
order by a.student_ssn 


------
go

create proc Teacher_gradeAssignment   ---5 Grade the students’ solutions for the assignments
@teacher_id integer,
@student_id integer,
@course_code varchar(15),
@assignment_number integer,
@grade varchar(5)
as
update Assignment_Grades
set grade=@grade
where student_ssn=@student_id and course_code=@course_code and assigment_number=@assignment_number and teacher_id=@teacher_id
------
go

create proc Teacher_deleteAssignments    --6 Delete assignment from course
@teacher_id integer,
@code varchar(15),
@number integer
as
delete from Assignment_Grades
where Assignment_Grades.course_code=@code and Assignment_Grades.assigment_number=@number and Assignment_Grades.teacher_id=@teacher_id
delete
from Assignments 
where Assignments.course_code=@code and Assignments.number=@number and Assignments.teacher_id=@teacher_id

------
go

create proc Teacher_reports     --7 Write monthly reports about student I teach
@Teacher_id integer,
@student_id integer,
@date datetime,
@comment varchar(300)
as
insert into Reports (teacher_id,student_ssn,date_released,teacher_comment)
values (@Teacher_id,@student_id,@date,@comment)
 
-------
go

create proc Teacher_studentQuestions    --8 View the questions asked by the students
@course_code varchar(15),
@teacher_id integer
as
select Questions.student_ssn,Questions.question
from Questions
where Questions.course_code=@course_code and Questions.teacher_id=@Teacher_id 

----------
go

create proc Teacher_AnswerStudent      --9  answer the questions asked by the students
@teacher_id integer,
@number integer,
@student_id integer,
@course_code varchar(15),
@answer varchar(300)
as
update Questions
set answer=@answer
where Questions.course_code=@course_code and Questions.number=@number and Questions.student_ssn=@student_id and Questions.teacher_id=@teacher_id

----------
go

create proc	Teacher_students       --10  View a list of students that i teach
@teacher_id integer
as
select distinct c.grade ,d.name  
from Teachers t inner join Courses c on t.course_code=c.code
      inner join Students s on c.grade=s.grade 
	  inner join Children d on s.ssn=d.ssn
where t.school_id=s.school_id and t.id=@teacher_id
order by c.grade ,d.name


--------
go

create proc Teacher_studentNotJoinActivity   --11 View a list of students that did not join any activity.
@teacher_id integer
as
declare @sc_id integer
set @sc_id = (select max(t.school_id)
             from Teachers as t
             where t.id=@teacher_id)

select distinct c.ssn,c.name
from Students s inner join Children c on s.ssn=c.ssn 
where s.school_id=@sc_id
except
select distinct c.ssn,c.name
from Students s inner join Children c on s.ssn=c.ssn 
                 inner join Students_Join_Activities a on s.ssn=a.student_ssn
where s.school_id=@sc_id

-----------
go

create proc Teacher_studentLargestNumberClubs    --12 Display the name of the high school student who is currently a member of the greatest number of clubs.
@name  varchar(20) output,
@number integer output,
@teacher_id integer
as
declare @sc_id integer
set @sc_id=(select t.school_id
           from Teachers as t
           where t.id=@teacher_id)

                        select s.ssn,c.name as first_name,COUNT(*) as num 
						into #Temp
                        from Students s inner join Children c on s.ssn=c.ssn
                         inner join Club_Participants p on c.ssn=p.student_ssn  
						 where s.school_id=@sc_id       
                         group by s.ssn , c.name 

select @name=first_name, @number=num   
from #Temp  
where num=(select max (num)
                 from #Temp)  
go
create proc Teacher_login
@id int output,
@name varchar(100) output,
@username varchar(30),
@password varchar(30)
as
set @id=0 
select @id=t.id,@name=t.first_name +' '+ t.middle_name+ ' ' + t.last_name 
from Teachers t
where t.username=@username and t.teacher_password=@password

go

create proc Teacher_coursescodes
@id integer
as
select course_code
from Teachers  
where id=@id

go

create proc Teacher_Assignments  
@teacher_id integer,
@code varchar (15),
@assignment_number integer,
@information varchar(1200) output
as
declare @content varchar(1000)
set @content=(select content+char(13)+'Due Data: '+cast(due_date as varchar) from Assignments where teacher_id=@teacher_id and number=@assignment_number and course_code=@code) 
set @information='Course Code: '+@code +char(13)+'Assignment Number: ' + cast (@assignment_number as varchar) +char(13)+ 'Content: '+@content     
select a.student_ssn , a.answer,a.grade
from  Courses c inner join Assignment_Grades a on c.code=a.course_code 
where c.code=@code and a.assigment_number=@assignment_number and a.teacher_id=@teacher_id
order by a.student_ssn  


go

create proc	Teacher_studentSSN     
@teacher_id integer
as
select distinct s.ssn 
from Teachers t inner join Courses c on t.course_code=c.code
      inner join Students s on c.grade=s.grade 
where t.school_id=s.school_id and t.id=@teacher_id
order by s.ssn

go

create proc Teacher_studentQuestionsAnswers   
@course_code varchar(15),
@teacher_id integer
as
select Questions.student_ssn,Questions.number,Questions.question,Questions.answer
from Questions
where Questions.course_code=@course_code and Questions.teacher_id=@Teacher_id 



go




create proc Teacher_AssignmentNumber
@code varchar(15),
@teacher_id integer
as
select number
from Assignments
where course_code=@code and teacher_id=@teacher_id

go

create proc	Teacher_studentsIDS      
@teacher_id integer
as
select distinct c.grade ,s.ssn,d.name  
from Teachers t inner join Courses c on t.course_code=c.code
      inner join Students s on c.grade=s.grade 
	  inner join Children d on s.ssn=d.ssn
where t.school_id=s.school_id and t.id=@teacher_id
order by c.grade ,s.ssn,d.name

				 --------------------------------------------------------
--STUDENT
GO
CREATE PROC EnrolledUpdate
@ssn int,
@name varchar(50),
@birth_date date,
@gender char(1),
@username varchar(20),
@student_password varchar(20),
@grade int,
@level_id int
as 
UPDATE Children
SET name=@name,birth_date=@birth_date,gender=@gender
where ssn=@ssn
UPDATE Students 
SET student_password=@student_password,grade=@grade,level_id=@level_id
where ssn=@ssn

go
--2 View a list of courses’ names assigned to me based on my grade ordered by name.
Create proc ViewCourses
@ssn int
as
SELECT distinct Courses.code,Courses.name
from Courses Inner join Students on Students.grade=Courses.grade
where Students.ssn=@ssn
order by Courses.name

go

--3 Post questions I have about a certain course.
Create proc Ask
@course_code VARCHAR(15),
@ssn int,
@question VARCHAR(200)
as
insert into Questions (course_code,student_ssn,question)
values(@course_code,@ssn,@question)

go

--4 View all questions asked by other students on a certain course along with their answers.
Create proc ViewQuestions
@course_code VARCHAR(15)
as
select Questions.question, Questions.answer
from Questions
Where Questions.course_code=@course_code

go

--5 View the assignments posted for the courses I take.
Create proc ViewAssignments
@ssn int
as
select a.course_code , a.number , a.due_date , a.content
from Assignment_Grades ag inner join Assignments a  on ag.course_code=a.course_code
where ag.assigment_number=a.number and ag.student_ssn=@ssn and ag.teacher_id=a.teacher_id

go

--6 Solve assignments posted for courses I take.
Create proc SolveAssignments 
@ssn int,
@course_code VARCHAR(15),
@assignments_number int,
@answer VARCHAR(2500)
as
update Assignment_Grades
Set answer=@answer
where course_code=@course_code and assigment_number=@assignments_number and student_ssn=@ssn

go

--7 View the grade of the assignments I solved per course.
Create proc AssignmentsGrade
@ssn int
as
Select course_code, assigment_number, grade
from Assignment_Grades
where Assignment_Grades.student_ssn=@ssn


go
--8 View the announcements posted within the past 10 days about the school I am enrolled in.
Create proc ViewAnnouncements
@ssn int
as
Declare @school_id int
Declare @now date = Cast(Current_timeStamp as Date)
Declare @Lowerdate date = DateAdd(Day,-10,@now)
Select @school_id=school_id from Students where Students.ssn=@ssn
Select Announcements.title, Announcements.announcement_type, Announcements.announcement_description
from Announcements inner join Administrators on Announcements.administrator_id = Administrators.id
where Administrators.school_id=@school_id and Announcements.date_released > @lowerdate 

go
--9 View all the information about activities offered by my school, as well as the teacher responsible
--for it.



--10 Apply for activities in my school on the condition that I can not join two activities of the same
--type on the same date.
Create proc JoinActivity
@ssn int,
@id int
as
Declare @activity_type varchar(20)
Select @activity_type=Activities.activity_type from Activities where Activities.id=@id 
if(not exists(select * from Students_Join_Activities S inner join Activities A on S.activity_id=A.id 
Where A.date_released = Cast(Current_timeStamp as Date)AND A.activity_type <> @activity_type))
insert into Students_Join_Activities Values(@ssn,@id)

go
--11 Join clubs offered by my school, if I am a highschool student.
Create proc JoinClub
@ssn int,
@school_id int,
@club_name Varchar(20)
as
if(exists(Select* from Students inner join Highs 
on Highs.school_id = Students.school_id AND Students.level_id=Highs.level_id))
insert into Club_Participants values (@club_name,@school_id,@ssn)

go

--12 Search in a list of courses that i take by its name or code.


Create proc CourseSearch
@Course_Code VARCHAR(15),
@Course_Name VARCHAR(20)
as
select distinct Courses.* 
from Courses
where courses.name=@Course_Name or courses.code=@Course_Code
go


 create proc ViewAssignmentsCourse
@ssn int,
@course_code varchar(15)
as
select a.number
from Assignment_Grades ag inner join Assignments a on ag.course_code=a.course_code
where ag.assigment_number=a.number and ag.student_ssn=@ssn 
and ag.teacher_id=a.teacher_id and ag.course_code=@course_code
and grade is NULL

--------
go
Create proc GetInfo
@ssn int
as
select * 
from Students inner join Children on Students.ssn=Children.ssn
where Students.ssn=@ssn
---------
go
Create proc GetAssignemnt
@number int,
@course_code Varchar(15)
as
Select Assignments.content from Assignments where Assignments.number=@number and Assignments.course_code=@course_code
---------
go
Create proc ViewClubs
@ssn int
as
Select Clubs.Name
from Clubs inner join Students on Clubs.school_id=Students.school_id
where Students.ssn=@ssn

---------
go
Create Proc GetSchool
@ssn int,
@school_id int output
as
Select @school_id=school_id
from Students
where ssn=@ssn
---------
go
CREATE PROC StudentLogIn
@ssn int output,
@username Varchar(15),
@password Varchar(15)
as set @ssn=0 
select @ssn=students.ssn 
from Students 
where Students.username=@username and Students.student_password=@password

--Updated
--drop proc ViewActivities
go
Create proc ViewActivities
@ssn int
as
Declare @school_id int
Select @school_id=school_id from Students where Students.ssn=@ssn
Select t.* , att.teacher_id, Teachers.first_name, Teachers.middle_name
from Activities t inner join Administrators_Assign_Activities_Teachers att
on att.activity_id=t.id inner join Teachers on Teachers.id=att.teacher_id
inner join Administrators a on a.id=att.administator_id
where a.school_id=@school_id