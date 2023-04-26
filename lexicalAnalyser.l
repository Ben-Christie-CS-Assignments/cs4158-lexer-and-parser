%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tokens.h"
%}

%option noyywrap

%option yylineno

%%
"START"               { return START; }
"END"                 { return END; }
"MAIN"                { return MAIN; }
"MOVE"                { return MOVE; }
"TO"                  { return TO; }
"ADD"                 { return ADD; }
"INPUT"               { return INPUT; }
"PRINT"               { return PRINT; }

";"                   { return SEMICOLON; }

[0-9]+                { yylval.integer = atoi(yytext); return INTEGER; }
\"[^\"]*\"            { yylval.text = strdup(yytext + 1); yylval.text[strlen(yylval.text) - 1] = '\0'; return TEXT; }
"S"+[1-9][0-9]*" "+[a-zA-Z_][a-zA-Z0-9_-]*"."  { yylval.text = strdup(yytext); return DECLARATION; }
[a-zA-Z_][a-zA-Z0-9_-]* { yylval.text = strdup(yytext); return IDENTIFIER; }

[ \t\n]               {}
.                     { fprintf(stderr, "Invalid character '%c' on line %d\n", yytext[0], yylineno); }
%%