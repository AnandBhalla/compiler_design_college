%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%token A B

%%

input:  s '\n'   { printf("Valid string\n"); exit(0); }
      ;

s:      A s      { /* matches one or more A's */ }
      | B B B B  { /* matches exactly four B's */ }
      ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Invalid string: %s\n", s);
    exit(1);
}

int main() {
    printf("Enter a string: ");
    yyparse();
    return 0;
}

int yywrap(){
    return 1;
}