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
">"             {printf("%s",yytext); return GREATER; }
"<"             {printf("%s",yytext); return LESS; }
">="             {printf("%s",yytext); return GTEQ; }
"<="             {printf("%s",yytext); return LTEQ; }
"=="             {printf("%s",yytext); return EQUAL; }
"!="             {printf("%s",yytext); return NOTEQUAL; }
"&&"             {printf("%s",yytext); return AND; }
"||"             {printf("%s",yytext); return OR; }
"!"                 {printf("%s",yytext); return NOT; }
"do"          {printf("%s",yytext); return DO; }
"while"          {printf("%s",yytext); return WHILE; }
"for"               {printf("%s",yytext); return FOR; }
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
[0-9]+          {printf("%s",yytext); return NUMBER; }
"+"             {printf("%s",yytext); return PLUS; }
"-"             {printf("%s",yytext); return MINUS; }
"*"             {printf("%s",yytext); return MULT; }
"/"             {printf("%s",yytext); return DIV; }
\"[^\"\n]*\"    {printf("%s",yytext); return STRING_LITERAL; }
.               {printf("%s",yytext); /* Ignore any other characters */ }

%%

int yywrap() {
    return 1;
}
