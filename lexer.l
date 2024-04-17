%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%

"public"        {printf("%s",yytext); return PUBLIC; }
"class"         {printf("%s",yytext); return CLASS; }
"void"          {printf("%s",yytext); return VOID; }
"out.println"   {printf("%s",yytext); return PRINTLN; }
[a-zA-Z]+       {printf("%s",yytext); return IDENTIFIER; }
"{"             {printf("%s",yytext); return LBRACE; }
"}"             {printf("%s",yytext); return RBRACE; }
"("             {printf("%s",yytext); return LPAREN; }
")"             {printf("%s",yytext); return RPAREN; }
";"             {printf("%s",yytext); return SEMICOLON; }
\"[^\"\n]*\"    {printf("%s",yytext); return STRING_LITERAL; }
.               {printf("%s",yytext); /* Ignore any other characters */ }

%%

int yywrap() {
    return 1;
}