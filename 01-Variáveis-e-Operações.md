Introdução a programação em R
================
22/02/2022

## Introdução

R é uma linguagem de programação, muito usada em análises estatisticas e
representações gráficas nas mais diversas áreas de análise de dados.

## Por que usar R?

-   É um ótimo recurso para análise de dados, visualização de dados,
    ciência de dados e aprendizado de máquina.
-   Fornece muitas técnicas estatísticas (como testes estatísticos,
    classificação, agrupamento e redução de dados)
-   Fácil desenhar gráficos em R, como gráficos de pizza, histogramas,
    gráfico de caixa, gráfico de dispersão, etc.
-   Funciona em diferentes plataformas (Windows, Mac, Linux)
-   É de código aberto e gratuito
-   Tem um grande apoio da comunidade
-   Possui muitos pacotes (bibliotecas de funções) que podem ser usados
    para resolver diferentes problemas

# Atalhos úteis in R

ls() -&gt; lista todos os objetos do diretório de trabalho ctrl + enter
-&gt; Eexecuta a linha Esc -&gt; Interrompe a execução de uma linha
Shift + alt + up/down -&gt; Copia uma linha abaixo ou acima alt +
up/down -&gt; MOve uma linha para abaixo ou para acima Ctrl + L -&gt;
Limpa o console Ctrl + S -&gt; Salva o documento atual Ctrl + alt + W
-&gt; Fecha o documento atual Ctrl + Shift + M -&gt; (%&gt;%) operador
pipe Ctrl + Alt + I -&gt; Cria um chunk no R Markdown Ctrl + D -&gt;
Deleta uma linha Alt + Shit + K -&gt; Abre janela com todos os atalhos
disponíveis. Ctrl + Shift + c -&gt; Para comentar uma linha ou multiplas
linhas.

# Variáveis

## Regras para declaração de nomes das Variáveis em R:

-   Uma variável pode ter um nome curto (como xe) ou um nome mais
    descritivo (idade, nome\_carro, volume\_total).
-   O nome de uma variável deve começar com uma letra e pode ser uma
    combinação de letras, dígitos, ponto (.) e underline (\_).
-   Se começar com um ponto (.), Não pode ser seguido por um dígito.
-   O nome de uma variável não pode começar com um número ou sublinhado
    (\_)
-   Os nomes das variáveis diferenciam maiúsculas de minúsculas (idade,
    idade e IDADE são três variáveis diferentes)
-   Palavras reservadas não podem ser usadas como variáveis (TRUE,
    FALSE, NULL, if …)

## Declarando variáveis:

``` r
var1 = 'hello World'
var2 <- 'ola'
var3 <- 2 + 2 
var4 <- 5 + 5
var5 <- 'abc'
.var6<-'variavel Oculta'
```

## Imprimindo as variáveis:

``` r
print(var1)
```

    ## [1] "hello World"

``` r
print(var2)
```

    ## [1] "ola"

``` r
print(var3)
```

    ## [1] 4

``` r
print(var4)
```

    ## [1] 10

``` r
print(var5)
```

    ## [1] "abc"

``` r
print(.var6)
```

    ## [1] "variavel Oculta"

## Listando as variáveis declaradas no local de trabalho:

``` r
ls()
```

    ## [1] "var1" "var2" "var3" "var4" "var5"

# Removendo variáveis declaradas da memória:

``` r
rm(var5)
```

# Conferindo as variáveis:

``` r
ls()
```

    ## [1] "var1" "var2" "var3" "var4"

# procurando por variáveis com um padrão:

``` r
ls(pattern = 'var')
```

    ## [1] "var1" "var2" "var3" "var4"

# Listando variáveis ocultas:

``` r
ls(all.names = TRUE)
```

    ## [1] ".var6" "var1"  "var2"  "var3"  "var4"

# Concatenando variáveis ou textos:

``` r
paste(var2, "Como estas?")
```

    ## [1] "ola Como estas?"

``` r
paste(var1,", How's it going?", ", Good")
```

    ## [1] "hello World , How's it going? , Good"

# Operações matemáticas

R divide os operadores nos seguintes grupos:

Operadores lógicos e Operadores diversos

## Operadores aritméticos

``` r
var3 + var4        # adição
```

    ## [1] 14

``` r
var4 - var3        # subtração
```

    ## [1] 6

``` r
var3*2             # multiplicação
```

    ## [1] 8

``` r
var3/2             # divisão
```

    ## [1] 2

``` r
var3^2             # var3**2 também se refere a potência
```

    ## [1] 16

``` r
var3%%2            # Resto da divisão
```

    ## [1] 0

``` r
exp(var3)          # função exponencial = (2.718281828 ^var3)
```

    ## [1] 54.59815

## Operadores de atribuição

``` r
my_var <- 3
print(my_var)
```

    ## [1] 3

``` r
my_var <<- 3
print(my_var)
```

    ## [1] 3

``` r
3 -> my_var
print(my_var)
```

    ## [1] 3

``` r
3 ->> my_var
print(my_var)
```

    ## [1] 3

## Operadores de comparação

Verificando igualdade entre as operação

``` r
sqrt(9) == 3^1
```

    ## [1] TRUE

Verificando diferença entre as operação:

``` r
sqrt(9) != 3^1
```

    ## [1] FALSE

maior

``` r
2>3
```

    ## [1] FALSE

menor

``` r
3<1
```

    ## [1] FALSE

maior igual

``` r
9>=9
```

    ## [1] TRUE

menor igual

``` r
10<=5
```

    ## [1] FALSE

## Operação mais complexas:

Em operações mais complexas onde incluam várias operações é sempre bom
explicitar entre parenteses as operações a serem realizadas.

No exemplo abaixo, primeiro será realizado a soma, depois a subtração e
por fim a raíz quadrada’

``` r
sqrt(((var4+var4) - var3))
```

    ## [1] 4

## Operadores diversos de R

Operadores diversos são usados para manipular dados

Operador ————— Descrição ——————————————————————

& ——-&gt; Operador Logico AND. Retorna TRUE se ambos os elementos forem
TRUE. && ——-&gt; Compara apenas o primeiro elemento de cada vetor,
retornado TRUE se eles forem iguais. \| ——-&gt; Operador Logico Not.
Retorna TRUE se ambos os elementos forem False. \|\| ——-&gt; Compara
apenas o primeiro elemento de cada vetor, retornado TRUE se eles forem
diferentes. ! ——-&gt; Logico NOT - retorna FALSE se o statment é TRUE :
——-&gt; Cria uma serie de númeors em sequencia. ( Exemplo: x &lt;- 1:10)
%in% ——&gt; Procura por elementos de um vetor em outro. ( Exemplo: x
%in% y) %\*% ——&gt; Multiplicação de Matriz

## Referências:

<https://www.w3schools.com/r/default.asp>
<https://www.cs.upc.edu/~robert/teaching/estadistica/rprogramming.pdf>
