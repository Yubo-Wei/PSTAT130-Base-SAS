/* homework2 question1*/
data q1;
input ID trt$ response;
datalines;
001 D1 10
002 D1 14
003 D1 9
004 D2 0
005 D2 5
006 P 20
007 P 22
009 P 11
011 D1 8
013 D2 3
014 D1 2
010 P 0 
;
run;
proc format;
value amount low-<10 = 'Less than 10'
10-20 = '10 to 20'
20-high = 'Greater than 20'
;
run;
proc print data = q1;
format response amount.;
run;
proc print data = q1 label;
label response = 'Response (time in Months)'
trt = 'Treatment';
format response amount.;
run;

/* question2 */

data q2;
infile '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets/idcourse.txt';
input ID Course $;
if UPCASE(SUBSTR(Course,1,5)) = 'PSTAT' then PSTAT = 1;
else PSTAT = 0;
run;

data q22;
set q2;
where PSTAT = 1;
keep id;
run;

/* question3 */

data insure10(keep =Name Company BalanceDue);
set '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets/insure.sas7bdat';
where PctInsured < 100;
keep Name Company PctInsured BalanceDue;
run;

/* question4 */
proc import out = temp datafile ='/home/u51524567/PSTAT 130 2021 summer/ClassDataSets/MonthlyUnemployementRate.csv'
dbms = CSV replace;
getnames = yes;
delimiter= ';';
run;
proc print data = temp;
run;

data temp2;
set temp;
day = '01';
year_v1 = put(year,4.);
run;

data temp3;
set temp2;
month_v1 = UPCASE(SUBSTR(month,1,3));
run;


data temp4;
set temp3;
date_v1 = substr(cats(day,month_v1,year_v1),1,9);
run;

data temp5;
set temp4;
date = input(date_v1, date9.);
format date date9.;
run;






