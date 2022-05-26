/* question1 */
data test;
 x=.;
 y=5;
 a=x+y;
 b=sum(x,y);
 c=5;
 c+x;
 d=5;
 d+x+y;
 put a= b= c= d =;
run; 

/* question2 */
libname class "/home/u51524567/PSTAT 130 2021 summer/ClassDataSets";
proc print data =class.grades;run;
data grades;
set class.grades;
run;

data temp (keep = Exam1 Exam2 Exam3 TotalExam MaxTotalExam AveExam);
set grades;
TotalExam = sum(exam1, exam2, exam3);
MaxTotalExam = max(MaxTotalExam, TotalExam);
retain MaxTotalExam;
BigSum + TotalExam;
n+1;
AveExam = BigSum/n;
run;

proc sort data = temp out = highest;
by descending totalexam;
run;
proc print data = highest (obs = 1);
run;

/* question3 */
proc import datafile = '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets/usage.xlsx'
dbms = xlsx out = usage;
getnames = yes;
run;
proc print data =usage;
run;

proc sort data =usage; by customer_id;run;
data temp1;
set usage;
by customer_id;
if first.customer_id then do;
count = 0; end;
count + 1;
if last.customer_id and count = 1;
output;
run;
/* DONE! */








