%{
#include<stdio.h>
#include <stdlib.h>
int lines=0;
int tabs=0;
int spaces=0;
int chars=0;
int words=0;
// FILE *outFile;
// extern FILE *yyin;
%}

%%
"\n"       { lines++; chars++; }      
"\t"       { tabs++; chars++; }       
" "        { spaces++; chars++; }     
[a-zA-Z0-9]+ { words++; chars += yyleng; }  
.          { chars++; } 
%%

int yywrap(){
    return 1;
} 

int main(int argc,char *argv[]){
    extern FILE *yyin, *yyout;
    yyin=fopen("input.txt","r");
    yyout=fopen("output.txt","w");
    yylex();
    fprintf(yyout, "Lines: %d\nTabs: %d\nSpaces: %d\nCharacters: %d\nWords: %d\n",
            lines, tabs, spaces, chars, words);
    // fclose(inFile);
    // fclose(outFile);
    // FILE *inFile = fopen("input.txt", "r");
    // outFile = fopen("output.txt", "w");
    // yyin=inFile;
    return 0;
} 
