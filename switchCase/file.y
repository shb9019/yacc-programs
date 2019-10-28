%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    int yyerror();
%}

%token VAR CHAR SWITCH CASE BREAK TYPE SEMICOLON COLON DEFAULT LPAR RPAR LBR RBR 

%%

S : SWITCHST {printf("Input accepted!"); exit(0);}

SWITCHST  : SWITCH LPAR VAR RPAR SWITCHDEF
          ;

SWITCHDEF : LBR SWITCHBODY RBR
          ;

SWITCHBODY : CASE VAR COLON SWITCHBLOCK SWITCHBODY
            | DEFAULT COLON SWITCHBLOCK
            |
            ;

SWITCHBLOCK : LBR BLOCK BREAK SEMICOLON RBR
    | LBR BLOCK RBR
    | ST BREAK SEMICOLON
    | ST
    ;

BLOCK : ST BLOCK
      |
      ;

ST : CHAR ST 
   | VAR ST
   | LPAR ST
   | RPAR ST
   | SEMICOLON

%%

int main() {
    yyparse();
}

int yyerror() {
    printf("\nInvalid\n");
}
