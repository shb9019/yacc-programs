%{
    #include "y.tab.h"
    extern int yylval;
%}

DIGIT [0-9]

%%
{DIGIT} {yylval = atoi(yytext); return NUM;}
[\n \t] return 0;
.       return yytext[0];
%%
