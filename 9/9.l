%{
#include<stdio.h>
FILE *fp_in,*fp_out;
%}
%%
^[9][0-9]{9}$ {fprintf(fp_out,"valid phone number %s\n",yytext);}
.* {fprintf(fp_out,"invalid phone number %s\n",yytext);}
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
fclose(fp_in);
fclose(fp_out);
printf("processing complete,check the output file!\n");
return 0;
}
