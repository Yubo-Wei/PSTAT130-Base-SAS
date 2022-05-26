Data _null_;
/* get today's date */
today=today();
/* how to create a date */
ex1 = mdy(6,26,2020);
/* date function: YEAR(),MONTH(), WEEKDAY() */ 
dt1 ='26Jun20'd;
year = year(dt1);
month = month(dt1);
weekday = weekday(dt1);
put today date9. ;
put ex1 date9.;
put dt1 year month weekday;
/* dt1 is stored as a numeric value */
year1 = year(ex1); month1 = month(ex1); put year1= ' ' month1= ;
run; 

/* functions in this sas program: */
/* _today_: get today's date */
/* _mdy_: create a date with the month, day, and year */
/* define a variable as a string:'20May29'd, d is used to mark date value. */
/* _year_: extract year value */
/* _month_: extract month value */
/* _weekday_:extract weekday value */
/*  */
