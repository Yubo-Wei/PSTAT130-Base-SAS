/* question1 */
data height;
infile '/home/u51524567/PSTAT 130 2021 summer/week4/height.txt';
input ID $ height units $;
run;
proc contents data = height; run;
proc print data = height; run;

data height_in;
set height;
if upcase(units) = 'CM' THEN height = height/2.54;
drop units;
run;
proc print data = height_in; run;

/* question2 */
data group;
infile '/home/u51524567/PSTAT 130 2021 summer/week4/group.txt';
input ID $ group $;
run;
proc sort data = height_in;
by ID; run;
proc sort data = group;
by ID; run;

data temp1;
merge group height_in;
by ID;
run;

proc sort data = temp1;
by group;run;

proc means data = temp1 n mean std;
by group;
var height;
run;

/* question3  */

data height2;
infile '/home/u51524567/PSTAT 130 2021 summer/week4/height2.txt';
input ID $ height units$;
run;
data height2_in;
set height2;
if upcase(units)='CM' then height = height/2.54;
else if upcase(units) = 'IN' then height = height;
else delete;
drop units;
run;

/* question 4 */
data group2;
infile '/home/u51524567/PSTAT 130 2021 summer/week4/group2.txt';
input ID $ group $;
run;

proc sort data = height2_in;
by ID; run;
proc sort data = group2;
by ID; run;

data temp2;
merge group height_in (in=a);
by ID;
if a;
run;
data temp3;
set temp1 temp2;
run;

proc sort data = temp3;
by group;run;

proc means data = temp3 n mean std;
by group;
var height;
run;

/* question5 */
data temp1;
merge height_in group;
by id;
source=1;
run;
data temp2;
merge height2_in (in=a) group2;
by id;
if a;
source=2;
run;
data temp3;
set temp1 temp2;
run;
proc freq data=temp3;
table group*source;
run;






