%{
#include <stdio.h>
%}

%%
[a-b]*b        { printf("Accepted: Ends with 'b'\n"); }
[a-b]*         { printf("Rejected: Does not end with 'b'\n"); }
.|\n           { return 0;}
%%

int main() {
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
