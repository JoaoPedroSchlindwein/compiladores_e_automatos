%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>       /* Necessário para pow() */

    int yylex(void);
    void yyerror(const char *s);
%}

%union {
    double val;             /* Define um tipo de dado para valores numéricos */
}

%token <val> NUMBER

%left '+' '-'
%left '*' '/'
%right '^'                /* Potência com associatividade à direita */
%right UMINUS             /* Operador unário menos */

%type <val> expr          /* As expressões retornam double */

%start calculation        /* Define a regra inicial */

%%

calculation:
    /* vazio */
    | calculation line
    ;

line:
    '\n'                   /* Ignora linhas vazias */
    | expr '\n'            { printf("Resultado: %g\n", $1); }
    ;

expr:
    NUMBER                 { $$ = $1; }
    | expr '+' expr        { $$ = $1 + $3; }
    | expr '-' expr        { $$ = $1 - $3; }
    | expr '*' expr        { $$ = $1 * $3; }
    | expr '/' expr        {
                               if ($3 == 0) {
                                   yyerror("Divisao por zero!");
                                   exit(EXIT_FAILURE);
                               } else {
                                   $$ = $1 / $3;
                               }
                           }
    | expr '^' expr        { $$ = pow($1, $3); }
    | '(' expr ')'         { $$ = $2; }
    | '[' expr ']'         { $$ = $2; }
    | '{' expr '}'         { $$ = $2; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}

int main(void) {
    printf("Digite uma expressao matematica:\n");
    yyparse();
    return 0;
}
