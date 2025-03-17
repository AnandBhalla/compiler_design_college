%{
#include<stdio.h>
%}
%%
^-?[0-9]+$ {printf("Integer\n");}
^-?[0-9]+\.[0-9]+$ {printf("Float\n");}
.* {printf("Invalid identifier\n");}
%%
int yywrap(){return 1;}
int main()
{
yylex();
return 0;
}
