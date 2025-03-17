%{
#include<stdio.h>
int single=0;
int multi=0;
%}
%%
\/\/.* {single++;}
\/\*([^*]|\*+[^*/])*\*\/ { multi++; }
.|\n {}
%%

int yywrap(){return 1;}
int main()
{
yylex();
printf("multi line comments: %d\n",multi);
printf("single line comments: %d\n",single);
return 0;
}
