%{
#include <stdio.h>
%}

%%
"+"             { printf("Operador Aritmetico (Suma)\t\t%s\n", yytext); }
"-"             { printf("Operador Aritmetico (Resta)\t\t%s\n", yytext); }
"*"             { printf("Operador Aritmetico (Multiplicacion)\t%s\n", yytext); }
"/"             { printf("Operador Aritmetico (Division)\t%s\n", yytext); }

"<="            { printf("Operador Relacional (Menor o igual)\t%s\n", yytext); }
">="            { printf("Operador Relacional (Mayor o igual)\t%s\n", yytext); }
"=="            { printf("Operador Relacional (Igualdad)\t%s\n", yytext); }
"!="            { printf("Operador Relacional (Desigualdad)\t%s\n", yytext); }
"<"             { printf("Operador Relacional (Menor que)\t\t%s\n", yytext); }
">"             { printf("Operador Relacional (Mayor que)\t\t%s\n", yytext); }

[ \t\r\n]+      ;
.               { printf("Otro / No reconocido\t\t\t%s\n", yytext); }
%%

int yywrap() { return 1; }

int main()
{
    printf("Tipo de Operador\t\t\tLexema\n");
    printf("----------------\t\t\t------\n");
    yylex();
    return 0;
}