/* Exercise 1 */
data work.airports;
   infile '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets/airports.dat';
   input @ 1 Code $3.
         @ 4 City $50.
         @54 Country $15.;
run;
Proc print data=work.airports label;
	label code = 'Airport Code';
run;


proc print data=work.airports;
	var city;
run;

proc print data=work.airports;
	var city country;
run;

/* with vaiable labels */
Proc print data=work.airports label;
	label code = 'Airport Code';
run;


/* with noobs */
Proc print data=work.airports noobs label;
	label code = 'Airport Code';
run;

/* Exercise 2 */
data test;
input x y z;
cards;
1 2 4
3 4 7
5 80 3
6 20 2
9 30 1
;
run;

proc print data = test;
run;




