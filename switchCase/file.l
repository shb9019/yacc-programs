%{
    #include "y.tab.h"
    extern int yylval;
%}

DIGIT [0-9]
ALPHA [A-Za-z]

%%

[\t \n] 
switch return SWITCH;
case return CASE;
break return BREAK;
default return DEFAULT;
({ALPHA}|{DIGIT})+ return VAR;
; return SEMICOLON;
: return COLON;
\( return LPAR;
\) return RPAR;
\{ return LBR;
\} return RBR; 
. return CHAR;

%%