
%{ 
   #include <stdio.h> 
   #include <stdlib.h>
   int yylex();
   int yyerror();
%}

%token   MACRO VAR COMMA LPAR RPAR CHAR

%%

S : E {
    printf("Input Accepted! \n");
    exit(0);
}

E : MACRO VAR LPAR ARGS RPAR MACROBODY
  | MACRO VAR LPAR RPAR MACROBODY
  | MACRO VAR MACROBODY
  ;

ARGS : VAR COMMA ARGS
     | VAR
     ;

MACROBODY : CHAR
          | VAR
          | VAR MACROBODY
          | LPAR MACROBODY
          | RPAR
          | RPAR MACROBODY
          | CHAR MACROBODY
          ;

%%

int main() {
    yyparse();
}

int yyerror() {
    printf("\nInvalid\n");
}