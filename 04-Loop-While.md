Loop while em R
================
Luiz Carlos Vieira
22/02/2022

# Introdução

Os loops podem executar um bloco de código, desde que uma condição
especificada seja verdadeira.

Os loops são úteis porque economizam tempo, reduzem os erros e tornam o
código mais legível.

R tem dois comandos de loop:

-   while loops
-   for loops

## While Loops

Com o loop while, podemos executar um conjunto de instruções, desde que
uma condição seja TRUE:

``` r
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5

No exemplo acima, o loop produz os números que variam de 1 a 5. Quando
atingir o valor 6, ele é interrompido porque 6 &lt; 6, avaliando a
condição como FALSE.

O loop while requer uma variáveis como ponto de partida ou de
comparação, neste exemplo, defini uma variável de indexação, “i”, que
defini como 1.

Nota: lembre-se de incrementar a variável “i” (i &lt;= i + 1), caso
contrátio o loop continuará infinitamente.

## Break

Com a instrução break, podemos parar o loop mesmo se a condição while
for TRUE:

``` r
i <- 0
while (i < 5){
  print(i)
  i <- i + 1
  if (i == 3) {
    break
  }
}
```

    ## [1] 0
    ## [1] 1
    ## [1] 2

No exemplo acima, o loop para em 2 porque escolhemos terminar o loop,
com a instrução break, quando “i” for igual a 3 (i == 3).

## Next

Com a instrução next, podemos pular uma iteração sem encerrar o loop.

``` r
i <- 0
while (i < 5){
  i <- i + 1
  if (i == 3){
    next
  }
  print(i)
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 4
    ## [1] 5

No exemplo assim, o loop pulou o valor 3, porque usei a instrução next,
para pular ou ignorar esse valor, se ele for encontrado.

## If … Else Combinado com While Loop

``` r
dado <- 1
while (dado <= 6){
  if (dado < 6){
    print('Esse não é o maior valor do dado')
  } else {
    print('Você conseguiu o maior valor')
  }
  dado <- dado + 1
}
```

    ## [1] "Esse não é o maior valor do dado"
    ## [1] "Esse não é o maior valor do dado"
    ## [1] "Esse não é o maior valor do dado"
    ## [1] "Esse não é o maior valor do dado"
    ## [1] "Esse não é o maior valor do dado"
    ## [1] "Você conseguiu o maior valor"

## Referências:

<https://www.w3schools.com/r/default.asp>
<https://www.cs.upc.edu/~robert/teaching/estadistica/rprogramming.pdf>
