
# Projeto de Compiladores e Autômatos

**Universidade do Oeste de Santa Catarina - Campus Joaçaba**  
**Componente Curricular:** Compiladores e Autômatos  

## Informações Gerais

Este projeto foi desenvolvido como parte da **Avaliação A1-3** da disciplina **Compiladores e Autômatos**. Ele utiliza as ferramentas **Lex (Flex)** e **Yacc (Bison)** para demonstrar a construção de componentes básicos de um compilador.

**Data de Entrega:** 17/11/2024  
**Integrantes do Grupo:**
- **Henrique Miguel de Jesus** - Matrícula: 296287  
- **João Pedro Schlindwein** - Matrícula: 399958  

---

## Objetivos do Projeto

1. **Estudo de Compiladores e Autômatos:**
   - Implementação de um analisador léxico utilizando Lex (Flex).
   - Construção de um analisador sintático utilizando Yacc (Bison).
   - Exploração de conceitos de gramáticas e autômatos.

2. **Desenvolvimento Prático:**
   - Processar expressões matemáticas utilizando gramáticas definidas.
   - Analisar e avaliar entradas seguindo as regras definidas no projeto.

---

## Estrutura do Projeto

O projeto é composto por dois arquivos principais escritos em **C** com o uso de **Flex** e **Bison**:

### Arquivos:
- **expr.l**: Arquivo de entrada do **analisador léxico**. Define os tokens e suas correspondências na entrada.  
- **expr.y**: Arquivo de entrada do **analisador sintático**. Define as regras gramaticais e a lógica de processamento.

### Fluxo de Funcionamento:
1. O arquivo **expr.l** identifica os tokens na entrada.
2. O arquivo **expr.y** analisa a sequência de tokens de acordo com as regras gramaticais definidas.
3. Após a análise, o programa avalia ou processa as expressões matemáticas.

---

## Execução

### Pré-requisitos:
- **Flex**
- **Bison**
- **GCC**

### Instruções de Compilação:
1. Gere o analisador léxico:
   ```bash
   flex expr.l
   ```
2. Gere o analisador sintático:
   ```bash
   bison -d expr.y
   ```
3. Compile os arquivos gerados:
   ```bash
   gcc lex.yy.c expr.tab.c -o compilador
   ```

### Execução do Programa:
Após a compilação, execute o programa com:
```bash
./compilador
```

### Exemplo de Entrada:
```txt
3 + 5 * (2 - 1)
```

---

## Contribuição

- **Henrique Miguel de Jesus**: Implementação do analisador léxico.
- **João Pedro Schlindwein**: Implementação do analisador sintático e integração.

--- 

**Nota:** O projeto foi desenvolvido para fins acadêmicos e visa ilustrar os conceitos fundamentais de compiladores e autômatos.
