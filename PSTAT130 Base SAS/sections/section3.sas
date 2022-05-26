data work.insure1;
set '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets/insure.sas7bdat'(keep =  Name Policy Company PctInsured BalanceDue);
run;

data work.insure2(keep =  ID Name Company PctInsured Total);
set '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets/insure.sas7bdat';
run;

data work.insure3;
set '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets/insure.sas7bdat'(keep =  Name Policy Company PctInsured BalanceDue);
keep Name BalanceDue;
/* title 'Insured Information'; */
run;
proc print data = work.insure3;
title 'Insured Information';
run;



/* 2 */

data readin;
input name $ Section $ Score;
datalines;
Tom A 84
Raj A 80
Ram B 71
Atul . 77
Priya . 45
Sandy A 67
Sam A 57
David B 39
Wolf B 34
Rahul . 95
Sahul C 84
Lahul C 44
;
run;
proc print data = readin;
where Section = 'A' | Section = 'B';
run;

proc print data = readin;
where Section ~= 'A' & Section ~= 'B' & Section ~= 'C';
run;

proc print data = readin;
where Name ='S';
run;


/* 3 */

data world;
set '/home/u51524567/PSTAT 130 2021 summer/week2/world.sas7bdat';
run;


proc contents data = world;
run;
 
proc print data = world;
run;


proc print data = world Label;
label country = 'Country Name'
code= 'Continent Code'
gdp= 'Gross Domestic Product'
pci= 'Per Capita Income'
lit_rate= 'Literacy Rate (%)'
mil_spend= 'Amount of Military Spending'
physicians= 'Number of Physicians per 100000 population'
UNdate= 'Date the country joined the United Nations' 
;
run;

data world2;
set '/home/u51524567/PSTAT 130 2021 summer/week2/world.sas7bdat';
label country = 'Country Name'
code= 'Continent Code'
gdp= 'Gross Domestic Product'
pci= 'Per Capita Income'
lit_rate= 'Literacy Rate (%)'
mil_spend= 'Amount of Military Spending'
physicians= 'Number of Physicians per 100000 population'
UNdate= 'Date the country joined the United Nations' 
;
run;
proc print data = world2 label;
run;

proc contents data = world2;
run;



