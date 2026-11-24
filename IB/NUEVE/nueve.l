%option noyywrap
%{
#include <stdio.h>
int cont[10] = {0};
%}

%%
[0-9]       { cont[yytext[0] - '0']++; }
.|\n        { /* ignorar todo lo demas */ }
%%

int main() {
    int i;
    yylex();
    printf("+--------+-------------+\n");
    printf("| Digito | Apariciones |\n");
    printf("+--------+-------------+\n");
    for (i = 0; i < 10; i++) {
        printf("|   %d    |      %-4d   |\n", i, cont[i]);
    }
    printf("+--------+-------------+\n");
    return 0;
}
