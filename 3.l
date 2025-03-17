%{
#include<stdio.h>
%}
%%
^[9][0-9]{9}$ {printf("valid phone number\n");}
.* {printf("invalid phone number\n");}
%%
int yywrap(){return 1;}
int main()
{
yylex();
return 0;
}
