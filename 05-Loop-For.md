Loop for em R
================
Luiz Carlos Vieira
22/02/2022

# Introdução

Os loops podem executar um bloco de código, desde que uma condiçõo
especificada seja verdadeira.

Os loops são úteis porque economizam tempo, reduzem os erros e tornam o
código mais legível.

R tem dois comandos de loop: \* while loops \* for loops

Um for loop é usado para iterar sobre uma sequencia

``` r
for (x in 1:10) {
  print(x)
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9
    ## [1] 10

Um “loop for” funciona como um método iterador, sendo usado para se
executar um conjunto de instruções ou condições, uma para cada item ou
valor em um vector, array, lista, etc.

``` r
# imprimir cada item da lista
lista <- list("pão", "rosca", "pão-de-queijo", "manteiga", "leite", "iogurt")
for (x in lista) {
  print(x)
}
```

    ## [1] "pão"
    ## [1] "rosca"
    ## [1] "pão-de-queijo"
    ## [1] "manteiga"
    ## [1] "leite"
    ## [1] "iogurt"

# loop for com condicional

``` r
# imprimir apenas items da lista menores que 6 caracteres
for(x in lista){
  if (nchar(x) < 6){
    print(x)
  }
}
```

    ## [1] "pão"
    ## [1] "rosca"
    ## [1] "leite"

# for loop com break

``` r
# imprimir itens da lista até que o item "pão-de-queijo" seja encontrado.
for (x in lista){
  if (x == 'pão-de-queijo'){
    break
  }
  print(x)
}
```

    ## [1] "pão"
    ## [1] "rosca"

# for loop com next

``` r
for (x in lista){
  if (x == 'pão-de-queijo'){
    next
  } 
  print(x)
}
```

    ## [1] "pão"
    ## [1] "rosca"
    ## [1] "manteiga"
    ## [1] "leite"
    ## [1] "iogurt"

# If … Else Combinado com for Loop

``` r
dado <- 1 : 6

for (x in lista){
  if (nchar(x) < 6){
    print('Você adquiriu um item com número de caracteres menor que 6')
  } else {
    print('Você adquiriu um item com número de caracteres maior que 6')
  }
}
```

    ## [1] "Você adquiriu um item com número de caracteres menor que 6"
    ## [1] "Você adquiriu um item com número de caracteres menor que 6"
    ## [1] "Você adquiriu um item com número de caracteres maior que 6"
    ## [1] "Você adquiriu um item com número de caracteres maior que 6"
    ## [1] "Você adquiriu um item com número de caracteres menor que 6"
    ## [1] "Você adquiriu um item com número de caracteres maior que 6"

# Loop for Aninhado

``` r
tipo <- list('padaria', 'laticíneo')

for (x in lista[1:3]){
  for (j in tipo[1]){
    print(paste("Produto:", x, "---", "Tipo:", j))
  }
}
```

    ## [1] "Produto: pão --- Tipo: padaria"
    ## [1] "Produto: rosca --- Tipo: padaria"
    ## [1] "Produto: pão-de-queijo --- Tipo: padaria"

``` r
for (x in lista[4:6]){
  for (j in tipo[2]){
    print(paste("Produto:", x, "---", "Tipo:", j))
  }
}
```

    ## [1] "Produto: manteiga --- Tipo: laticíneo"
    ## [1] "Produto: leite --- Tipo: laticíneo"
    ## [1] "Produto: iogurt --- Tipo: laticíneo"

## Referências:

<https://www.w3schools.com/r/default.asp>
<https://www.cs.upc.edu/~robert/teaching/estadistica/rprogramming.pdf>
