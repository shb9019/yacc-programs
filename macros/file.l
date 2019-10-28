%{
    #include "y.tab.h"
    extern int yylval;
%}

DIGIT [0-9]
ALPHA [A-Za-z]

%%

[\t \n] 
#define return MACRO;
({ALPHA}|{DIGIT})+ return VAR;
\( return LPAR;
\) return RPAR;
, return COMMA;
. return CHAR;

%%