/* ---------- Declaraciones ---------- */
%{
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap

BINARIO   [01]+
PALABRA   [0-9A-Za-z_]+

/* ---------- Reglas ---------- */
%%
{BINARIO}   {
                if (yyleng > 64) {
                    printf("Aviso: '%s' tiene mas de 64 digitos, no cabe en un entero.\n", yytext);
                } else {
                    unsigned long long valor = strtoull(yytext, NULL, 2);
                    printf("Binario %s = %llu en decimal\n", yytext, valor);
                }
            }

{PALABRA}   { printf("ERROR: '%s' no es un numero binario valido\n", yytext); }

[ \t\r\n]+  { /* ignorar espacios y saltos de linea */ }

.           { printf("ERROR: caracter no reconocido '%s'\n", yytext); }
%%

/* ---------- Codigo (main) ---------- */
int main()
{
    yylex();
    return 0;
}
