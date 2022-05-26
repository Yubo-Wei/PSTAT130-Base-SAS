libname student "/home/u51524567/PSTAT 130 2021 summer/database";

libname class '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets';
data student.NewSalary;
set class.empdata;
newsalary = salary * 1.03;
run;
proc print data = student.NewSalary; run;


data CITY;
infile datalines dlm = ',';
input Year City $ Name1 $ Name2 $;
datalines;
18, San Diego, Rebecca, Marian
19, San Francisco, Kathy, Ginger
20, Long Beach, Scott, Sally
21, Las Vegas, Cynthia, MaryAnne
22, San Jose, Ethan, Frank
;
run;
proc print data = CITY NOOBS;
run;







