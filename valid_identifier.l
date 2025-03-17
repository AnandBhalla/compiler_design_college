%{
#include<stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z_0-9] {printf("%s is a valid identifier",yytext);}
[0-9]+[a-zA-Z_]*   {printf("%s is not a valid identifier",yytext);}
[^a-zA-Z_\n]+  {printf("%s is not a valid identifier",yytext);}
%%

int main()
{
    yylex();
}

int yywrap()
{
    return 1;
}