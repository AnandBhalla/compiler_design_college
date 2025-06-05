%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token A B

%%

input:s '\n' {printf("valid string"); exit(0);}
s:A s1 B|B
s1: ;|A s1 
;

%%

main(){
    printf("enter string:");
    yyparse();
}

yyerror(){
    printf("not valid");
    exit(0);
}

int yywrap(){
    return 1;
}