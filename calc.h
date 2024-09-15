#ifndef CALC_H
#define CALC_H
/* SYMBOLTABLESIZE is the maximum number of symbols we can have */

#define SYMBOLTABLESIZE 20

/* An entry in the symbol table has a name, a pointer to a function,
   and a numeric value. */

struct symtab {
  char *name;
  double (*funcptr)();
  double value;
} symtab[SYMBOLTABLESIZE];

struct symtab *symlook();

void printHelp();
void yyerror();
#endif
