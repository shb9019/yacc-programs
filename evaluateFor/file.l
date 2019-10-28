%{
    #include "y.tab.h"
    extern int yylval;
%}

DIGIT [0-9]+
ALPHA [A-Za-z]+

%%

[\t \n] 
for     return FOR;
int return TYPE;
float return TYPE;
double return TYPE;
char return TYPE;
{DIGIT}+  return NUM;
{ALPHA}({ALPHA}|{DIGIT})* return VAR;
"<=" return LE;
">=" return GE;
"==" return EQ;
"!=" return NE;
"||" return OR;
"&&" return AND;
. return yytext[0];

%%
