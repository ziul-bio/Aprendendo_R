################################################ Exerc�cios ######################################################################

# soma acumulativa
cumsum(1:5)

# Soma acumulativa reverse
cumsum(rev(1:5))

# Extrair 10 uma amostra de uma popula��o
sample(1:100, 10)

a <- sample(1:100, 10)
b <- sample(2:200, 10)

# Desvio padr�o
sd(a/b)

# m�dia de a + b
mean(a+b)

# Criando uma matriz aleat�ria com valores com uma distribui��o uniforme
aa <- matrix(runif(12, min = 10, max = 100), ncol = 4)

# Criando uma matriz aleat�ria com valores com uma distribui��o normal
bb <- matrix(rnorm(12), ncol = 4)

# Criando histogramas
hist(aa)
hist(bb, breaks = 10)

# scatterplots
plot(a, b, col='red')


# ------------------------------------ Explorando dados ------------------------------------

# Carregando a biblioteca built-in de R MASS
library(MASS)

# Visualizando o cabe�alho do dataset cars93
head(Cars93)  

# Visualizando o dataset Cars93 completo
View(Cars93)

# Selecionando apenas ps modelos de 4 cilindros
cyl_4 <- subset(Cars93, Cars93$Cylinders==4)

# Descobrindo o n�mero de modelos de carros com 4 cilindros
nrow(cyl_4)

# Organizando os dados de fabricante
fabricantes <- sort(cyl_4$Manufacturer)
head(fabricantes)

# salvando o arquivo cyl_4 em um arquivo csv
write.csv(cyl_4, 'four_cylinders.csv', row.names = F)

# Lendo o arquivo csv
read.csv('four_cylinders.csv')

# Analisando a densidade dos cavalos de pot�ncia.
# o gr�vico mostra que a maior parte se encntra entre 100 e 150
x = density(Cars93$Horsepower)
hist(Cars93$Horsepower, col='green', freq = F)
lines(x)



