Condicionais If e Else (Statements)
================
Luiz Carlos Vieira
22/02/2022

# Introdução

Os statements in R recebem como condicionais os operadores matem?ticos
como: == , != , &lt; , &gt; , &lt;= , &gt;= .

Tais operadores servem para julgar se uma determinada condição ou
statement deve ou não ser executada.

Exemplo de condicionais:

“if” (se) é executado se uma determinada condição for verdadeira, “else”
(se não) uma outra deve ser executada.

## If

O condicional if é usado para se avaliar uma condição. Se (if) esta
condição for verdadeira faça algo, se não, não faça nada.

``` r
a <- 10
b <- 20
c <- 30

if (a < b){
  print('A condiçãoes é verdadeira')
}
```

    ## [1] "A condiçãoes é verdadeira"

## else if

Gera uma outra condição. Se a primeira não for atendida ele procura pela
próxima e se está tbm não for verdadeira, segue-se para a próxima, e
assim por diante.

obs: é possível usar else if, tantas vezes quanto necessário.

``` r
if (a == b){
  print(paste(a, ' é igual à ', b))
}else if (a < b){
  print(paste(a, ' é menor que ', b))
}
```

    ## [1] "10  é menor que  20"

## Else

Esta condição é executada quando nenhuma das condições anteriores foram
atendidas.

``` r
if (a == b){
  print(paste(a, 'é igual é ', b))
}else if (a > b){
  print(paste(a, 'é maior que ', b))
}else {
  print(paste(a, 'é menor que ', b))
}
```

    ## [1] "10 é menor que  20"

## Condicionais Aninhados

O uso de condicionais aninhados garantem que cada condicional seja
testado, independente do anterior for verdadeiro ou não.

``` r
# Condicional aninhado:
if (a < b){
  print(paste(a, 'é menor que ', b))
  if (a < c) {
    print(paste(a, 'é menor que ', c))
    if (c > b){
      print(paste(c, 'é maior que ', b))
  }}} 
```

    ## [1] "10 é menor que  20"
    ## [1] "10 é menor que  30"
    ## [1] "30 é maior que  20"

## Condicional NãO aninhado

Perceba que, se a primeira condição for atendida, as demais condições
não são testadas, e a condição atendida é imprimida.

``` r
if (a < b){
  print(paste(a, 'é menor que ', b))
}else if (a < c){
  print(paste(a, 'é menor que ', c))
}else if (c > b){
  print(paste(c, 'é maior que ', b))
} else {
  print('Nenhuma das condições foram atendidas')
}
```

    ## [1] "10 é menor que  20"

# Operadores lógicos

``` r
if (a < b & c > a){
  print("Ambas as condições são verdadeiras")
} 
```

    ## [1] "Ambas as condições são verdadeiras"

``` r
if (a < b & c < a){
  print("Ambas as condições são verdadeiras")
} else{
  print("Nem todas as condições foram atendidas")
}
```

    ## [1] "Nem todas as condições foram atendidas"

``` r
if (a < b | a > c){
  print("Pelo menos uma das condições é verdadeira")
}
```

    ## [1] "Pelo menos uma das condições é verdadeira"

## Referências:

<https://www.w3schools.com/r/default.asp>
<https://www.cs.upc.edu/~robert/teaching/estadistica/rprogramming.pdf>
