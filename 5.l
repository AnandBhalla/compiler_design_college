%{
#include<stdio.h>
%}
%%
-[1-9]+[0-9]* |
[0-9]* {printf("%s is Integer\n",yytext);}
-?[0-9]*\.[0-9]+ {printf("Float\n");}
.* {printf("Invalid identifier\n");}
%%
int yywrap(){return 1;}
int main()
{
yylex();
return 0;
}
