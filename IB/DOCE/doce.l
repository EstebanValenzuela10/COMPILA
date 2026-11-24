/* ---------- Declaraciones ---------- */
%{
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap

HEXA      0[xX][0-9a-fA-F]+
PALABRA   [0-9A-Za-z_]+

/* ---------- Reglas ---------- */
%%
{HEXA}      {
                if (yyleng - 2 > 16) {
                    printf("Aviso: '%s' excede los 16 digitos hexadecimales.\n", yytext);
                } else {
                    /* yytext+2 salta el prefijo "0x" */
                    unsigned long long valor = strtoull(yytext + 2, NULL, 16);
                    printf("Hexadecimal %s = %llu en decimal\n", yytext, valor);
                }
            }

{PALABRA}   { printf("ERROR: '%s' no es un hexadecimal valido (use 0x...)\n", yytext); }

[ \t\r\n]+  { /* ignorar espacios y saltos de linea */ }

.           { printf("ERROR: caracter no reconocido '%s'\n", yytext); }
%%

/* ---------- Codigo (main) ---------- */
int main()
{
    yylex();
    return 0;
}
