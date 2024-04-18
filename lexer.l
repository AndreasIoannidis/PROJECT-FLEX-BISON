%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%

"public"        {printf("%s",yytext); return PUBLIC; }
"private"        {printf("%s",yytext); return PRIVATE; }
"new"             {printf("%s",yytext); return NEW; }
"class"         {printf("%s",yytext); return CLASS; }
"void"          {printf("%s",yytext); return VOID; }
"int"          {printf("%s",yytext); return INT; }
"char"          {printf("%s",yytext); return CHAR; }
"double"          {printf("%s",yytext); return DOUBLE; }
"boolean"          {printf("%s",yytext); return BOOLEAN; }
"String"          {printf("%s",yytext); return STRING; }
"out.println"   {printf("%s",yytext); return PRINTLN; }
[a-zA-Z_][a-zA-Z0-9_]*   {printf("%s",yytext); return IDENTIFIER; }
"{"             {printf("%s",yytext); return LBRACE; }
"}"             {printf("%s",yytext); return RBRACE; }
"("             {printf("%s",yytext); return LPAREN; }
")"             {printf("%s",yytext); return RPAREN; }
";"             {printf("%s",yytext); return SEMICOLON; }
"="             {printf("%s",yytext); return ASSIGNMENT; }
\"[^\"\n]*\"    {printf("%s",yytext); return STRING_LITERAL; }
.               {printf("%s",yytext); /* Ignore any other characters */ }

%%

int yywrap() {
    return 1;
}
