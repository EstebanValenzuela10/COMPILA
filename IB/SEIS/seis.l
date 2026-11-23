%{
#include <stdio.h>
%}

L    [a-zA-Z_]
D    [0-9]
ID   {L}({L}|{D})*
NUM  {D}+

%%
"if"|"else"|"while"|"int"   { printf("Palabra_Reservada\t%s\n", yytext); }
{ID}                        { printf("Identificador\t\t%s\n", yytext); }
{NUM}                       { printf("Entero\t\t\t%s\n", yytext); }
{D}[a-zA-Z0-9_.]*           { printf("No_Reconocido\t\t%s\n", yytext); }
"."{D}[a-zA-Z0-9_.]*        { printf("No_Reconocido\t\t%s\n", yytext); }
[ \t\r\n]+                  ;
.                           { printf("No_Reconocido\t\t%s\n", yytext); }
%%

int yywrap() { return 1; }

int main()
{
    printf("Token\t\t\tLexema\n");
    printf("-----\t\t\t------\n");
    yylex();
    return 0;
}