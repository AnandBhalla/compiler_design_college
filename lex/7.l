%{
#include<stdio.h>
int lines=0,chars=0,tabs=0,spaces=0;
%}
%%
\n {lines++;}
\t {tabs++;}
" " {spaces++;}
[a-zA-Z] {chars++;}
. ;
%%
int yywrap(){return 1;}
int main()
{
yylex();
printf("lines: %d\n",lines);
printf("chars: %d\n",chars);
printf("tabs : %d\n",tabs);
printf("spaces: %d\n",spaces);
return 0;
}
