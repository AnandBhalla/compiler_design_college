%{
#include <stdio.h>
int space_count = 0;
FILE *input_file, *output_file;
%}

%%
[ \t\n]+ { 
    space_count += yyleng; 
    fprintf(output_file, " ");
}
.    { fprintf(output_file, "%s", yytext); }
%%

int main() {
    input_file = fopen("input.txt", "r");
    yyin = input_file; 
    output_file = fopen("output.txt", "w");
    yylex();
    fprintf(output_file, "\nTotal whitespace characters: %d\n", space_count);
    fclose(input_file);
    fclose(output_file);
    return 0;
}

int yywrap() {
    return 1;
}
