/* question1 */
data Account;
input name $ balance;
datalines;
Me 1000
;
run;

data projected;
set Account;
increase = 1.0425;
year =1;
balance= balance * increase;
output;
year =2;
balance= balance * increase;
output;
year =3;
balance= balance * increase;
output;
year =4;
balance= balance * increase;
output;
year =5;
balance= balance * increase;
output;
run;

proc print data = projected;
format balance dollar10.2;
run;

/* question2 */
libname class '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets';
data temp;
set class.sfosch;
/* keep totpasscap fclasspass bclasspass eclasspass; */
run;

data temp1(keep = date totalpass totalcap percentage);
set temp;
by date;
if first.date then do;totalpass=0; totalcap=0;end;
totalpass + sum(FClassPass, BClassPass, EClassPass);
totalcap + totpasscap;
if last.date; percentage = totalpass/totalcap; 
run;
proc print data = temp1;
format percentage percent7.1;
run;
/* 28DEC2000 is over capacity. */









