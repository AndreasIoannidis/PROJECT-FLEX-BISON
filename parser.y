%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern FILE* yyin;
void yyerror(const char *s);
%}

%token PUBLIC CLASS VOID PRINTLN IDENTIFIER LBRACE RBRACE LPAREN RPAREN SEMICOLON STRING_LITERAL INT CHAR ASSIGNMENT DOUBLE BOOLEAN STRING PRIVATE NEW

%%

program : class_declaration | variable_declaration | object_creation | member_access
        ;

variable_declaration : data_type IDENTIFIER SEMICOLON
                     ;

class_declaration : PUBLIC CLASS IDENTIFIER LBRACE method_declaration  RBRACE
                   ;

method_declaration : PUBLIC VOID IDENTIFIER LPAREN RPAREN LBRACE statement RBRACE |
                    ;

statement : IDENTIFIER '.' IDENTIFIER LPAREN STRING_LITERAL RPAREN SEMICOLON
          | PRINTLN LPAREN STRING_LITERAL RPAREN SEMICOLON 
          ;

data_type : INT
          | CHAR
          | DOUBLE
          | STRING
          | BOOLEAN
          | modifier data_type
          ;

modifier : PUBLIC
         | PRIVATE
         | /* Κανένας modifier */
         ;

object_creation : IDENTIFIER IDENTIFIER ASSIGNMENT NEW IDENTIFIER LPAREN RPAREN SEMICOLON
                ;

member_access : IDENTIFIER '.' IDENTIFIER LPAREN RPAREN SEMICOLON
          | IDENTIFIER '.' IDENTIFIER SEMICOLON 
          ;


     
%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    yyin = input_file;

    yyparse();

    fclose(input_file);
    return 0;
}
