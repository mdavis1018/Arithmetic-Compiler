%{
#include "y.tab.h"
#include <math.h>

/************************************************************************
A lexical scanner to recognize numbers, symbols. 
When a NUMBER is found, its value is set is set to the
appropriate float.  When a NAME is found, an entry in symbol table is
created (with initial value 0.0) and the token's value is a pointer to
this entry. Spaces and tabs are ignored. Any other characters, including
a newline, are passed on as their own tokens. 
************************************************************************/

struct symtab* symlook(char *name); // Declare symlook here

%}

/* Definitions for character classes */
D     [0-9]
A     [a-zA-Z]
AD    [a-zA-Z0-9]

%%

"&"            return AND;
"|"            return OR;
"=="            return EQ;
">"             return GT;
"<"             return LT;

({D}+|({D}*\.{D}+)([eE][-+]?{D}+)?) { yylval.dval = atof(yytext); return NUMBER; }

{A}{AD}*                            { struct symtab *sp = symlook(yytext); yylval.symp = sp; return NAME; }

[ \t]                               { /* ignore whitespace */ }

\n                                  { return yytext[0]; }
.                                   { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
