/* Question 1 */
/* Create three datasets */
data one;
input x y;
datalines;
5 11.1
6 12.2
7 13.3
8 14.4
;
run;
data two;
input x w $;
datalines;
5 a
6 b
9 z 
;
run;

data three;
input z;
datalines;
100
200
;
run;

proc print data=one;run;
proc print data=two;run;
proc print data=three;run;

data a;
set one two;
run;
proc print data = a;run;

data b;
set one two three;
run;
proc print data = b;run;

data c;
merge one two;
by x;
run;
proc print data = c;run;

data d;
merge one(in = inx) two(in = iny);
by x;
if inx and iny;
run;
proc print data = d;run;

/* Question 2 */
libname class '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets';

data insure10(keep = name company pctinsured);
set class.insure;
where pctinsured >= 100;
run;
proc print data = insure10;run;


data insure20(keep = name company pctinsured balancedue);
set class.insure;
run;

proc sort data = insure20 out = insure20_edited;
by descending balancedue;
run;
proc print data = insure20_edited;
var name company balancedue;
format balancedue dollar11.2;
run;








