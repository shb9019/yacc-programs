%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    int yyerror();
%}

%token VAR NUM IF ELSE LE GE EQ NE OR AND TYPE
%right "="
%left OR AND
%left '<' '>' GE LE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%%

S   : ST {printf("Input Accepted!"); exit(0);}

ST  : IF '(' E ')' DEF EP

EP  : ELSE DEF
    | ELSE IF '(' E ')' EP
    |
    ;

DEF : '{' BODY '}'
    | E ';'
    | ST
    ;

BODY : BODY BODY
    | E ';'
    | ST
    |
    ;

E   : VAR '=' E
    | TYPE VAR
    | TYPE VAR '=' E
    | E '+' E
    | E '-' E
    | E '*' E
    | E '/' E
    | E '<' E
    | E '>' E
    | E LE E
    | E GE E
    | E EQ E
    | E NE E
    | E OR E
    | E AND E
    | E '+' '+'
    | E '-' '-'
    | VAR
    | NUM
    ;


%%

int main() {
    yyparse();
}

int yyerror() {
    printf("\nInvalid\n");
}
