%{
#include<stdio.h>
int count=0;
%}
%%
[a-zA-Z0-9_]+ {count++;} 
.;
%%
int yywrap(){return 1;}
int main()
{
printf("Enter the string(ctrl D to end the input): \n");
yylex();
printf("words = %d\n",count);
return 0;
}
