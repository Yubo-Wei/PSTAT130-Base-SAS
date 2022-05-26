

data olympics;
infile datalines;
input hostcity $ year country $;
datalines;
Rio 2016 Brazil
London 2012 England
Beijing 2008 China
Athens 2004 Greece
Sydney 2000 Australia
;
run;

proc print data = olympics noobs;
title  "Olympic Information";
footnote "Confidential";
run;

data band;
infile '/home/u51524567/PSTAT 130 2021 summer/week2/bands.csv' dlm = ',' DSD MISSOVER;
input band_name: $30. Date: MMDDYY10. eight_pm nine_pm ten_pm eleven_pm;
format Date MMDDYY10.
run;

proc print data = band;
run;







