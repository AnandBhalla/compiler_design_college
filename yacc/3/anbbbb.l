%{
    #include "yacc_prog.tab.h"

%}

%%
a {return A;}
b {return B;}
[\n]    {return '\n';}
%%