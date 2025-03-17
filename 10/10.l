%{
#include<stdio.h>
#include<string.h>
FILE *fp_in, *fp_out;
%}
%%
^[a-zA-Z_][a-zA-Z0-9_]*$ {fprintf(fp_out, "%s : Valid Identifier\n", yytext);}
.* { fprintf(fp_out, "%s : Invalid Identifier\n", yytext); }
%%
int yywrap() { return 1; }
int main() {
char ip_file[50], op_file[50];
printf("Enter input filename: ");
scanf("%s", ip_file);
printf("Enter output filename: ");
scanf("%s", op_file);
fp_in = fopen(ip_file, "r");
if (!fp_in) {
printf("Error opening input file!\n");
return 1;
}
fp_out = fopen(op_file, "w");
if (!fp_out) {
printf("Error opening output file!\n");
fclose(fp_in);
return 1;
}
yyin = fp_in; 
yylex();
fclose(fp_in);
fclose(fp_out);
printf("Processing complete, check the output file!\n");
return 0;
}
