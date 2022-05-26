data pol;
infile '/home/u51524567/PSTAT 130 2021 summer/week5/POLI125.txt';
input studentname $1-16;
coursename = 'POLI125';
run;

data pstat;
infile '/home/u51524567/PSTAT 130 2021 summer/week5/PSTAT130.txt';
input studentname $1-16;
coursename = 'PSTAT130';
run;

data psy;
infile '/home/u51524567/PSTAT 130 2021 summer/week5/PSYCH118.txt';
input studentname $1-16;
coursename = 'PSYCH118';
run;

data allstudents;
set psy pstat pol; 
run;

data classroom;
infile '/home/u51524567/PSTAT 130 2021 summer/week5/classrooms.txt';
input BldgName $1-11  @13 roomnumber coursename $ days $ Time $35-43;
run;

data instructors;
infile '/home/u51524567/PSTAT 130 2021 summer/week5/instructors.txt';
input instructorname $1-14 academicrank $ salary dollar10. coursename $ firstclassdate $;
run;

proc sort data = allstudents; by coursename; run;
proc sort data = classroom; by coursename; run;
proc sort data = instructors; by coursename; run;
data temp;
merge allstudents classroom instructors;
by coursename;
format firstclassdate mmddyy8. salary dollar10.;
run;
proc print data = temp;run;

proc report data = temp;
column  studentname;
by coursename;
label coursename = 'Course Name';
define studentname / 'Student Name';
run;

proc sort data = temp out = temp1; by studentname firstclassdate; run;

proc report data = temp1;
column coursename firstclassdate instructorname bldgname roomnumber days time;
by studentname;
label studentname = 'Student Name';
define coursename / 'Course Name';
define firstclassdate / 'First Class Date';
define instructorname / 'Instructor Name';
define bldgname / 'Building Name';
define roomnumber / 'Room Number';
define days / 'Class Days';
define time / 'Class Time';
run;

proc format;
value $rank 'Asst' = 'Assistant Professor' 
'Assoc'='Associate Professor' ; 
run;

title 'List of Students for Associate Professors';
proc report data = temp;
where academicrank = 'Assoc';
format academicrank $rank.;
column studentname coursename instructorname academicrank salary;
define studentname / 'Student Name';
define coursename / 'Course Name';
define instructorname / 'Instructor Name';
define academicrank / 'Academic Rank';
define salary / 'Salary';
run;
title;











