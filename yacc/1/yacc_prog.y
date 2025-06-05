%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token A B

%%
start: S '\n' { printf("string is valid"); exit(0); }
    S: A S B | ;
%%

main()
{
    printf("enter a string:");
    yyparse();
}

yyerror()
{
    printf("string not accepted");
    exit(0);
}

int yywrap()
{
    return 1;
}

