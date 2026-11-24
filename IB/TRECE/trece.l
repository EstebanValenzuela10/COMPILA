/* ---------- Declaraciones ---------- */
%{
#include <stdio.h>

int elementos   = 0;   /* elementos validos en la lista actual */
int errores     = 0;   /* errores en la lista actual           */
int esperaElem  = 1;   /* 1 = toca un elemento, 0 = toca coma  */

void elemento(const char *tipo, const char *texto);
void fin_de_lista(void);
%}

%option noyywrap

LETRA     [a-zA-Z_]
DIGITO    [0-9]
ID        {LETRA}({LETRA}|{DIGITO})*
ENTERO    -?{DIGITO}+
MALFORMADO {DIGITO}+{LETRA}({LETRA}|{DIGITO})*

/* ---------- Reglas ---------- */
%%
{MALFORMADO}  {
                  printf("ERROR: token mal formado '%s' (empieza con digito pero no es entero)\n", yytext);
                  errores++;
                  esperaElem = 0;   /* ocupa el lugar de un elemento */
              }

{ID}          { elemento("identificador", yytext); }

{ENTERO}      { elemento("entero", yytext); }

","           {
                  if (esperaElem) {
                      printf("ERROR: coma sin elemento antes\n");
                      errores++;
                  }
                  esperaElem = 1;
              }

[ \t\r]+      { /* ignorar espacios */ }

\n            { fin_de_lista(); }

.             {
                  printf("ERROR: token no valido '%s'\n", yytext);
                  errores++;
              }
%%

/* ---------- Subrutinas del usuario ---------- */
void elemento(const char *tipo, const char *texto)
{
    if (!esperaElem) {
        printf("ERROR: falta una coma antes de '%s'\n", texto);
        errores++;
    } else {
        printf("  Elemento %d: %s (%s)\n", elementos + 1, texto, tipo);
        elementos++;
    }
    esperaElem = 0;
}

void fin_de_lista(void)
{
    if (esperaElem && (elementos > 0 || errores > 0)) {
        printf("ERROR: la lista termina en coma\n");
        errores++;
    }
    if (elementos > 0 || errores > 0) {
        printf("=> Lista con %d elemento(s) valido(s) y %d error(es)\n\n",
               elementos, errores);
    }
    elementos = 0; errores = 0; esperaElem = 1;   /* reiniciar */
}

int main()
{
    yylex();
    return 0;
}
