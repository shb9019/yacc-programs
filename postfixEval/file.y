
%{ 
   #include <stdio.h> 
   #include <stdlib.h>
   int yylex();
   int yyerror();
%}

%token   NUM
%left    '+' '-'
%left    '*' '/'

%%

S : E {
    printf("Result = %d\n", $$);
    return 0;
}

E : E E '+' { $$ = $1 + $2; }
  | E E '-' { $$ = $1 - $2; }
  | E E '*' { $$ = $1 * $2; }
  | E E '/' { $$ = $1 / $2; }
  | NUM { $$ = $1; }

%%

int main() {
    printf("Enter the expression\n");
    yyparse();
}

int yyerror() {
    printf("\nExpression is invalid\n");
}