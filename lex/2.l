%{
#include<stdio.h>
%}
%%
[a-zA-Z_][a-zA-Z0-9_]* {printf("Valid Identifier\n");}
.* {printf("Invalid Identifier\n");}
%%
int yywrap(){return 1;}
int main()
{
printf("enter the identifier\n");
yylex();
return 0;
}
