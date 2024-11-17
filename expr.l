/*
UNIVERSIDADE DO OESTE DE SANTA CATARINA - CAMPUS JOAÇABA
COMPONENTE CURRICULAR: COMPILADORES E AUTÔMATOS
DISCENTES: HENRIQUE MIGUEL DE JESUS - 296287
           JOÃO PEDRO SCHLINDWEIN - 399958
AVALIAÇÃO A1-3
DATA: 17/11/2024

--------------------- SOLUCIONADOR DE EXPRESSÕES NUMÉRICAS ---------------------
*/
%{
    #include "expr.tab.h"
%}

%option noyywrap

%%

[0-9]+(\.[0-9]+)?     {
                          /* Reconhece números inteiros e decimais */
                          yylval.val = atof(yytext);   /* Converte o texto para double */
                          return NUMBER;               /* Retorna o token NUMBER */
                      }

[+\-]                 { return *yytext; }              /* Retorna '+' ou '-' */

[*/^]                 { return *yytext; }              /* Retorna '*', '/', ou '^' */

"("                   { return '('; }                  /* Retorna '(' */
")"                   { return ')'; }                  /* Retorna ')' */
"["                   { return '['; }                  /* Retorna '[' */
"]"                   { return ']'; }                  /* Retorna ']' */
"{"                   { return '{'; }                  /* Retorna '{' */
"}"                   { return '}'; }                  /* Retorna '}' */

[ \t]                 ;                                /* Ignora espaços e tabulações */

\n                    { return '\n'; }                 /* Retorna nova linha */

.                     { printf("Caractere invalido: %s\n", yytext); }

%%
