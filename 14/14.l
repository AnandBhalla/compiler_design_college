%{
#include <stdio.h>
#include <string.h>
FILE *out;
%}

TAG    \<[^>]+\>

%%
{TAG}  { fprintf(out, "%s\n", yytext); }
.|\n   ; 
%%

int main() {
    char input_filename[100], output_filename[100];
    printf("Enter input HTML file name: ");
    scanf("%s", input_filename);
    printf("Enter output file name: ");
    scanf("%s", output_filename);
    FILE *in = fopen(input_filename, "r");
    out = fopen(output_filename, "w");
    yyin = in;
    yylex();
    fclose(in);
    fclose(out);
    return 0;
}

int yywrap() {
    return 1;
}
