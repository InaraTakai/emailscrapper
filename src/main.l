
%{
#include <stdio.h>
#include <string.h>
unsigned long int i;
%}

ALFANUMERICO [(a-zA-Z)(0-9)]
CARACTERES [(\-)(.)(_)]
EMAIL {ALFANUMERICO}+({CARACTERES}*{ALFANUMERICO})*[@]{ALFANUMERICO}+({CARACTERES}*{ALFANUMERICO})*

%%

{EMAIL}+ { printf("%s\n", yytext); }
{EMAIL}+[.] { for (i=0; i<(strlen(yytext)-1); i++)
  {
    printf("%c", yytext[i]);
  }printf("\n"); }

[[:space:]]+ ;
[[:^space:]]+ ;

%%

int main() {
  yylex();
  return 0;
}
