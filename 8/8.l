%{
#include<stdio.h>
int lines=0,tabs=0,chars=0,spaces=0,words=0;
FILE *fp_in,*fp_out;
%}
%%
\n {lines++;}
\t {tabs++;}
" " {spaces++;}
[a-zA-Z0-9]+ {words++; chars+=yyleng;}
. {chars++;}
%%
int yywrap(){return 1;}
int main()
{
char ip_file[50],op_file[50];
printf("enter input filename: ");
scanf("%s",ip_file);
printf("enter output filename: ");
scanf("%s",op_file);
fp_in=fopen(ip_file,"r");
if(!fp_in){
printf("error opening input file\n");
return 1;
}
fp_out=fopen(op_file,"w");
if(!fp_out)
{
printf("error opening output file!\n");
fclose(fp_in);
return 1;
}
yyin=fp_in;
yylex();
fprintf(fp_out,"Lines : %d\n", lines+1);
fprintf(fp_out,"Words : %d\n", words);
fprintf(fp_out,"Chars : %d\n", chars);
fprintf(fp_out,"Tabs : %d\n", tabs);
fprintf(fp_out,"Spaces : %d\n", spaces);
fclose(fp_in);
fclose(fp_out);
printf("processing complete,check the output file!\n");
return 0;
}
