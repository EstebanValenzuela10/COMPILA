%option noyywrap
%{
#include <stdio.h>
%}

LETRA_NUM   [a-zA-Z0-9._%+-]
DOMINIO     [a-zA-Z0-9.-]

%%
{LETRA_NUM}+@{DOMINIO}+\.[a-zA-Z]{2,}   { printf("TOKEN_EMAIL: %s\n", yytext); }
.|\n                                    { /* ignorar todo lo demas */ }
%%

int main() {
    yylex();
    return 0;
}
