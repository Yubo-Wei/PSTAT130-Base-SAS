/* question1 */
/* . How many variables and observations are in the resulting dataset? What is the first row in the */
/* dataset?  */

data d000;
N = 20;
do i = 1 to N;
x + 1;
if i > 17 then output;
end;
run;

/* There are 3 variables, 3 observations in the dataset. */
/* The first row is 20  18  18 */

/* question2 */
libname class '/home/u51524567/PSTAT 130 2021 summer/ClassDataSets';
data temp;
set class.gradegs;
keep Q1-Q8;
run;

proc means data = temp;
var Q1-Q8;
output out = AvQuiz(drop = _type_ _freq_) mean = Q1-Q8;
run;

proc print data = AvQuiz;
run;

proc transpose data = AvQuiz out = AvQuiz_transpose;
run;
proc print data = AvQuiz_transpose label;
label _Name_ = "Quiz"
Col1 = "Av_score_quiz";
run;

proc means data = AvQuiz_transpose;
var COL1;
run;

proc sgplot data = AvQuiz_transpose;
series x = _NAME_ y = Col1 / markers smoothconnect markerattrs=(symbol = diamond);
refline 4.423 /label = "Global Average" lineattrs=(color = blue);
xaxis label = 'Quiz Number';
yaxis label = 'Average';
run;


