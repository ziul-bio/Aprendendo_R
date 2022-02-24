Tipos de dados em R
================
Luiz Carlos Vieira
22/02/2022

## Introdução

As variáveis podem armazenar dados de diferentes tipos, e diferentes
tipos podem fazer coisas diferentes.

Em R, variáveis nãoo precisam ser declaradas como um tipo específico, e
podem até mesmo mudar de tipo após terem sido definidas.

# Principais tipos de dados:

numeral (double) ——&gt; (10,5, 55, 787)  
numeral (inteiro) —–&gt; (1L, 55L, 100L, onde a letra “L” declara isso
como um inteiro)  
complexo —————&gt; (9 + 3i, onde “i” ? a parte imagin?ria)  
caracter (string) ——&gt; (“k”, “R é top”, “FALSE”, “11,5”)  
lógico (ou booleano) —&gt; (VERDADEIRO ou FALSO)

Podemos usar a função class() para verificar o tipo de dados de uma
variável:

# Tipos de dados

## Numeral

são os mais comuns e apresentam um valor decimal

``` r
x <- 10.5
class(x)
```

    ## [1] "numeric"

``` r
typeof(x)
```

    ## [1] "double"

## Inteiro

é um número sem decimal. Para se certificar que o número não ser
convertido em numeral declare inteiro com o L

``` r
x <- 1000L
class(x)
```

    ## [1] "integer"

``` r
typeof(x)
```

    ## [1] "integer"

## Complexo

são escritos seguidos pela letra i, de imaginário

``` r
x <- 9i + 3
class(x)
```

    ## [1] "complex"

``` r
typeof(x)
```

    ## [1] "complex"

## Character/string

``` r
x <- "R é uma linguagem de programação"
class(x)
```

    ## [1] "character"

``` r
typeof(x)
```

    ## [1] "character"

## Lógico/boolean

``` r
x <- TRUE
class(x)
```

    ## [1] "logical"

``` r
typeof(x)
```

    ## [1] "logical"

## Caracter ou string:

string podem ser definidas com aspas simples ou duplos

``` r
print(a<- "hello") 
```

    ## [1] "hello"

``` r
print(b <- 'world')
```

    ## [1] "world"

# Concatenando strings

``` r
paste(a, b) 
```

    ## [1] "hello world"

# Textos são strings multiplas:

Defininfo a string

``` r
txt <- "textos são multiplas strings e possuim os mesmos atributos que strings simples"
```

Diferentes formas de imprimir

``` r
# imprime o texto como esta sendo visualizado no script.
print(txt)
```

    ## [1] "textos são multiplas strings e possuim os mesmos atributos que strings simples"

``` r
# retorna o número de caracteres presentes na string.
nchar(txt)  
```

    ## [1] 78

``` r
# procura por padrões ou string e retorna True ou False
grepl('str', txt) 
```

    ## [1] TRUE

``` r
# Upper case
toupper((txt)) 
```

    ## [1] "TEXTOS SÃO MULTIPLAS STRINGS E POSSUIM OS MESMOS ATRIBUTOS QUE STRINGS SIMPLES"

``` r
# número de caracteres
nchar((txt)) 
```

    ## [1] 78

``` r
# Substring
substring(txt, 30,60) 
```

    ## [1] "e possuim os mesmos atributos q"

``` r
# dividir a string quando encontrar um 'm'
strsplit(txt, 'm')   
```

    ## [[1]]
    ## [1] "textos são "                 "ultiplas strings e possui"  
    ## [3] " os "                        "es"                         
    ## [5] "os atributos que strings si" "ples"

Defininfo uma variável em text

``` r
spaceCharacter <- "Dentro de textos podemos querer escrever \"palavras chaves\" dentro de aspas,
com isso o contrabarra antes das aspas permitem que isso seja possível, sem que seja retornado um erro.
o \"contrabarra + aspas\" indicam que um caracter especial vem logo depois.\n \nE o contrabarra n, imprime o texto em uma nova linha."
```

# Uso da função cat()

Permite que a impressão saia com o formato idealizado, caso contrário
será impresso, literalmente como se encontra no script.

``` r
cat(spaceCharacter)     
```

    ## Dentro de textos podemos querer escrever "palavras chaves" dentro de aspas,
    ## com isso o contrabarra antes das aspas permitem que isso seja possível, sem que seja retornado um erro.
    ## o "contrabarra + aspas" indicam que um caracter especial vem logo depois.
    ##  
    ## E o contrabarra n, imprime o texto em uma nova linha.

# Outros escape characters in R:

``` r
#   \n   ------> Nova Linha
#   \t   ------> Tab (escaçamento tabular)

txt2 <- ' Testando\t os espaçamenros\n e uma nova linha de texto'
cat(txt2)
```

    ##  Testando     os espaçamenros
    ##  e uma nova linha de texto

# Função substituir

``` r
# Substitui apenas a primeira ocorrencia
sub('aspas', 'ASPAS', spaceCharacter) 
```

    ## [1] "Dentro de textos podemos querer escrever \"palavras chaves\" dentro de ASPAS,\ncom isso o contrabarra antes das aspas permitem que isso seja possível, sem que seja retornado um erro.\no \"contrabarra + aspas\" indicam que um caracter especial vem logo depois.\n \nE o contrabarra n, imprime o texto em uma nova linha."

``` r
# Globalmente, Substitui todas as ocorrências
gsub('aspas', 'ASPAS', spaceCharacter) 
```

    ## [1] "Dentro de textos podemos querer escrever \"palavras chaves\" dentro de ASPAS,\ncom isso o contrabarra antes das ASPAS permitem que isso seja possível, sem que seja retornado um erro.\no \"contrabarra + ASPAS\" indicam que um caracter especial vem logo depois.\n \nE o contrabarra n, imprime o texto em uma nova linha."

# Formatação de strings

``` r
sprintf("%s atingiu %.2f porcento", "Luiz", 72.3)
```

    ## [1] "Luiz atingiu 72.30 porcento"

# Conversão do Tipo dado

Converter um tipo de dado para outro com as seguintes funções:

``` r
x <- 10.5    # num
y <- 5L      # int
z <- 131191

as.numeric (z)
```

    ## [1] 131191

``` r
as.integer (x)
```

    ## [1] 10

``` r
as.complex (x)
```

    ## [1] 10.5+0i

``` r
as.character(z)
```

    ## [1] "131191"

``` r
typeof(z)
```

    ## [1] "double"

## Referências:

<https://www.w3schools.com/r/default.asp>
<https://www.cs.upc.edu/~robert/teaching/estadistica/rprogramming.pdf>
