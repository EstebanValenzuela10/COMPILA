# COMPILA – Ejercicios en Lex

**Video:** https://drive.google.com/file/d/1lZClUhdOmHI5F2Dx_IoHPBkSA-TewAhW/view?usp=sharing

Trece ejercicios de análisis léxico con **Lex/Flex** para Compiladores. Cada carpeta de `IB/` trae el fuente `.l`, `lex.yy.c`, `a.out` y los archivos `entrada.txt` y `salida.txt`.

| N.º | Carpeta | Qué hace |
| --- | --- | --- |
| 1 | `UNO` | Programa mínimo: copia la entrada a la salida |
| 2 | `DOS` | Reemplaza `pare` e `inicio` por mensajes |
| 3 | `TRES` | Cuenta líneas y caracteres |
| 4 | `CUATRO` / `CUATRO-B` | Reconoce enteros e identificadores; la variante B añade reales |
| 5 | `CINCO` | Cuenta mayúsculas, minúsculas, dígitos, espacios y otros |
| 6 | `SEIS` | Clasifica palabras reservadas, identificadores y enteros |
| 7 | `SIETE` | Clasifica operadores aritméticos y relacionales |
| 8 | `OCHO` | Convierte mayúsculas a minúsculas |
| 9 | `NUEVE` | Cuenta las apariciones de cada dígito |
| 10 | `DIEZ` | Detecta correos electrónicos |
| 11 | `ONCE` | Convierte binarios a decimal y reporta errores |
| 12 | `DOCE` | Convierte hexadecimales (`0x...`) a decimal y reporta errores |
| 13 | `TRECE` | Valida listas separadas por comas e indica los errores |

## Uso

Requiere `lex` y `gcc`. Desde la carpeta de un ejercicio (ejemplo con `UNO`):

```bash
lex uno.l
gcc lex.yy.c -lfl
./a.out < entrada.txt > salida.txt
```
