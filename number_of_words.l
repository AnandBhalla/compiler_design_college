%{ 
#include<stdio.h> 
#include<string.h> 
int i = 0; 
%} 
%% 
([a-zA-Z0-9])*    {i++;}  
.   ;
%% 
  
int yywrap(void){} 
  
int main() 
{    
    yylex(); 
    printf("%d\n", i);
    return 0; 
} 