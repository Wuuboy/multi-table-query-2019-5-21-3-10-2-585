use test;

# 1.查询同时存在1课程和2课程的情况
select * from student;
select * from course;
select * from student_course;
select * from teacher;

select * from student a ,student_course b ,student_course c
where a.id = b.studentId and a.id = c.studentId and b.courseId = 1 and c.courseId = 2;


# 2.查询同时存在1课程和2课程的情况
select * from student a ,student_course b ,student_course c
where a.id = b.studentId and a.id = c.studentId and b.courseId = 1 and c.courseId = 2;


# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select a.id ,a.name,b.avgNum from student a join (
select studentId,avg(score) as avgNum from student_course group by studentId having avgNum >=60)b on a.id = b.studentId;


# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student where id not in (select studentId from student_course);


# 5.查询所有有成绩的SQL
select b.name,a.score,c.name from student_course a join student b on a.studentId = b.id join course c on a.courseId = c.id;


# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select a.* from student a ,student_course b , student_course c where a.id = b.studentId and a.id = c.studentId and b.courseId = 1 and c.courseId = 2 ;


# 7.检索1课程分数小于60，按分数降序排列的学生信息
select * from student where id in (select studentId from student_course where score < 60 order by score desc);


# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select a.name ,b.avgScore from course a join  (select courseId,avg(score)avgScore from student_course group by courseId order by avgScore desc,avgScore asc)b on a.id = b.courseId;


# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select c.name,a.score from student_course a join course b on a.courseId = b.id join student c on a.studentId = c.id where a.score < 60 and b.name = '数学'
