Manipulando arquivos em R
================
Luiz Carlos Vieira
22/02/2022

# Introdução

# Escolhendo os arquivos

A funções read de R oferece vários métodos para leitura de arquivos no
formato csv, table, delim etc.

Para que a leitura do arquivo seja feita, é preciso que o arquivo esteja
na diretório atual de trabalho, ou ao menos que este seja especificdo.

# Descobrindo o diretório onde se estar trabalhando

``` r
getwd()
```

    ## [1] "C:/Users/luiz_/GoogleDrive/R/Aprendendo_R"

# Especificando o diretório de trabalho:

Isso evitará erros como: “file not found or not present in pwd”

``` r
setwd("C:/Users/luiz_/GoogleDrive/R/Aprendendo_R")
```

Ou vá em: Session –&gt; Set Working Directoty –&gt; To Source File
Location

# Lendo arquivos em R

Um dos formatos importantes para armazenar um arquivo é em um arquivo de
texto.

R fornece vários métodos que podem ser lidos em um arquivo de texto.

## read.delim()

Este método é usado para ler arquivos de “valores separados por
tabulação” (“.txt”).

Por padrão, o ponto (“.”) é usado como casas decimais.

Sintax:

``` r
#read.delim("arquivo", header = T, sep = "\t", dec = ".")
```

-   arquivo = o caminho para o arquivo que contém os dados a serem lidos
    em R.
-   header = um valor lógico. Se TRUE, read.delim() assume que seu
    arquivo tem uma linha de cabeçalho, ou seja, a linha 1 é o nome de
    cada coluna. Se não for esse o caso, altere o argumento header =
    FALSE.
-   sep: o caracterer separador de campo. “” é usado para um arquivo
    delimitado por tabulação.
-   dec: o caracterer usado no arquivo para casas decimais.

Exemplo

``` r
file <- read.delim("C:/Users/luiz_/GoogleDrive/Rna-Seq/2-DESeq2/Analysis_DESeq2_Annotation_CHO/coldata.txt",
                   header = T, sep = "\t")
file
```

    ##     sample_id condition
    ## 1 SRR10493810      day4
    ## 2 SRR10493811      day4
    ## 3 SRR10493818      day7
    ## 4 SRR10493819      day7

## file.choose()

Em R também é possível escolher um arquivo interativamente usando a
função .

``` r
# Com esta função, uma nova aba se abrirá, onde o arquivo deve ser escolhido

#myFile = read.table(file.choose(), header = T, sep = '\t', row.names=1)
```

## read\_tsv()

Este método também é usado para ler valores separados por tabulação (")
usando a ajuda do pacote readr.

## Importando a bibioteca readr

``` r
library(readr)

myData = read_tsv("C:/Users/luiz_/GoogleDrive/Rna-Seq/2-DESeq2/Analysis_DESeq2_Annotation_CHO/coldata.txt",
                  col_names = T)
```

    ## Rows: 4 Columns: 2
    ## -- Column specification --------------------------------------------------------
    ## Delimiter: "\t"
    ## chr (2): sample_id, condition
    ## 
    ## i Use `spec()` to retrieve the full column specification for this data.
    ## i Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
print(myData)
```

    ## # A tibble: 4 x 2
    ##   sample_id   condition
    ##   <chr>       <chr>    
    ## 1 SRR10493810 day4     
    ## 2 SRR10493811 day4     
    ## 3 SRR10493818 day7     
    ## 4 SRR10493819 day7

col\_names: TRUE, FALSE ou um vetor de caracteres especificando os nomes
das colunas. Se TRUE, a primeira linha da entrada será usada como os
nomes das colunas.

## acionar ajuda do R

``` r
?read_tsv
```

    ## starting httpd help server ... done

## read.table()

read.table () é uma função geral que pode ser usada para ler um arquivo
em formato de tabela. Os dados serão importados como um quadro de dados.

# Usando read.table()

``` r
myData2 = read.table("C:/Users/luiz_/GoogleDrive/Rna-Seq/2-DESeq2/Analysis_DESeq2_Annotation_CHO/coldata.txt",
                     sep="", header=TRUE, dec = '.')
print(myData2)
```

    ##     sample_id condition
    ## 1 SRR10493810      day4
    ## 2 SRR10493811      day4
    ## 3 SRR10493818      day7
    ## 4 SRR10493819      day7

# Lendo arquivos da web

``` r
df <- read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.txt", header = FALSE)
df
```

    ##   V1 V2 V3
    ## 1  1  6  a
    ## 2  2  7  b
    ## 3  3  8  c
    ## 4  4  9  d
    ## 5  5 10  e

## read.csv ()

read.csv() é usado para ler arquivos de “valores separados por vírgula”
(“.csv”). Neste também os dados serão importados como um dataFrame.

``` r
csv = read.csv("four_cylinders.csv", header = T, sep = ',') 

print(csv)
```

    ##     Manufacturer         Model    Type Min.Price Price Max.Price MPG.city
    ## 1          Acura       Integra   Small      12.9  15.9      18.8       25
    ## 2            BMW          535i Midsize      23.7  30.0      36.2       22
    ## 3          Buick       Century Midsize      14.2  15.7      17.3       22
    ## 4      Chevrolet      Cavalier Compact       8.5  13.4      18.3       25
    ## 5      Chevrolet       Corsica Compact      11.4  11.4      11.4       25
    ## 6      Chevrolet        Lumina Midsize      13.4  15.9      18.4       21
    ## 7       Chrysler       LeBaron Compact      14.5  15.8      17.1       23
    ## 8          Dodge          Colt   Small       7.9   9.2      10.6       29
    ## 9          Dodge        Shadow   Small       8.4  11.3      14.2       23
    ## 10         Dodge        Spirit Compact      11.9  13.3      14.7       22
    ## 11         Dodge       Dynasty Midsize      14.8  15.6      16.4       21
    ## 12         Eagle        Summit   Small       7.9  12.2      16.5       29
    ## 13          Ford       Festiva   Small       6.9   7.4       7.9       31
    ## 14          Ford        Escort   Small       8.4  10.1      11.9       23
    ## 15          Ford         Tempo Compact      10.4  11.3      12.2       22
    ## 16          Ford       Mustang  Sporty      10.8  15.9      21.0       22
    ## 17          Ford         Probe  Sporty      12.8  14.0      15.2       24
    ## 18           Geo         Storm  Sporty      11.5  12.5      13.5       30
    ## 19         Honda       Prelude  Sporty      17.0  19.8      22.7       24
    ## 20         Honda         Civic   Small       8.4  12.1      15.8       42
    ## 21         Honda        Accord Compact      13.8  17.5      21.2       24
    ## 22       Hyundai         Excel   Small       6.8   8.0       9.2       29
    ## 23       Hyundai       Elantra   Small       9.0  10.0      11.0       22
    ## 24       Hyundai        Scoupe  Sporty       9.1  10.0      11.0       26
    ## 25       Hyundai        Sonata Midsize      12.4  13.9      15.3       20
    ## 26         Mazda           323   Small       7.4   8.3       9.1       29
    ## 27         Mazda       Protege   Small      10.9  11.6      12.3       28
    ## 28         Mazda           626 Compact      14.3  16.5      18.7       26
    ## 29 Mercedes-Benz          190E Compact      29.0  31.9      34.9       20
    ## 30       Mercury         Capri  Sporty      13.3  14.1      15.0       23
    ## 31    Mitsubishi        Mirage   Small       7.7  10.3      12.9       29
    ## 32        Nissan        Sentra   Small       8.7  11.8      14.9       29
    ## 33        Nissan        Altima Compact      13.0  15.7      18.3       24
    ## 34    Oldsmobile       Achieva Compact      13.0  13.5      14.0       24
    ## 35    Oldsmobile Cutlass_Ciera Midsize      14.2  16.3      18.4       23
    ## 36      Plymouth         Laser  Sporty      11.4  14.4      17.4       23
    ## 37       Pontiac        LeMans   Small       8.2   9.0       9.9       31
    ## 38       Pontiac       Sunbird Compact       9.4  11.1      12.8       23
    ## 39          Saab           900 Compact      20.3  28.7      37.1       20
    ## 40        Saturn            SL   Small       9.2  11.1      12.9       28
    ## 41        Subaru        Loyale   Small      10.5  10.9      11.3       25
    ## 42        Subaru        Legacy Compact      16.3  19.5      22.7       23
    ## 43        Toyota        Tercel   Small       7.8   9.8      11.8       32
    ## 44        Toyota        Celica  Sporty      14.2  18.4      22.6       25
    ## 45        Toyota         Camry Midsize      15.2  18.2      21.2       22
    ## 46        Toyota        Previa     Van      18.9  22.7      26.6       18
    ## 47    Volkswagen           Fox   Small       8.7   9.1       9.5       25
    ## 48    Volkswagen        Passat Compact      17.6  20.0      22.4       21
    ## 49         Volvo           240 Compact      21.8  22.7      23.5       21
    ##    MPG.highway            AirBags DriveTrain Cylinders EngineSize Horsepower
    ## 1           31               None      Front         4        1.8        140
    ## 2           30        Driver only       Rear         4        3.5        208
    ## 3           31        Driver only      Front         4        2.2        110
    ## 4           36               None      Front         4        2.2        110
    ## 5           34        Driver only      Front         4        2.2        110
    ## 6           29               None      Front         4        2.2        110
    ## 7           28 Driver & Passenger      Front         4        3.0        141
    ## 8           33               None      Front         4        1.5         92
    ## 9           29        Driver only      Front         4        2.2         93
    ## 10          27        Driver only      Front         4        2.5        100
    ## 11          27        Driver only      Front         4        2.5        100
    ## 12          33               None      Front         4        1.5         92
    ## 13          33               None      Front         4        1.3         63
    ## 14          30               None      Front         4        1.8        127
    ## 15          27               None      Front         4        2.3         96
    ## 16          29        Driver only       Rear         4        2.3        105
    ## 17          30        Driver only      Front         4        2.0        115
    ## 18          36        Driver only      Front         4        1.6         90
    ## 19          31 Driver & Passenger      Front         4        2.3        160
    ## 20          46        Driver only      Front         4        1.5        102
    ## 21          31 Driver & Passenger      Front         4        2.2        140
    ## 22          33               None      Front         4        1.5         81
    ## 23          29               None      Front         4        1.8        124
    ## 24          34               None      Front         4        1.5         92
    ## 25          27               None      Front         4        2.0        128
    ## 26          37               None      Front         4        1.6         82
    ## 27          36               None      Front         4        1.8        103
    ## 28          34        Driver only      Front         4        2.5        164
    ## 29          29        Driver only       Rear         4        2.3        130
    ## 30          26        Driver only      Front         4        1.6        100
    ## 31          33               None      Front         4        1.5         92
    ## 32          33        Driver only      Front         4        1.6        110
    ## 33          30        Driver only      Front         4        2.4        150
    ## 34          31               None      Front         4        2.3        155
    ## 35          31        Driver only      Front         4        2.2        110
    ## 36          30               None        4WD         4        1.8         92
    ## 37          41               None      Front         4        1.6         74
    ## 38          31               None      Front         4        2.0        110
    ## 39          26        Driver only      Front         4        2.1        140
    ## 40          38        Driver only      Front         4        1.9         85
    ## 41          30               None        4WD         4        1.8         90
    ## 42          30        Driver only        4WD         4        2.2        130
    ## 43          37        Driver only      Front         4        1.5         82
    ## 44          32        Driver only      Front         4        2.2        135
    ## 45          29        Driver only      Front         4        2.2        130
    ## 46          22        Driver only        4WD         4        2.4        138
    ## 47          33               None      Front         4        1.8         81
    ## 48          30               None      Front         4        2.0        134
    ## 49          28        Driver only       Rear         4        2.3        114
    ##     RPM Rev.per.mile Man.trans.avail Fuel.tank.capacity Passengers Length
    ## 1  6300         2890             Yes               13.2          5    177
    ## 2  5700         2545             Yes               21.1          4    186
    ## 3  5200         2565              No               16.4          6    189
    ## 4  5200         2380             Yes               15.2          5    182
    ## 5  5200         2665             Yes               15.6          5    184
    ## 6  5200         2595              No               16.5          6    198
    ## 7  5000         2090              No               16.0          6    183
    ## 8  6000         3285             Yes               13.2          5    174
    ## 9  4800         2595             Yes               14.0          5    172
    ## 10 4800         2535             Yes               16.0          6    181
    ## 11 4800         2465              No               16.0          6    192
    ## 12 6000         2505             Yes               13.2          5    174
    ## 13 5000         3150             Yes               10.0          4    141
    ## 14 6500         2410             Yes               13.2          5    171
    ## 15 4200         2805             Yes               15.9          5    177
    ## 16 4600         2285             Yes               15.4          4    180
    ## 17 5500         2340             Yes               15.5          4    179
    ## 18 5400         3250             Yes               12.4          4    164
    ## 19 5800         2855             Yes               15.9          4    175
    ## 20 5900         2650             Yes               11.9          4    173
    ## 21 5600         2610             Yes               17.0          4    185
    ## 22 5500         2710             Yes               11.9          5    168
    ## 23 6000         2745             Yes               13.7          5    172
    ## 24 5550         2540             Yes               11.9          4    166
    ## 25 6000         2335             Yes               17.2          5    184
    ## 26 5000         2370             Yes               13.2          4    164
    ## 27 5500         2220             Yes               14.5          5    172
    ## 28 5600         2505             Yes               15.5          5    184
    ## 29 5100         2425             Yes               14.5          5    175
    ## 30 5750         2475             Yes               11.1          4    166
    ## 31 6000         2505             Yes               13.2          5    172
    ## 32 6000         2435             Yes               13.2          5    170
    ## 33 5600         2130             Yes               15.9          5    181
    ## 34 6000         2380              No               15.2          5    188
    ## 35 5200         2565              No               16.5          5    190
    ## 36 5000         2360             Yes               15.9          4    173
    ## 37 5600         3130             Yes               13.2          4    177
    ## 38 5200         2665             Yes               15.2          5    181
    ## 39 6000         2910             Yes               18.0          5    184
    ## 40 5000         2145             Yes               12.8          5    176
    ## 41 5200         3375             Yes               15.9          5    175
    ## 42 5600         2330             Yes               15.9          5    179
    ## 43 5200         3505             Yes               11.9          5    162
    ## 44 5400         2405             Yes               15.9          4    174
    ## 45 5400         2340             Yes               18.5          5    188
    ## 46 5000         2515             Yes               19.8          7    187
    ## 47 5500         2550             Yes               12.4          4    163
    ## 48 5800         2685             Yes               18.5          5    180
    ## 49 5400         2215             Yes               15.8          5    190
    ##    Wheelbase Width Turn.circle Rear.seat.room Luggage.room Weight  Origin
    ## 1        102    68          37           26.5           11   2705 non-USA
    ## 2        109    69          39           27.0           13   3640 non-USA
    ## 3        105    69          41           28.0           16   2880     USA
    ## 4        101    66          38           25.0           13   2490     USA
    ## 5        103    68          39           26.0           14   2785     USA
    ## 6        108    71          40           28.5           16   3195     USA
    ## 7        104    68          41           30.5           14   3085     USA
    ## 8         98    66          32           26.5           11   2270     USA
    ## 9         97    67          38           26.5           13   2670     USA
    ## 10       104    68          39           30.5           14   2970     USA
    ## 11       105    69          42           30.5           16   3080     USA
    ## 12        98    66          36           26.5           11   2295     USA
    ## 13        90    63          33           26.0           12   1845     USA
    ## 14        98    67          36           28.0           12   2530     USA
    ## 15       100    68          39           27.5           13   2690     USA
    ## 16       101    68          40           24.0           12   2850     USA
    ## 17       103    70          38           23.0           18   2710     USA
    ## 18        97    67          37           24.5           11   2475 non-USA
    ## 19       100    70          39           23.5            8   2865 non-USA
    ## 20       103    67          36           28.0           12   2350 non-USA
    ## 21       107    67          41           28.0           14   3040 non-USA
    ## 22        94    63          35           26.0           11   2345 non-USA
    ## 23        98    66          36           28.0           12   2620 non-USA
    ## 24        94    64          34           23.5            9   2285 non-USA
    ## 25       104    69          41           31.0           14   2885 non-USA
    ## 26        97    66          34           27.0           16   2325 non-USA
    ## 27        98    66          36           26.5           13   2440 non-USA
    ## 28       103    69          40           29.5           14   2970 non-USA
    ## 29       105    67          34           26.0           12   2920 non-USA
    ## 30        95    65          36           19.0            6   2450     USA
    ## 31        98    67          36           26.0           11   2295 non-USA
    ## 32        96    66          33           26.0           12   2545 non-USA
    ## 33       103    67          40           28.5           14   3050 non-USA
    ## 34       103    67          39           28.0           14   2910     USA
    ## 35       105    70          42           28.0           16   2890     USA
    ## 36        97    67          39           24.5            8   2640     USA
    ## 37        99    66          35           25.5           17   2350     USA
    ## 38       101    66          39           25.0           13   2575     USA
    ## 39        99    67          37           26.5           14   2775 non-USA
    ## 40       102    68          40           26.5           12   2495     USA
    ## 41        97    65          35           27.5           15   2490 non-USA
    ## 42       102    67          37           27.0           14   3085 non-USA
    ## 43        94    65          36           24.0           11   2055 non-USA
    ## 44        99    69          39           23.0           13   2950 non-USA
    ## 45       103    70          38           28.5           15   3030 non-USA
    ## 46       113    71          41           35.0           NA   3785 non-USA
    ## 47        93    63          34           26.0           10   2240 non-USA
    ## 48       103    67          35           31.5           14   2985 non-USA
    ## 49       104    67          37           29.5           14   2985 non-USA
    ##                        Make
    ## 1             Acura Integra
    ## 2                  BMW 535i
    ## 3             Buick Century
    ## 4        Chevrolet Cavalier
    ## 5         Chevrolet Corsica
    ## 6          Chevrolet Lumina
    ## 7          Chrysler LeBaron
    ## 8                Dodge Colt
    ## 9              Dodge Shadow
    ## 10             Dodge Spirit
    ## 11            Dodge Dynasty
    ## 12             Eagle Summit
    ## 13             Ford Festiva
    ## 14              Ford Escort
    ## 15               Ford Tempo
    ## 16             Ford Mustang
    ## 17               Ford Probe
    ## 18                Geo Storm
    ## 19            Honda Prelude
    ## 20              Honda Civic
    ## 21             Honda Accord
    ## 22            Hyundai Excel
    ## 23          Hyundai Elantra
    ## 24           Hyundai Scoupe
    ## 25           Hyundai Sonata
    ## 26                Mazda 323
    ## 27            Mazda Protege
    ## 28                Mazda 626
    ## 29       Mercedes-Benz 190E
    ## 30            Mercury Capri
    ## 31        Mitsubishi Mirage
    ## 32            Nissan Sentra
    ## 33            Nissan Altima
    ## 34       Oldsmobile Achieva
    ## 35 Oldsmobile Cutlass_Ciera
    ## 36           Plymouth Laser
    ## 37           Pontiac LeMans
    ## 38          Pontiac Sunbird
    ## 39                 Saab 900
    ## 40                Saturn SL
    ## 41            Subaru Loyale
    ## 42            Subaru Legacy
    ## 43            Toyota Tercel
    ## 44            Toyota Celica
    ## 45             Toyota Camry
    ## 46            Toyota Previa
    ## 47           Volkswagen Fox
    ## 48        Volkswagen Passat
    ## 49                Volvo 240

## read.csv2()

é usado usado em países que usam uma vírgula “,” como ponto decimal e um
ponto e vírgula “;” como separadores de campo.

``` r
csv2 = read.csv2("four_cylinders.csv", header = T, sep = ',') 

print(csv2)
```

    ##     Manufacturer         Model    Type Min.Price Price Max.Price MPG.city
    ## 1          Acura       Integra   Small      12.9  15.9      18.8       25
    ## 2            BMW          535i Midsize      23.7    30      36.2       22
    ## 3          Buick       Century Midsize      14.2  15.7      17.3       22
    ## 4      Chevrolet      Cavalier Compact       8.5  13.4      18.3       25
    ## 5      Chevrolet       Corsica Compact      11.4  11.4      11.4       25
    ## 6      Chevrolet        Lumina Midsize      13.4  15.9      18.4       21
    ## 7       Chrysler       LeBaron Compact      14.5  15.8      17.1       23
    ## 8          Dodge          Colt   Small       7.9   9.2      10.6       29
    ## 9          Dodge        Shadow   Small       8.4  11.3      14.2       23
    ## 10         Dodge        Spirit Compact      11.9  13.3      14.7       22
    ## 11         Dodge       Dynasty Midsize      14.8  15.6      16.4       21
    ## 12         Eagle        Summit   Small       7.9  12.2      16.5       29
    ## 13          Ford       Festiva   Small       6.9   7.4       7.9       31
    ## 14          Ford        Escort   Small       8.4  10.1      11.9       23
    ## 15          Ford         Tempo Compact      10.4  11.3      12.2       22
    ## 16          Ford       Mustang  Sporty      10.8  15.9        21       22
    ## 17          Ford         Probe  Sporty      12.8    14      15.2       24
    ## 18           Geo         Storm  Sporty      11.5  12.5      13.5       30
    ## 19         Honda       Prelude  Sporty        17  19.8      22.7       24
    ## 20         Honda         Civic   Small       8.4  12.1      15.8       42
    ## 21         Honda        Accord Compact      13.8  17.5      21.2       24
    ## 22       Hyundai         Excel   Small       6.8     8       9.2       29
    ## 23       Hyundai       Elantra   Small         9    10        11       22
    ## 24       Hyundai        Scoupe  Sporty       9.1    10        11       26
    ## 25       Hyundai        Sonata Midsize      12.4  13.9      15.3       20
    ## 26         Mazda           323   Small       7.4   8.3       9.1       29
    ## 27         Mazda       Protege   Small      10.9  11.6      12.3       28
    ## 28         Mazda           626 Compact      14.3  16.5      18.7       26
    ## 29 Mercedes-Benz          190E Compact        29  31.9      34.9       20
    ## 30       Mercury         Capri  Sporty      13.3  14.1        15       23
    ## 31    Mitsubishi        Mirage   Small       7.7  10.3      12.9       29
    ## 32        Nissan        Sentra   Small       8.7  11.8      14.9       29
    ## 33        Nissan        Altima Compact        13  15.7      18.3       24
    ## 34    Oldsmobile       Achieva Compact        13  13.5        14       24
    ## 35    Oldsmobile Cutlass_Ciera Midsize      14.2  16.3      18.4       23
    ## 36      Plymouth         Laser  Sporty      11.4  14.4      17.4       23
    ## 37       Pontiac        LeMans   Small       8.2     9       9.9       31
    ## 38       Pontiac       Sunbird Compact       9.4  11.1      12.8       23
    ## 39          Saab           900 Compact      20.3  28.7      37.1       20
    ## 40        Saturn            SL   Small       9.2  11.1      12.9       28
    ## 41        Subaru        Loyale   Small      10.5  10.9      11.3       25
    ## 42        Subaru        Legacy Compact      16.3  19.5      22.7       23
    ## 43        Toyota        Tercel   Small       7.8   9.8      11.8       32
    ## 44        Toyota        Celica  Sporty      14.2  18.4      22.6       25
    ## 45        Toyota         Camry Midsize      15.2  18.2      21.2       22
    ## 46        Toyota        Previa     Van      18.9  22.7      26.6       18
    ## 47    Volkswagen           Fox   Small       8.7   9.1       9.5       25
    ## 48    Volkswagen        Passat Compact      17.6    20      22.4       21
    ## 49         Volvo           240 Compact      21.8  22.7      23.5       21
    ##    MPG.highway            AirBags DriveTrain Cylinders EngineSize Horsepower
    ## 1           31               None      Front         4        1.8        140
    ## 2           30        Driver only       Rear         4        3.5        208
    ## 3           31        Driver only      Front         4        2.2        110
    ## 4           36               None      Front         4        2.2        110
    ## 5           34        Driver only      Front         4        2.2        110
    ## 6           29               None      Front         4        2.2        110
    ## 7           28 Driver & Passenger      Front         4          3        141
    ## 8           33               None      Front         4        1.5         92
    ## 9           29        Driver only      Front         4        2.2         93
    ## 10          27        Driver only      Front         4        2.5        100
    ## 11          27        Driver only      Front         4        2.5        100
    ## 12          33               None      Front         4        1.5         92
    ## 13          33               None      Front         4        1.3         63
    ## 14          30               None      Front         4        1.8        127
    ## 15          27               None      Front         4        2.3         96
    ## 16          29        Driver only       Rear         4        2.3        105
    ## 17          30        Driver only      Front         4          2        115
    ## 18          36        Driver only      Front         4        1.6         90
    ## 19          31 Driver & Passenger      Front         4        2.3        160
    ## 20          46        Driver only      Front         4        1.5        102
    ## 21          31 Driver & Passenger      Front         4        2.2        140
    ## 22          33               None      Front         4        1.5         81
    ## 23          29               None      Front         4        1.8        124
    ## 24          34               None      Front         4        1.5         92
    ## 25          27               None      Front         4          2        128
    ## 26          37               None      Front         4        1.6         82
    ## 27          36               None      Front         4        1.8        103
    ## 28          34        Driver only      Front         4        2.5        164
    ## 29          29        Driver only       Rear         4        2.3        130
    ## 30          26        Driver only      Front         4        1.6        100
    ## 31          33               None      Front         4        1.5         92
    ## 32          33        Driver only      Front         4        1.6        110
    ## 33          30        Driver only      Front         4        2.4        150
    ## 34          31               None      Front         4        2.3        155
    ## 35          31        Driver only      Front         4        2.2        110
    ## 36          30               None        4WD         4        1.8         92
    ## 37          41               None      Front         4        1.6         74
    ## 38          31               None      Front         4          2        110
    ## 39          26        Driver only      Front         4        2.1        140
    ## 40          38        Driver only      Front         4        1.9         85
    ## 41          30               None        4WD         4        1.8         90
    ## 42          30        Driver only        4WD         4        2.2        130
    ## 43          37        Driver only      Front         4        1.5         82
    ## 44          32        Driver only      Front         4        2.2        135
    ## 45          29        Driver only      Front         4        2.2        130
    ## 46          22        Driver only        4WD         4        2.4        138
    ## 47          33               None      Front         4        1.8         81
    ## 48          30               None      Front         4          2        134
    ## 49          28        Driver only       Rear         4        2.3        114
    ##     RPM Rev.per.mile Man.trans.avail Fuel.tank.capacity Passengers Length
    ## 1  6300         2890             Yes               13.2          5    177
    ## 2  5700         2545             Yes               21.1          4    186
    ## 3  5200         2565              No               16.4          6    189
    ## 4  5200         2380             Yes               15.2          5    182
    ## 5  5200         2665             Yes               15.6          5    184
    ## 6  5200         2595              No               16.5          6    198
    ## 7  5000         2090              No                 16          6    183
    ## 8  6000         3285             Yes               13.2          5    174
    ## 9  4800         2595             Yes                 14          5    172
    ## 10 4800         2535             Yes                 16          6    181
    ## 11 4800         2465              No                 16          6    192
    ## 12 6000         2505             Yes               13.2          5    174
    ## 13 5000         3150             Yes                 10          4    141
    ## 14 6500         2410             Yes               13.2          5    171
    ## 15 4200         2805             Yes               15.9          5    177
    ## 16 4600         2285             Yes               15.4          4    180
    ## 17 5500         2340             Yes               15.5          4    179
    ## 18 5400         3250             Yes               12.4          4    164
    ## 19 5800         2855             Yes               15.9          4    175
    ## 20 5900         2650             Yes               11.9          4    173
    ## 21 5600         2610             Yes                 17          4    185
    ## 22 5500         2710             Yes               11.9          5    168
    ## 23 6000         2745             Yes               13.7          5    172
    ## 24 5550         2540             Yes               11.9          4    166
    ## 25 6000         2335             Yes               17.2          5    184
    ## 26 5000         2370             Yes               13.2          4    164
    ## 27 5500         2220             Yes               14.5          5    172
    ## 28 5600         2505             Yes               15.5          5    184
    ## 29 5100         2425             Yes               14.5          5    175
    ## 30 5750         2475             Yes               11.1          4    166
    ## 31 6000         2505             Yes               13.2          5    172
    ## 32 6000         2435             Yes               13.2          5    170
    ## 33 5600         2130             Yes               15.9          5    181
    ## 34 6000         2380              No               15.2          5    188
    ## 35 5200         2565              No               16.5          5    190
    ## 36 5000         2360             Yes               15.9          4    173
    ## 37 5600         3130             Yes               13.2          4    177
    ## 38 5200         2665             Yes               15.2          5    181
    ## 39 6000         2910             Yes                 18          5    184
    ## 40 5000         2145             Yes               12.8          5    176
    ## 41 5200         3375             Yes               15.9          5    175
    ## 42 5600         2330             Yes               15.9          5    179
    ## 43 5200         3505             Yes               11.9          5    162
    ## 44 5400         2405             Yes               15.9          4    174
    ## 45 5400         2340             Yes               18.5          5    188
    ## 46 5000         2515             Yes               19.8          7    187
    ## 47 5500         2550             Yes               12.4          4    163
    ## 48 5800         2685             Yes               18.5          5    180
    ## 49 5400         2215             Yes               15.8          5    190
    ##    Wheelbase Width Turn.circle Rear.seat.room Luggage.room Weight  Origin
    ## 1        102    68          37           26.5           11   2705 non-USA
    ## 2        109    69          39             27           13   3640 non-USA
    ## 3        105    69          41             28           16   2880     USA
    ## 4        101    66          38             25           13   2490     USA
    ## 5        103    68          39             26           14   2785     USA
    ## 6        108    71          40           28.5           16   3195     USA
    ## 7        104    68          41           30.5           14   3085     USA
    ## 8         98    66          32           26.5           11   2270     USA
    ## 9         97    67          38           26.5           13   2670     USA
    ## 10       104    68          39           30.5           14   2970     USA
    ## 11       105    69          42           30.5           16   3080     USA
    ## 12        98    66          36           26.5           11   2295     USA
    ## 13        90    63          33             26           12   1845     USA
    ## 14        98    67          36             28           12   2530     USA
    ## 15       100    68          39           27.5           13   2690     USA
    ## 16       101    68          40             24           12   2850     USA
    ## 17       103    70          38             23           18   2710     USA
    ## 18        97    67          37           24.5           11   2475 non-USA
    ## 19       100    70          39           23.5            8   2865 non-USA
    ## 20       103    67          36             28           12   2350 non-USA
    ## 21       107    67          41             28           14   3040 non-USA
    ## 22        94    63          35             26           11   2345 non-USA
    ## 23        98    66          36             28           12   2620 non-USA
    ## 24        94    64          34           23.5            9   2285 non-USA
    ## 25       104    69          41             31           14   2885 non-USA
    ## 26        97    66          34             27           16   2325 non-USA
    ## 27        98    66          36           26.5           13   2440 non-USA
    ## 28       103    69          40           29.5           14   2970 non-USA
    ## 29       105    67          34             26           12   2920 non-USA
    ## 30        95    65          36             19            6   2450     USA
    ## 31        98    67          36             26           11   2295 non-USA
    ## 32        96    66          33             26           12   2545 non-USA
    ## 33       103    67          40           28.5           14   3050 non-USA
    ## 34       103    67          39             28           14   2910     USA
    ## 35       105    70          42             28           16   2890     USA
    ## 36        97    67          39           24.5            8   2640     USA
    ## 37        99    66          35           25.5           17   2350     USA
    ## 38       101    66          39             25           13   2575     USA
    ## 39        99    67          37           26.5           14   2775 non-USA
    ## 40       102    68          40           26.5           12   2495     USA
    ## 41        97    65          35           27.5           15   2490 non-USA
    ## 42       102    67          37             27           14   3085 non-USA
    ## 43        94    65          36             24           11   2055 non-USA
    ## 44        99    69          39             23           13   2950 non-USA
    ## 45       103    70          38           28.5           15   3030 non-USA
    ## 46       113    71          41             35           NA   3785 non-USA
    ## 47        93    63          34             26           10   2240 non-USA
    ## 48       103    67          35           31.5           14   2985 non-USA
    ## 49       104    67          37           29.5           14   2985 non-USA
    ##                        Make
    ## 1             Acura Integra
    ## 2                  BMW 535i
    ## 3             Buick Century
    ## 4        Chevrolet Cavalier
    ## 5         Chevrolet Corsica
    ## 6          Chevrolet Lumina
    ## 7          Chrysler LeBaron
    ## 8                Dodge Colt
    ## 9              Dodge Shadow
    ## 10             Dodge Spirit
    ## 11            Dodge Dynasty
    ## 12             Eagle Summit
    ## 13             Ford Festiva
    ## 14              Ford Escort
    ## 15               Ford Tempo
    ## 16             Ford Mustang
    ## 17               Ford Probe
    ## 18                Geo Storm
    ## 19            Honda Prelude
    ## 20              Honda Civic
    ## 21             Honda Accord
    ## 22            Hyundai Excel
    ## 23          Hyundai Elantra
    ## 24           Hyundai Scoupe
    ## 25           Hyundai Sonata
    ## 26                Mazda 323
    ## 27            Mazda Protege
    ## 28                Mazda 626
    ## 29       Mercedes-Benz 190E
    ## 30            Mercury Capri
    ## 31        Mitsubishi Mirage
    ## 32            Nissan Sentra
    ## 33            Nissan Altima
    ## 34       Oldsmobile Achieva
    ## 35 Oldsmobile Cutlass_Ciera
    ## 36           Plymouth Laser
    ## 37           Pontiac LeMans
    ## 38          Pontiac Sunbird
    ## 39                 Saab 900
    ## 40                Saturn SL
    ## 41            Subaru Loyale
    ## 42            Subaru Legacy
    ## 43            Toyota Tercel
    ## 44            Toyota Celica
    ## 45             Toyota Camry
    ## 46            Toyota Previa
    ## 47           Volkswagen Fox
    ## 48        Volkswagen Passat
    ## 49                Volvo 240

# Lendo EXCEL com xlsx package

O pacote fornece funções R para ler, gravar e formatar arquivos do
Excel. Depende do Java, mas isso o torna disponível na maioria dos
sistemas operacionais.

Sintax: read.xlsx(file, sheetIndex, header=TRUE, colClasses=NA)

# documentos Excel em R.

``` r
library(xlsx)

# o número um, representa a primeira aba do arquivo execel
excel = read.xlsx(file="C:/Users/luiz_/GoogleDrive/Rna-Seq/2-DESeq2/Analysis_DESeq2_Annotation_CHO/results_DESeq2_genes_up.xlsx", 1)

excel
```

    ##          Gene.stable.ID     baseMean log2FoldChange      lfcSE      stat
    ## 1    ENSCGRG00015023276     3.770296      5.1976108 1.97871673  2.626758
    ## 2    ENSCGRG00015014056   117.023468      4.4014276 0.41334957 10.648197
    ## 3    ENSCGRG00015021957    49.390020      4.3958771 0.63196123  6.955929
    ## 4    ENSCGRG00015010553   975.317910      4.1229894 0.14662617 28.119055
    ## 5    ENSCGRG00015010553   975.317910      4.1229894 0.14662617 28.119055
    ## 6    ENSCGRG00015003447    60.584781      3.5573831 0.48816165  7.287306
    ## 7    ENSCGRG00015019703    46.005317      3.4329860 0.54319488  6.319989
    ## 8    ENSCGRG00015005333     6.341283      3.3719027 1.43076006  2.356721
    ## 9    ENSCGRG00015019999     7.721947      3.0281767 1.23601237  2.449957
    ## 10   ENSCGRG00015021000   296.122448      2.8494316 0.20810269 13.692431
    ## 11   ENSCGRG00015022374    50.090043      2.7043148 0.47285424  5.719130
    ## 12   ENSCGRG00015022818  1045.783335      2.6828276 0.11838709 22.661489
    ## 13   ENSCGRG00015018673   518.236283      2.6803858 0.15740165 17.028956
    ## 14   ENSCGRG00015013748    27.046892      2.6794474 0.64367294  4.162747
    ## 15   ENSCGRG00015006309   387.990111      2.6500252 0.18867071 14.045769
    ## 16   ENSCGRG00015026283     9.996078      2.6468698 1.04712740  2.527744
    ## 17   ENSCGRG00015026483  1264.508018      2.5895178 0.10972307 23.600486
    ## 18   ENSCGRG00015006767    11.612163      2.5819205 0.95663758  2.698954
    ## 19   ENSCGRG00015012020   808.078614      2.5723359 0.13094754 19.644018
    ## 20   ENSCGRG00015012020   808.078614      2.5723359 0.13094754 19.644018
    ## 21   ENSCGRG00015000457    24.929585      2.5614751 0.65250573  3.925598
    ## 22   ENSCGRG00015003069   355.479983      2.5430826 0.18594919 13.676223
    ## 23   ENSCGRG00015026339   434.294879      2.5260062 0.16987558 14.869743
    ## 24   ENSCGRG00015004376  1789.488087      2.5160221 0.10964778 22.946402
    ## 25   ENSCGRG00015018686    13.063674      2.5005028 0.88924555  2.811937
    ## 26   ENSCGRG00015024219   289.242750      2.4902886 0.19980566 12.463553
    ## 27   ENSCGRG00015018352    65.452744      2.3768087 0.40430326  5.878777
    ## 28   ENSCGRG00015003928    25.732643      2.3649314 0.62602584  3.777690
    ## 29   ENSCGRG00015004852   264.966635      2.3553803 0.20830246 11.307501
    ## 30   ENSCGRG00015015867    40.670946      2.3481985 0.50187612  4.678841
    ## 31   ENSCGRG00015018688  1509.990908      2.3149317 0.10571616 21.897614
    ## 32   ENSCGRG00015019960  2141.045161      2.3030585 0.09595413 24.001660
    ## 33   ENSCGRG00015011063   202.001183      2.2980316 0.24103996  9.533820
    ## 34   ENSCGRG00015014964  1305.267851      2.2548248 0.12181551 18.510162
    ## 35   ENSCGRG00015011537    61.026126      2.2546793 0.41009287  5.497972
    ## 36   ENSCGRG00015012080  1074.909475      2.2536086 0.12656394 17.806088
    ## 37   ENSCGRG00015024624   712.813329      2.2522918 0.13094618 17.200134
    ## 38   ENSCGRG00015014722   322.265505      2.2294272 0.19341478 11.526664
    ## 39   ENSCGRG00015007629    23.398243      2.2262273 0.67804618  3.283297
    ## 40   ENSCGRG00015018077   284.731586      2.2171012 0.19527003 11.354027
    ## 41   ENSCGRG00015012698   332.505288      2.1937405 0.18120710 12.106261
    ## 42   ENSCGRG00015010733   249.823206      2.1847060 0.23375272  9.346227
    ## 43   ENSCGRG00015014135   315.971875      2.1747267 0.19016763 11.435840
    ## 44   ENSCGRG00015011312   471.513254      2.1577169 0.15598912 13.832483
    ## 45   ENSCGRG00015007140   267.819265      2.1517738 0.20430679 10.532072
    ## 46   ENSCGRG00015020782    95.437080      2.1459363 0.32339074  6.635738
    ## 47   ENSCGRG00015022298   631.456957      2.1446526 0.13755110 15.591679
    ## 48   ENSCGRG00015026627    25.775933      2.1444585 0.62176310  3.448996
    ## 49   ENSCGRG00015027836   236.986832      2.1432211 0.21197035 10.110948
    ## 50   ENSCGRG00015010960    55.397494      2.1264259 0.44149589  4.816412
    ## 51   ENSCGRG00015011853    76.903270      2.1041579 0.35639362  5.904028
    ## 52   ENSCGRG00015020318   224.134339      2.0897411 0.21426975  9.752852
    ## 53   ENSCGRG00015024733  1810.068837      2.0833443 0.10267860 20.289955
    ## 54   ENSCGRG00015003998    44.738396      2.0734078 0.47137908  4.398600
    ## 55   ENSCGRG00015006811   923.425948      2.0718824 0.13138987 15.768966
    ## 56   ENSCGRG00015002115   112.734009      2.0676985 0.29716474  6.958088
    ## 57   ENSCGRG00015024957   680.886072      2.0619940 0.13810594 14.930524
    ## 58   ENSCGRG00015022098  2302.820331      2.0539312 0.08844319 23.223170
    ## 59   ENSCGRG00015025011  1323.847584      2.0527450 0.10807611 18.993514
    ## 60   ENSCGRG00015011607   292.336404      2.0525888 0.19204455 10.688087
    ## 61   ENSCGRG00015024322    64.201834      2.0504456 0.42293968  4.848080
    ## 62   ENSCGRG00015011755  1406.171793      2.0494492 0.10955182 18.707577
    ## 63   ENSCGRG00015003013   285.691811      2.0330921 0.20174712 10.077429
    ## 64   ENSCGRG00015006292  1587.465883      2.0268226 0.10879045 18.630520
    ## 65   ENSCGRG00015011745  1291.729370      2.0204711 0.11452969 17.641462
    ## 66   ENSCGRG00015006943   288.297842      2.0176367 0.19053482 10.589333
    ## 67   ENSCGRG00015000230   100.155067      2.0142768 0.31665642  6.361080
    ## 68   ENSCGRG00015000230   100.155067      2.0142768 0.31665642  6.361080
    ## 69   ENSCGRG00015026532  1658.871497      1.9895010 0.10929773 18.202583
    ## 70   ENSCGRG00015024367  4117.771419      1.9885014 0.09111235 21.824719
    ## 71   ENSCGRG00015021717   234.022148      1.9803987 0.21407704  9.250869
    ## 72   ENSCGRG00015010047  1024.278079      1.9657588 0.11270658 17.441384
    ## 73   ENSCGRG00015018774  3159.463022      1.9648070 0.07949832 24.715074
    ## 74   ENSCGRG00015009804   742.206650      1.9570440 0.12957330 15.103760
    ## 75   ENSCGRG00015014101  1060.679647      1.9564840 0.11103873 17.619834
    ## 76   ENSCGRG00015021563   863.373423      1.9559236 0.13302029 14.703950
    ## 77   ENSCGRG00015006213  1652.377397      1.9555409 0.10134244 19.296366
    ## 78   ENSCGRG00015002832    52.348405      1.9371401 0.42702828  4.536327
    ## 79   ENSCGRG00015026077   725.242714      1.9210706 0.12721640 15.100809
    ## 80   ENSCGRG00015019306  2603.088740      1.9155765 0.09150137 20.934949
    ## 81   ENSCGRG00015007374   565.865021      1.8976318 0.15011348 12.641315
    ## 82   ENSCGRG00015017614  2977.680443      1.8935123 0.08922094 21.222733
    ## 83   ENSCGRG00015010481   590.079144      1.8900377 0.13804595 13.691366
    ## 84   ENSCGRG00015026307   315.167088      1.8876278 0.18699454 10.094561
    ## 85   ENSCGRG00015002538  1825.120783      1.8867850 0.10943591 17.241005
    ## 86   ENSCGRG00015016020   678.223281      1.8852334 0.13639170 13.822200
    ## 87   ENSCGRG00015024097  1139.057508      1.8812806 0.11790954 15.955287
    ## 88   ENSCGRG00015025354  1324.833219      1.8668173 0.10178853 18.340154
    ## 89   ENSCGRG00015017465   991.322155      1.8653822 0.12591306 14.814843
    ## 90   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 91   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 92   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 93   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 94   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 95   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 96   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 97   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 98   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 99   ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 100  ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 101  ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 102  ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 103  ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 104  ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 105  ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 106  ENSCGRG00015025125   558.264714      1.8608177 0.15617161 11.915211
    ## 107  ENSCGRG00015017376  1976.299082      1.8568532 0.10911103 17.018014
    ## 108  ENSCGRG00015001004   338.666976      1.8494949 0.18520267  9.986330
    ## 109  ENSCGRG00015001062   120.112212      1.8459555 0.28554535  6.464667
    ## 110  ENSCGRG00015013770   596.237775      1.8434428 0.15042895 12.254575
    ## 111  ENSCGRG00015006143  1073.219266      1.8367015 0.11698894 15.699787
    ## 112  ENSCGRG00015014744   255.698572      1.8334667 0.21095805  8.691144
    ## 113  ENSCGRG00015014711   114.086425      1.8287035 0.28937284  6.319541
    ## 114  ENSCGRG00015027773  2834.961855      1.8280533 0.09378703 19.491535
    ## 115  ENSCGRG00015025379  1045.160009      1.8227070 0.10981103 16.598579
    ## 116  ENSCGRG00015004874   200.794296      1.8167940 0.22127457  8.210586
    ## 117  ENSCGRG00015001320   435.270973      1.8156142 0.15861724 11.446512
    ## 118  ENSCGRG00015021724  1537.585788      1.8130446 0.09695942 18.699004
    ## 119  ENSCGRG00015018407   217.695845      1.8118121 0.21258002  8.522965
    ## 120  ENSCGRG00015004052    37.653947      1.8080228 0.49298179  3.667524
    ## 121  ENSCGRG00015027901  1482.879578      1.8009042 0.10218075 17.624691
    ## 122  ENSCGRG00015001084   463.690826      1.7989089 0.15700105 11.457942
    ## 123  ENSCGRG00015025620  2179.540264      1.7977450 0.09282034 19.368007
    ## 124  ENSCGRG00015018363  1956.918807      1.7972844 0.09998322 17.975861
    ## 125  ENSCGRG00015003638  2524.665630      1.7949833 0.08613863 20.838307
    ## 126  ENSCGRG00015012855    14.866404      1.7894045 0.77952245  2.295514
    ## 127  ENSCGRG00015011894   170.216987      1.7893089 0.25863451  6.918291
    ## 128  ENSCGRG00015025943  4412.414061      1.7891370 0.08289142 21.584105
    ## 129  ENSCGRG00015024352   202.267272      1.7761667 0.22840615  7.776352
    ## 130  ENSCGRG00015002553   809.986056      1.7757110 0.13473883 13.178911
    ## 131  ENSCGRG00015018391  1932.045880      1.7752607 0.09157200 19.386502
    ## 132  ENSCGRG00015024107   524.722138      1.7742146 0.14423802 12.300603
    ## 133  ENSCGRG00015013009    56.419729      1.7681145 0.41419881  4.268758
    ## 134  ENSCGRG00015013926   531.508928      1.7676949 0.15011167 11.775866
    ## 135  ENSCGRG00015023782   650.898208      1.7664301 0.14111659 12.517522
    ## 136  ENSCGRG00015001527  1228.726474      1.7641166 0.11098843 15.894600
    ## 137  ENSCGRG00015016562   826.139860      1.7639949 0.12109869 14.566590
    ## 138  ENSCGRG00015018747  1950.952361      1.7616422 0.09373030 18.794800
    ## 139  ENSCGRG00015025067   744.454163      1.7607700 0.12714552 13.848463
    ## 140  ENSCGRG00015009263   393.429578      1.7602745 0.17648202  9.974242
    ## 141  ENSCGRG00015010228   353.119387      1.7591241 0.17542474 10.027800
    ## 142  ENSCGRG00015002154   358.552329      1.7542434 0.17657972  9.934569
    ## 143  ENSCGRG00015010463   147.930707      1.7528949 0.25569438  6.855430
    ## 144  ENSCGRG00015011410  1225.233066      1.7512492 0.10376676 16.876784
    ## 145  ENSCGRG00015007096   608.383860      1.7392781 0.13498807 12.884680
    ## 146  ENSCGRG00015017220   497.497882      1.7338859 0.14980312 11.574432
    ## 147  ENSCGRG00015010053   258.207542      1.7308810 0.20029507  8.641655
    ## 148  ENSCGRG00015006745   674.512017      1.7304058 0.12892381 13.421926
    ## 149  ENSCGRG00015002191  1768.335447      1.7296555 0.09900239 17.470846
    ## 150  ENSCGRG00015007375   182.821603      1.7170294 0.23132584  7.422558
    ## 151  ENSCGRG00015001485   441.016782      1.7115395 0.16046279 10.666270
    ## 152  ENSCGRG00015013936   366.674368      1.7077825 0.17157807  9.953385
    ## 153  ENSCGRG00015015965   879.803709      1.7070411 0.12566512 13.584048
    ## 154  ENSCGRG00015021714   702.411320      1.7046783 0.13931229 12.236381
    ## 155  ENSCGRG00015018748    86.584684      1.6974387 0.32659816  5.197331
    ## 156  ENSCGRG00015007752    45.046370      1.6971459 0.44836031  3.785228
    ## 157  ENSCGRG00015009337   174.309574      1.6922410 0.23507383  7.198764
    ## 158  ENSCGRG00015028688   638.854333      1.6892718 0.13369775 12.635006
    ## 159  ENSCGRG00015027997  2131.048869      1.6883858 0.08911548 18.946044
    ## 160  ENSCGRG00015020268  2974.421838      1.6873057 0.08864969 19.033409
    ## 161  ENSCGRG00015010069    24.807677      1.6871878 0.60750894  2.777223
    ## 162  ENSCGRG00015000856  1286.270675      1.6870729 0.10135646 16.644948
    ## 163  ENSCGRG00015021161  2822.353362      1.6854420 0.08549659 19.713559
    ## 164  ENSCGRG00015021161  2822.353362      1.6854420 0.08549659 19.713559
    ## 165  ENSCGRG00015018873   258.199656      1.6836876 0.19544039  8.614839
    ## 166  ENSCGRG00015021816   878.934146      1.6829318 0.12502952 13.460276
    ## 167  ENSCGRG00015014078   735.143959      1.6828207 0.13232016 12.717795
    ## 168  ENSCGRG00015000007  2491.435800      1.6823534 0.08987558 18.718693
    ## 169  ENSCGRG00015008015  1833.637227      1.6801828 0.09733534 17.261796
    ## 170  ENSCGRG00015020576   324.146267      1.6799507 0.18308538  9.175777
    ## 171  ENSCGRG00015028223  6371.878593      1.6785776 0.07124840 23.559511
    ## 172  ENSCGRG00015002716   191.880840      1.6731434 0.22306217  7.500794
    ## 173  ENSCGRG00015004151   124.931787      1.6711019 0.27374113  6.104680
    ## 174  ENSCGRG00015004151   124.931787      1.6711019 0.27374113  6.104680
    ## 175  ENSCGRG00015004151   124.931787      1.6711019 0.27374113  6.104680
    ## 176  ENSCGRG00015004945  1014.534681      1.6667536 0.12028851 13.856300
    ## 177  ENSCGRG00015016383  1118.117175      1.6666389 0.10705502 15.568059
    ## 178  ENSCGRG00015024667  1087.622680      1.6656328 0.11870045 14.032237
    ## 179  ENSCGRG00015001543  1389.703680      1.6639800 0.10660525 15.608800
    ## 180  ENSCGRG00015019350  1170.192178      1.6636748 0.11345120 14.664233
    ## 181  ENSCGRG00015009186    44.104687      1.6574947 0.45254999  3.662567
    ## 182  ENSCGRG00015011644  1384.891590      1.6556650 0.10100839 16.391362
    ## 183  ENSCGRG00015022354  1333.449413      1.6540841 0.10889188 15.190151
    ## 184  ENSCGRG00015023479   177.284793      1.6503211 0.23396175  7.053807
    ## 185  ENSCGRG00015005432    17.294957      1.6482420 0.71598977  2.302047
    ## 186  ENSCGRG00015022053   175.547914      1.6471821 0.23535687  6.998657
    ## 187  ENSCGRG00015025736   141.190172      1.6441770 0.26901254  6.111897
    ## 188  ENSCGRG00015017804   633.087079      1.6376300 0.14188595 11.541875
    ## 189  ENSCGRG00015011492   202.450946      1.6351136 0.21762232  7.513538
    ## 190  ENSCGRG00015023847   435.742482      1.6345999 0.15538111 10.519940
    ## 191  ENSCGRG00015014316 10155.045837      1.6335152 0.07981588 20.466042
    ## 192  ENSCGRG00015009158   797.098977      1.6319443 0.13240364 12.325525
    ## 193  ENSCGRG00015023529  3287.084268      1.6312386 0.08556521 19.064275
    ## 194  ENSCGRG00015002612   385.822648      1.6265450 0.16426878  9.901729
    ## 195  ENSCGRG00015003802   963.465801      1.6255236 0.11541555 14.084095
    ## 196  ENSCGRG00015003802   963.465801      1.6255236 0.11541555 14.084095
    ## 197  ENSCGRG00015012640  2835.506034      1.6234059 0.09577103 16.950909
    ## 198  ENSCGRG00015001440  1406.490487      1.6200971 0.09956210 16.272227
    ## 199  ENSCGRG00015004194   255.669925      1.6176256 0.19927130  8.117705
    ## 200  ENSCGRG00015025571  1441.078555      1.6163989 0.10127543 15.960426
    ## 201  ENSCGRG00015028678    32.685396      1.6115274 0.52341570  3.078867
    ## 202  ENSCGRG00015005161   888.307339      1.6096782 0.11857409 13.575294
    ## 203  ENSCGRG00015011378   989.027729      1.6063031 0.11074659 14.504313
    ## 204  ENSCGRG00015002539   786.764816      1.6023266 0.12900123 12.421018
    ## 205  ENSCGRG00015004469   251.446934      1.6021959 0.20077619  7.980009
    ## 206  ENSCGRG00015025254   752.753872      1.6005056 0.13583617 11.782617
    ## 207  ENSCGRG00015025772    52.843583      1.6002727 0.41142237  3.889610
    ## 208  ENSCGRG00015001392    20.026397      1.5970307 0.67404237  2.369333
    ## 209  ENSCGRG00015019577   746.001877      1.5950207 0.12451591 12.809774
    ## 210  ENSCGRG00015000262  1367.645980      1.5932758 0.11575496 13.764212
    ## 211  ENSCGRG00015006401   405.740916      1.5922657 0.16058074  9.915670
    ## 212  ENSCGRG00015014293   118.252692      1.5791908 0.29429049  5.366095
    ## 213  ENSCGRG00015027474   200.550594      1.5790069 0.21779234  7.250057
    ## 214  ENSCGRG00015005013   614.857760      1.5785162 0.13398153 11.781596
    ## 215  ENSCGRG00015020145   605.098056      1.5770031 0.13861649 11.376735
    ## 216  ENSCGRG00015005251  1704.880342      1.5753276 0.09212875 17.099198
    ## 217  ENSCGRG00015023991   255.478213      1.5750328 0.19574281  8.046440
    ## 218  ENSCGRG00015017382  1081.763382      1.5749447 0.10824531 14.549772
    ## 219  ENSCGRG00015009924   378.168528      1.5732756 0.16878529  9.321165
    ## 220  ENSCGRG00015024368   519.054062      1.5679104 0.14262067 10.993571
    ## 221  ENSCGRG00015015799  1811.289062      1.5678328 0.10069236 15.570524
    ## 222  ENSCGRG00015000953   980.052273      1.5668529 0.11601225 13.505926
    ## 223  ENSCGRG00015019675   119.720488      1.5668087 0.27846228  5.626646
    ## 224  ENSCGRG00015016195   639.927556      1.5658081 0.13201438 11.860891
    ## 225  ENSCGRG00015010376   927.193838      1.5656374 0.12103870 12.935015
    ## 226  ENSCGRG00015023429  1164.186005      1.5642899 0.10564816 14.806598
    ## 227  ENSCGRG00015026216   176.138120      1.5527068 0.23344041  6.651405
    ## 228  ENSCGRG00015020497   395.887389      1.5507805 0.16264761  9.534603
    ## 229  ENSCGRG00015018623    77.297944      1.5495917 0.35039036  4.422472
    ## 230  ENSCGRG00015016723   413.889389      1.5470710 0.15752688  9.820997
    ## 231  ENSCGRG00015028432   155.106695      1.5440024 0.24506218  6.300451
    ## 232  ENSCGRG00015004599   381.260957      1.5439368 0.16633486  9.282099
    ## 233  ENSCGRG00015004599   381.260957      1.5439368 0.16633486  9.282099
    ## 234  ENSCGRG00015020188   862.806506      1.5429088 0.11592238 13.309843
    ## 235  ENSCGRG00015024293   216.283651      1.5407902 0.21521948  7.159157
    ## 236  ENSCGRG00015000169  1597.765068      1.5404717 0.09508963 16.200207
    ## 237  ENSCGRG00015028235  1901.156911      1.5357757 0.11605573 13.233088
    ## 238  ENSCGRG00015008253   914.706444      1.5334042 0.11496420 13.338102
    ## 239  ENSCGRG00015017050    44.439121      1.5322577 0.47760435  3.208216
    ## 240  ENSCGRG00015020169   114.431041      1.5273986 0.28483370  5.362423
    ## 241  ENSCGRG00015019729   511.562296      1.5235143 0.14363792 10.606630
    ## 242  ENSCGRG00015004571   260.393991      1.5233726 0.20032285  7.604587
    ## 243  ENSCGRG00015017472  1845.192957      1.5179403 0.09138945 16.609580
    ## 244  ENSCGRG00015007237  1093.373598      1.5179158 0.11178372 13.579043
    ## 245  ENSCGRG00015003325  1258.456685      1.5164037 0.10917960 13.889075
    ## 246  ENSCGRG00015000307  2068.768644      1.5146108 0.08745671 17.318407
    ## 247  ENSCGRG00015000307  2068.768644      1.5146108 0.08745671 17.318407
    ## 248  ENSCGRG00015015619  4943.644535      1.5121449 0.07275444 20.784228
    ## 249  ENSCGRG00015016396   108.170081      1.5117668 0.29201659  5.176989
    ## 250  ENSCGRG00015016756   222.113854      1.5106619 0.20629091  7.322969
    ## 251  ENSCGRG00015001825  1304.718186      1.5095416 0.10171712 14.840585
    ## 252  ENSCGRG00015003602    25.788528      1.5089171 0.58206218  2.592364
    ## 253  ENSCGRG00015024279  3602.309789      1.5087726 0.07696016 19.604592
    ## 254  ENSCGRG00015013728   299.579926      1.5078783 0.18085007  8.337726
    ## 255  ENSCGRG00015026835   298.041219      1.5069715 0.18540169  8.128143
    ## 256  ENSCGRG00015022757    27.906510      1.5066729 0.55966531  2.692096
    ## 257  ENSCGRG00015002074   511.224911      1.5051772 0.14641738 10.280045
    ## 258  ENSCGRG00015028446   152.551575      1.5048094 0.25174724  5.977461
    ## 259  ENSCGRG00015010483   562.813224      1.5008351 0.14060156 10.674384
    ## 260  ENSCGRG00015015506  2624.496291      1.5005521 0.09627171 15.586637
    ## 261  ENSCGRG00015015677   820.665640      1.4987998 0.14458440 10.366262
    ## 262  ENSCGRG00015021129   199.183942      1.4962158 0.21728016  6.886113
    ## 263  ENSCGRG00015026485   126.318465      1.4960932 0.27533984  5.433624
    ## 264  ENSCGRG00015024319   657.882541      1.4951195 0.12892446 11.596864
    ## 265  ENSCGRG00015012444   233.249505      1.4944805 0.20268431  7.373440
    ## 266  ENSCGRG00015024257   196.371081      1.4928509 0.22020709  6.779305
    ## 267  ENSCGRG00015022462  2057.600830      1.4918975 0.10143242 14.708291
    ## 268  ENSCGRG00015028649  1442.489927      1.4912485 0.09758819 15.281034
    ## 269  ENSCGRG00015007083   593.170961      1.4911109 0.13668748 10.908906
    ## 270  ENSCGRG00015011121  1559.167148      1.4904404 0.11277332 13.216250
    ## 271  ENSCGRG00015021121   165.488299      1.4902265 0.23698361  6.288310
    ## 272  ENSCGRG00015019427   506.063070      1.4883540 0.14806534 10.052008
    ## 273  ENSCGRG00015012340   595.154325      1.4880526 0.13397128 11.107251
    ## 274  ENSCGRG00015017892  2491.435322      1.4858058 0.08366396 17.759209
    ## 275  ENSCGRG00015022820   580.541240      1.4844118 0.13601152 10.913868
    ## 276  ENSCGRG00015023464   369.955230      1.4837264 0.17670867  8.396455
    ## 277  ENSCGRG00015019451    21.047040      1.4811463 0.64707957  2.288971
    ## 278  ENSCGRG00015013466   345.645694      1.4785292 0.17105808  8.643433
    ## 279  ENSCGRG00015001077   432.833557      1.4742500 0.15317861  9.624386
    ## 280  ENSCGRG00015003784    47.129783      1.4711099 0.43737760  3.363478
    ## 281  ENSCGRG00015021394   265.690687      1.4687756 0.19930386  7.369529
    ## 282  ENSCGRG00015001399  1469.376652      1.4670398 0.10669471 13.749883
    ## 283  ENSCGRG00015022123   620.242313      1.4669021 0.13539491 10.834249
    ## 284  ENSCGRG00015024326    27.798329      1.4652123 0.65140160  2.249323
    ## 285  ENSCGRG00015023566  1071.596628      1.4644792 0.11096371 13.197821
    ## 286  ENSCGRG00015009513  3324.846549      1.4622810 0.08074478 18.109912
    ## 287  ENSCGRG00015022497   831.999010      1.4614156 0.11739603 12.448595
    ## 288  ENSCGRG00015007093  2058.246502      1.4595612 0.09509430 15.348566
    ## 289  ENSCGRG00015028918   259.389005      1.4592495 0.19478435  7.491616
    ## 290  ENSCGRG00015026901   289.069402      1.4580275 0.19045302  7.655576
    ## 291  ENSCGRG00015009072   963.154601      1.4570337 0.11664856 12.490799
    ## 292  ENSCGRG00015014989   202.200120      1.4564073 0.21626074  6.734497
    ## 293  ENSCGRG00015025407  4277.849328      1.4543633 0.08672141 16.770523
    ## 294  ENSCGRG00015008992   601.810542      1.4540916 0.14311673 10.160180
    ## 295  ENSCGRG00015006578  6787.601133      1.4540681 0.06804433 21.369423
    ## 296  ENSCGRG00015027480  4216.547809      1.4528475 0.08096688 17.943726
    ## 297  ENSCGRG00015003888   325.712781      1.4515441 0.17353268  8.364673
    ## 298  ENSCGRG00015000743   334.918961      1.4507100 0.18036011  8.043408
    ## 299  ENSCGRG00015015807  1055.089403      1.4486873 0.11030808 13.133102
    ## 300  ENSCGRG00015003196   174.402706      1.4476975 0.23527886  6.153113
    ## 301  ENSCGRG00015008312   538.704043      1.4472637 0.14723482  9.829629
    ## 302  ENSCGRG00015025368   924.300052      1.4462255 0.11881653 12.171921
    ## 303  ENSCGRG00015019705   541.255347      1.4458182 0.15163718  9.534721
    ## 304  ENSCGRG00015021257  2320.067117      1.4456521 0.09375541 15.419400
    ## 305  ENSCGRG00015016211  1538.428871      1.4438065 0.09973403 14.476568
    ## 306  ENSCGRG00015010378  1563.972989      1.4436505 0.09929795 14.538574
    ## 307  ENSCGRG00015028511  1038.490243      1.4361988 0.11022270 13.029973
    ## 308  ENSCGRG00015016838   220.038537      1.4354505 0.20614000  6.963474
    ## 309  ENSCGRG00015013062   165.948367      1.4324278 0.23606498  6.067939
    ## 310  ENSCGRG00015020146   827.908471      1.4300863 0.11781682 12.138219
    ## 311  ENSCGRG00015009043  2226.309207      1.4295752 0.08771811 16.297378
    ## 312  ENSCGRG00015014240   375.257017      1.4286003 0.16300181  8.764321
    ## 313  ENSCGRG00015010634    31.509461      1.4282806 0.55607175  2.568519
    ## 314  ENSCGRG00015019894   525.684649      1.4270636 0.15121959  9.437029
    ## 315  ENSCGRG00015025877  1297.598713      1.4235518 0.10134095 14.047153
    ## 316  ENSCGRG00015027289  4596.308820      1.4229296 0.08289854 17.164713
    ## 317  ENSCGRG00015001290   573.618713      1.4228333 0.14038682 10.135092
    ## 318  ENSCGRG00015002676   232.160219      1.4210514 0.20862662  6.811458
    ## 319  ENSCGRG00015013552  3329.524776      1.4195563 0.08378007 16.943843
    ## 320  ENSCGRG00015019578  1327.616887      1.4183645 0.11544548 12.286011
    ## 321  ENSCGRG00015028322  2211.043039      1.4181578 0.08877616 15.974534
    ## 322  ENSCGRG00015028322  2211.043039      1.4181578 0.08877616 15.974534
    ## 323  ENSCGRG00015000997  1301.731065      1.4162783 0.10675106 13.267112
    ## 324  ENSCGRG00015003556  2262.376360      1.4155064 0.08714622 16.242890
    ## 325  ENSCGRG00015019759  3572.711212      1.4143427 0.08214677 17.217266
    ## 326  ENSCGRG00015019649   390.051535      1.4136330 0.16648160  8.491226
    ## 327  ENSCGRG00015001657   212.484361      1.4102801 0.21054954  6.698092
    ## 328  ENSCGRG00015009877  5899.935756      1.4080665 0.07435427 18.937265
    ## 329  ENSCGRG00015009564   424.271887      1.4070497 0.16088578  8.745644
    ## 330  ENSCGRG00015017143  6699.817981      1.4069967 0.08396224 16.757493
    ## 331  ENSCGRG00015002284    45.884720      1.4068383 0.43597988  3.226842
    ## 332  ENSCGRG00015009748   263.064149      1.4060925 0.20309229  6.923416
    ## 333  ENSCGRG00015015369   401.491719      1.4017091 0.16528524  8.480546
    ## 334  ENSCGRG00015025077   423.425824      1.4015381 0.15367877  9.119920
    ## 335  ENSCGRG00015019728   456.154785      1.3957547 0.34069502  4.096786
    ## 336  ENSCGRG00015006582  1205.745246      1.3953294 0.10722997 13.012494
    ## 337  ENSCGRG00015025770  3445.394058      1.3938517 0.08025205 17.368425
    ## 338  ENSCGRG00015008324   434.599055      1.3935225 0.15295638  9.110587
    ## 339  ENSCGRG00015022347   584.121819      1.3923106 0.13528954 10.291340
    ## 340  ENSCGRG00015017440  5420.040985      1.3906046 0.07720395 18.012091
    ## 341  ENSCGRG00015005462  7039.357740      1.3894553 0.08822968 15.748162
    ## 342  ENSCGRG00015003805  2417.319670      1.3890947 0.08271590 16.793563
    ## 343  ENSCGRG00015015999   639.905500      1.3890216 0.13254750 10.479425
    ## 344  ENSCGRG00015028752  4109.862779      1.3880017 0.07679241 18.074724
    ## 345  ENSCGRG00015018471   431.510982      1.3860954 0.15566179  8.904532
    ## 346  ENSCGRG00015020110   856.133438      1.3846995 0.11631826 11.904403
    ## 347  ENSCGRG00015024546   636.547508      1.3843407 0.13880190  9.973499
    ## 348  ENSCGRG00015019148    22.996327      1.3810167 0.61535500  2.244260
    ## 349  ENSCGRG00015017354  2281.953450      1.3791963 0.09131565 15.103614
    ## 350  ENSCGRG00015024223   537.644726      1.3767163 0.13975564  9.850882
    ## 351  ENSCGRG00015008295  2536.292713      1.3765544 0.09264032 14.859128
    ## 352  ENSCGRG00015011461   448.233917      1.3746482 0.15362007  8.948363
    ## 353  ENSCGRG00015025305   623.977664      1.3731138 0.13048567 10.523101
    ## 354  ENSCGRG00015010105   163.070797      1.3728247 0.23641846  5.806758
    ## 355  ENSCGRG00015028383  4416.205119      1.3726273 0.07568605 18.135803
    ## 356  ENSCGRG00015013688  4506.153492      1.3720537 0.08630706 15.897352
    ## 357  ENSCGRG00015010878   223.623027      1.3712011 0.20594143  6.658209
    ## 358  ENSCGRG00015023414   325.346050      1.3709585 0.18785234  7.298064
    ## 359  ENSCGRG00015025597  4116.566981      1.3689926 0.07726725 17.717630
    ## 360  ENSCGRG00015019801   256.944763      1.3673587 0.21212722  6.445937
    ## 361  ENSCGRG00015009093   287.555747      1.3635539 0.18292892  7.454009
    ## 362  ENSCGRG00015006450   402.248409      1.3626785 0.17155620  7.943044
    ## 363  ENSCGRG00015019433  4602.125129      1.3616115 0.09105040 14.954482
    ## 364  ENSCGRG00015013988   890.174078      1.3611658 0.11395258 11.945019
    ## 365  ENSCGRG00015001056   563.164934      1.3591982 0.14239673  9.545150
    ## 366  ENSCGRG00015026260  2981.498185      1.3568065 0.07967645 17.028953
    ## 367  ENSCGRG00015007417    84.912617      1.3567418 0.33441826  4.057021
    ## 368  ENSCGRG00015006099    25.669710      1.3558231 0.58953727  2.299809
    ## 369  ENSCGRG00015007287  1082.266852      1.3554654 0.27322882  4.960917
    ## 370  ENSCGRG00015007287  1082.266852      1.3554654 0.27322882  4.960917
    ## 371  ENSCGRG00015027099   829.718474      1.3551633 0.11887470 11.399930
    ## 372  ENSCGRG00015006723  1806.685669      1.3544314 0.10436987 12.977227
    ## 373  ENSCGRG00015020257  1216.781008      1.3543675 0.12378834 10.940994
    ## 374  ENSCGRG00015017144   738.555373      1.3541415 0.13076301 10.355692
    ## 375  ENSCGRG00015005689   104.741839      1.3539676 0.29791377  4.544830
    ## 376  ENSCGRG00015009701   200.363609      1.3521062 0.22618309  5.977928
    ## 377  ENSCGRG00015000816   767.264137      1.3510665 0.12739728 10.605144
    ## 378  ENSCGRG00015020195   617.437988      1.3469425 0.13463899 10.004104
    ## 379  ENSCGRG00015023046   244.187600      1.3467079 0.20189673  6.670281
    ## 380  ENSCGRG00015006805  1861.654916      1.3461654 0.11289064 11.924508
    ## 381  ENSCGRG00015016811   870.766994      1.3460891 0.12462770 10.800882
    ## 382  ENSCGRG00015023181  1074.306361      1.3459637 0.10844955 12.410966
    ## 383  ENSCGRG00015022306  1008.599405      1.3435047 0.13299928 10.101594
    ## 384  ENSCGRG00015017518   606.531061      1.3412553 0.14387196  9.322562
    ## 385  ENSCGRG00015025729  1132.756682      1.3408479 0.10579132 12.674460
    ## 386  ENSCGRG00015006633   337.443414      1.3406761 0.17430302  7.691640
    ## 387  ENSCGRG00015001988  1409.834286      1.3389861 0.09832381 13.618126
    ## 388  ENSCGRG00015022951   134.335645      1.3386898 0.26328476  5.084570
    ## 389  ENSCGRG00015016255   801.551854      1.3384724 0.12089502 11.071361
    ## 390  ENSCGRG00015022126   453.976971      1.3382317 0.15837611  8.449706
    ## 391  ENSCGRG00015017601    85.606755      1.3377650 0.32283858  4.143758
    ## 392  ENSCGRG00015012300   523.749808      1.3366785 0.14035587  9.523496
    ## 393  ENSCGRG00015028710   300.844823      1.3357627 0.19678088  6.788072
    ## 394  ENSCGRG00015017771   171.437063      1.3353905 0.23571855  5.665190
    ## 395  ENSCGRG00015023957   361.042192      1.3315941 0.18976995  7.016886
    ## 396  ENSCGRG00015005730   632.068520      1.3312032 0.13019674 10.224551
    ## 397  ENSCGRG00015004931  1550.093089      1.3285547 0.10474473 12.683738
    ## 398  ENSCGRG00015003008  1204.700982      1.3282960 0.10751111 12.354965
    ## 399  ENSCGRG00015025545  7827.671272      1.3264717 0.06704640 19.784385
    ## 400  ENSCGRG00015007895   657.063664      1.3261895 0.14517950  9.134826
    ## 401  ENSCGRG00015003272   748.088132      1.3245953 0.12516461 10.582826
    ## 402  ENSCGRG00015006803   297.111285      1.3229349 0.18021374  7.340921
    ## 403  ENSCGRG00015024393    60.263550      1.3225387 0.38486988  3.436327
    ## 404  ENSCGRG00015011793   939.364384      1.3203207 0.11967477 11.032574
    ## 405  ENSCGRG00015021776   185.597877      1.3193009 0.22662125  5.821612
    ## 406  ENSCGRG00015008011  3353.447373      1.3183304 0.09031834 14.596487
    ## 407  ENSCGRG00015009421  1101.193459      1.3169228 0.10548833 12.484062
    ## 408  ENSCGRG00015023953   710.001427      1.3163198 0.13410547  9.815557
    ## 409  ENSCGRG00015008773    65.911233      1.3158701 0.36719632  3.583560
    ## 410  ENSCGRG00015012100    51.735223      1.3115996 0.41284308  3.176993
    ## 411  ENSCGRG00015003824  1838.791830      1.3114779 0.09780013 13.409776
    ## 412  ENSCGRG00015007060   619.775263      1.3110827 0.13670423  9.590652
    ## 413  ENSCGRG00015004994   561.923594      1.3093750 0.13742500  9.527925
    ## 414  ENSCGRG00015020405  1264.309230      1.3085142 0.10652435 12.283710
    ## 415  ENSCGRG00015011685   421.999372      1.3061396 0.15533952  8.408289
    ## 416  ENSCGRG00015016966  1995.655248      1.3059974 0.08801706 14.838004
    ## 417  ENSCGRG00015016966  1995.655248      1.3059974 0.08801706 14.838004
    ## 418  ENSCGRG00015005360   580.039870      1.3049539 0.13624254  9.578168
    ## 419  ENSCGRG00015000444  7582.758004      1.3045027 0.06716976 19.420982
    ## 420  ENSCGRG00015019998  1804.951007      1.3044840 0.09079209 14.367815
    ## 421  ENSCGRG00015009279    66.815518      1.3044513 0.36246291  3.598855
    ## 422  ENSCGRG00015002357  1015.724684      1.3036898 0.11531057 11.305900
    ## 423  ENSCGRG00015025304   756.200103      1.3026215 0.13220396  9.853120
    ## 424  ENSCGRG00015021871  1957.307363      1.3026001 0.09018188 14.444145
    ## 425  ENSCGRG00015013134   488.353080      1.3022711 0.14417297  9.032699
    ## 426  ENSCGRG00015006886   589.815394      1.2996075 0.13876870  9.365279
    ## 427  ENSCGRG00015024414   204.160080      1.2977968 0.21306838  6.090987
    ## 428  ENSCGRG00015024337   156.918743      1.2962046 0.30610132  4.234561
    ## 429  ENSCGRG00015026887  2172.464700      1.2875444 0.08615290 14.944876
    ## 430  ENSCGRG00015006259  1883.916618      1.2871862 0.08907594 14.450436
    ## 431  ENSCGRG00015011785  1300.526397      1.2868282 0.10134560 12.697425
    ## 432  ENSCGRG00015020653  1533.213658      1.2821914 0.09699479 13.219179
    ## 433  ENSCGRG00015019486   386.465807      1.2820426 0.16116588  7.954801
    ## 434  ENSCGRG00015016163   497.871539      1.2817482 0.14619900  8.767148
    ## 435  ENSCGRG00015014719   859.893031      1.2814241 0.12141953 10.553690
    ## 436  ENSCGRG00015024041   544.922088      1.2779600 0.13823146  9.245074
    ## 437  ENSCGRG00015027817    61.242492      1.2772809 0.37859119  3.373773
    ## 438  ENSCGRG00015002955  1944.366409      1.2771717 0.09291290 13.745903
    ## 439  ENSCGRG00015009558   468.318023      1.2765511 0.15168447  8.415833
    ## 440  ENSCGRG00015000381   377.263824      1.2759336 0.16328665  7.814072
    ## 441  ENSCGRG00015026194  4888.160109      1.2741444 0.08101151 15.727943
    ## 442  ENSCGRG00015000502   265.358588      1.2741136 0.18807491  6.774500
    ## 443  ENSCGRG00015004384   339.586581      1.2736543 0.17183436  7.412105
    ## 444  ENSCGRG00015019371    48.712215      1.2722801 0.42178446  3.016422
    ## 445  ENSCGRG00015019371    48.712215      1.2722801 0.42178446  3.016422
    ## 446  ENSCGRG00015013286  2423.397592      1.2699584 0.08501068 14.938809
    ## 447  ENSCGRG00015009362   640.732910      1.2694913 0.13234770  9.592092
    ## 448  ENSCGRG00015011090   292.289968      1.2687844 0.18497081  6.859376
    ## 449  ENSCGRG00015007086  1889.671709      1.2682223 0.09676566 13.106120
    ## 450  ENSCGRG00015014137   279.948058      1.2665767 0.18373580  6.893467
    ## 451  ENSCGRG00015007928    81.239921      1.2656044 0.34495493  3.668898
    ## 452  ENSCGRG00015018040   905.631440      1.2641131 0.11848787 10.668714
    ## 453  ENSCGRG00015025810   807.602301      1.2629674 0.11957166 10.562431
    ## 454  ENSCGRG00015017020   386.378790      1.2627260 0.16699801  7.561324
    ## 455  ENSCGRG00015001844  3374.194348      1.2624067 0.07770162 16.246850
    ## 456  ENSCGRG00015007638  1325.067648      1.2613572 0.10024119 12.583223
    ## 457  ENSCGRG00015011025   410.449194      1.2610457 0.15776179  7.993353
    ## 458  ENSCGRG00015015836  1488.982255      1.2591311 0.09563176 13.166453
    ## 459  ENSCGRG00015019919  5661.863775      1.2587647 0.07898046 15.937672
    ## 460  ENSCGRG00015028447  5947.168058      1.2584512 0.06857108 18.352506
    ## 461  ENSCGRG00015008185   429.827556      1.2555333 0.15152184  8.286154
    ## 462  ENSCGRG00015010644   563.955880      1.2547556 0.13812118  9.084455
    ## 463  ENSCGRG00015025544  1853.278472      1.2544707 0.09267626 13.536052
    ## 464  ENSCGRG00015006789  1062.634034      1.2532376 0.12699545  9.868366
    ## 465  ENSCGRG00015005953  1054.772061      1.2530705 0.11149698 11.238604
    ## 466  ENSCGRG00015027931    35.001024      1.2522665 0.49411655  2.534354
    ## 467  ENSCGRG00015025878  1963.301550      1.2489184 0.08895885 14.039282
    ## 468  ENSCGRG00015009236   756.906898      1.2481103 0.12242975 10.194502
    ## 469  ENSCGRG00015002354   487.366297      1.2462028 0.14408116  8.649311
    ## 470  ENSCGRG00015005539  1889.711229      1.2443338 0.08834141 14.085510
    ## 471  ENSCGRG00015015107  1685.375318      1.2438459 0.09186180 13.540404
    ## 472  ENSCGRG00015019266  8563.794703      1.2423197 0.06984833 17.785961
    ## 473  ENSCGRG00015006386   456.439495      1.2418380 0.14920363  8.323108
    ## 474  ENSCGRG00015006151   492.778804      1.2410700 0.14456781  8.584691
    ## 475  ENSCGRG00015007176    91.764630      1.2407861 0.31183645  3.978964
    ## 476  ENSCGRG00015006268   627.595226      1.2402911 0.13455610  9.217650
    ## 477  ENSCGRG00015028102   345.206902      1.2393442 0.17822377  6.953866
    ## 478  ENSCGRG00015012332  2115.000524      1.2380758 0.09270164 13.355490
    ## 479  ENSCGRG00015010764    76.434531      1.2376988 0.34260435  3.612618
    ## 480  ENSCGRG00015014573   562.915806      1.2374105 0.15003059  8.247721
    ## 481  ENSCGRG00015006379  1482.940963      1.2355846 0.09914983 12.461792
    ## 482  ENSCGRG00015017399  2337.442445      1.2346337 0.08429825 14.646019
    ## 483  ENSCGRG00015014098   486.631323      1.2334105 0.14834409  8.314524
    ## 484  ENSCGRG00015022366  2518.112789      1.2331723 0.08999456 13.702742
    ## 485  ENSCGRG00015002404  1770.743533      1.2312156 0.09436503 13.047371
    ## 486  ENSCGRG00015020113   283.927738      1.2300116 0.18363145  6.698263
    ## 487  ENSCGRG00015003127   288.658775      1.2294254 0.18526757  6.635945
    ## 488  ENSCGRG00015018409  1025.045037      1.2293111 0.11503933 10.686007
    ## 489  ENSCGRG00015028159  1670.021995      1.2285706 0.10164603 12.086755
    ## 490  ENSCGRG00015014090 11747.821857      1.2265470 0.07264620 16.883842
    ## 491  ENSCGRG00015026116   947.506167      1.2252487 0.12451136  9.840457
    ## 492  ENSCGRG00015017007    66.415036      1.2241134 0.39480386  3.100561
    ## 493  ENSCGRG00015007258  2279.459003      1.2232376 0.10839739 11.284751
    ## 494  ENSCGRG00015027492   484.901765      1.2229559 0.14917286  8.198247
    ## 495  ENSCGRG00015014393   679.452411      1.2223018 0.12901818  9.473873
    ## 496  ENSCGRG00015004084    49.068789      1.2221622 0.42155107  2.899203
    ## 497  ENSCGRG00015003684  1856.340078      1.2210223 0.10133416 12.049464
    ## 498  ENSCGRG00015014476  4539.248753      1.2196350 0.07334182 16.629462
    ## 499  ENSCGRG00015006454   740.304552      1.2176877 0.12334246  9.872413
    ## 500  ENSCGRG00015009120   529.635950      1.2176634 0.14698399  8.284327
    ## 501  ENSCGRG00015016278  1033.311303      1.2173535 0.11837259 10.284083
    ## 502  ENSCGRG00015027661   255.196032      1.2172092 0.19365762  6.285367
    ## 503  ENSCGRG00015026986   740.207252      1.2168848 0.12151445 10.014321
    ## 504  ENSCGRG00015024140    85.180124      1.2158065 0.32158157  3.780710
    ## 505  ENSCGRG00015017341  1676.166652      1.2153224 0.09130018 13.311282
    ## 506  ENSCGRG00015023720   477.994015      1.2114524 0.14846191  8.160022
    ## 507  ENSCGRG00015028031   230.525075      1.2111231 0.19982272  6.060988
    ## 508  ENSCGRG00015012925   119.185960      1.2095319 0.27148001  4.455326
    ## 509  ENSCGRG00015008708   700.641986      1.2083803 0.12733690  9.489632
    ## 510  ENSCGRG00015014963  1280.560723      1.2071146 0.10657810 11.326104
    ## 511  ENSCGRG00015024860    50.560767      1.2067659 0.41394535  2.915278
    ## 512  ENSCGRG00015023072  1520.512544      1.2055592 0.09693289 12.437050
    ## 513  ENSCGRG00015002841  6472.963775      1.2052264 0.06864907 17.556340
    ## 514  ENSCGRG00015014124   438.395946      1.2050648 0.15071291  7.995764
    ## 515  ENSCGRG00015010067   595.450787      1.2047484 0.13438334  8.965013
    ## 516  ENSCGRG00015005609  1384.507872      1.2046123 0.09685948 12.436700
    ## 517  ENSCGRG00015019964    45.076178      1.2045143 0.44067582  2.733334
    ## 518  ENSCGRG00015013258   885.174033      1.2034467 0.11452681 10.507991
    ## 519  ENSCGRG00015021914  1634.223801      1.2032307 0.09193188 13.088286
    ## 520  ENSCGRG00015006085  1398.765666      1.2016657 0.09669905 12.426862
    ## 521  ENSCGRG00015006681   722.504982      1.1994568 0.12232363  9.805602
    ## 522  ENSCGRG00015006681   722.504982      1.1994568 0.12232363  9.805602
    ## 523  ENSCGRG00015024292   111.406834      1.1993775 0.29397972  4.079797
    ## 524  ENSCGRG00015008306  1554.264570      1.1986293 0.09748336 12.295732
    ## 525  ENSCGRG00015024253    55.989878      1.1982521 0.39380207  3.042777
    ## 526  ENSCGRG00015014245   507.877462      1.1973012 0.14127373  8.475045
    ## 527  ENSCGRG00015007780   390.507338      1.1972413 0.19691882  6.079872
    ## 528  ENSCGRG00015021638   110.637227      1.1963933 0.28745953  4.161954
    ## 529  ENSCGRG00015013610   242.937950      1.1956786 0.19522045  6.124761
    ## 530  ENSCGRG00015027366   248.932367      1.1921981 0.19346369  6.162387
    ## 531  ENSCGRG00015012984   651.342250      1.1918934 0.12725757  9.365992
    ## 532  ENSCGRG00015022359  5507.652407      1.1914036 0.07004349 17.009484
    ## 533  ENSCGRG00015028862  4144.680850      1.1912753 0.08874388 13.423747
    ## 534  ENSCGRG00015006303   185.054129      1.1909275 0.22068004  5.396625
    ## 535  ENSCGRG00015026508  1057.443888      1.1900000 0.10879539 10.937964
    ## 536  ENSCGRG00015025004  1387.923108      1.1897593 0.09703818 12.260734
    ## 537  ENSCGRG00015016212   130.276291      1.1889926 0.26676867  4.457017
    ## 538  ENSCGRG00015001972  1024.632203      1.1884494 0.11181954 10.628280
    ## 539  ENSCGRG00015018067    46.541403      1.1874569 0.43101497  2.755025
    ## 540  ENSCGRG00015023487   762.471362      1.1871126 0.12823483  9.257333
    ## 541  ENSCGRG00015014203   361.205096      1.1848080 0.16589078  7.142097
    ## 542  ENSCGRG00015005129  1483.255794      1.1835835 0.09479991 12.485070
    ## 543  ENSCGRG00015025595  2515.001650      1.1803177 0.10138687 11.641721
    ## 544  ENSCGRG00015028284   371.134435      1.1763851 0.16084274  7.313883
    ## 545  ENSCGRG00015013177   321.418568      1.1763397 0.18147826  6.481987
    ## 546  ENSCGRG00015004822   320.006955      1.1762587 0.17221356  6.830233
    ## 547  ENSCGRG00015003083   789.689916      1.1755198 0.12417840  9.466379
    ## 548  ENSCGRG00015028365   382.537557      1.1739576 0.16191507  7.250453
    ## 549  ENSCGRG00015007315   555.873075      1.1738283 0.13935282  8.423427
    ## 550  ENSCGRG00015014223   424.892127      1.1735103 0.15201351  7.719776
    ## 551  ENSCGRG00015001765  2204.466883      1.1728796 0.08945476 13.111427
    ## 552  ENSCGRG00015012839   347.754190      1.1720275 0.17810170  6.580664
    ## 553  ENSCGRG00015001788   994.509481      1.1719027 0.11070466 10.585848
    ## 554  ENSCGRG00015000755   537.381764      1.1717262 0.14639386  8.003930
    ## 555  ENSCGRG00015005002   284.308842      1.1696874 0.19809719  5.904614
    ## 556  ENSCGRG00015010088  1676.524413      1.1692639 0.09441571 12.384209
    ## 557  ENSCGRG00015006590  7248.337714      1.1687870 0.07992427 14.623680
    ## 558  ENSCGRG00015012901   403.370853      1.1673763 0.16027546  7.283562
    ## 559  ENSCGRG00015001950   583.667982      1.1669640 0.14298344  8.161532
    ## 560  ENSCGRG00015002351  9869.123767      1.1668796 0.06448710 18.094775
    ## 561  ENSCGRG00015008806    42.832180      1.1655619 0.45926393  2.537891
    ## 562  ENSCGRG00015022039   491.265017      1.1652991 0.14258884  8.172443
    ## 563  ENSCGRG00015006959   713.680464      1.1633918 0.12499092  9.307810
    ## 564  ENSCGRG00015027978  1400.678293      1.1633135 0.09780628 11.894057
    ## 565  ENSCGRG00015001744   689.947793      1.1630017 0.12450925  9.340685
    ## 566  ENSCGRG00015026816   488.537766      1.1625558 0.14652966  7.933928
    ## 567  ENSCGRG00015016417   151.491021      1.1609240 0.25634729  4.528716
    ## 568  ENSCGRG00015018539   210.826852      1.1601521 0.22033616  5.265373
    ## 569  ENSCGRG00015024364  2790.587953      1.1600674 0.08206695 14.135623
    ## 570  ENSCGRG00015001539  1542.238344      1.1592601 0.09558373 12.128215
    ## 571  ENSCGRG00015004259  1880.236800      1.1592487 0.09018180 12.854575
    ## 572  ENSCGRG00015013509  1096.878754      1.1585243 0.10612950 10.916139
    ## 573  ENSCGRG00015000854  1186.723853      1.1579057 0.10309066 11.231916
    ## 574  ENSCGRG00015018084  3417.517207      1.1573575 0.07728689 14.974824
    ## 575  ENSCGRG00015002850  2518.076338      1.1571417 0.08131334 14.230650
    ## 576  ENSCGRG00015006727   583.066594      1.1560339 0.13296433  8.694316
    ## 577  ENSCGRG00015010182   435.226747      1.1558257 0.15228854  7.589709
    ## 578  ENSCGRG00015026875  4623.800210      1.1542993 0.07871235 14.664779
    ## 579  ENSCGRG00015021928  3542.048192      1.1539142 0.07672377 15.039852
    ## 580  ENSCGRG00015016119   322.278630      1.1524368 0.17975021  6.411324
    ## 581  ENSCGRG00015021458   627.775064      1.1523868 0.12940142  8.905519
    ## 582  ENSCGRG00015021416  1376.313499      1.1508596 0.09864095 11.667158
    ## 583  ENSCGRG00015008818  1188.731674      1.1504258 0.10645436 10.806751
    ## 584  ENSCGRG00015025753   288.290806      1.1498444 0.18382864  6.254980
    ## 585  ENSCGRG00015025753   288.290806      1.1498444 0.18382864  6.254980
    ## 586  ENSCGRG00015028205   661.232658      1.1494279 0.13798708  8.329968
    ## 587  ENSCGRG00015019219   645.209196      1.1487585 0.12984612  8.847076
    ## 588  ENSCGRG00015001368  1071.156428      1.1478232 0.11958271  9.598571
    ## 589  ENSCGRG00015027169  7246.742464      1.1473868 0.06707169 17.106871
    ## 590  ENSCGRG00015006037   432.053549      1.1473850 0.15076847  7.610245
    ## 591  ENSCGRG00015024936   528.287029      1.1472961 0.13912310  8.246625
    ## 592  ENSCGRG00015016429  2615.337873      1.1464799 0.08568883 13.379573
    ## 593  ENSCGRG00015028875  1146.522053      1.1463519 0.10449648 10.970245
    ## 594  ENSCGRG00015002296   986.829714      1.1460794 0.11201975 10.231047
    ## 595  ENSCGRG00015008090   716.398733      1.1459622 0.12574568  9.113332
    ## 596  ENSCGRG00015008090   716.398733      1.1459622 0.12574568  9.113332
    ## 597  ENSCGRG00015014745   885.244422      1.1454305 0.11658441  9.824902
    ## 598  ENSCGRG00015005505    60.233770      1.1442577 0.39752971  2.878421
    ## 599  ENSCGRG00015025299   788.320437      1.1442025 0.13037177  8.776459
    ## 600  ENSCGRG00015012992   738.267999      1.1429772 0.12113771  9.435354
    ## 601  ENSCGRG00015023417   499.173668      1.1428687 0.14496979  7.883496
    ## 602  ENSCGRG00015002398  9236.993059      1.1427372 0.07282157 15.692290
    ## 603  ENSCGRG00015019678   661.566889      1.1415610 0.12879329  8.863513
    ## 604  ENSCGRG00015024117   843.695965      1.1413789 0.11567242  9.867338
    ## 605  ENSCGRG00015022147   232.978773      1.1399308 0.20464112  5.570390
    ## 606  ENSCGRG00015027902   658.865421      1.1397570 0.14279999  7.981492
    ## 607  ENSCGRG00015009934  1097.934459      1.1396321 0.11460362  9.944119
    ## 608  ENSCGRG00015023229   334.058161      1.1382455 0.16811330  6.770705
    ## 609  ENSCGRG00015015227   608.740197      1.1373008 0.15179144  7.492522
    ## 610  ENSCGRG00015014588   670.304303      1.1372489 0.12905460  8.812153
    ## 611  ENSCGRG00015015987   787.974713      1.1372121 0.11822415  9.619118
    ## 612  ENSCGRG00015013663  9498.481298      1.1360802 0.06681508 17.003349
    ## 613  ENSCGRG00015003964   194.505544      1.1357963 0.21838874  5.200801
    ## 614  ENSCGRG00015024695  2145.609956      1.1356867 0.09012209 12.601645
    ## 615  ENSCGRG00015004940   849.896851      1.1337285 0.12307836  9.211437
    ## 616  ENSCGRG00015023339   512.505035      1.1333167 0.14557339  7.785191
    ## 617  ENSCGRG00015023339   512.505035      1.1333167 0.14557339  7.785191
    ## 618  ENSCGRG00015002994   121.930307      1.1331750 0.26970733  4.201499
    ## 619  ENSCGRG00015006632   826.602257      1.1329636 0.30615148  3.700663
    ## 620  ENSCGRG00015004511   510.728006      1.1324884 0.14440503  7.842444
    ## 621  ENSCGRG00015015688   849.773090      1.1324106 0.11522071  9.828186
    ## 622  ENSCGRG00015004459  1255.751106      1.1321966 0.10370686 10.917278
    ## 623  ENSCGRG00015020501  2177.942536      1.1313066 0.09817087 11.523852
    ## 624  ENSCGRG00015022995   705.159074      1.1312738 0.12741053  8.878966
    ## 625  ENSCGRG00015012377   393.511808      1.1297771 0.16471870  6.858827
    ## 626  ENSCGRG00015015970   448.778959      1.1287135 0.15805385  7.141322
    ## 627  ENSCGRG00015015970   448.778959      1.1287135 0.15805385  7.141322
    ## 628  ENSCGRG00015001938   959.118590      1.1285573 0.11764496  9.592908
    ## 629  ENSCGRG00015003435    63.420054      1.1280855 0.37241198  3.029133
    ## 630  ENSCGRG00015003435    63.420054      1.1280855 0.37241198  3.029133
    ## 631  ENSCGRG00015028259  1612.544939      1.1279790 0.09466447 11.915548
    ## 632  ENSCGRG00015010901  1037.095136      1.1274495 0.11118233 10.140546
    ## 633  ENSCGRG00015014687   423.618626      1.1254033 0.15777995  7.132740
    ## 634  ENSCGRG00015018045   611.885175      1.1251565 0.13028731  8.635964
    ## 635  ENSCGRG00015024068  1799.241628      1.1249867 0.08926031 12.603438
    ## 636  ENSCGRG00015021666  3133.583107      1.1241951 0.07860702 14.301459
    ## 637  ENSCGRG00015002495   174.178854      1.1239410 0.23136704  4.857827
    ## 638  ENSCGRG00015013395  1066.471649      1.1234144 0.11028512 10.186455
    ## 639  ENSCGRG00015022085   361.006374      1.1217911 0.16777475  6.686293
    ## 640  ENSCGRG00015008732   254.209998      1.1214502 0.20029641  5.598953
    ## 641  ENSCGRG00015012636  2216.130424      1.1211995 0.09299417 12.056665
    ## 642  ENSCGRG00015026502   766.506729      1.1201554 0.12886153  8.692706
    ## 643  ENSCGRG00015003714  1273.400430      1.1201020 0.10019618 11.179089
    ## 644  ENSCGRG00015018433   108.468991      1.1197489 0.28688405  3.903141
    ## 645  ENSCGRG00015007431  6835.104623      1.1195830 0.07225260 15.495402
    ## 646  ENSCGRG00015002596   812.748837      1.1194640 0.11791376  9.493922
    ## 647  ENSCGRG00015010591   336.503496      1.1192222 0.16756438  6.679356
    ## 648  ENSCGRG00015002486   323.774702      1.1184803 0.17043419  6.562535
    ## 649  ENSCGRG00015022719   174.295712      1.1181248 0.23403141  4.777670
    ## 650  ENSCGRG00015000638   447.834547      1.1178775 0.15030440  7.437424
    ## 651  ENSCGRG00015028651  1368.889357      1.1171905 0.09838557 11.355228
    ## 652  ENSCGRG00015025752   142.030490      1.1158426 0.24942346  4.473687
    ## 653  ENSCGRG00015017423   852.763003      1.1157145 0.11794692  9.459462
    ## 654  ENSCGRG00015016803  2601.891446      1.1155270 0.08166798 13.659295
    ## 655  ENSCGRG00015016472  2241.985413      1.1148161 0.09333107 11.944748
    ## 656  ENSCGRG00015007973   396.137289      1.1142062 0.16075342  6.931151
    ## 657  ENSCGRG00015010346  3917.827480      1.1141571 0.09572832 11.638741
    ## 658  ENSCGRG00015001540   750.751890      1.1133400 0.12180516  9.140336
    ## 659  ENSCGRG00015018459   994.010969      1.1128765 0.10944498 10.168366
    ## 660  ENSCGRG00015009796  1307.252719      1.1123067 0.10024662 11.095703
    ## 661  ENSCGRG00015016753    62.556235      1.1118989 0.37146464  2.993283
    ## 662  ENSCGRG00015021314  1503.402070      1.1112786 0.09646413 11.520123
    ## 663  ENSCGRG00015018936   568.257870      1.1112439 0.13637907  8.148199
    ## 664  ENSCGRG00015012001   548.434787      1.1103458 0.13843499  8.020702
    ## 665  ENSCGRG00015021874   286.899992      1.1100837 0.19852531  5.591648
    ## 666  ENSCGRG00015015871   182.208290      1.1096232 0.22139040  5.012066
    ## 667  ENSCGRG00015018893  1060.704224      1.1091005 0.11152542  9.944822
    ## 668  ENSCGRG00015028778 12056.666044      1.1088952 0.06906881 16.054932
    ## 669  ENSCGRG00015015066  1811.656962      1.1086536 0.09245957 11.990685
    ## 670  ENSCGRG00015018941   402.202798      1.1084458 0.16246832  6.822535
    ## 671  ENSCGRG00015002748  2577.792388      1.1073212 0.08444305 13.113230
    ## 672  ENSCGRG00015002748  2577.792388      1.1073212 0.08444305 13.113230
    ## 673  ENSCGRG00015002748  2577.792388      1.1073212 0.08444305 13.113230
    ## 674  ENSCGRG00015019691   683.098373      1.1073130 0.12551768  8.821969
    ## 675  ENSCGRG00015008457  1193.017179      1.1070492 0.10952219 10.107990
    ## 676  ENSCGRG00015005026   125.044510      1.1064146 0.26592616  4.160608
    ## 677  ENSCGRG00015002409  1120.493583      1.1032395 0.11129421  9.912821
    ## 678  ENSCGRG00015002291   210.388767      1.1022798 0.21500411  5.126785
    ## 679  ENSCGRG00015023216  2496.856577      1.1018817 0.08400618 13.116674
    ## 680  ENSCGRG00015019534   513.351251      1.1001359 0.14455953  7.610262
    ## 681  ENSCGRG00015002660   708.418899      1.0996770 0.12724135  8.642450
    ## 682  ENSCGRG00015010765   157.980999      1.0987462 0.24378042  4.507114
    ## 683  ENSCGRG00015006752   134.955091      1.0981165 0.25805910  4.255291
    ## 684  ENSCGRG00015018703  5667.223472      1.0950549 0.07749120 14.131344
    ## 685  ENSCGRG00015020860   670.190940      1.0946891 0.13347529  8.201436
    ## 686  ENSCGRG00015000487  2724.219554      1.0945832 0.08246963 13.272561
    ## 687  ENSCGRG00015020586  1648.823693      1.0932480 0.09554950 11.441692
    ## 688  ENSCGRG00015020586  1648.823693      1.0932480 0.09554950 11.441692
    ## 689  ENSCGRG00015020586  1648.823693      1.0932480 0.09554950 11.441692
    ## 690  ENSCGRG00015020586  1648.823693      1.0932480 0.09554950 11.441692
    ## 691  ENSCGRG00015020586  1648.823693      1.0932480 0.09554950 11.441692
    ## 692  ENSCGRG00015020586  1648.823693      1.0932480 0.09554950 11.441692
    ## 693  ENSCGRG00015020586  1648.823693      1.0932480 0.09554950 11.441692
    ## 694  ENSCGRG00015020586  1648.823693      1.0932480 0.09554950 11.441692
    ## 695  ENSCGRG00015009419   831.110918      1.0927273 0.11652654  9.377497
    ## 696  ENSCGRG00015001071   485.422160      1.0925825 0.14394521  7.590267
    ## 697  ENSCGRG00015006736  1499.711275      1.0912673 0.09542583 11.435765
    ## 698  ENSCGRG00015017669  1846.971437      1.0912662 0.09935862 10.983106
    ## 699  ENSCGRG00015003665   503.836161      1.0908619 0.14351205  7.601187
    ## 700  ENSCGRG00015011202   495.431625      1.0908361 0.14852415  7.344503
    ## 701  ENSCGRG00015025483   228.257815      1.0904854 0.20094177  5.426873
    ## 702  ENSCGRG00015024519  2578.915844      1.0889006 0.09074962 11.998955
    ## 703  ENSCGRG00015016542  1441.183002      1.0887754 0.09551915 11.398504
    ## 704  ENSCGRG00015023336   787.984136      1.0886589 0.11902131  9.146756
    ## 705  ENSCGRG00015011735  1209.557732      1.0877756 0.11039058  9.853881
    ## 706  ENSCGRG00015011265   374.926211      1.0875321 0.16356383  6.648977
    ## 707  ENSCGRG00015001785   776.321761      1.0866957 0.12121712  8.964870
    ## 708  ENSCGRG00015021810    54.096854      1.0862140 0.40097875  2.708907
    ## 709  ENSCGRG00015020515   284.605672      1.0854370 0.18189405  5.967414
    ## 710  ENSCGRG00015021147   209.825261      1.0846988 0.23165368  4.682416
    ## 711  ENSCGRG00015006117  1292.970587      1.0841295 0.10014034 10.826101
    ## 712  ENSCGRG00015010582  1061.689274      1.0840707 0.10885621  9.958740
    ## 713  ENSCGRG00015014230   436.426762      1.0832220 0.15681052  6.907840
    ## 714  ENSCGRG00015018382   390.287442      1.0830214 0.16341289  6.627515
    ## 715  ENSCGRG00015013706   806.175851      1.0828203 0.12238842  8.847408
    ## 716  ENSCGRG00015026053  4260.433961      1.0826605 0.08896714 12.169219
    ## 717  ENSCGRG00015007179   843.333995      1.0825111 0.11653838  9.288881
    ## 718  ENSCGRG00015024353  1614.826680      1.0822624 0.11208372  9.655839
    ## 719  ENSCGRG00015024839  2092.136172      1.0815573 0.08685022 12.453132
    ## 720  ENSCGRG00015008359  2991.098170      1.0813298 0.07787271 13.885864
    ## 721  ENSCGRG00015013085   630.363424      1.0810771 0.13297761  8.129768
    ## 722  ENSCGRG00015015789   735.361844      1.0806810 0.12207987  8.852246
    ## 723  ENSCGRG00015025842  5551.617574      1.0800679 0.07651432 14.115892
    ## 724  ENSCGRG00015023555  1041.625988      1.0799910 0.10679813 10.112453
    ## 725  ENSCGRG00015027368  1238.019152      1.0798937 0.10651902 10.138037
    ## 726  ENSCGRG00015020238    58.465847      1.0791387 0.40097909  2.691259
    ## 727  ENSCGRG00015018533  1932.857600      1.0785426 0.09659615 11.165482
    ## 728  ENSCGRG00015020249   196.616384      1.0780177 0.21766254  4.952702
    ## 729  ENSCGRG00015021143  3244.753128      1.0766691 0.07768355 13.859679
    ## 730  ENSCGRG00015012451   645.962068      1.0762269 0.12794132  8.411879
    ## 731  ENSCGRG00015003658   446.484432      1.0758857 0.14817017  7.261149
    ## 732  ENSCGRG00015026695  1517.622875      1.0753434 0.10045906 10.704294
    ## 733  ENSCGRG00015019428  7654.453646      1.0751282 0.07277001 14.774330
    ## 734  ENSCGRG00015008477  4689.466181      1.0750504 0.08018398 13.407297
    ## 735  ENSCGRG00015006883   672.673385      1.0740838 0.13176197  8.151698
    ## 736  ENSCGRG00015022541   296.935640      1.0737204 0.18029426  5.955377
    ## 737  ENSCGRG00015019758  1969.559731      1.0735306 0.09442802 11.368772
    ## 738  ENSCGRG00015009586   114.932704      1.0734866 0.27625105  3.885909
    ## 739  ENSCGRG00015020367   180.291901      1.0720597 0.22621855  4.739044
    ## 740  ENSCGRG00015020367   180.291901      1.0720597 0.22621855  4.739044
    ## 741  ENSCGRG00015018198   331.137287      1.0718825 0.16883746  6.348606
    ## 742  ENSCGRG00015011021   729.887247      1.0712859 0.12732193  8.413993
    ## 743  ENSCGRG00015022656   946.510549      1.0710902 0.11389670  9.404049
    ## 744  ENSCGRG00015004600   117.148716      1.0696608 0.27688108  3.863250
    ## 745  ENSCGRG00015012482   685.235055      1.0695345 0.13588560  7.870845
    ## 746  ENSCGRG00015022715   463.718250      1.0693698 0.14619145  7.314859
    ## 747  ENSCGRG00015025668   112.254777      1.0692417 0.29809973  3.586859
    ## 748  ENSCGRG00015020921   140.189000      1.0692023 0.25119029  4.256543
    ## 749  ENSCGRG00015011774  1427.004653      1.0689076 0.10541301 10.140187
    ## 750  ENSCGRG00015017164   122.180298      1.0687315 0.27209830  3.927740
    ## 751  ENSCGRG00015017202   231.731373      1.0679187 0.21487444  4.969966
    ## 752  ENSCGRG00015011766    72.930400      1.0673658 0.35386750  3.016287
    ## 753  ENSCGRG00015028240   652.252128      1.0670204 0.12965933  8.229414
    ## 754  ENSCGRG00015017409   413.388912      1.0667610 0.15398470  6.927708
    ## 755  ENSCGRG00015023255   658.944620      1.0662709 0.12866257  8.287344
    ## 756  ENSCGRG00015018450   143.810278      1.0656129 0.24953081  4.270466
    ## 757  ENSCGRG00015026905  1951.217640      1.0648957 0.08719286 12.213107
    ## 758  ENSCGRG00015006764   703.874423      1.0646880 0.12441009  8.557891
    ## 759  ENSCGRG00015011326   313.756850      1.0644341 0.17348197  6.135705
    ## 760  ENSCGRG00015019084  2806.588718      1.0639515 0.08391620 12.678738
    ## 761  ENSCGRG00015027726    66.577189      1.0636507 0.36018015  2.953107
    ## 762  ENSCGRG00015024706   484.914791      1.0633425 0.14668354  7.249229
    ## 763  ENSCGRG00015026098  1158.281731      1.0630890 0.11420541  9.308570
    ## 764  ENSCGRG00015025655  1128.647502      1.0630500 0.10438594 10.183842
    ## 765  ENSCGRG00015007189  6092.334972      1.0622807 0.06996249 15.183576
    ## 766  ENSCGRG00015024408   754.789832      1.0619978 0.11990644  8.856887
    ## 767  ENSCGRG00015005679  1250.500053      1.0618849 0.10039999 10.576544
    ## 768  ENSCGRG00015007553    68.658337      1.0614338 0.35633109  2.978785
    ## 769  ENSCGRG00015002054  1376.787277      1.0612957 0.09662895 10.983206
    ## 770  ENSCGRG00015002054  1376.787277      1.0612957 0.09662895 10.983206
    ## 771  ENSCGRG00015006116    43.713776      1.0605621 0.44472019  2.384785
    ## 772  ENSCGRG00015007074   679.984649      1.0601330 0.13523312  7.839300
    ## 773  ENSCGRG00015027080  3187.724976      1.0598742 0.08385433 12.639469
    ## 774  ENSCGRG00015022400  1019.512797      1.0596460 0.11309256  9.369723
    ## 775  ENSCGRG00015020476  2873.020696      1.0591743 0.08623242 12.282785
    ## 776  ENSCGRG00015022870  1134.014302      1.0588386 0.10336380 10.243805
    ## 777  ENSCGRG00015027458   302.557604      1.0567698 0.17563827  6.016740
    ## 778  ENSCGRG00015008229  1333.959724      1.0565505 0.10005351 10.559854
    ## 779  ENSCGRG00015002686   429.855137      1.0550310 0.15223276  6.930381
    ## 780  ENSCGRG00015017497   543.365300      1.0544587 0.13641256  7.729924
    ## 781  ENSCGRG00015015155   331.462732      1.0537239 0.16993726  6.200664
    ## 782  ENSCGRG00015026741  2585.937850      1.0534273 0.08333479 12.640906
    ## 783  ENSCGRG00015007214  2474.998057      1.0527532 0.08466758 12.433960
    ## 784  ENSCGRG00015025560  1336.451763      1.0527343 0.09991457 10.536344
    ## 785  ENSCGRG00015017575   459.908242      1.0518444 0.15833938  6.642974
    ## 786  ENSCGRG00015018167  1118.465458      1.0516360 0.10660366  9.864915
    ## 787  ENSCGRG00015004339   453.205823      1.0514942 0.14747328  7.130066
    ## 788  ENSCGRG00015020574   229.170640      1.0488038 0.19918854  5.265383
    ## 789  ENSCGRG00015002723   901.719604      1.0486238 0.11203303  9.359953
    ## 790  ENSCGRG00015014136   129.170507      1.0477484 0.26009601  4.028314
    ## 791  ENSCGRG00015023392   339.457807      1.0474675 0.18173314  5.763767
    ## 792  ENSCGRG00015019847  2550.529652      1.0472531 0.08591764 12.189036
    ## 793  ENSCGRG00015018925  3434.825096      1.0471056 0.07748598 13.513485
    ## 794  ENSCGRG00015006142    39.175666      1.0470099 0.46545842  2.249417
    ## 795  ENSCGRG00015017520  3201.968638      1.0468581 0.07892402 13.264125
    ## 796  ENSCGRG00015000060   118.935330      1.0466439 0.26966627  3.881256
    ## 797  ENSCGRG00015013329   342.183816      1.0449288 0.16712769  6.252278
    ## 798  ENSCGRG00015011754   374.780437      1.0447649 0.16221359  6.440674
    ## 799  ENSCGRG00015013814  1833.314012      1.0443426 0.09284093 11.248730
    ## 800  ENSCGRG00015017858   897.167884      1.0442023 0.11283698  9.254079
    ## 801  ENSCGRG00015004295    85.324940      1.0440758 0.31657772  3.298008
    ## 802  ENSCGRG00015021737  1332.047949      1.0439674 0.10551223  9.894279
    ## 803  ENSCGRG00015007110  2159.350737      1.0424334 0.08594559 12.128992
    ## 804  ENSCGRG00015008301   109.684211      1.0407425 0.28417142  3.662376
    ## 805  ENSCGRG00015018427 15771.032687      1.0405062 0.07592229 13.704884
    ## 806  ENSCGRG00015016298    61.612825      1.0403948 0.37671853  2.761730
    ## 807  ENSCGRG00015002912   541.814257      1.0397197 0.14177372  7.333656
    ## 808  ENSCGRG00015026221 10491.593598      1.0393203 0.07068055 14.704473
    ## 809  ENSCGRG00015005287   749.754633      1.0389976 0.12695932  8.183705
    ## 810  ENSCGRG00015009696   232.119347      1.0386691 0.19826295  5.238846
    ## 811  ENSCGRG00015015916   677.175725      1.0377508 0.12982777  7.993288
    ## 812  ENSCGRG00015028182   705.531926      1.0374140 0.12791917  8.109918
    ## 813  ENSCGRG00015000198   631.147570      1.0370966 0.12880047  8.051963
    ## 814  ENSCGRG00015000126   585.166250      1.0366256 0.13304356  7.791626
    ## 815  ENSCGRG00015000126   585.166250      1.0366256 0.13304356  7.791626
    ## 816  ENSCGRG00015015781   615.056720      1.0353750 0.13235605  7.822650
    ## 817  ENSCGRG00015019989    98.998001      1.0338614 0.30048600  3.440631
    ## 818  ENSCGRG00015021135   622.531732      1.0337281 0.13143425  7.864983
    ## 819  ENSCGRG00015026461  2068.947207      1.0333187 0.08604485 12.009070
    ## 820  ENSCGRG00015002846  2536.931269      1.0331982 0.08579229 12.043020
    ## 821  ENSCGRG00015027761  2861.873052      1.0331806 0.07955066 12.987706
    ## 822  ENSCGRG00015014174   320.419762      1.0331418 0.17590163  5.873407
    ## 823  ENSCGRG00015012316  5589.045074      1.0330666 0.06914106 14.941434
    ## 824  ENSCGRG00015009766 10738.893378      1.0329730 0.08071670 12.797513
    ## 825  ENSCGRG00015011235   114.752872      1.0324205 0.27483544  3.756504
    ## 826  ENSCGRG00015021973   882.792713      1.0324014 0.11861095  8.704098
    ## 827  ENSCGRG00015003406  1056.359146      1.0316712 0.11255102  9.166253
    ## 828  ENSCGRG00015024230   711.858521      1.0311051 0.12887551  8.000784
    ## 829  ENSCGRG00015024230   711.858521      1.0311051 0.12887551  8.000784
    ## 830  ENSCGRG00015028832  5376.854383      1.0298577 0.07256313 14.192575
    ## 831  ENSCGRG00015017121   135.603349      1.0297477 0.26113821  3.943305
    ## 832  ENSCGRG00015008703   172.747136      1.0296444 0.23009489  4.474868
    ## 833  ENSCGRG00015025290   221.562786      1.0292824 0.20605120  4.995275
    ## 834  ENSCGRG00015004833    48.352309      1.0289968 0.41859901  2.458192
    ## 835  ENSCGRG00015011377   776.787879      1.0281996 0.12430840  8.271360
    ## 836  ENSCGRG00015012987   164.074468      1.0281047 0.23404368  4.392790
    ## 837  ENSCGRG00015025946   553.131771      1.0264539 0.13525134  7.589233
    ## 838  ENSCGRG00015016081   646.773909      1.0257528 0.12909794  7.945540
    ## 839  ENSCGRG00015025652  1081.334399      1.0256075 0.11741271  8.735064
    ## 840  ENSCGRG00015007187   414.344062      1.0253666 0.16795475  6.105017
    ## 841  ENSCGRG00015024569   406.521576      1.0248926 0.17088150  5.997680
    ## 842  ENSCGRG00015011816   594.328696      1.0246260 0.13983038  7.327635
    ## 843  ENSCGRG00015021793    46.222523      1.0240442 0.43751871  2.340572
    ## 844  ENSCGRG00015002186   701.657323      1.0236846 0.12377867  8.270283
    ## 845  ENSCGRG00015010281    56.072152      1.0236368 0.39249944  2.607996
    ## 846  ENSCGRG00015006030  1069.823105      1.0234745 0.12267907  8.342699
    ## 847  ENSCGRG00015021181  1233.835556      1.0226273 0.10070164 10.155021
    ## 848  ENSCGRG00015028049   233.089309      1.0223204 0.20024418  5.105369
    ## 849  ENSCGRG00015001550   358.263892      1.0215349 0.16300758  6.266794
    ## 850  ENSCGRG00015014785   835.726408      1.0207588 0.12199143  8.367463
    ## 851  ENSCGRG00015024669   510.748610      1.0194507 0.14221135  7.168560
    ## 852  ENSCGRG00015021203   325.854329      1.0194373 0.17151661  5.943666
    ## 853  ENSCGRG00015004246  1179.809171      1.0190669 0.12827755  7.944234
    ## 854  ENSCGRG00015024554   525.668387      1.0186380 0.14243078  7.151811
    ## 855  ENSCGRG00015024554   525.668387      1.0186380 0.14243078  7.151811
    ## 856  ENSCGRG00015003437  3950.249768      1.0184379 0.07749083 13.142690
    ## 857  ENSCGRG00015006728   416.947744      1.0179748 0.15656047  6.502119
    ## 858  ENSCGRG00015012530  3910.219205      1.0169663 0.07898138 12.876026
    ## 859  ENSCGRG00015000757   108.547637      1.0165869 0.28555313  3.560062
    ## 860  ENSCGRG00015021936  1378.597166      1.0161398 0.09968236 10.193777
    ## 861  ENSCGRG00015002084   349.860110      1.0150151 0.16969760  5.981317
    ## 862  ENSCGRG00015007564   369.294624      1.0142410 0.16128712  6.288419
    ## 863  ENSCGRG00015007406   773.576118      1.0135215 0.12048977  8.411681
    ## 864  ENSCGRG00015023380    44.348387      1.0125386 0.44498041  2.275468
    ## 865  ENSCGRG00015009016  2155.715116      1.0116205 0.09269479 10.913456
    ## 866  ENSCGRG00015020948  1079.803650      1.0111923 0.11175502  9.048295
    ## 867  ENSCGRG00015004505   332.195733      1.0111726 0.16820195  6.011658
    ## 868  ENSCGRG00015002601   656.646463      1.0107534 0.12649178  7.990665
    ## 869  ENSCGRG00015017111  1673.998271      1.0097421 0.09076266 11.125082
    ## 870  ENSCGRG00015021813   343.465522      1.0096918 0.17202543  5.869433
    ## 871  ENSCGRG00015010122   888.066250      1.0089938 0.11224795  8.988973
    ## 872  ENSCGRG00015001097  1194.870753      1.0078781 0.10217619  9.864119
    ## 873  ENSCGRG00015011999   802.274661      1.0078775 0.11735000  8.588645
    ## 874  ENSCGRG00015012645  6638.849196      1.0076297 0.07536722 13.369602
    ## 875  ENSCGRG00015004697  1484.140810      1.0073312 0.11175606  9.013661
    ## 876  ENSCGRG00015015840  2641.860769      1.0059496 0.09014658 11.159043
    ## 877  ENSCGRG00015028801   666.244990      1.0057923 0.12519032  8.034106
    ## 878  ENSCGRG00015028801   666.244990      1.0057923 0.12519032  8.034106
    ## 879  ENSCGRG00015020341   589.655090      1.0054151 0.14747950  6.817321
    ## 880  ENSCGRG00015005663   777.950666      1.0051239 0.14081378  7.137965
    ## 881  ENSCGRG00015020328   424.007194      1.0048645 0.15127336  6.642706
    ## 882  ENSCGRG00015021772  1592.077015      1.0048082 0.10410088  9.652254
    ## 883  ENSCGRG00015011485   618.530814      1.0044690 0.13172718  7.625374
    ## 884  ENSCGRG00015006420  2474.360190      1.0041176 0.08379158 11.983514
    ## 885  ENSCGRG00015008644   933.732149      1.0038896 0.11370113  8.829197
    ## 886  ENSCGRG00015016902   163.699330      1.0036001 0.23766994  4.222663
    ## 887  ENSCGRG00015021035    73.700920      1.0024124 0.34626359  2.894940
    ## 888  ENSCGRG00015021347   377.338989      1.0010253 0.16415774  6.097948
    ## 889  ENSCGRG00015004975   162.690914      1.0010071 0.23648121  4.232924
    ## 890  ENSCGRG00015014237    87.192242      1.0002194 0.31357546  3.189725
    ## 891  ENSCGRG00015000703   288.267759      1.0001723 0.17993181  5.558618
    ## 892  ENSCGRG00015012415   254.156627      0.9992125 0.19165359  5.213638
    ## 893  ENSCGRG00015010817  1300.855357      0.9984399 0.10819542  9.228115
    ## 894  ENSCGRG00015010817  1300.855357      0.9984399 0.10819542  9.228115
    ## 895  ENSCGRG00015015774   226.131207      0.9977361 0.22032538  4.528466
    ## 896  ENSCGRG00015001460   947.068242      0.9975404 0.11245028  8.870946
    ## 897  ENSCGRG00015026314  1444.252198      0.9973069 0.10174389  9.802130
    ## 898  ENSCGRG00015001822  1616.781878      0.9972573 0.09740241 10.238528
    ## 899  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 900  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 901  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 902  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 903  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 904  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 905  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 906  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 907  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 908  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 909  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 910  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 911  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 912  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 913  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 914  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 915  ENSCGRG00015005249   783.937677      0.9971876 0.12524652  7.961799
    ## 916  ENSCGRG00015026920   751.451484      0.9967561 0.12314613  8.094092
    ## 917  ENSCGRG00015008784   549.638034      0.9967325 0.13612718  7.322068
    ## 918  ENSCGRG00015008428  1523.515434      0.9942494 0.09569654 10.389607
    ## 919  ENSCGRG00015000676  2858.942795      0.9937519 0.08092397 12.280068
    ## 920  ENSCGRG00015027001    48.400707      0.9924065 0.41623067  2.384270
    ## 921  ENSCGRG00015014861  5466.953002      0.9913196 0.07078261 14.005129
    ## 922  ENSCGRG00015024020   518.370402      0.9912158 0.13963170  7.098788
    ## 923  ENSCGRG00015016318   402.772598      0.9909809 0.15600541  6.352221
    ## 924  ENSCGRG00015023292   428.143764      0.9908465 0.15108584  6.558169
    ## 925  ENSCGRG00015005260  4740.036887      0.9900935 0.08178020 12.106762
    ## 926  ENSCGRG00015007660   638.102393      0.9896965 0.12871758  7.688899
    ## 927  ENSCGRG00015025213  1314.384279      0.9893901 0.10197439  9.702339
    ## 928  ENSCGRG00015001488   155.420386      0.9892123 0.23864518  4.145117
    ## 929  ENSCGRG00015006036    63.036602      0.9890387 0.36868448  2.682616
    ## 930  ENSCGRG00015028378  2349.173780      0.9887327 0.08736511 11.317249
    ## 931  ENSCGRG00015009998  1537.873545      0.9885019 0.09641193 10.252900
    ## 932  ENSCGRG00015015217  1424.796251      0.9884737 0.09624480 10.270411
    ## 933  ENSCGRG00015022569  2174.249556      0.9873070 0.08556661 11.538461
    ## 934  ENSCGRG00015009722   769.466147      0.9871282 0.11952847  8.258520
    ## 935  ENSCGRG00015009289   798.901340      0.9863811 0.11851632  8.322745
    ## 936  ENSCGRG00015024460  3259.582722      0.9855837 0.08188203 12.036630
    ## 937  ENSCGRG00015008832   398.133746      0.9852069 0.15608932  6.311815
    ## 938  ENSCGRG00015016021   412.573456      0.9841241 0.15287922  6.437265
    ## 939  ENSCGRG00015022606  2155.053381      0.9839503 0.08449168 11.645529
    ## 940  ENSCGRG00015007221   507.908095      0.9829559 0.14097740  6.972436
    ## 941  ENSCGRG00015003246   424.661136      0.9828679 0.16378450  6.000982
    ## 942  ENSCGRG00015022406   159.343811      0.9811713 0.24247084  4.046554
    ## 943  ENSCGRG00015026686   573.801383      0.9810947 0.14777183  6.639254
    ## 944  ENSCGRG00015016950  1260.429367      0.9810852 0.10225188  9.594789
    ## 945  ENSCGRG00015025837  1819.682535      0.9809268 0.09227303 10.630699
    ## 946  ENSCGRG00015014438   406.072350      0.9789918 0.15620296  6.267435
    ## 947  ENSCGRG00015017172   343.690899      0.9788122 0.16566371  5.908428
    ## 948  ENSCGRG00015008848   717.693229      0.9780038 0.12201867  8.015198
    ## 949  ENSCGRG00015015578  1320.813806      0.9779145 0.10273919  9.518418
    ## 950  ENSCGRG00015012697   395.528504      0.9774967 0.15572976  6.276878
    ## 951  ENSCGRG00015018373   940.769845      0.9768762 0.12812758  7.624246
    ## 952  ENSCGRG00015024994   266.821714      0.9766805 0.18847060  5.182137
    ## 953  ENSCGRG00015012321    75.965329      0.9754653 0.33465414  2.914846
    ## 954  ENSCGRG00015010110   939.752301      0.9751736 0.11489424  8.487576
    ## 955  ENSCGRG00015006836  4259.989667      0.9749882 0.07573944 12.872926
    ## 956  ENSCGRG00015020674    53.521402      0.9742303 0.39954545  2.438347
    ## 957  ENSCGRG00015015278  2607.706193      0.9737069 0.08152793 11.943232
    ## 958  ENSCGRG00015006660   466.154334      0.9735693 0.15386253  6.327527
    ## 959  ENSCGRG00015010425  1737.618768      0.9733385 0.09484531 10.262379
    ## 960  ENSCGRG00015015183   489.211712      0.9732771 0.14445881  6.737402
    ## 961  ENSCGRG00015013500    78.430854      0.9727057 0.39876673  2.439285
    ## 962  ENSCGRG00015021817   782.690111      0.9719580 0.11774183  8.254993
    ## 963  ENSCGRG00015021165   423.150433      0.9712392 0.15119894  6.423585
    ## 964  ENSCGRG00015008877   415.684453      0.9706140 0.15478812  6.270597
    ## 965  ENSCGRG00015008501   576.904562      0.9700307 0.14095264  6.881962
    ## 966  ENSCGRG00015020206   828.467749      0.9695379 0.11643709  8.326710
    ## 967  ENSCGRG00015025461   502.296656      0.9679909 0.14801163  6.539966
    ## 968  ENSCGRG00015007516   511.131854      0.9667807 0.14615712  6.614667
    ## 969  ENSCGRG00015004729   518.089220      0.9663197 0.14145267  6.831399
    ## 970  ENSCGRG00015014911   758.261654      0.9662436 0.11922944  8.104069
    ## 971  ENSCGRG00015000781  1222.620028      0.9659649 0.10560549  9.146919
    ## 972  ENSCGRG00015010386   631.940210      0.9655989 0.13735216  7.030096
    ## 973  ENSCGRG00015010651   398.515528      0.9655351 0.15531380  6.216673
    ## 974  ENSCGRG00015010170   868.165976      0.9655092 0.11624039  8.306142
    ## 975  ENSCGRG00015016259   684.586748      0.9650305 0.12396905  7.784447
    ## 976  ENSCGRG00015021386   159.488152      0.9646364 0.25172326  3.832131
    ## 977  ENSCGRG00015006351   281.996838      0.9644336 0.18908096  5.100638
    ## 978  ENSCGRG00015004008    86.968386      0.9632360 0.31488159  3.059042
    ## 979  ENSCGRG00015026463   238.955373      0.9628250 0.19582934  4.916653
    ## 980  ENSCGRG00015007588   484.009539      0.9622937 0.15296650  6.290879
    ## 981  ENSCGRG00015017381   636.449954      0.9617544 0.13234888  7.266812
    ## 982  ENSCGRG00015011343  9654.765617      0.9610172 0.07131881 13.474948
    ## 983  ENSCGRG00015021451   318.713744      0.9596965 0.17424657  5.507692
    ## 984  ENSCGRG00015021173  4145.484617      0.9588088 0.08858873 10.823147
    ## 985  ENSCGRG00015015589   248.363308      0.9578787 0.19296670  4.963959
    ## 986  ENSCGRG00015019501  1286.155930      0.9578182 0.10359096  9.246156
    ## 987  ENSCGRG00015018790   944.227549      0.9570504 0.11672978  8.198854
    ## 988  ENSCGRG00015020304  3027.896731      0.9567256 0.08337897 11.474423
    ## 989  ENSCGRG00015001185   584.783928      0.9567096 0.13549974  7.060601
    ## 990  ENSCGRG00015002731   516.392559      0.9560239 0.13940408  6.857934
    ## 991  ENSCGRG00015027413  1834.852086      0.9554967 0.10827130  8.825024
    ## 992  ENSCGRG00015027413  1834.852086      0.9554967 0.10827130  8.825024
    ## 993  ENSCGRG00015028734  3473.138982      0.9554238 0.08521781 11.211551
    ## 994  ENSCGRG00015028734  3473.138982      0.9554238 0.08521781 11.211551
    ## 995  ENSCGRG00015019706  1052.091183      0.9553650 0.11373302  8.400067
    ## 996  ENSCGRG00015027408  1279.936338      0.9550760 0.10329667  9.245951
    ## 997  ENSCGRG00015015281  1138.467116      0.9549601 0.10402988  9.179671
    ## 998  ENSCGRG00015016306   608.621669      0.9541827 0.13031325  7.322223
    ## 999  ENSCGRG00015009992  3177.830101      0.9539314 0.08233727 11.585658
    ## 1000 ENSCGRG00015017831   858.013850      0.9529661 0.11683050  8.156826
    ## 1001 ENSCGRG00015001757  3580.948099      0.9528711 0.08383304 11.366296
    ## 1002 ENSCGRG00015012890 20308.143855      0.9519565 0.06165825 15.439240
    ## 1003 ENSCGRG00015011879  1042.880627      0.9518211 0.11229526  8.476058
    ## 1004 ENSCGRG00015008608  6557.486839      0.9511856 0.07605483 12.506577
    ## 1005 ENSCGRG00015000008  1734.822673      0.9511191 0.09468494 10.045094
    ## 1006 ENSCGRG00015002575   679.071683      0.9509506 0.13481083  7.053962
    ## 1007 ENSCGRG00015017758   288.946269      0.9509439 0.18246843  5.211553
    ## 1008 ENSCGRG00015016865  1265.168611      0.9508436 0.10443763  9.104415
    ## 1009 ENSCGRG00015011931  1323.304381      0.9507311 0.10703752  8.882223
    ## 1010 ENSCGRG00015012153   557.023586      0.9499795 0.13932389  6.818497
    ## 1011 ENSCGRG00015006395   529.481659      0.9498973 0.14025670  6.772562
    ## 1012 ENSCGRG00015001321   450.640412      0.9484098 0.16552043  5.729865
    ## 1013 ENSCGRG00015002785   228.621363      0.9482450 0.19931438  4.757535
    ## 1014 ENSCGRG00015016219   985.269146      0.9475673 0.11088726  8.545322
    ## 1015 ENSCGRG00015024771   119.674424      0.9471390 0.27204744  3.481521
    ## 1016 ENSCGRG00015013567  1993.436070      0.9470932 0.08845742 10.706769
    ## 1017 ENSCGRG00015008170   306.047117      0.9460215 0.17554597  5.389025
    ## 1018 ENSCGRG00015003740   607.566205      0.9457534 0.13040762  7.252286
    ## 1019 ENSCGRG00015000343   590.079463      0.9456400 0.13719042  6.892901
    ## 1020 ENSCGRG00015025375  1117.804922      0.9452480 0.11967873  7.898212
    ## 1021 ENSCGRG00015002129  1369.985543      0.9452205 0.10025130  9.428512
    ## 1022 ENSCGRG00015009949  1059.369084      0.9450216 0.11229499  8.415528
    ## 1023 ENSCGRG00015003024  1001.318746      0.9446667 0.11907630  7.933289
    ## 1024 ENSCGRG00015017078   753.054595      0.9439022 0.11954221  7.895974
    ## 1025 ENSCGRG00015016755   312.094483      0.9435343 0.17239193  5.473193
    ## 1026 ENSCGRG00015022190   159.340779      0.9427759 0.23558874  4.001787
    ## 1027 ENSCGRG00015028239 11384.699848      0.9424807 0.06864870 13.729040
    ## 1028 ENSCGRG00015019171  1024.815342      0.9421331 0.10986419  8.575434
    ## 1029 ENSCGRG00015001484  5875.907466      0.9416784 0.09594846  9.814419
    ## 1030 ENSCGRG00015001484  5875.907466      0.9416784 0.09594846  9.814419
    ## 1031 ENSCGRG00015007789   641.191729      0.9412891 0.12879910  7.308196
    ## 1032 ENSCGRG00015004179   340.550706      0.9411914 0.17413030  5.405099
    ## 1033 ENSCGRG00015002309  1397.610041      0.9407923 0.09674976  9.723975
    ## 1034 ENSCGRG00015009398   445.471537      0.9407859 0.14805677  6.354224
    ## 1035 ENSCGRG00015013364   390.478458      0.9386857 0.15905977  5.901465
    ## 1036 ENSCGRG00015025226   134.102567      0.9384261 0.25406677  3.693620
    ## 1037 ENSCGRG00015019621   664.589432      0.9382589 0.12579708  7.458511
    ## 1038 ENSCGRG00015009927  6814.751019      0.9382023 0.07008917 13.385838
    ## 1039 ENSCGRG00015006531   385.307477      0.9378856 0.17212447  5.448880
    ## 1040 ENSCGRG00015006783   235.561454      0.9378184 0.19734605  4.752152
    ## 1041 ENSCGRG00015012119   981.036047      0.9368457 0.11152650  8.400207
    ## 1042 ENSCGRG00015002138   816.689379      0.9365517 0.13464689  6.955613
    ## 1043 ENSCGRG00015020744   406.388859      0.9362390 0.15360523  6.095098
    ## 1044 ENSCGRG00015004305   866.229812      0.9361030 0.11399805  8.211570
    ## 1045 ENSCGRG00015003644  2866.668299      0.9358387 0.08213222 11.394293
    ## 1046 ENSCGRG00015023460   144.152692      0.9348464 0.25222065  3.706462
    ## 1047 ENSCGRG00015015059   654.961021      0.9341900 0.12603872  7.411929
    ## 1048 ENSCGRG00015016404  5835.441120      0.9341489 0.06968648 13.405024
    ## 1049 ENSCGRG00015026039   704.219053      0.9337192 0.13363283  6.987199
    ## 1050 ENSCGRG00015017999   657.276364      0.9319692 0.12915603  7.215840
    ## 1051 ENSCGRG00015015808    56.654911      0.9318859 0.41331826  2.254645
    ## 1052 ENSCGRG00015015808    56.654911      0.9318859 0.41331826  2.254645
    ## 1053 ENSCGRG00015015600  7074.703615      0.9317994 0.06729043 13.847429
    ## 1054 ENSCGRG00015021773   132.484088      0.9317330 0.26041432  3.577887
    ## 1055 ENSCGRG00015004011   182.051435      0.9305094 0.22119015  4.206830
    ## 1056 ENSCGRG00015000829  1449.865343      0.9302450 0.09920361  9.377129
    ## 1057 ENSCGRG00015009805   296.668756      0.9296245 0.18098581  5.136450
    ## 1058 ENSCGRG00015017401  1244.354328      0.9294825 0.10410915  8.927962
    ## 1059 ENSCGRG00015004098   583.880375      0.9286102 0.14345772  6.473059
    ## 1060 ENSCGRG00015004098   583.880375      0.9286102 0.14345772  6.473059
    ## 1061 ENSCGRG00015006245   245.019266      0.9281545 0.19369964  4.791720
    ## 1062 ENSCGRG00015021032  1491.788414      0.9273520 0.09816554  9.446818
    ## 1063 ENSCGRG00015004286  5106.500186      0.9272143 0.07063653 13.126555
    ## 1064 ENSCGRG00015027815   642.197943      0.9270761 0.14774276  6.274934
    ## 1065 ENSCGRG00015013272   660.915159      0.9267834 0.12780403  7.251598
    ## 1066 ENSCGRG00015023251   445.683140      0.9265537 0.14863929  6.233572
    ## 1067 ENSCGRG00015028761  1384.445669      0.9260083 0.10517196  8.804708
    ## 1068 ENSCGRG00015015852   399.507996      0.9259731 0.15754734  5.877428
    ## 1069 ENSCGRG00015018475 18190.918126      0.9259322 0.06214992 14.898365
    ## 1070 ENSCGRG00015006319  2181.942527      0.9256866 0.08493613 10.898620
    ## 1071 ENSCGRG00015012746  4990.581360      0.9256853 0.07142283 12.960636
    ## 1072 ENSCGRG00015017814   531.197309      0.9254476 0.13867906  6.673305
    ## 1073 ENSCGRG00015001051   299.563156      0.9239949 0.17908436  5.159551
    ## 1074 ENSCGRG00015008697  3439.185577      0.9239921 0.07885057 11.718268
    ## 1075 ENSCGRG00015021620   318.829962      0.9228163 0.17154083  5.379572
    ## 1076 ENSCGRG00015011102   320.078263      0.9222649 0.17556470  5.253134
    ## 1077 ENSCGRG00015007910   554.790867      0.9218605 0.14675269  6.281728
    ## 1078 ENSCGRG00015003751  1211.788241      0.9218521 0.10286107  8.962108
    ## 1079 ENSCGRG00015010054  8437.220625      0.9218152 0.16846488  5.471854
    ## 1080 ENSCGRG00015013353  1911.347229      0.9211849 0.09714491  9.482585
    ## 1081 ENSCGRG00015024275   490.619114      0.9207524 0.15452370  5.958648
    ## 1082 ENSCGRG00015025352  1880.099204      0.9206657 0.09494472  9.696861
    ## 1083 ENSCGRG00015015956   342.394542      0.9204866 0.17293405  5.322761
    ## 1084 ENSCGRG00015026435  3097.557947      0.9202861 0.07910764 11.633340
    ## 1085 ENSCGRG00015022675   132.603826      0.9196248 0.25933175  3.546133
    ## 1086 ENSCGRG00015017843   190.913631      0.9193963 0.21969777  4.184823
    ## 1087 ENSCGRG00015007308    95.313982      0.9171547 0.34835382  2.632825
    ## 1088 ENSCGRG00015014946   724.292194      0.9165715 0.12080897  7.586949
    ## 1089 ENSCGRG00015005790  1129.699513      0.9156594 0.10278570  8.908432
    ## 1090 ENSCGRG00015013640  6449.187862      0.9153503 0.07319952 12.504867
    ## 1091 ENSCGRG00015014381   651.037815      0.9151228 0.12877172  7.106551
    ## 1092 ENSCGRG00015004206   900.089800      0.9140711 0.11294945  8.092745
    ## 1093 ENSCGRG00015012677  1466.205019      0.9139870 0.09472429  9.648919
    ## 1094 ENSCGRG00015010857   394.103847      0.9139857 0.15912051  5.743984
    ## 1095 ENSCGRG00015004578  1596.482858      0.9136720 0.09966217  9.167692
    ## 1096 ENSCGRG00015028311  1062.493763      0.9131712 0.11220456  8.138450
    ## 1097 ENSCGRG00015008873  1223.199068      0.9130929 0.10081368  9.057232
    ## 1098 ENSCGRG00015000541   365.872747      0.9116139 0.16028790  5.687353
    ## 1099 ENSCGRG00015006709   999.150905      0.9114138 0.11172848  8.157400
    ## 1100 ENSCGRG00015009626  1436.840578      0.9113013 0.10390234  8.770749
    ## 1101 ENSCGRG00015005853   397.204321      0.9110465 0.15811012  5.762101
    ## 1102 ENSCGRG00015015573   427.354883      0.9109832 0.14980100  6.081289
    ## 1103 ENSCGRG00015017534  1090.644465      0.9106721 0.10555549  8.627426
    ## 1104 ENSCGRG00015001244   138.415270      0.9104312 0.25048806  3.634629
    ## 1105 ENSCGRG00015004563   304.168975      0.9104048 0.17562036  5.183936
    ## 1106 ENSCGRG00015001803   592.201345      0.9103015 0.13162556  6.915842
    ## 1107 ENSCGRG00015002865  3325.332945      0.9102030 0.07687834 11.839524
    ## 1108 ENSCGRG00015018665  1067.650657      0.9100334 0.10569198  8.610241
    ## 1109 ENSCGRG00015019211  3868.480220      0.9091968 0.07645643 11.891698
    ## 1110 ENSCGRG00015005453   407.885571      0.9091560 0.15538902  5.850838
    ## 1111 ENSCGRG00015025682   685.717018      0.9088971 0.12409170  7.324398
    ## 1112 ENSCGRG00015014325  2192.322074      0.9085474 0.08591879 10.574490
    ## 1113 ENSCGRG00015017549   462.195997      0.9083959 0.14561459  6.238358
    ## 1114 ENSCGRG00015021525  1000.906021      0.9082069 0.11019275  8.241984
    ## 1115 ENSCGRG00015028307   492.877781      0.9068921 0.14168625  6.400706
    ## 1116 ENSCGRG00015028376   178.684833      0.9062216 0.23183535  3.908902
    ## 1117 ENSCGRG00015012306   573.982066      0.9061754 0.13464440  6.730138
    ## 1118 ENSCGRG00015003885   904.737777      0.9057739 0.12902235  7.020287
    ## 1119 ENSCGRG00015016378  1166.882484      0.9052789 0.10727365  8.438968
    ## 1120 ENSCGRG00015026025  1669.653336      0.9045094 0.09129503  9.907543
    ## 1121 ENSCGRG00015008371   554.093314      0.9040803 0.13985387  6.464464
    ## 1122 ENSCGRG00015016024   749.607589      0.9034891 0.12068670  7.486236
    ## 1123 ENSCGRG00015010709   546.746035      0.9032630 0.13738518  6.574676
    ## 1124 ENSCGRG00015025750  5411.357535      0.9030749 0.07221349 12.505626
    ## 1125 ENSCGRG00015001857  1203.377289      0.9029573 0.10144729  8.900754
    ## 1126 ENSCGRG00015007921   605.562412      0.9024211 0.13742849  6.566478
    ## 1127 ENSCGRG00015001519   401.557562      0.9015349 0.15527819  5.805934
    ## 1128 ENSCGRG00015027104   228.576643      0.9014363 0.19808668  4.550717
    ## 1129 ENSCGRG00015015682   267.594000      0.9013135 0.20130648  4.477320
    ## 1130 ENSCGRG00015015682   267.594000      0.9013135 0.20130648  4.477320
    ## 1131 ENSCGRG00015013326  2889.622926      0.9011587 0.08450183 10.664368
    ## 1132 ENSCGRG00015021897  1480.249133      0.9010758 0.10022205  8.990794
    ## 1133 ENSCGRG00015010419  1305.929419      0.9009841 0.10453375  8.619073
    ## 1134 ENSCGRG00015023244   488.154135      0.9008353 0.14620322  6.161529
    ## 1135 ENSCGRG00015020069  1194.467552      0.9006341 0.10097187  8.919654
    ## 1136 ENSCGRG00015011259  7253.206643      0.8992171 0.06905215 13.022289
    ## 1137 ENSCGRG00015006017  3426.725447      0.8986506 0.08049891 11.163513
    ## 1138 ENSCGRG00015005439    81.112217      0.8982983 0.32758117  2.742216
    ## 1139 ENSCGRG00015015855  2123.987468      0.8982367 0.09634401  9.323223
    ## 1140 ENSCGRG00015018541   550.023148      0.8977048 0.13504940  6.647233
    ## 1141 ENSCGRG00015007825   484.428556      0.8974755 0.14611152  6.142401
    ## 1142 ENSCGRG00015015592   841.763179      0.8973292 0.11501080  7.802130
    ## 1143 ENSCGRG00015015231  1438.813530      0.8973128 0.09712142  9.239083
    ## 1144 ENSCGRG00015014238   461.001418      0.8969118 0.14638988  6.126870
    ## 1145 ENSCGRG00015006479   247.106067      0.8964983 0.19250479  4.657018
    ## 1146 ENSCGRG00015009919  2443.863668      0.8959093 0.08258146 10.848795
    ## 1147 ENSCGRG00015020661   317.640917      0.8957228 0.17037850  5.257253
    ## 1148 ENSCGRG00015021282  2360.022298      0.8956428 0.08649857 10.354424
    ## 1149 ENSCGRG00015022328  1184.320392      0.8956064 0.10398929  8.612487
    ## 1150 ENSCGRG00015002433   857.964061      0.8954050 0.11404364  7.851424
    ## 1151 ENSCGRG00015021017  1209.481341      0.8953747 0.11738253  7.627836
    ## 1152 ENSCGRG00015007270  1033.821755      0.8953211 0.10679750  8.383352
    ## 1153 ENSCGRG00015004169  2035.656503      0.8952569 0.09438036  9.485627
    ## 1154 ENSCGRG00015006594   510.802598      0.8941873 0.14260085  6.270561
    ## 1155 ENSCGRG00015007199   672.915761      0.8941183 0.12491294  7.157932
    ## 1156 ENSCGRG00015014900  2205.270155      0.8939656 0.08545634 10.461080
    ## 1157 ENSCGRG00015004236 13285.548161      0.8932894 0.06573163 13.589948
    ## 1158 ENSCGRG00015002246   563.466815      0.8929569 0.13508134  6.610513
    ## 1159 ENSCGRG00015003395    92.780750      0.8921064 0.31025303  2.875416
    ## 1160 ENSCGRG00015008911  1027.657812      0.8917869 0.11738936  7.596829
    ## 1161 ENSCGRG00015003135   647.834006      0.8915791 0.12723704  7.007229
    ## 1162 ENSCGRG00015024642  1042.582038      0.8912796 0.10734244  8.303143
    ## 1163 ENSCGRG00015020870   749.460159      0.8912285 0.12996341  6.857534
    ## 1164 ENSCGRG00015027510   633.576705      0.8910019 0.13042739  6.831402
    ## 1165 ENSCGRG00015025218   504.264705      0.8905355 0.14164239  6.287211
    ## 1166 ENSCGRG00015028921  3665.580577      0.8903009 0.07769068 11.459559
    ## 1167 ENSCGRG00015016108   296.678456      0.8900227 0.18174087  4.897207
    ## 1168 ENSCGRG00015021688    83.101224      0.8899821 0.32186895  2.765045
    ## 1169 ENSCGRG00015013877  1295.747820      0.8898422 0.09799664  9.080334
    ## 1170 ENSCGRG00015017631  3152.543664      0.8896608 0.08157140 10.906528
    ## 1171 ENSCGRG00015019165  1441.122595      0.8896554 0.10244925  8.683865
    ## 1172 ENSCGRG00015021357   468.853388      0.8893700 0.15637909  5.687269
    ## 1173 ENSCGRG00015007649  2071.223208      0.8893105 0.08740339 10.174782
    ## 1174 ENSCGRG00015018060  1184.148858      0.8892626 0.10237670  8.686182
    ## 1175 ENSCGRG00015008325   568.573977      0.8892215 0.13550004  6.562519
    ## 1176 ENSCGRG00015010126  2193.222062      0.8888239 0.08567387 10.374503
    ## 1177 ENSCGRG00015014515   651.632538      0.8885187 0.14191013  6.261137
    ## 1178 ENSCGRG00015020000  8209.409292      0.8880565 0.07114924 12.481601
    ## 1179 ENSCGRG00015000775   840.184294      0.8877072 0.13724346  6.468121
    ## 1180 ENSCGRG00015019822   133.969160      0.8875078 0.25777134  3.443004
    ## 1181 ENSCGRG00015019170   879.142559      0.8869718 0.11318307  7.836612
    ## 1182 ENSCGRG00015009206   433.272129      0.8863298 0.16285078  5.442589
    ## 1183 ENSCGRG00015015884   411.987745      0.8862929 0.15324628  5.783455
    ## 1184 ENSCGRG00015021096  1070.895014      0.8860054 0.11598712  7.638826
    ## 1185 ENSCGRG00015015152  3150.552727      0.8853212 0.08124528 10.896895
    ## 1186 ENSCGRG00015011761   559.271933      0.8852178 0.14185051  6.240498
    ## 1187 ENSCGRG00015008030   767.759526      0.8850386 0.12219543  7.242813
    ## 1188 ENSCGRG00015022401   129.279022      0.8849359 0.26700329  3.314326
    ## 1189 ENSCGRG00015008768  1260.332508      0.8847434 0.10503962  8.422949
    ## 1190 ENSCGRG00015009385   103.123296      0.8847030 0.29868242  2.962019
    ## 1191 ENSCGRG00015022685   553.373514      0.8840340 0.13561021  6.518934
    ## 1192 ENSCGRG00015021398  1278.733691      0.8840108 0.10038348  8.806338
    ## 1193 ENSCGRG00015010607  2543.429707      0.8834736 0.08396326 10.522145
    ## 1194 ENSCGRG00015019508   462.760307      0.8830188 0.14702851  6.005766
    ## 1195 ENSCGRG00015011638  3387.234365      0.8819384 0.07623353 11.568905
    ## 1196 ENSCGRG00015007134   931.792317      0.8818136 0.11006588  8.011689
    ## 1197 ENSCGRG00015015435   745.466034      0.8816798 0.12687357  6.949279
    ## 1198 ENSCGRG00015015435   745.466034      0.8816798 0.12687357  6.949279
    ## 1199 ENSCGRG00015006072  1922.917615      0.8815763 0.09057474  9.733136
    ## 1200 ENSCGRG00015006072  1922.917615      0.8815763 0.09057474  9.733136
    ## 1201 ENSCGRG00015020797   204.838091      0.8814544 0.21141940  4.169222
    ## 1202 ENSCGRG00015014487  2824.513354      0.8812873 0.08101124 10.878582
    ## 1203 ENSCGRG00015012624  2979.071646      0.8810940 0.07771450 11.337576
    ## 1204 ENSCGRG00015023780   336.261607      0.8806513 0.16764349  5.253120
    ## 1205 ENSCGRG00015018359  1436.748848      0.8805234 0.09796952  8.987728
    ## 1206 ENSCGRG00015024749   408.637755      0.8797149 0.16224560  5.422119
    ## 1207 ENSCGRG00015004735   526.162757      0.8792725 0.13956509  6.300089
    ## 1208 ENSCGRG00015010284   943.915842      0.8790876 0.11034319  7.966850
    ## 1209 ENSCGRG00015026632  3363.944501      0.8780030 0.07919910 11.086023
    ## 1210 ENSCGRG00015001649  1143.424484      0.8779012 0.10433567  8.414199
    ## 1211 ENSCGRG00015003209   434.793119      0.8772643 0.15337678  5.719668
    ## 1212 ENSCGRG00015014481   496.553044      0.8771486 0.14413266  6.085703
    ## 1213 ENSCGRG00015004910   351.265389      0.8766499 0.16562791  5.292887
    ## 1214 ENSCGRG00015000456  2228.613398      0.8766306 0.08521135 10.287721
    ## 1215 ENSCGRG00015012389   767.722894      0.8761889 0.11978585  7.314628
    ## 1216 ENSCGRG00015024724   870.843079      0.8760520 0.11590188  7.558565
    ## 1217 ENSCGRG00015013970  1430.596112      0.8760121 0.09975171  8.781926
    ## 1218 ENSCGRG00015010355   419.311965      0.8757843 0.15205820  5.759533
    ## 1219 ENSCGRG00015015136  2029.903877      0.8757684 0.08587634 10.198017
    ## 1220 ENSCGRG00015004426    81.702725      0.8744217 0.32373038  2.701080
    ## 1221 ENSCGRG00015004902   105.968452      0.8741559 0.28334944  3.085081
    ## 1222 ENSCGRG00015028582   347.901353      0.8740450 0.16619283  5.259222
    ## 1223 ENSCGRG00015004445   637.606983      0.8737477 0.12837542  6.806191
    ## 1224 ENSCGRG00015007095   386.570750      0.8734879 0.15715704  5.558058
    ## 1225 ENSCGRG00015013402  1216.478857      0.8730279 0.10056863  8.680917
    ## 1226 ENSCGRG00015005762   224.563736      0.8726189 0.20195040  4.320956
    ## 1227 ENSCGRG00015000948  8528.466188      0.8725557 0.07645542 11.412607
    ## 1228 ENSCGRG00015006567   310.729594      0.8721142 0.17266385  5.050937
    ## 1229 ENSCGRG00015000637   346.876412      0.8718336 0.16485927  5.288350
    ## 1230 ENSCGRG00015013161   440.221743      0.8713123 0.15675379  5.558477
    ## 1231 ENSCGRG00015019253   614.066845      0.8709501 0.12967837  6.716233
    ## 1232 ENSCGRG00015028255   619.531555      0.8707846 0.12862001  6.770211
    ## 1233 ENSCGRG00015020005   103.083998      0.8700737 0.29388798  2.960563
    ## 1234 ENSCGRG00015002654   563.102287      0.8699939 0.13440724  6.472820
    ## 1235 ENSCGRG00015017789   141.641533      0.8699020 0.24992479  3.480655
    ## 1236 ENSCGRG00015012254   241.547177      0.8695486 0.19291503  4.507417
    ## 1237 ENSCGRG00015017239   160.789460      0.8686261 0.24368331  3.564570
    ## 1238 ENSCGRG00015013309  2126.187428      0.8683507 0.08498478 10.217720
    ## 1239 ENSCGRG00015019803  1089.999962      0.8681299 0.10638795  8.160040
    ## 1240 ENSCGRG00015006261    60.884293      0.8679611 0.37243705  2.330491
    ## 1241 ENSCGRG00015004808   868.021395      0.8678880 0.11443861  7.583874
    ## 1242 ENSCGRG00015013585   771.584147      0.8677170 0.11807444  7.348898
    ## 1243 ENSCGRG00015005972   591.875680      0.8676568 0.13166189  6.590038
    ## 1244 ENSCGRG00015019236  4153.786106      0.8673782 0.07980609 10.868571
    ## 1245 ENSCGRG00015017093   811.325272      0.8673274 0.11893673  7.292342
    ## 1246 ENSCGRG00015027819  2257.318466      0.8671712 0.08460967 10.249079
    ## 1247 ENSCGRG00015020767   670.303375      0.8665713 0.12539738  6.910601
    ## 1248 ENSCGRG00015006306   134.855686      0.8664913 0.26388656  3.283575
    ## 1249 ENSCGRG00015015628   104.491667      0.8649613 0.28573441  3.027151
    ## 1250 ENSCGRG00015027732   224.095782      0.8649230 0.19951575  4.335111
    ## 1251 ENSCGRG00015027812  1098.633782      0.8645186 0.11773016  7.343221
    ## 1252 ENSCGRG00015007799   519.702761      0.8643476 0.14916685  5.794502
    ## 1253 ENSCGRG00015004554  1191.137664      0.8641293 0.11475324  7.530326
    ## 1254 ENSCGRG00015008514  4694.429746      0.8634607 0.07113964 12.137547
    ## 1255 ENSCGRG00015005858  1197.573901      0.8630190 0.10061698  8.577270
    ## 1256 ENSCGRG00015000417  3737.021101      0.8629104 0.07678795 11.237576
    ## 1257 ENSCGRG00015018749   258.469612      0.8625905 0.18862796  4.572973
    ## 1258 ENSCGRG00015015097  1312.914978      0.8613275 0.10908181  7.896161
    ## 1259 ENSCGRG00015026521  6701.578133      0.8612433 0.07513288 11.462936
    ## 1260 ENSCGRG00015009588  1918.491651      0.8611749 0.10313261  8.350170
    ## 1261 ENSCGRG00015013942   808.721100      0.8610227 0.11970169  7.193071
    ## 1262 ENSCGRG00015011893  3048.751801      0.8606656 0.07857921 10.952841
    ## 1263 ENSCGRG00015002472  4078.725157      0.8605898 0.07771623 11.073489
    ## 1264 ENSCGRG00015001689   555.604030      0.8604388 0.13763651  6.251530
    ## 1265 ENSCGRG00015005482   229.307553      0.8603698 0.19719477  4.363046
    ## 1266 ENSCGRG00015008901  1334.798253      0.8598124 0.10340128  8.315297
    ## 1267 ENSCGRG00015014909   499.879667      0.8594727 0.15047077  5.711891
    ## 1268 ENSCGRG00015028400  2420.344496      0.8594554 0.08281339 10.378219
    ## 1269 ENSCGRG00015007993  1246.102709      0.8594409 0.10051128  8.550691
    ## 1270 ENSCGRG00015005062  1184.494083      0.8593952 0.10304633  8.339892
    ## 1271 ENSCGRG00015000453   188.136169      0.8587852 0.21877224  3.925476
    ## 1272 ENSCGRG00015007899   131.912197      0.8584143 0.26567988  3.231010
    ## 1273 ENSCGRG00015019362   689.190534      0.8583515 0.12378970  6.933949
    ## 1274 ENSCGRG00015016271  4487.953326      0.8579690 0.08249535 10.400210
    ## 1275 ENSCGRG00015000277   223.407347      0.8578135 0.20271138  4.231699
    ## 1276 ENSCGRG00015016855    71.641532      0.8572961 0.34538727  2.482130
    ## 1277 ENSCGRG00015011767   474.123840      0.8563439 0.14791853  5.789295
    ## 1278 ENSCGRG00015028323  3728.330490      0.8557875 0.07507434 11.399200
    ## 1279 ENSCGRG00015004256   462.105761      0.8551625 0.14761195  5.793315
    ## 1280 ENSCGRG00015004256   462.105761      0.8551625 0.14761195  5.793315
    ## 1281 ENSCGRG00015028816   520.544273      0.8551149 0.14152414  6.042184
    ## 1282 ENSCGRG00015014355   373.014174      0.8551103 0.16557421  5.164514
    ## 1283 ENSCGRG00015021108  1221.414520      0.8538509 0.11813290  7.227884
    ## 1284 ENSCGRG00015007031   935.929764      0.8534943 0.11827755  7.216029
    ## 1285 ENSCGRG00015001154  3346.741629      0.8533282 0.07672191 11.122353
    ## 1286 ENSCGRG00015017980   450.583394      0.8527931 0.14657796  5.818017
    ## 1287 ENSCGRG00015028568  1075.795765      0.8525182 0.10509062  8.112219
    ## 1288 ENSCGRG00015016466   406.421912      0.8523338 0.15675926  5.437215
    ## 1289 ENSCGRG00015026921  2167.949669      0.8522821 0.08455090 10.080107
    ## 1290 ENSCGRG00015015257    78.758566      0.8518883 0.33520063  2.541428
    ## 1291 ENSCGRG00015028361  9005.940023      0.8518476 0.07447508 11.438022
    ## 1292 ENSCGRG00015025973    78.811578      0.8516415 0.33698532  2.527236
    ## 1293 ENSCGRG00015020398  6518.193358      0.8516175 0.07119395 11.961937
    ## 1294 ENSCGRG00015020160  2730.633485      0.8507158 0.10065565  8.451744
    ## 1295 ENSCGRG00015010571   866.800780      0.8501017 0.12628434  6.731648
    ## 1296 ENSCGRG00015009271  1806.477240      0.8494222 0.09128606  9.305060
    ## 1297 ENSCGRG00015006119  2523.867993      0.8493676 0.08166933 10.400081
    ## 1298 ENSCGRG00015021705    69.234203      0.8490768 0.35422252  2.397015
    ## 1299 ENSCGRG00015016954   819.062097      0.8488364 0.11628402  7.299682
    ## 1300 ENSCGRG00015011590  1216.939598      0.8487433 0.10589650  8.014838
    ## 1301 ENSCGRG00015021117   486.515434      0.8485236 0.14215032  5.969199
    ## 1302 ENSCGRG00015010326  2177.459360      0.8483655 0.08607419  9.856212
    ## 1303 ENSCGRG00015011250  1281.542804      0.8479469 0.10202165  8.311441
    ## 1304 ENSCGRG00015005949   699.443793      0.8479047 0.13352276  6.350264
    ## 1305 ENSCGRG00015008374   107.298186      0.8472934 0.28674760  2.954840
    ## 1306 ENSCGRG00015018571   172.952634      0.8470289 0.22604987  3.747089
    ## 1307 ENSCGRG00015027734   612.196130      0.8461974 0.13078192  6.470293
    ## 1308 ENSCGRG00015020638   305.883988      0.8461360 0.17407713  4.860696
    ## 1309 ENSCGRG00015000348  1309.357044      0.8459244 0.10391893  8.140234
    ## 1310 ENSCGRG00015015990   157.666872      0.8459045 0.23755261  3.560914
    ## 1311 ENSCGRG00015021652  2856.634072      0.8448376 0.08366263 10.098148
    ## 1312 ENSCGRG00015003289   642.712291      0.8447353 0.12630411  6.688106
    ## 1313 ENSCGRG00015012070  1921.549961      0.8445155 0.09678079  8.726066
    ## 1314 ENSCGRG00015010354  3145.874315      0.8444237 0.09273782  9.105495
    ## 1315 ENSCGRG00015027886   814.028126      0.8440691 0.11902001  7.091825
    ## 1316 ENSCGRG00015021935  1707.493869      0.8438847 0.09296454  9.077490
    ## 1317 ENSCGRG00015026226  1250.262153      0.8437853 0.10118031  8.339422
    ## 1318 ENSCGRG00015020910   191.784382      0.8437167 0.21375691  3.947085
    ## 1319 ENSCGRG00015028067   394.478920      0.8435883 0.17190402  4.907321
    ## 1320 ENSCGRG00015005390   246.466083      0.8432463 0.19058668  4.424477
    ## 1321 ENSCGRG00015001648  5134.517513      0.8432336 0.07264593 11.607444
    ## 1322 ENSCGRG00015020778  2787.648346      0.8430335 0.08831524  9.545732
    ## 1323 ENSCGRG00015014652   744.998647      0.8427837 0.12270379  6.868440
    ## 1324 ENSCGRG00015014652   744.998647      0.8427837 0.12270379  6.868440
    ## 1325 ENSCGRG00015027268   626.627898      0.8426998 0.13435309  6.272277
    ## 1326 ENSCGRG00015014894   128.188705      0.8423998 0.26089640  3.228867
    ## 1327 ENSCGRG00015027910   678.748431      0.8419569 0.13848094  6.079948
    ## 1328 ENSCGRG00015022327  3198.259393      0.8419385 0.09432020  8.926386
    ## 1329 ENSCGRG00015000127  3216.001039      0.8414965 0.07825613 10.753106
    ## 1330 ENSCGRG00015025525    74.199734      0.8414380 0.35004428  2.403805
    ## 1331 ENSCGRG00015020726   873.318941      0.8414281 0.11387452  7.389081
    ## 1332 ENSCGRG00015018964   290.922096      0.8411037 0.18373682  4.577764
    ## 1333 ENSCGRG00015021077  1506.818947      0.8400659 0.09602749  8.748181
    ## 1334 ENSCGRG00015017729  4713.784875      0.8400617 0.07836023 10.720511
    ## 1335 ENSCGRG00015002255   767.008323      0.8389393 0.11998310  6.992146
    ## 1336 ENSCGRG00015003656   987.856772      0.8387799 0.11903979  7.046214
    ## 1337 ENSCGRG00015014315   177.940481      0.8380570 0.22691916  3.693196
    ## 1338 ENSCGRG00015007147   423.096262      0.8379663 0.15528396  5.396348
    ## 1339 ENSCGRG00015010522  1041.328034      0.8378209 0.11220811  7.466669
    ## 1340 ENSCGRG00015028439  3856.912051      0.8371350 0.07865474 10.643159
    ## 1341 ENSCGRG00015007843   485.681592      0.8370481 0.15675077  5.339994
    ## 1342 ENSCGRG00015004593   259.680368      0.8370123 0.20017850  4.181330
    ## 1343 ENSCGRG00015010269   345.255328      0.8367524 0.16393360  5.104215
    ## 1344 ENSCGRG00015017605   228.996852      0.8366287 0.19880023  4.208389
    ## 1345 ENSCGRG00015019363  5012.239763      0.8361408 0.07052599 11.855782
    ## 1346 ENSCGRG00015028841  1952.443959      0.8360221 0.09460202  8.837255
    ## 1347 ENSCGRG00015014748   800.197927      0.8358888 0.11686787  7.152426
    ## 1348 ENSCGRG00015016071   252.374288      0.8354365 0.19845566  4.209689
    ## 1349 ENSCGRG00015002417  1253.365420      0.8349781 0.10214441  8.174487
    ## 1350 ENSCGRG00015008251   993.370093      0.8348383 0.10719175  7.788270
    ## 1351 ENSCGRG00015024371   354.732962      0.8347452 0.16600030  5.028576
    ## 1352 ENSCGRG00015021369  7334.470015      0.8346356 0.06924065 12.054127
    ## 1353 ENSCGRG00015025376   239.661845      0.8342633 0.19332398  4.315364
    ## 1354 ENSCGRG00015017140  1195.545881      0.8338147 0.10411848  8.008325
    ## 1355 ENSCGRG00015021593   523.898194      0.8336510 0.13714288  6.078704
    ## 1356 ENSCGRG00015019774   318.309773      0.8335518 0.17203800  4.845161
    ## 1357 ENSCGRG00015001206  1304.969653      0.8331822 0.10363478  8.039600
    ## 1358 ENSCGRG00015007444  2894.710200      0.8330054 0.08260834 10.083794
    ## 1359 ENSCGRG00015008553   186.379065      0.8324071 0.21788264  3.820438
    ## 1360 ENSCGRG00015006010   565.318657      0.8323696 0.14106716  5.900520
    ## 1361 ENSCGRG00015007948   737.741151      0.8305827 0.12088624  6.870779
    ## 1362 ENSCGRG00015025915   669.114617      0.8303302 0.12451909  6.668297
    ## 1363 ENSCGRG00015016138  1561.205257      0.8303043 0.09910751  8.377814
    ## 1364 ENSCGRG00015016456   369.184343      0.8300921 0.16409819  5.058509
    ## 1365 ENSCGRG00015001856  2999.469379      0.8296429 0.08238258 10.070610
    ## 1366 ENSCGRG00015020558   768.508418      0.8294028 0.12135554  6.834486
    ## 1367 ENSCGRG00015024810   211.849745      0.8290425 0.20670765  4.010700
    ## 1368 ENSCGRG00015023942   249.357980      0.8287095 0.19384776  4.275054
    ## 1369 ENSCGRG00015018396   615.511146      0.8285018 0.14271504  5.805287
    ## 1370 ENSCGRG00015005000   992.838882      0.8282717 0.11195243  7.398425
    ## 1371 ENSCGRG00015011719  1044.409415      0.8272284 0.10559058  7.834301
    ## 1372 ENSCGRG00015011719  1044.409415      0.8272284 0.10559058  7.834301
    ## 1373 ENSCGRG00015010079  2271.385577      0.8265829 0.08395507  9.845539
    ## 1374 ENSCGRG00015009628  2308.172175      0.8264283 0.10138912  8.151055
    ## 1375 ENSCGRG00015026570  1916.921164      0.8259950 0.08699579  9.494656
    ## 1376 ENSCGRG00015016347  2289.612360      0.8256648 0.09614290  8.587892
    ## 1377 ENSCGRG00015016307  1662.416385      0.8253506 0.09086357  9.083405
    ## 1378 ENSCGRG00015022110 11291.561529      0.8246874 0.07039757 11.714713
    ## 1379 ENSCGRG00015003577  1285.585881      0.8245586 0.09960135  8.278589
    ## 1380 ENSCGRG00015024770  3914.935704      0.8236420 0.07515529 10.959202
    ## 1381 ENSCGRG00015002346  2326.628656      0.8234027 0.08561101  9.617954
    ## 1382 ENSCGRG00015013864  1841.574251      0.8230883 0.09100611  9.044319
    ## 1383 ENSCGRG00015025703  2127.978326      0.8228228 0.08530496  9.645661
    ## 1384 ENSCGRG00015025703  2127.978326      0.8228228 0.08530496  9.645661
    ## 1385 ENSCGRG00015021623   418.656664      0.8224617 0.15066418  5.458907
    ## 1386 ENSCGRG00015002206 17636.783863      0.8224571 0.06295041 13.065157
    ## 1387 ENSCGRG00015019925   550.992583      0.8222956 0.13470077  6.104609
    ## 1388 ENSCGRG00015027682  8797.409648      0.8219730 0.07193670 11.426337
    ## 1389 ENSCGRG00015012554   325.844747      0.8219644 0.17079427  4.812599
    ## 1390 ENSCGRG00015002710   392.846319      0.8217497 0.16679927  4.926579
    ## 1391 ENSCGRG00015028899   910.470214      0.8215870 0.11083049  7.413006
    ## 1392 ENSCGRG00015007373   299.855250      0.8212404 0.17522699  4.686723
    ## 1393 ENSCGRG00015021944  5403.892391      0.8208837 0.08055924 10.189814
    ## 1394 ENSCGRG00015021665   179.433618      0.8202168 0.22231327  3.689464
    ## 1395 ENSCGRG00015028663  1589.884716      0.8202021 0.09443853  8.685036
    ## 1396 ENSCGRG00015013749  1053.091546      0.8201398 0.10572911  7.756992
    ## 1397 ENSCGRG00015028087   502.354199      0.8200545 0.14482450  5.662402
    ## 1398 ENSCGRG00015015580   724.345229      0.8198917 0.13285853  6.171163
    ## 1399 ENSCGRG00015021577  1543.186237      0.8195239 0.09500830  8.625814
    ## 1400 ENSCGRG00015020324  1101.901526      0.8192405 0.10398367  7.878550
    ## 1401 ENSCGRG00015020579  1436.886166      0.8190186 0.10329192  7.929164
    ## 1402 ENSCGRG00015014423   568.312307      0.8179476 0.13466323  6.074023
    ## 1403 ENSCGRG00015010036   724.398332      0.8179019 0.12070249  6.776181
    ## 1404 ENSCGRG00015015461   749.127651      0.8175459 0.12181823  6.711195
    ## 1405 ENSCGRG00015003743   701.743582      0.8160268 0.12203333  6.686918
    ## 1406 ENSCGRG00015011705   594.743980      0.8151065 0.13097139  6.223546
    ## 1407 ENSCGRG00015026159   243.962496      0.8149887 0.19131106  4.260018
    ## 1408 ENSCGRG00015003071   646.212087      0.8149378 0.12644722  6.444885
    ## 1409 ENSCGRG00015006173  1134.079508      0.8145831 0.10313702  7.898067
    ## 1410 ENSCGRG00015006521   467.419350      0.8144793 0.14454925  5.634614
    ## 1411 ENSCGRG00015000013   776.997101      0.8143675 0.11865811  6.863142
    ## 1412 ENSCGRG00015003737  1131.190365      0.8141775 0.11167953  7.290302
    ## 1413 ENSCGRG00015008022   950.504902      0.8141009 0.11290114  7.210741
    ## 1414 ENSCGRG00015005824  1343.761739      0.8139342 0.11486193  7.086197
    ## 1415 ENSCGRG00015027126   840.857362      0.8137759 0.28709140  2.834553
    ## 1416 ENSCGRG00015004558   200.276406      0.8126728 0.21492793  3.781141
    ## 1417 ENSCGRG00015014714   402.700547      0.8123132 0.15933079  5.098281
    ## 1418 ENSCGRG00015026407  2750.312546      0.8120374 0.08933632  9.089668
    ## 1419 ENSCGRG00015021570   939.076878      0.8118208 0.11243692  7.220233
    ## 1420 ENSCGRG00015019151   715.597661      0.8113668 0.13301005  6.100041
    ## 1421 ENSCGRG00015012772  1998.768802      0.8112717 0.08701244  9.323629
    ## 1422 ENSCGRG00015012716   824.779021      0.8111412 0.13279057  6.108425
    ## 1423 ENSCGRG00015012716   824.779021      0.8111412 0.13279057  6.108425
    ## 1424 ENSCGRG00015004841   291.600649      0.8110378 0.18337796  4.422766
    ## 1425 ENSCGRG00015011277   606.259998      0.8107982 0.13282365  6.104322
    ## 1426 ENSCGRG00015009646  1061.906021      0.8107304 0.10772443  7.525965
    ## 1427 ENSCGRG00015028199  1158.436576      0.8106808 0.10479585  7.735811
    ## 1428 ENSCGRG00015009523   928.312913      0.8105778 0.10983415  7.380016
    ## 1429 ENSCGRG00015019217  3037.863423      0.8104297 0.07991381 10.141297
    ## 1430 ENSCGRG00015027096   534.831941      0.8101168 0.13970746  5.798665
    ## 1431 ENSCGRG00015017548   242.640697      0.8100299 0.19812303  4.088520
    ## 1432 ENSCGRG00015016005   828.231757      0.8096107 0.11463849  7.062294
    ## 1433 ENSCGRG00015011821   396.414818      0.8095392 0.15614046  5.184685
    ## 1434 ENSCGRG00015024488   926.939736      0.8094895 0.12257526  6.604020
    ## 1435 ENSCGRG00015013763  2241.285956      0.8093546 0.09328174  8.676452
    ## 1436 ENSCGRG00015003451  4896.159895      0.8091204 0.07354462 11.001762
    ## 1437 ENSCGRG00015005842  2065.666896      0.8091060 0.08569423  9.441779
    ## 1438 ENSCGRG00015021205  2315.014105      0.8090926 0.08255365  9.800809
    ## 1439 ENSCGRG00015012516  1154.072064      0.8088332 0.10187284  7.939635
    ## 1440 ENSCGRG00015021310   855.824876      0.8085366 0.12273492  6.587666
    ## 1441 ENSCGRG00015006598   533.414653      0.8081566 0.16971582  4.761822
    ## 1442 ENSCGRG00015010317   210.192213      0.8081294 0.20491081  3.943811
    ## 1443 ENSCGRG00015026478  3211.788602      0.8079594 0.09135714  8.843965
    ## 1444 ENSCGRG00015010780  1126.319491      0.8077384 0.10278355  7.858635
    ## 1445 ENSCGRG00015000507 14994.057933      0.8076626 0.06204772 13.016798
    ## 1446 ENSCGRG00015008944  1262.705859      0.8074630 0.10451956  7.725473
    ## 1447 ENSCGRG00015027102  1442.570110      0.8071379 0.10222046  7.896050
    ## 1448 ENSCGRG00015006948   450.424101      0.8070334 0.15135847  5.331934
    ## 1449 ENSCGRG00015022452   930.702736      0.8069595 0.11142393  7.242245
    ## 1450 ENSCGRG00015005503   787.132046      0.8065991 0.12160387  6.633005
    ## 1451 ENSCGRG00015016653  8532.858735      0.8063817 0.07589623 10.624792
    ## 1452 ENSCGRG00015017428  2805.253274      0.8057353 0.08110017  9.935063
    ## 1453 ENSCGRG00015016289  1744.757445      0.8055877 0.09211287  8.745659
    ## 1454 ENSCGRG00015022556   415.238387      0.8054252 0.15214881  5.293667
    ## 1455 ENSCGRG00015017965  4428.649140      0.8052816 0.07376962 10.916169
    ## 1456 ENSCGRG00015006059  1732.512071      0.8049979 0.09719788  8.282052
    ## 1457 ENSCGRG00015027565   531.032064      0.8047642 0.13773019  5.843048
    ## 1458 ENSCGRG00015011921  1088.642724      0.8047148 0.10611108  7.583701
    ## 1459 ENSCGRG00015016951   182.641194      0.8044493 0.22289212  3.609142
    ## 1460 ENSCGRG00015021980  1836.187019      0.8043151 0.10943919  7.349426
    ## 1461 ENSCGRG00015020671   250.259734      0.8042037 0.18942434  4.245514
    ## 1462 ENSCGRG00015003868   361.273168      0.8039020 0.16381828  4.907279
    ## 1463 ENSCGRG00015026110   591.095504      0.8038805 0.13209580  6.085587
    ## 1464 ENSCGRG00015021158  1108.968813      0.8031140 0.11384891  7.054209
    ## 1465 ENSCGRG00015027027   409.422328      0.8029398 0.15245684  5.266670
    ## 1466 ENSCGRG00015027027   409.422328      0.8029398 0.15245684  5.266670
    ## 1467 ENSCGRG00015016725   112.358849      0.8028835 0.28586996  2.808562
    ## 1468 ENSCGRG00015027140   776.009248      0.8025886 0.12196488  6.580489
    ## 1469 ENSCGRG00015002438  1388.288127      0.8022090 0.10014936  8.010126
    ## 1470 ENSCGRG00015007256   240.251625      0.8020969 0.19820384  4.046828
    ## 1471 ENSCGRG00015019444   246.873699      0.8020511 0.19619076  4.088119
    ## 1472 ENSCGRG00015011077   694.089181      0.8016804 0.12596448  6.364337
    ## 1473 ENSCGRG00015019904   200.738026      0.8016715 0.21165577  3.787620
    ## 1474 ENSCGRG00015002944   508.514473      0.8015733 0.14715836  5.447011
    ## 1475 ENSCGRG00015021849  2177.288180      0.8014479 0.08769640  9.138891
    ## 1476 ENSCGRG00015002805  4488.118684      0.8013396 0.07265070 11.030034
    ## 1477 ENSCGRG00015009122   290.532973      0.8009054 0.18484904  4.332754
    ## 1478 ENSCGRG00015024743   711.841326      0.8006906 0.13098248  6.112960
    ## 1479 ENSCGRG00015026579   771.505991      0.8006402 0.11775555  6.799172
    ## 1480 ENSCGRG00015011728  2367.215199      0.8002651 0.08311598  9.628295
    ## 1481 ENSCGRG00015000590  2549.051459      0.7993511 0.08571973  9.325170
    ## 1482 ENSCGRG00015007869   301.683014      0.7992020 0.17963701  4.448983
    ## 1483 ENSCGRG00015018501  1405.042613      0.7991741 0.10091317  7.919423
    ## 1484 ENSCGRG00015004625  1589.944020      0.7989470 0.09393044  8.505731
    ## 1485 ENSCGRG00015015013  2355.465654      0.7989272 0.09452319  8.452183
    ## 1486 ENSCGRG00015014224   945.970399      0.7979861 0.11116271  7.178542
    ## 1487 ENSCGRG00015018169   467.990309      0.7974711 0.14643182  5.446023
    ## 1488 ENSCGRG00015026152   636.765885      0.7974591 0.12875892  6.193428
    ## 1489 ENSCGRG00015026239  2431.316084      0.7974575 0.08142314  9.793991
    ## 1490 ENSCGRG00015010384  2509.730851      0.7968380 0.08106395  9.829745
    ## 1491 ENSCGRG00015010527  6439.514405      0.7963664 0.08017424  9.932946
    ## 1492 ENSCGRG00015026743   339.793739      0.7963515 0.16711247  4.765363
    ## 1493 ENSCGRG00015023948  1063.010668      0.7961521 0.11392945  6.988115
    ## 1494 ENSCGRG00015001748  4156.923946      0.7959654 0.07368412 10.802402
    ## 1495 ENSCGRG00015025797   299.134791      0.7958369 0.18923362  4.205579
    ## 1496 ENSCGRG00015024505  3732.336048      0.7953805 0.07645830 10.402801
    ## 1497 ENSCGRG00015017335  2956.722460      0.7950850 0.08294946  9.585174
    ## 1498 ENSCGRG00015022564   273.780323      0.7944053 0.18281574  4.345388
    ## 1499 ENSCGRG00015028932   867.698238      0.7939269 0.11556330  6.870061
    ## 1500 ENSCGRG00015026582  1585.398619      0.7935575 0.10179289  7.795804
    ## 1501 ENSCGRG00015027644  3680.638344      0.7935522 0.08551756  9.279406
    ## 1502 ENSCGRG00015021119  1574.836086      0.7935372 0.10177344  7.797095
    ## 1503 ENSCGRG00015003199  3921.196949      0.7920753 0.07419553 10.675513
    ## 1504 ENSCGRG00015009652  1887.178519      0.7918659 0.09045155  8.754587
    ## 1505 ENSCGRG00015009009   778.326524      0.7918578 0.11815560  6.701822
    ## 1506 ENSCGRG00015021450    84.718655      0.7913140 0.33256983  2.379392
    ## 1507 ENSCGRG00015021450    84.718655      0.7913140 0.33256983  2.379392
    ## 1508 ENSCGRG00015021450    84.718655      0.7913140 0.33256983  2.379392
    ## 1509 ENSCGRG00015020153  2462.323231      0.7912539 0.08826835  8.964186
    ## 1510 ENSCGRG00015001598   289.601811      0.7910311 0.19509394  4.054616
    ## 1511 ENSCGRG00015027177  1439.697302      0.7909688 0.09674732  8.175614
    ## 1512 ENSCGRG00015018171   299.504503      0.7909247 0.17431347  4.537370
    ## 1513 ENSCGRG00015000260  5428.557435      0.7906149 0.08258397  9.573467
    ## 1514 ENSCGRG00015009649 10226.632419      0.7900088 0.06440840 12.265618
    ## 1515 ENSCGRG00015021253   425.490683      0.7898842 0.16555379  4.771163
    ## 1516 ENSCGRG00015020742   564.689520      0.7896331 0.13723969  5.753679
    ## 1517 ENSCGRG00015001867  2268.276594      0.7893348 0.08767997  9.002453
    ## 1518 ENSCGRG00015024018  1492.050555      0.7889474 0.09395668  8.396928
    ## 1519 ENSCGRG00015025929   256.891507      0.7887898 0.19659766  4.012203
    ## 1520 ENSCGRG00015004759  1117.530717      0.7886117 0.10369655  7.604995
    ## 1521 ENSCGRG00015025437  1375.719149      0.7879619 0.09770110  8.065026
    ## 1522 ENSCGRG00015001264  2300.887767      0.7874653 0.08492039  9.272983
    ## 1523 ENSCGRG00015014331   320.302202      0.7871651 0.17812225  4.419240
    ## 1524 ENSCGRG00015028161   806.778238      0.7870832 0.13594982  5.789513
    ## 1525 ENSCGRG00015026233  1437.597929      0.7870595 0.09457049  8.322463
    ## 1526 ENSCGRG00015020047   375.942384      0.7869329 0.15896605  4.950321
    ## 1527 ENSCGRG00015002707  2052.842707      0.7868191 0.08894465  8.846166
    ## 1528 ENSCGRG00015009708   257.637080      0.7866652 0.18647289  4.218657
    ## 1529 ENSCGRG00015015977   458.532529      0.7863092 0.14871631  5.287310
    ## 1530 ENSCGRG00015018389  9057.080603      0.7862554 0.07645151 10.284368
    ## 1531 ENSCGRG00015005580   245.493394      0.7859216 0.19043320  4.127020
    ## 1532 ENSCGRG00015005140   250.238938      0.7858103 0.19012488  4.133127
    ## 1533 ENSCGRG00015017578   155.443968      0.7857744 0.24050490  3.267187
    ## 1534 ENSCGRG00015016739   763.581430      0.7857686 0.13178556  5.962479
    ## 1535 ENSCGRG00015017975  1066.007563      0.7857301 0.10723403  7.327246
    ## 1536 ENSCGRG00015025866  1409.086275      0.7852068 0.09730824  8.069274
    ## 1537 ENSCGRG00015024841  3640.497675      0.7848017 0.07658272 10.247765
    ## 1538 ENSCGRG00015011237   543.667287      0.7847625 0.13569375  5.783336
    ## 1539 ENSCGRG00015028588   209.962756      0.7842983 0.20674354  3.793581
    ## 1540 ENSCGRG00015024108    83.158233      0.7834970 0.32217435  2.431904
    ## 1541 ENSCGRG00015009220  2131.815018      0.7833805 0.08657698  9.048370
    ## 1542 ENSCGRG00015027047  1495.780223      0.7833277 0.10589840  7.396974
    ## 1543 ENSCGRG00015016125  1020.245184      0.7832933 0.10622589  7.373846
    ## 1544 ENSCGRG00015003626  1155.984715      0.7830813 0.10206234  7.672578
    ## 1545 ENSCGRG00015012616   458.025833      0.7824313 0.14547508  5.378456
    ## 1546 ENSCGRG00015019290  1188.505238      0.7822955 0.10539339  7.422624
    ## 1547 ENSCGRG00015013800  5276.962905      0.7822903 0.08338597  9.381557
    ## 1548 ENSCGRG00015017681  1624.280090      0.7822428 0.09708274  8.057486
    ## 1549 ENSCGRG00015006363   528.249557      0.7819937 0.13664431  5.722841
    ## 1550 ENSCGRG00015006254   331.822786      0.7819156 0.16816506  4.649691
    ## 1551 ENSCGRG00015020168  5176.594301      0.7811226 0.07145646 10.931449
    ## 1552 ENSCGRG00015022884   793.992462      0.7800222 0.11845244  6.585109
    ## 1553 ENSCGRG00015024833  2541.581576      0.7800159 0.08539547  9.134160
    ## 1554 ENSCGRG00015010779   221.900661      0.7800116 0.19977457  3.904459
    ## 1555 ENSCGRG00015012834  4942.541261      0.7799185 0.07181847 10.859580
    ## 1556 ENSCGRG00015001894   256.542708      0.7797459 0.19530589  3.992434
    ## 1557 ENSCGRG00015002659  5669.901732      0.7796436 0.07245878 10.759822
    ## 1558 ENSCGRG00015016701  1477.261927      0.7794435 0.09457994  8.241108
    ## 1559 ENSCGRG00015017090  1125.580581      0.7793432 0.10658969  7.311618
    ## 1560 ENSCGRG00015002584   474.058028      0.7788961 0.15193830  5.126397
    ## 1561 ENSCGRG00015010012  1502.606559      0.7787108 0.09560697  8.144916
    ## 1562 ENSCGRG00015009454   853.751682      0.7784621 0.11564757  6.731331
    ## 1563 ENSCGRG00015004871   111.080589      0.7783454 0.27883756  2.791394
    ## 1564 ENSCGRG00015022253   242.302002      0.7779820 0.19329996  4.024740
    ## 1565 ENSCGRG00015021823   511.432229      0.7773903 0.14192921  5.477310
    ## 1566 ENSCGRG00015025300  1040.306648      0.7773417 0.11261110  6.902887
    ## 1567 ENSCGRG00015008983  3180.975123      0.7770365 0.08375590  9.277395
    ## 1568 ENSCGRG00015004949   734.735992      0.7770136 0.12930301  6.009246
    ## 1569 ENSCGRG00015025271   954.842111      0.7769843 0.11391909  6.820492
    ## 1570 ENSCGRG00015004566   463.840926      0.7767937 0.14836208  5.235797
    ## 1571 ENSCGRG00015003107   167.512185      0.7764826 0.23105873  3.360542
    ## 1572 ENSCGRG00015002268  1216.960334      0.7763532 0.10051260  7.723939
    ## 1573 ENSCGRG00015027669   170.925273      0.7763074 0.25013149  3.103597
    ## 1574 ENSCGRG00015001609    83.854343      0.7759066 0.32492725  2.387939
    ## 1575 ENSCGRG00015016344  2090.701439      0.7757508 0.08786800  8.828593
    ## 1576 ENSCGRG00015018622  1179.046695      0.7753961 0.11431330  6.783079
    ## 1577 ENSCGRG00015026199  9095.252787      0.7751970 0.06749838 11.484677
    ## 1578 ENSCGRG00015009527   328.230275      0.7751027 0.17209223  4.503996
    ## 1579 ENSCGRG00015025385   426.264810      0.7742578 0.15811755  4.896723
    ## 1580 ENSCGRG00015025825   818.117475      0.7737534 0.11804720  6.554610
    ## 1581 ENSCGRG00015028652  1590.206641      0.7737350 0.09295147  8.324075
    ## 1582 ENSCGRG00015013465 48304.442991      0.7732824 0.06365897 12.147264
    ## 1583 ENSCGRG00015005053   168.744277      0.7728031 0.23555264  3.280808
    ## 1584 ENSCGRG00015016676   136.061113      0.7726040 0.25204714  3.065316
    ## 1585 ENSCGRG00015010864  1944.279679      0.7726004 0.08764972  8.814637
    ## 1586 ENSCGRG00015011388   881.573309      0.7723508 0.11715789  6.592393
    ## 1587 ENSCGRG00015007926    75.064402      0.7720466 0.33690713  2.291571
    ## 1588 ENSCGRG00015001387   390.492769      0.7719785 0.15686606  4.921259
    ## 1589 ENSCGRG00015005422   930.848635      0.7717635 0.11124829  6.937307
    ## 1590 ENSCGRG00015015800  8167.743962      0.7717102 0.07353703 10.494172
    ## 1591 ENSCGRG00015019648   644.033908      0.7716150 0.13704397  5.630419
    ## 1592 ENSCGRG00015021499   454.411004      0.7713080 0.15022235  5.134442
    ## 1593 ENSCGRG00015025154   653.821805      0.7708445 0.12710867  6.064452
    ## 1594 ENSCGRG00015019887    94.127458      0.7702697 0.30663409  2.512016
    ## 1595 ENSCGRG00015016388  1049.232221      0.7696118 0.10648499  7.227420
    ## 1596 ENSCGRG00015003861 15452.714790      0.7692914 0.06798550 11.315523
    ## 1597 ENSCGRG00015002922  1179.149954      0.7690984 0.10078161  7.631337
    ## 1598 ENSCGRG00015004859   136.100164      0.7689810 0.25286799  3.041037
    ## 1599 ENSCGRG00015004499   356.723551      0.7688854 0.16410541  4.685314
    ## 1600 ENSCGRG00015013639  1623.139725      0.7684909 0.09300985  8.262468
    ## 1601 ENSCGRG00015005034   722.361007      0.7682518 0.12147443  6.324391
    ## 1602 ENSCGRG00015008761   603.987886      0.7681009 0.13350468  5.753363
    ## 1603 ENSCGRG00015025748   266.792194      0.7674224 0.18358351  4.180236
    ## 1604 ENSCGRG00015024909   431.090002      0.7673696 0.15760836  4.868838
    ## 1605 ENSCGRG00015013354   478.073117      0.7665011 0.14267725  5.372273
    ## 1606 ENSCGRG00015013484  1749.147329      0.7662354 0.09035191  8.480566
    ## 1607 ENSCGRG00015012462   798.342431      0.7662161 0.11753927  6.518810
    ## 1608 ENSCGRG00015012462   798.342431      0.7662161 0.11753927  6.518810
    ## 1609 ENSCGRG00015013716   464.404072      0.7657515 0.14947852  5.122820
    ## 1610 ENSCGRG00015024481   775.166242      0.7653204 0.12392723  6.175563
    ## 1611 ENSCGRG00015001960  5497.384645      0.7649260 0.07527273 10.162061
    ## 1612 ENSCGRG00015015892   273.698102      0.7648274 0.18918122  4.042830
    ## 1613 ENSCGRG00015004223  1313.867777      0.7645472 0.09914332  7.711535
    ## 1614 ENSCGRG00015007162  1180.945506      0.7645139 0.10304973  7.418884
    ## 1615 ENSCGRG00015009955   870.424878      0.7643931 0.11561356  6.611622
    ## 1616 ENSCGRG00015013430   858.478017      0.7636464 0.11399862  6.698734
    ## 1617 ENSCGRG00015016173   646.119826      0.7635220 0.13616422  5.607361
    ## 1618 ENSCGRG00015009559  4565.333143      0.7632952 0.07972083  9.574601
    ## 1619 ENSCGRG00015005573  2302.084516      0.7623395 0.09314996  8.184003
    ## 1620 ENSCGRG00015011400   907.817013      0.7623044 0.11130717  6.848655
    ## 1621 ENSCGRG00015024426   853.138590      0.7622852 0.11813401  6.452715
    ## 1622 ENSCGRG00015002332   406.654210      0.7622218 0.15390814  4.952446
    ## 1623 ENSCGRG00015001832   627.632579      0.7621778 0.12971612  5.875737
    ## 1624 ENSCGRG00015028354   510.383300      0.7620964 0.14804595  5.147701
    ## 1625 ENSCGRG00015021384    91.693861      0.7620905 0.30245054  2.519720
    ## 1626 ENSCGRG00015004038  2443.967856      0.7620129 0.08513752  8.950376
    ## 1627 ENSCGRG00015025618   481.347667      0.7620122 0.14377287  5.300111
    ## 1628 ENSCGRG00015007618   869.946884      0.7618588 0.11807284  6.452447
    ## 1629 ENSCGRG00015007618   869.946884      0.7618588 0.11807284  6.452447
    ## 1630 ENSCGRG00015026658   159.632143      0.7617972 0.23732884  3.209881
    ## 1631 ENSCGRG00015005938   629.388638      0.7617671 0.13121435  5.805517
    ## 1632 ENSCGRG00015005938   629.388638      0.7617671 0.13121435  5.805517
    ## 1633 ENSCGRG00015005938   629.388638      0.7617671 0.13121435  5.805517
    ## 1634 ENSCGRG00015005938   629.388638      0.7617671 0.13121435  5.805517
    ## 1635 ENSCGRG00015016458   928.669001      0.7615378 0.11032016  6.902980
    ## 1636 ENSCGRG00015016787  1084.811873      0.7615095 0.10619071  7.171149
    ## 1637 ENSCGRG00015026548   855.313676      0.7612160 0.11426059  6.662104
    ## 1638 ENSCGRG00015011706   203.770735      0.7607211 0.20789139  3.659224
    ## 1639 ENSCGRG00015024893   237.519799      0.7605262 0.19775450  3.845810
    ## 1640 ENSCGRG00015019439  1038.485099      0.7604911 0.10595783  7.177299
    ## 1641 ENSCGRG00015013912   267.700297      0.7601982 0.18575418  4.092496
    ## 1642 ENSCGRG00015016433   898.141635      0.7594812 0.11464171  6.624824
    ## 1643 ENSCGRG00015004917  4246.394187      0.7593598 0.07290664 10.415509
    ## 1644 ENSCGRG00015022978   911.546576      0.7590354 0.11050328  6.868894
    ## 1645 ENSCGRG00015023101   549.231386      0.7587266 0.13514856  5.614019
    ## 1646 ENSCGRG00015013404  2478.887469      0.7579234 0.08515640  8.900369
    ## 1647 ENSCGRG00015003181   100.335584      0.7577958 0.29196455  2.595506
    ## 1648 ENSCGRG00015017623  1654.674732      0.7576382 0.09669882  7.835030
    ## 1649 ENSCGRG00015004706  2132.000456      0.7576323 0.08902352  8.510473
    ## 1650 ENSCGRG00015020339  1033.697445      0.7575991 0.10756327  7.043288
    ## 1651 ENSCGRG00015020756   226.849763      0.7574212 0.20443286  3.704987
    ## 1652 ENSCGRG00015019522   609.421487      0.7572583 0.13739817  5.511414
    ## 1653 ENSCGRG00015011271   655.920849      0.7572415 0.12603705  6.008087
    ## 1654 ENSCGRG00015012245   437.475973      0.7571835 0.14977753  5.055388
    ## 1655 ENSCGRG00015024897   843.751712      0.7570945 0.11475372  6.597560
    ## 1656 ENSCGRG00015003403   522.209872      0.7565728 0.14308672  5.287513
    ## 1657 ENSCGRG00015013137  7684.465377      0.7562493 0.06770720 11.169407
    ## 1658 ENSCGRG00015005181  1135.159811      0.7557888 0.10317135  7.325568
    ## 1659 ENSCGRG00015018845  2392.656716      0.7553873 0.09222704  8.190519
    ## 1660 ENSCGRG00015019697  1353.736591      0.7552223 0.09760823  7.737281
    ## 1661 ENSCGRG00015028296   669.759395      0.7548966 0.12547237  6.016437
    ## 1662 ENSCGRG00015025083   171.392999      0.7548949 0.23836470  3.166974
    ## 1663 ENSCGRG00015017368  1635.972498      0.7546789 0.09494033  7.948982
    ## 1664 ENSCGRG00015019086   159.249490      0.7546283 0.23584567  3.199670
    ## 1665 ENSCGRG00015024705   783.720191      0.7540487 0.12074181  6.245133
    ## 1666 ENSCGRG00015015555  4334.376392      0.7539954 0.07538841 10.001477
    ## 1667 ENSCGRG00015011507   977.329415      0.7539856 0.10947894  6.887038
    ## 1668 ENSCGRG00015017054  1327.173696      0.7539743 0.10228645  7.371204
    ## 1669 ENSCGRG00015020845   577.434573      0.7536842 0.14445482  5.217439
    ## 1670 ENSCGRG00015007902   293.613591      0.7535874 0.17991834  4.188497
    ## 1671 ENSCGRG00015018882  2614.602181      0.7535649 0.08149565  9.246688
    ## 1672 ENSCGRG00015013033  1401.971642      0.7534897 0.09870875  7.633465
    ## 1673 ENSCGRG00015011911  4410.158847      0.7534352 0.07560534  9.965369
    ## 1674 ENSCGRG00015004692  2471.951670      0.7532771 0.08578838  8.780643
    ## 1675 ENSCGRG00015006438   133.288289      0.7530188 0.26364885  2.856143
    ## 1676 ENSCGRG00015015388  1272.071470      0.7527304 0.10846501  6.939846
    ## 1677 ENSCGRG00015023924  4175.952055      0.7526261 0.07538193  9.984171
    ## 1678 ENSCGRG00015019360  1150.619274      0.7526213 0.11752388  6.403986
    ## 1679 ENSCGRG00015023574   103.780899      0.7525392 0.28996727  2.595256
    ## 1680 ENSCGRG00015020561  3118.256532      0.7524349 0.08292422  9.073765
    ## 1681 ENSCGRG00015017709  1548.462931      0.7520431 0.09690322  7.760765
    ## 1682 ENSCGRG00015010358 13920.261950      0.7520291 0.07247580 10.376278
    ## 1683 ENSCGRG00015008497  1939.843093      0.7515179 0.09261573  8.114366
    ## 1684 ENSCGRG00015016113  1905.244694      0.7514931 0.08874728  8.467788
    ## 1685 ENSCGRG00015027616   308.026222      0.7514316 0.17338629  4.333858
    ## 1686 ENSCGRG00015023383   522.256606      0.7513828 0.13814625  5.439039
    ## 1687 ENSCGRG00015001433   565.074570      0.7511836 0.13459371  5.581119
    ## 1688 ENSCGRG00015003705   867.274885      0.7508300 0.11234995  6.682959
    ## 1689 ENSCGRG00015028536   147.300026      0.7507743 0.25383145  2.957767
    ## 1690 ENSCGRG00015003814   899.811432      0.7504786 0.11277551  6.654624
    ## 1691 ENSCGRG00015010752   693.238228      0.7498670 0.12486269  6.005533
    ## 1692 ENSCGRG00015013612   508.516212      0.7497660 0.13964105  5.369238
    ## 1693 ENSCGRG00015020731   573.131496      0.7492714 0.13539988  5.533767
    ## 1694 ENSCGRG00015027472  3210.051997      0.7490284 0.07802717  9.599585
    ## 1695 ENSCGRG00015012883   408.721161      0.7487994 0.15739946  4.757319
    ## 1696 ENSCGRG00015015975  1021.623406      0.7487461 0.12366419  6.054672
    ## 1697 ENSCGRG00015025507   689.175334      0.7484937 0.12754589  5.868427
    ## 1698 ENSCGRG00015002305   397.216885      0.7484339 0.16018312  4.672364
    ## 1699 ENSCGRG00015022841  1107.835643      0.7484158 0.10335210  7.241418
    ## 1700 ENSCGRG00015003456   918.412679      0.7481952 0.11241240  6.655807
    ## 1701 ENSCGRG00015026558   813.481870      0.7479056 0.12057544  6.202802
    ## 1702 ENSCGRG00015026558   813.481870      0.7479056 0.12057544  6.202802
    ## 1703 ENSCGRG00015001838   235.078153      0.7475746 0.20571702  3.633995
    ## 1704 ENSCGRG00015016846  2837.026524      0.7471348 0.08121642  9.199308
    ## 1705 ENSCGRG00015007367  2796.669958      0.7465993 0.08496620  8.787016
    ## 1706 ENSCGRG00015006597  1344.269006      0.7465010 0.10019298  7.450632
    ## 1707 ENSCGRG00015000116  1060.729713      0.7464761 0.10886135  6.857127
    ## 1708 ENSCGRG00015004584   397.502668      0.7464623 0.15555728  4.798633
    ## 1709 ENSCGRG00015027564   127.807829      0.7462730 0.26612268  2.804244
    ## 1710 ENSCGRG00015009212   144.729270      0.7460497 0.24871338  2.999636
    ## 1711 ENSCGRG00015011730  2902.665449      0.7458827 0.08347693  8.935195
    ## 1712 ENSCGRG00015011730  2902.665449      0.7458827 0.08347693  8.935195
    ## 1713 ENSCGRG00015019553   709.874376      0.7454870 0.12155188  6.133077
    ## 1714 ENSCGRG00015024683   182.509870      0.7453823 0.21915971  3.401092
    ## 1715 ENSCGRG00015005434   519.123038      0.7452305 0.14871316  5.011194
    ## 1716 ENSCGRG00015026127  1119.475578      0.7449944 0.10311057  7.225199
    ## 1717 ENSCGRG00015026127  1119.475578      0.7449944 0.10311057  7.225199
    ## 1718 ENSCGRG00015025995   483.412180      0.7443225 0.14283314  5.211133
    ## 1719 ENSCGRG00015025734  1554.759091      0.7442286 0.09287567  8.013170
    ## 1720 ENSCGRG00015007210   581.498801      0.7441962 0.13602212  5.471140
    ## 1721 ENSCGRG00015002733  2030.145807      0.7433924 0.09506346  7.819960
    ## 1722 ENSCGRG00015015935  2756.777314      0.7428407 0.08401035  8.842252
    ## 1723 ENSCGRG00015006773  7647.488285      0.7423818 0.07789433  9.530627
    ## 1724 ENSCGRG00015013186  2678.214898      0.7422571 0.07951039  9.335348
    ## 1725 ENSCGRG00015007118   703.097392      0.7420944 0.12571433  5.903022
    ## 1726 ENSCGRG00015013450  1349.520384      0.7417773 0.10057277  7.375528
    ## 1727 ENSCGRG00015012274   414.448657      0.7410143 0.15280877  4.849292
    ## 1728 ENSCGRG00015009984   106.788479      0.7409622 0.28883006  2.565392
    ## 1729 ENSCGRG00015019166   308.019281      0.7408761 0.17383928  4.261845
    ## 1730 ENSCGRG00015014400   265.828236      0.7408215 0.18522194  3.999642
    ## 1731 ENSCGRG00015023400  3137.222071      0.7404555 0.07914429  9.355767
    ## 1732 ENSCGRG00015008397  2669.739859      0.7398345 0.08098789  9.135125
    ## 1733 ENSCGRG00015006677  5635.454236      0.7396524 0.07494154  9.869725
    ## 1734 ENSCGRG00015025320  2386.286216      0.7394348 0.08177623  9.042172
    ## 1735 ENSCGRG00015011413   795.999337      0.7391666 0.11671102  6.333306
    ## 1736 ENSCGRG00015023984   934.582486      0.7389658 0.11124586  6.642636
    ## 1737 ENSCGRG00015020681   617.178036      0.7388698 0.13715513  5.387110
    ## 1738 ENSCGRG00015009230  2040.213313      0.7388438 0.08778092  8.416906
    ## 1739 ENSCGRG00015018258   941.053578      0.7384778 0.11238187  6.571147
    ## 1740 ENSCGRG00015026455  1091.702534      0.7378564 0.10341833  7.134677
    ## 1741 ENSCGRG00015006112   265.496518      0.7377989 0.18726409  3.939885
    ## 1742 ENSCGRG00015004385   512.059675      0.7377429 0.13923962  5.298369
    ## 1743 ENSCGRG00015003766   610.249370      0.7376214 0.13298299  5.546735
    ## 1744 ENSCGRG00015026525  1221.377066      0.7370124 0.10166085  7.249717
    ## 1745 ENSCGRG00015007106   616.532571      0.7369173 0.12904751  5.710434
    ## 1746 ENSCGRG00015027912   241.185536      0.7368878 0.19517775  3.775470
    ## 1747 ENSCGRG00015016330  1510.927388      0.7367282 0.09846851  7.481866
    ## 1748 ENSCGRG00015026115  1627.531770      0.7365125 0.09368894  7.861253
    ## 1749 ENSCGRG00015027163   482.330851      0.7362366 0.14788208  4.978538
    ## 1750 ENSCGRG00015024365   207.680810      0.7358970 0.20790857  3.539522
    ## 1751 ENSCGRG00015028577   550.269653      0.7350574 0.13600033  5.404821
    ## 1752 ENSCGRG00015020330   605.753422      0.7349696 0.13463443  5.459001
    ## 1753 ENSCGRG00015026991   999.430045      0.7347510 0.11002146  6.678252
    ## 1754 ENSCGRG00015003856  6400.117971      0.7333405 0.07349433  9.978191
    ## 1755 ENSCGRG00015012017   272.778985      0.7328681 0.19056986  3.845667
    ## 1756 ENSCGRG00015020830   310.342977      0.7328121 0.17480233  4.192233
    ## 1757 ENSCGRG00015017732   475.234168      0.7321024 0.14631315  5.003668
    ## 1758 ENSCGRG00015015143  1215.850319      0.7320347 0.10021009  7.305000
    ## 1759 ENSCGRG00015005718   240.396122      0.7319617 0.19212603  3.809800
    ## 1760 ENSCGRG00015000517   230.148781      0.7319551 0.20159608  3.630800
    ## 1761 ENSCGRG00015023988   171.930240      0.7319062 0.24098023  3.037204
    ## 1762 ENSCGRG00015012768   258.173711      0.7318400 0.18602836  3.934023
    ## 1763 ENSCGRG00015025801   123.155263      0.7313959 0.26368950  2.773701
    ## 1764 ENSCGRG00015022850   772.295217      0.7311101 0.11751030  6.221668
    ## 1765 ENSCGRG00015014260  3362.343405      0.7301664 0.08429812  8.661716
    ## 1766 ENSCGRG00015025779  1000.167797      0.7300578 0.11298864  6.461338
    ## 1767 ENSCGRG00015020866  1291.203551      0.7300534 0.10058230  7.258268
    ## 1768 ENSCGRG00015002160   161.767329      0.7295696 0.23228164  3.140884
    ## 1769 ENSCGRG00015026350   238.461049      0.7292319 0.20124559  3.623592
    ## 1770 ENSCGRG00015023044   918.602702      0.7291653 0.11217167  6.500441
    ## 1771 ENSCGRG00015022946  2208.954893      0.7290135 0.08479825  8.597036
    ## 1772 ENSCGRG00015002677  1502.980932      0.7288256 0.09397572  7.755468
    ## 1773 ENSCGRG00015023783   630.140252      0.7287271 0.12779652  5.702245
    ## 1774 ENSCGRG00015001029  2207.287921      0.7286055 0.09022294  8.075613
    ## 1775 ENSCGRG00015018388  3777.137564      0.7277886 0.07444728  9.775892
    ## 1776 ENSCGRG00015027477   284.353375      0.7275474 0.19873804  3.660836
    ## 1777 ENSCGRG00015007301  4159.582612      0.7274775 0.08420296  8.639572
    ## 1778 ENSCGRG00015004807   175.249245      0.7269073 0.22700159  3.202212
    ## 1779 ENSCGRG00015023202   358.631963      0.7268315 0.16733320  4.343618
    ## 1780 ENSCGRG00015010093  4571.991758      0.7262268 0.07201159 10.084861
    ## 1781 ENSCGRG00015010294   443.549455      0.7259510 0.15072731  4.816320
    ## 1782 ENSCGRG00015022542   323.272632      0.7252834 0.18058298  4.016344
    ## 1783 ENSCGRG00015019624   853.860861      0.7252613 0.11641284  6.230080
    ## 1784 ENSCGRG00015015111   333.331095      0.7246691 0.17338027  4.179652
    ## 1785 ENSCGRG00015015111   333.331095      0.7246691 0.17338027  4.179652
    ## 1786 ENSCGRG00015014863  3353.165171      0.7245792 0.07761706  9.335309
    ## 1787 ENSCGRG00015005619  5309.034679      0.7244662 0.07092218 10.214945
    ## 1788 ENSCGRG00015011798  3705.754583      0.7240918 0.07850637  9.223351
    ## 1789 ENSCGRG00015008878  3237.803370      0.7240761 0.08683851  8.338191
    ## 1790 ENSCGRG00015019659   778.242267      0.7235100 0.11738022  6.163815
    ## 1791 ENSCGRG00015028434   418.339170      0.7233423 0.15475253  4.674187
    ## 1792 ENSCGRG00015006807   580.726233      0.7232508 0.13588996  5.322327
    ## 1793 ENSCGRG00015015011   260.413753      0.7230562 0.18994491  3.806662
    ## 1794 ENSCGRG00015024493  1204.788773      0.7224289 0.10216649  7.071095
    ## 1795 ENSCGRG00015016615   950.448623      0.7222753 0.12658046  5.706057
    ## 1796 ENSCGRG00015005741  2710.763207      0.7219176 0.08276282  8.722728
    ## 1797 ENSCGRG00015020485  3123.117186      0.7217118 0.08991637  8.026478
    ## 1798 ENSCGRG00015001799   105.511374      0.7216229 0.28287042  2.551072
    ## 1799 ENSCGRG00015005047   367.865504      0.7213634 0.15907854  4.534637
    ## 1800 ENSCGRG00015013277   686.110765      0.7212908 0.12458964  5.789332
    ## 1801 ENSCGRG00015004750 20280.276015      0.7212511 0.06140054 11.746658
    ## 1802 ENSCGRG00015025796   844.030159      0.7212090 0.11710107  6.158859
    ## 1803 ENSCGRG00015027175  4132.712545      0.7210637 0.07310451  9.863464
    ## 1804 ENSCGRG00015019329  1031.282103      0.7207952 0.10703294  6.734330
    ## 1805 ENSCGRG00015020570  1760.471740      0.7204196 0.09103939  7.913274
    ## 1806 ENSCGRG00015012847  2395.494842      0.7195463 0.08167285  8.810104
    ## 1807 ENSCGRG00015026162   777.580361      0.7194225 0.11922453  6.034182
    ## 1808 ENSCGRG00015020578   657.330620      0.7188319 0.12596380  5.706655
    ## 1809 ENSCGRG00015004335   160.479228      0.7188312 0.23385277  3.073862
    ## 1810 ENSCGRG00015021516  1555.494608      0.7186641 0.09385442  7.657222
    ## 1811 ENSCGRG00015011179   707.050081      0.7186156 0.12955128  5.546958
    ## 1812 ENSCGRG00015014038  5058.852766      0.7181368 0.08435369  8.513401
    ## 1813 ENSCGRG00015027346  2557.461653      0.7180925 0.08116598  8.847211
    ## 1814 ENSCGRG00015008078   833.581495      0.7177638 0.11577482  6.199654
    ## 1815 ENSCGRG00015019576    89.304540      0.7177489 0.30662426  2.340809
    ## 1816 ENSCGRG00015028737   464.227973      0.7176816 0.14468267  4.960384
    ## 1817 ENSCGRG00015025173   770.304535      0.7162691 0.11851533  6.043683
    ## 1818 ENSCGRG00015008021   932.340065      0.7159111 0.11028959  6.491194
    ## 1819 ENSCGRG00015015061   542.981801      0.7155285 0.14091914  5.077582
    ## 1820 ENSCGRG00015017024   912.696625      0.7152835 0.11189463  6.392474
    ## 1821 ENSCGRG00015017257   370.846761      0.7152284 0.16805258  4.255980
    ## 1822 ENSCGRG00015017673  1519.682106      0.7151938 0.09658957  7.404462
    ## 1823 ENSCGRG00015026439  1137.569230      0.7149103 0.10211363  7.001125
    ## 1824 ENSCGRG00015025601   255.124873      0.7145790 0.19017384  3.757504
    ## 1825 ENSCGRG00015025644   868.522418      0.7144867 0.11310915  6.316790
    ## 1826 ENSCGRG00015002413   566.201651      0.7142198 0.13525151  5.280679
    ## 1827 ENSCGRG00015003037  2132.979700      0.7141607 0.08524033  8.378202
    ## 1828 ENSCGRG00015017108   698.695485      0.7140112 0.12483650  5.719571
    ## 1829 ENSCGRG00015020060  3203.699330      0.7138178 0.07727023  9.237941
    ## 1830 ENSCGRG00015016402   438.435332      0.7134267 0.14743556  4.838905
    ## 1831 ENSCGRG00015016825   419.876670      0.7131996 0.17359802  4.108339
    ## 1832 ENSCGRG00015019332  1969.449521      0.7131769 0.09032818  7.895398
    ## 1833 ENSCGRG00015017010   484.399613      0.7128945 0.14290175  4.988703
    ## 1834 ENSCGRG00015024073   414.509890      0.7126301 0.15088670  4.722949
    ## 1835 ENSCGRG00015019162   360.338526      0.7116443 0.17241619  4.127479
    ## 1836 ENSCGRG00015021400   424.134677      0.7116306 0.14977455  4.751345
    ## 1837 ENSCGRG00015022701  1348.099508      0.7113059 0.09848806  7.222255
    ## 1838 ENSCGRG00015002423  1115.066184      0.7109889 0.10578367  6.721159
    ## 1839 ENSCGRG00015027044   592.731882      0.7103268 0.13171493  5.392910
    ## 1840 ENSCGRG00015022176   432.885320      0.7102883 0.14914672  4.762346
    ## 1841 ENSCGRG00015007163   174.669545      0.7099376 0.23667754  2.999598
    ## 1842 ENSCGRG00015007084  2592.134375      0.7095971 0.08649756  8.203667
    ## 1843 ENSCGRG00015020616   111.841387      0.7090146 0.28063981  2.526422
    ## 1844 ENSCGRG00015007573   553.258785      0.7080012 0.13870389  5.104408
    ## 1845 ENSCGRG00015028289   587.575664      0.7079957 0.13235170  5.349351
    ## 1846 ENSCGRG00015012266   510.739018      0.7078717 0.13920722  5.085021
    ## 1847 ENSCGRG00015027333   747.608169      0.7078500 0.12630267  5.604395
    ## 1848 ENSCGRG00015026220   403.530837      0.7077155 0.16063791  4.405657
    ## 1849 ENSCGRG00015019762  4709.371688      0.7076656 0.07222263  9.798392
    ## 1850 ENSCGRG00015014613  1222.287993      0.7076651 0.10202125  6.936448
    ## 1851 ENSCGRG00015003156   449.637596      0.7075394 0.15309149  4.621677
    ## 1852 ENSCGRG00015004472  3292.694866      0.7074807 0.08145594  8.685440
    ## 1853 ENSCGRG00015016679   615.503618      0.7074513 0.13485731  5.245925
    ## 1854 ENSCGRG00015020875   211.389154      0.7071787 0.20422916  3.462672
    ## 1855 ENSCGRG00015009455  2864.718371      0.7071651 0.08269015  8.551986
    ## 1856 ENSCGRG00015024591  1048.061189      0.7069685 0.10664285  6.629310
    ## 1857 ENSCGRG00015020588   830.143502      0.7060407 0.11557423  6.108980
    ## 1858 ENSCGRG00015005349  3387.054662      0.7058927 0.07579320  9.313403
    ## 1859 ENSCGRG00015025527   995.460713      0.7052043 0.11381502  6.196057
    ## 1860 ENSCGRG00015017276  1446.015954      0.7043790 0.10453188  6.738414
    ## 1861 ENSCGRG00015002984  3040.196450      0.7041737 0.08256123  8.529109
    ## 1862 ENSCGRG00015018817  2641.855465      0.7031408 0.08101473  8.679173
    ## 1863 ENSCGRG00015015463  3715.544020      0.7030834 0.08411074  8.359021
    ## 1864 ENSCGRG00015021252   302.951087      0.7030247 0.17413416  4.037259
    ## 1865 ENSCGRG00015023839   346.381769      0.7027717 0.16355844  4.296762
    ## 1866 ENSCGRG00015009557   244.300912      0.7022006 0.20074415  3.497988
    ## 1867 ENSCGRG00015024000   202.768477      0.7021788 0.21636107  3.245403
    ## 1868 ENSCGRG00015008321   579.368431      0.7018121 0.14029402  5.002438
    ## 1869 ENSCGRG00015017586   985.632766      0.7017738 0.10709508  6.552810
    ## 1870 ENSCGRG00015004329   486.008544      0.7015858 0.14113485  4.971032
    ## 1871 ENSCGRG00015006731  1422.246908      0.7009882 0.09473775  7.399248
    ## 1872 ENSCGRG00015016635   858.027973      0.7007023 0.11400263  6.146369
    ## 1873 ENSCGRG00015021756   541.286800      0.7001741 0.13848289  5.056033
    ## 1874 ENSCGRG00015011263   538.407391      0.6992395 0.13772014  5.077249
    ## 1875 ENSCGRG00015013379   512.524222      0.6986322 0.13884026  5.031914
    ## 1876 ENSCGRG00015020259   229.041149      0.6983739 0.20049709  3.483212
    ## 1877 ENSCGRG00015010385  8980.964064      0.6982439 0.07385823  9.453841
    ## 1878 ENSCGRG00015008479  1280.738887      0.6978927 0.10178994  6.856204
    ## 1879 ENSCGRG00015019662   440.000914      0.6974162 0.14749347  4.728455
    ## 1880 ENSCGRG00015027402  1104.490685      0.6972825 0.10497727  6.642223
    ## 1881 ENSCGRG00015013136  3209.092218      0.6971345 0.08097671  8.609074
    ## 1882 ENSCGRG00015004926   561.819798      0.6968654 0.13342014  5.223090
    ## 1883 ENSCGRG00015026789  2715.464613      0.6966463 0.09684863  7.193146
    ## 1884 ENSCGRG00015010136   450.208842      0.6966106 0.14927474  4.666634
    ## 1885 ENSCGRG00015028001   286.265312      0.6962588 0.18303385  3.803990
    ## 1886 ENSCGRG00015009833  1042.189560      0.6959302 0.10676086  6.518589
    ## 1887 ENSCGRG00015021632   229.695752      0.6957897 0.20489779  3.395789
    ## 1888 ENSCGRG00015027592   206.589857      0.6955854 0.20735636  3.354541
    ## 1889 ENSCGRG00015006881   324.193495      0.6952094 0.17112963  4.062472
    ## 1890 ENSCGRG00015024173  1188.466854      0.6950931 0.10124284  6.865602
    ## 1891 ENSCGRG00015007476   946.400183      0.6950255 0.11227472  6.190401
    ## 1892 ENSCGRG00015015003   171.938543      0.6946490 0.22639511  3.068304
    ## 1893 ENSCGRG00015022432   437.132331      0.6944744 0.14929925  4.651560
    ## 1894 ENSCGRG00015004745   310.862999      0.6943557 0.17349338  4.002203
    ## 1895 ENSCGRG00015025746   556.228270      0.6941040 0.13651438  5.084475
    ## 1896 ENSCGRG00015018829   263.231357      0.6937456 0.18498396  3.750302
    ## 1897 ENSCGRG00015023428  3615.208700      0.6927078 0.09412044  7.359802
    ## 1898 ENSCGRG00015026718   867.551458      0.6926198 0.11270469  6.145440
    ## 1899 ENSCGRG00015028393   730.622363      0.6925417 0.12240030  5.658006
    ## 1900 ENSCGRG00015024310   393.715750      0.6925195 0.15465466  4.477844
    ## 1901 ENSCGRG00015005232   401.875320      0.6922818 0.15588152  4.441077
    ## 1902 ENSCGRG00015021711   450.900354      0.6922684 0.14749871  4.693386
    ## 1903 ENSCGRG00015016019  2678.826653      0.6920625 0.08073470  8.572057
    ## 1904 ENSCGRG00015016931  3008.553197      0.6919623 0.08069504  8.575028
    ## 1905 ENSCGRG00015016437   428.838644      0.6916619 0.14892321  4.644420
    ## 1906 ENSCGRG00015001105   476.238439      0.6916019 0.14464422  4.781400
    ## 1907 ENSCGRG00015009591   442.450556      0.6913837 0.14955294  4.623003
    ## 1908 ENSCGRG00015009478  1026.592262      0.6910839 0.10596583  6.521762
    ## 1909 ENSCGRG00015028355   320.241484      0.6906806 0.17064450  4.047482
    ## 1910 ENSCGRG00015009057   316.621369      0.6902879 0.17005297  4.059252
    ## 1911 ENSCGRG00015026841   110.224809      0.6899505 0.28120053  2.453589
    ## 1912 ENSCGRG00015009756   834.665171      0.6896908 0.11598166  5.946550
    ## 1913 ENSCGRG00015003757   581.968318      0.6896714 0.13363990  5.160670
    ## 1914 ENSCGRG00015028247   392.375785      0.6894973 0.15902022  4.335910
    ## 1915 ENSCGRG00015022339  1492.834534      0.6893898 0.09776735  7.051330
    ## 1916 ENSCGRG00015009926   222.177955      0.6893586 0.21930779  3.143339
    ## 1917 ENSCGRG00015021144  1377.734160      0.6892144 0.10129288  6.804174
    ## 1918 ENSCGRG00015002199  2271.114156      0.6891415 0.08416836  8.187655
    ## 1919 ENSCGRG00015000902   281.003338      0.6890060 0.17985343  3.830930
    ## 1920 ENSCGRG00015003237  4153.698888      0.6888912 0.07222526  9.538092
    ## 1921 ENSCGRG00015024243   950.000539      0.6884984 0.11548127  5.961992
    ## 1922 ENSCGRG00015017739  5284.844463      0.6881115 0.06959636  9.887176
    ## 1923 ENSCGRG00015007076   140.903399      0.6876365 0.26514151  2.593470
    ## 1924 ENSCGRG00015026238  1664.075452      0.6876023 0.09089441  7.564847
    ## 1925 ENSCGRG00015019625   963.279609      0.6875806 0.10828063  6.349987
    ## 1926 ENSCGRG00015015240  3012.739065      0.6870647 0.07874570  8.725107
    ## 1927 ENSCGRG00015001461   292.382706      0.6865516 0.17694603  3.880006
    ## 1928 ENSCGRG00015006374   411.789716      0.6864662 0.16000496  4.290281
    ## 1929 ENSCGRG00015008155  1526.248170      0.6863614 0.09701924  7.074487
    ## 1930 ENSCGRG00015010467  4227.335337      0.6863217 0.07779033  8.822712
    ## 1931 ENSCGRG00015018208   527.127217      0.6861102 0.13997968  4.901499
    ## 1932 ENSCGRG00015008189   484.929799      0.6857940 0.15005111  4.570402
    ## 1933 ENSCGRG00015000104  1101.567124      0.6857311 0.10555520  6.496422
    ## 1934 ENSCGRG00015014319   369.507172      0.6856812 0.16969610  4.040642
    ## 1935 ENSCGRG00015017940   230.335538      0.6854549 0.19632646  3.491404
    ## 1936 ENSCGRG00015023603   328.330945      0.6852727 0.17498206  3.916245
    ## 1937 ENSCGRG00015007894  5950.688742      0.6852467 0.07445852  9.203067
    ## 1938 ENSCGRG00015011553   623.470124      0.6850996 0.13128268  5.218507
    ## 1939 ENSCGRG00015005564  1210.332322      0.6849556 0.10549893  6.492536
    ## 1940 ENSCGRG00015023006  2096.030167      0.6849264 0.08691618  7.880310
    ## 1941 ENSCGRG00015017963   487.726963      0.6848286 0.14251206  4.805408
    ## 1942 ENSCGRG00015017963   487.726963      0.6848286 0.14251206  4.805408
    ## 1943 ENSCGRG00015019543  1353.587340      0.6844422 0.09673313  7.075572
    ## 1944 ENSCGRG00015020375   295.626515      0.6843158 0.18871506  3.626185
    ## 1945 ENSCGRG00015027915  1057.293725      0.6841761 0.10666509  6.414245
    ## 1946 ENSCGRG00015024875   102.636512      0.6840523 0.28582168  2.393284
    ## 1947 ENSCGRG00015026349   723.489514      0.6839138 0.12373034  5.527455
    ## 1948 ENSCGRG00015005319  1550.726691      0.6835757 0.09342639  7.316731
    ## 1949 ENSCGRG00015014185  1238.840555      0.6833731 0.11291331  6.052193
    ## 1950 ENSCGRG00015019957   350.197554      0.6830698 0.16367870  4.173236
    ## 1951 ENSCGRG00015014461   932.920844      0.6828525 0.11360998  6.010498
    ## 1952 ENSCGRG00015011178   156.796940      0.6827852 0.23561000  2.897946
    ## 1953 ENSCGRG00015028054   479.526808      0.6827827 0.14772774  4.621899
    ## 1954 ENSCGRG00015001878  1141.143415      0.6826743 0.10227280  6.675033
    ## 1955 ENSCGRG00015015037  4135.469395      0.6824839 0.07769491  8.784152
    ## 1956 ENSCGRG00015015134   191.441739      0.6822239 0.21595165  3.159151
    ## 1957 ENSCGRG00015017469  1996.663172      0.6821980 0.08725706  7.818256
    ## 1958 ENSCGRG00015021937   647.374356      0.6819679 0.13306289  5.125155
    ## 1959 ENSCGRG00015016362  1225.265182      0.6818897 0.10333886  6.598580
    ## 1960 ENSCGRG00015028727  2180.955086      0.6816699 0.09078077  7.508968
    ## 1961 ENSCGRG00015018078   178.564364      0.6815276 0.22139908  3.078276
    ## 1962 ENSCGRG00015028309  1057.725389      0.6812324 0.25511027  2.670345
    ## 1963 ENSCGRG00015028244   667.305940      0.6811755 0.12465006  5.464702
    ## 1964 ENSCGRG00015005083   222.309667      0.6811060 0.19881783  3.425779
    ## 1965 ENSCGRG00015000098   705.201687      0.6809439 0.13388352  5.086092
    ## 1966 ENSCGRG00015010015   916.671801      0.6809259 0.11398080  5.974041
    ## 1967 ENSCGRG00015008059   332.897574      0.6808038 0.16661096  4.086189
    ## 1968 ENSCGRG00015011273   809.591171      0.6806812 0.11826014  5.755795
    ## 1969 ENSCGRG00015027614   832.430841      0.6803368 0.11744131  5.792994
    ## 1970 ENSCGRG00015023607   956.624015      0.6801255 0.10985747  6.190981
    ## 1971 ENSCGRG00015021140   471.068724      0.6800131 0.14614467  4.653013
    ## 1972 ENSCGRG00015014297   207.765238      0.6798400 0.21014983  3.235025
    ## 1973 ENSCGRG00015028130  2449.000041      0.6796128 0.08456559  8.036517
    ## 1974 ENSCGRG00015012523   977.623635      0.6794577 0.11233951  6.048252
    ## 1975 ENSCGRG00015012523   977.623635      0.6794577 0.11233951  6.048252
    ## 1976 ENSCGRG00015026689  3128.935178      0.6792892 0.07765766  8.747228
    ## 1977 ENSCGRG00015019785   353.061953      0.6788737 0.16371603  4.146654
    ## 1978 ENSCGRG00015014555   155.332807      0.6787093 0.24676770  2.750398
    ## 1979 ENSCGRG00015007726   109.646958      0.6782007 0.27694210  2.448890
    ## 1980 ENSCGRG00015004314   196.270567      0.6780361 0.25706803  2.637575
    ## 1981 ENSCGRG00015016447   277.579921      0.6779665 0.18479735  3.668703
    ## 1982 ENSCGRG00015015655  2471.112755      0.6778955 0.08146662  8.321144
    ## 1983 ENSCGRG00015009141   700.139779      0.6777738 0.12683632  5.343688
    ## 1984 ENSCGRG00015027609  1452.107877      0.6776957 0.10676619  6.347475
    ## 1985 ENSCGRG00015003095   687.357383      0.6773894 0.12645795  5.356637
    ## 1986 ENSCGRG00015002627   157.980678      0.6766438 0.23289486  2.905362
    ## 1987 ENSCGRG00015014734  1770.948847      0.6763609 0.09144963  7.395995
    ## 1988 ENSCGRG00015014582   387.922011      0.6763262 0.16136244  4.191348
    ## 1989 ENSCGRG00015019221   923.050950      0.6760366 0.11047890  6.119147
    ## 1990 ENSCGRG00015013707  5063.362755      0.6760157 0.07143069  9.463940
    ## 1991 ENSCGRG00015003617  1532.257502      0.6759901 0.09416960  7.178433
    ## 1992 ENSCGRG00015002528   645.255431      0.6756186 0.13111887  5.152718
    ## 1993 ENSCGRG00015012263   653.382873      0.6749934 0.12740988  5.297811
    ## 1994 ENSCGRG00015001522  4592.217643      0.6746026 0.07232185  9.327784
    ## 1995 ENSCGRG00015022107   167.300183      0.6742341 0.22787728  2.958759
    ## 1996 ENSCGRG00015014429   531.534752      0.6742115 0.14271772  4.724091
    ## 1997 ENSCGRG00015001780  2018.181808      0.6741187 0.09180602  7.342859
    ## 1998 ENSCGRG00015022851   820.296717      0.6740495 0.12114074  5.564185
    ## 1999 ENSCGRG00015021050   989.206560      0.6737791 0.11290853  5.967478
    ## 2000 ENSCGRG00015008285   171.293962      0.6737631 0.22772814  2.958629
    ## 2001 ENSCGRG00015023055  1756.889123      0.6737456 0.08937347  7.538541
    ## 2002 ENSCGRG00015000665  2272.885777      0.6737196 0.09305928  7.239682
    ## 2003 ENSCGRG00015016300  1539.766252      0.6727389 0.09255775  7.268315
    ## 2004 ENSCGRG00015015961   292.106760      0.6725747 0.17602146  3.820981
    ## 2005 ENSCGRG00015019073   186.107657      0.6723396 0.23638090  2.844306
    ## 2006 ENSCGRG00015023577   264.450375      0.6721485 0.19147481  3.510376
    ## 2007 ENSCGRG00015000009  1695.826396      0.6720972 0.09511973  7.065802
    ## 2008 ENSCGRG00015027519   410.802141      0.6720166 0.15425121  4.356638
    ## 2009 ENSCGRG00015020911   136.563553      0.6717619 0.24969991  2.690277
    ## 2010 ENSCGRG00015013884   660.156558      0.6713858 0.12450687  5.392360
    ## 2011 ENSCGRG00015024696  1165.954356      0.6712778 0.10726960  6.257856
    ## 2012 ENSCGRG00015023610  1723.455140      0.6712627 0.09287103  7.227902
    ## 2013 ENSCGRG00015006159  1146.142687      0.6708202 0.11316822  5.927638
    ## 2014 ENSCGRG00015003765   736.633296      0.6707042 0.12044046  5.568761
    ## 2015 ENSCGRG00015023973   109.663137      0.6701088 0.28250380  2.372035
    ## 2016 ENSCGRG00015025157  3615.319408      0.6699513 0.07892648  8.488296
    ## 2017 ENSCGRG00015012841  5511.366181      0.6699353 0.06884246  9.731426
    ## 2018 ENSCGRG00015027214   455.196502      0.6699211 0.14563770  4.599916
    ## 2019 ENSCGRG00015008133  2655.441360      0.6698642 0.07968963  8.405915
    ## 2020 ENSCGRG00015003668  1630.810063      0.6696412 0.09330311  7.177050
    ## 2021 ENSCGRG00015001855   354.526858      0.6694500 0.16252858  4.118968
    ## 2022 ENSCGRG00015025055   371.130682      0.6693510 0.16664076  4.016730
    ## 2023 ENSCGRG00015009082   560.486165      0.6693148 0.13336660  5.018609
    ## 2024 ENSCGRG00015015249   618.007107      0.6692860 0.12893342  5.190942
    ## 2025 ENSCGRG00015011668   121.845810      0.6685010 0.26429896  2.529336
    ## 2026 ENSCGRG00015011564   137.581309      0.6684911 0.25241661  2.648364
    ## 2027 ENSCGRG00015012683  1398.091803      0.6684319 0.10126686  6.600697
    ## 2028 ENSCGRG00015016711   679.917531      0.6683617 0.13453463  4.967953
    ## 2029 ENSCGRG00015013664  2420.815527      0.6681844 0.08396479  7.957912
    ## 2030 ENSCGRG00015002343   354.396977      0.6678116 0.16453695  4.058733
    ## 2031 ENSCGRG00015016359  1410.617288      0.6673728 0.10488574  6.362855
    ## 2032 ENSCGRG00015011175   989.474240      0.6672948 0.10731981  6.217816
    ## 2033 ENSCGRG00015014969  1370.402457      0.6672009 0.09831559  6.786318
    ## 2034 ENSCGRG00015026177   286.379384      0.6667375 0.18179606  3.667503
    ## 2035 ENSCGRG00015012467   487.667875      0.6665183 0.15518881  4.294886
    ## 2036 ENSCGRG00015007558   256.465357      0.6663147 0.18917787  3.522160
    ## 2037 ENSCGRG00015013171  1401.881795      0.6654987 0.10574315  6.293540
    ## 2038 ENSCGRG00015008413   303.718026      0.6651461 0.18008935  3.693423
    ## 2039 ENSCGRG00015004082  7766.743445      0.6648592 0.06670394  9.967315
    ## 2040 ENSCGRG00015009204  1124.209427      0.6647889 0.10619890  6.259848
    ## 2041 ENSCGRG00015014405   774.350173      0.6647017 0.11828304  5.619586
    ## 2042 ENSCGRG00015014690  1090.979072      0.6637712 0.10536931  6.299474
    ## 2043 ENSCGRG00015007621   559.245653      0.6637578 0.13314059  4.985390
    ## 2044 ENSCGRG00015005311  1677.055726      0.6636827 0.09107165  7.287479
    ## 2045 ENSCGRG00015008979  3479.230995      0.6633865 0.07631776  8.692425
    ## 2046 ENSCGRG00015028881   200.955147      0.6633480 0.20821569  3.185870
    ## 2047 ENSCGRG00015024713   134.282654      0.6630272 0.25322342  2.618349
    ## 2048 ENSCGRG00015024732   488.782828      0.6627090 0.14115229  4.694993
    ## 2049 ENSCGRG00015000799   572.588092      0.6621744 0.13331637  4.966940
    ## 2050 ENSCGRG00015027024  3406.236205      0.6621011 0.08694350  7.615303
    ## 2051 ENSCGRG00015006916   705.955239      0.6619080 0.12438240  5.321557
    ## 2052 ENSCGRG00015014937  2152.244143      0.6617119 0.08862454  7.466463
    ## 2053 ENSCGRG00015001231  2339.961849      0.6617012 0.08240262  8.030100
    ## 2054 ENSCGRG00015015500   909.708206      0.6615828 0.11079307  5.971338
    ## 2055 ENSCGRG00015002951  1318.243867      0.6613385 0.10024466  6.597244
    ## 2056 ENSCGRG00015028222   208.230661      0.6611358 0.20798402  3.178782
    ## 2057 ENSCGRG00015009773  1199.065105      0.6609515 0.10783347  6.129373
    ## 2058 ENSCGRG00015013474  1193.121829      0.6605772 0.10175681  6.491725
    ## 2059 ENSCGRG00015009252   634.581161      0.6604688 0.13560722  4.870455
    ## 2060 ENSCGRG00015025233  4914.164730      0.6600438 0.08453728  7.807725
    ## 2061 ENSCGRG00015018862   921.261778      0.6599101 0.11385201  5.796210
    ## 2062 ENSCGRG00015018138   919.886878      0.6596334 0.12116478  5.444102
    ## 2063 ENSCGRG00015025999  1046.362046      0.6595051 0.11385376  5.792563
    ## 2064 ENSCGRG00015020301  1590.723843      0.6589172 0.09524100  6.918420
    ## 2065 ENSCGRG00015006348   909.951255      0.6585850 0.11262393  5.847647
    ## 2066 ENSCGRG00015022730   555.751050      0.6580692 0.13631015  4.827734
    ## 2067 ENSCGRG00015025136   249.521582      0.6577795 0.19398860  3.390815
    ## 2068 ENSCGRG00015014879  2511.461099      0.6576945 0.09266584  7.097486
    ## 2069 ENSCGRG00015004661  3393.765903      0.6576557 0.08081467  8.137826
    ## 2070 ENSCGRG00015012164   204.384042      0.6574498 0.20872456  3.149844
    ## 2071 ENSCGRG00015005353  6040.009343      0.6573821 0.07632029  8.613464
    ## 2072 ENSCGRG00015009226  2485.077825      0.6570053 0.09073375  7.241024
    ## 2073 ENSCGRG00015016054  1578.342401      0.6567701 0.09378283  7.003095
    ## 2074 ENSCGRG00015007543   662.068141      0.6567318 0.12517917  5.246334
    ## 2075 ENSCGRG00015011182   685.251166      0.6567174 0.12497858  5.254639
    ## 2076 ENSCGRG00015013340   878.753186      0.6563665 0.11253910  5.832342
    ## 2077 ENSCGRG00015022687   787.147955      0.6561934 0.11717758  5.599992
    ## 2078 ENSCGRG00015019121   575.569279      0.6561373 0.13693105  4.791735
    ## 2079 ENSCGRG00015007491   296.593791      0.6559717 0.19334092  3.392824
    ## 2080 ENSCGRG00015020625  2050.618817      0.6559150 0.08533252  7.686577
    ## 2081 ENSCGRG00015026296  2658.349160      0.6555636 0.08869198  7.391464
    ## 2082 ENSCGRG00015026868   508.077617      0.6552705 0.14210100  4.611301
    ## 2083 ENSCGRG00015015645  2213.369931      0.6551076 0.08895913  7.364141
    ## 2084 ENSCGRG00015015645  2213.369931      0.6551076 0.08895913  7.364141
    ## 2085 ENSCGRG00015024760   118.572251      0.6550406 0.27458986  2.385524
    ## 2086 ENSCGRG00015007961  3177.114442      0.6549470 0.08216382  7.971234
    ## 2087 ENSCGRG00015022504  1507.767627      0.6548972 0.09301907  7.040462
    ## 2088 ENSCGRG00015026563   733.778835      0.6545741 0.12198251  5.366131
    ## 2089 ENSCGRG00015026774  1412.625764      0.6542778 0.09664948  6.769595
    ## 2090 ENSCGRG00015026593  2915.135498      0.6541507 0.08030019  8.146316
    ## 2091 ENSCGRG00015025997  1172.327259      0.6539930 0.10232630  6.391251
    ## 2092 ENSCGRG00015022907   184.619410      0.6538658 0.21860572  2.991073
    ## 2093 ENSCGRG00015026953   467.816573      0.6535089 0.15248012  4.285863
    ## 2094 ENSCGRG00015023573  5882.444980      0.6534725 0.07026969  9.299493
    ## 2095 ENSCGRG00015001037   921.949383      0.6533050 0.11912807  5.484056
    ## 2096 ENSCGRG00015024575   545.325127      0.6531034 0.13679898  4.774183
    ## 2097 ENSCGRG00015013578  1433.368006      0.6528141 0.09713034  6.721011
    ## 2098 ENSCGRG00015006537  1713.704565      0.6525509 0.09402904  6.939887
    ## 2099 ENSCGRG00015016829  3388.899128      0.6525013 0.07530440  8.664850
    ## 2100 ENSCGRG00015026234  1915.302530      0.6524280 0.09868275  6.611368
    ## 2101 ENSCGRG00015028364  5088.868752      0.6514024 0.08266837  7.879705
    ## 2102 ENSCGRG00015024693   293.872586      0.6510350 0.17504581  3.719226
    ## 2103 ENSCGRG00015028557  4609.123887      0.6508379 0.08896525  7.315642
    ## 2104 ENSCGRG00015026566  1022.826480      0.6505844 0.10611352  6.131023
    ## 2105 ENSCGRG00015006864   692.252198      0.6504249 0.12378334  5.254543
    ## 2106 ENSCGRG00015002391  2366.939810      0.6503084 0.08289010  7.845430
    ## 2107 ENSCGRG00015016088  3962.976225      0.6501973 0.08902008  7.303940
    ## 2108 ENSCGRG00015016088  3962.976225      0.6501973 0.08902008  7.303940
    ## 2109 ENSCGRG00015014350   492.440409      0.6499668 0.15919631  4.082801
    ## 2110 ENSCGRG00015007958  1042.474490      0.6499564 0.10720124  6.062957
    ## 2111 ENSCGRG00015006387  2660.646111      0.6495396 0.08211310  7.910304
    ## 2112 ENSCGRG00015004470   639.774256      0.6490712 0.12666537  5.124299
    ## 2113 ENSCGRG00015028882   706.460964      0.6488659 0.12180763  5.326973
    ## 2114 ENSCGRG00015027911   330.293813      0.6488476 0.17885978  3.627688
    ## 2115 ENSCGRG00015012058  1968.581766      0.6487105 0.09467024  6.852317
    ## 2116 ENSCGRG00015015686  2084.611770      0.6484566 0.09777497  6.632134
    ## 2117 ENSCGRG00015025443   374.610989      0.6483687 0.15940766  4.067362
    ## 2118 ENSCGRG00015003641   212.975401      0.6479885 0.20410264  3.174817
    ## 2119 ENSCGRG00015009691  3035.246313      0.6476372 0.07878867  8.219928
    ## 2120 ENSCGRG00015026622  2090.541981      0.6475963 0.08704680  7.439633
    ## 2121 ENSCGRG00015008300  1766.301687      0.6475694 0.08934421  7.248029
    ## 2122 ENSCGRG00015004503   718.714097      0.6474530 0.12423079  5.211695
    ## 2123 ENSCGRG00015019479   318.567633      0.6471977 0.17230827  3.756046
    ## 2124 ENSCGRG00015006968  3950.436321      0.6471382 0.07982032  8.107437
    ## 2125 ENSCGRG00015007443  1660.264566      0.6469937 0.09061042  7.140390
    ## 2126 ENSCGRG00015017408   716.885251      0.6469672 0.12238754  5.286218
    ## 2127 ENSCGRG00015027294   553.848818      0.6468378 0.14379767  4.498250
    ## 2128 ENSCGRG00015009741  1829.282939      0.6464482 0.09035716  7.154366
    ## 2129 ENSCGRG00015003245   691.453302      0.6462785 0.12219109  5.289081
    ## 2130 ENSCGRG00015027211   278.015946      0.6462384 0.18811523  3.435333
    ## 2131 ENSCGRG00015015527  4858.867999      0.6459661 0.07048557  9.164516
    ## 2132 ENSCGRG00015005043   128.244142      0.6457018 0.26234478  2.461272
    ## 2133 ENSCGRG00015021418   636.475402      0.6455892 0.13999413  4.611545
    ## 2134 ENSCGRG00015000050   756.348912      0.6454752 0.12460282  5.180262
    ## 2135 ENSCGRG00015011491  1249.702566      0.6453963 0.10647797  6.061313
    ## 2136 ENSCGRG00015000162   870.576959      0.6446132 0.11594123  5.559827
    ## 2137 ENSCGRG00015013515  1409.683989      0.6445482 0.09838323  6.551403
    ## 2138 ENSCGRG00015019194  1493.800925      0.6444103 0.10048055  6.413284
    ## 2139 ENSCGRG00015014721   398.834069      0.6443875 0.15892729  4.054606
    ## 2140 ENSCGRG00015025848  2544.260912      0.6442385 0.08032997  8.019902
    ## 2141 ENSCGRG00015018967  1102.800391      0.6442251 0.10553992  6.104090
    ## 2142 ENSCGRG00015019243  3447.642868      0.6431767 0.07653201  8.404022
    ## 2143 ENSCGRG00015014952   689.670404      0.6431618 0.13339149  4.821610
    ## 2144 ENSCGRG00015014952   689.670404      0.6431618 0.13339149  4.821610
    ## 2145 ENSCGRG00015025816   937.058662      0.6431172 0.11091533  5.798272
    ## 2146 ENSCGRG00015014231  1023.206613      0.6428979 0.10840515  5.930511
    ## 2147 ENSCGRG00015003454  1408.026222      0.6425376 0.10345318  6.210903
    ## 2148 ENSCGRG00015028505   297.620308      0.6419358 0.17937866  3.578663
    ## 2149 ENSCGRG00015000687  1634.949621      0.6418496 0.09380405  6.842451
    ## 2150 ENSCGRG00015016235   734.108303      0.6414849 0.12617482  5.084096
    ## 2151 ENSCGRG00015007862  1104.155060      0.6413839 0.10470309  6.125739
    ## 2152 ENSCGRG00015013955   774.707456      0.6409967 0.11726858  5.466057
    ## 2153 ENSCGRG00015025569  2117.544989      0.6409504 0.08929664  7.177765
    ## 2154 ENSCGRG00015003595   952.654943      0.6409467 0.11301952  5.671115
    ## 2155 ENSCGRG00015017138   978.467834      0.6408967 0.10799316  5.934605
    ## 2156 ENSCGRG00015014566   502.277508      0.6408475 0.14160844  4.525489
    ## 2157 ENSCGRG00015018543  1478.909518      0.6408093 0.09398259  6.818383
    ## 2158 ENSCGRG00015010491   199.716359      0.6405009 0.20919704  3.061711
    ## 2159 ENSCGRG00015006961  2788.276795      0.6402448 0.07853438  8.152414
    ## 2160 ENSCGRG00015025692  2165.545245      0.6401763 0.08689928  7.366877
    ## 2161 ENSCGRG00015009215   755.357357      0.6395662 0.12753808  5.014708
    ## 2162 ENSCGRG00015018998  1095.591559      0.6392856 0.10534599  6.068438
    ## 2163 ENSCGRG00015027979  1081.835196      0.6390413 0.10763054  5.937360
    ## 2164 ENSCGRG00015028713  1023.512200      0.6390209 0.10763965  5.936668
    ## 2165 ENSCGRG00015028713  1023.512200      0.6390209 0.10763965  5.936668
    ## 2166 ENSCGRG00015013427  1008.569917      0.6385202 0.11238057  5.681767
    ## 2167 ENSCGRG00015006211   412.952320      0.6384777 0.15418952  4.140863
    ## 2168 ENSCGRG00015007063   441.775570      0.6383128 0.14971778  4.263440
    ## 2169 ENSCGRG00015028775  6572.449965      0.6375891 0.07119105  8.956029
    ## 2170 ENSCGRG00015017377  4231.126201      0.6375198 0.07381877  8.636282
    ## 2171 ENSCGRG00015005537   941.322279      0.6371673 0.11220202  5.678751
    ## 2172 ENSCGRG00015010766   295.123788      0.6370738 0.17488905  3.642731
    ## 2173 ENSCGRG00015003018  1048.611633      0.6368147 0.11017000  5.780291
    ## 2174 ENSCGRG00015026087  4555.134203      0.6367725 0.07189629  8.856820
    ## 2175 ENSCGRG00015010060  4191.280575      0.6366841 0.07325751  8.691042
    ## 2176 ENSCGRG00015018866   273.568597      0.6364843 0.18068146  3.522687
    ## 2177 ENSCGRG00015019842   383.564380      0.6360252 0.15672053  4.058340
    ## 2178 ENSCGRG00015011762   464.418533      0.6360229 0.15107160  4.210076
    ## 2179 ENSCGRG00015026790   446.965886      0.6357991 0.14594877  4.356317
    ## 2180 ENSCGRG00015012387   946.969418      0.6355320 0.11067757  5.742193
    ## 2181 ENSCGRG00015011591  7200.148016      0.6347857 0.06644376  9.553728
    ## 2182 ENSCGRG00015007081  1570.914348      0.6346054 0.09664103  6.566624
    ## 2183 ENSCGRG00015000479  5918.712821      0.6344237 0.07703867  8.235132
    ## 2184 ENSCGRG00015015643  2329.869351      0.6343812 0.09021939  7.031539
    ## 2185 ENSCGRG00015009438   437.119463      0.6337264 0.14851579  4.267064
    ## 2186 ENSCGRG00015014346  1193.207578      0.6335001 0.10022708  6.320648
    ## 2187 ENSCGRG00015027118   852.589692      0.6333579 0.11444464  5.534185
    ## 2188 ENSCGRG00015009273   633.001332      0.6330635 0.12848772  4.927035
    ## 2189 ENSCGRG00015017966   314.438447      0.6325028 0.18155863  3.483739
    ## 2190 ENSCGRG00015021462   802.035334      0.6324690 0.11680949  5.414535
    ## 2191 ENSCGRG00015003846  1483.000655      0.6323545 0.09551710  6.620328
    ## 2192 ENSCGRG00015003553   699.067679      0.6317906 0.12651197  4.993920
    ## 2193 ENSCGRG00015001333  1860.939535      0.6315609 0.09610784  6.571378
    ## 2194 ENSCGRG00015014289  1191.876799      0.6313480 0.10144581  6.223499
    ## 2195 ENSCGRG00015014709   189.020556      0.6311022 0.21641452  2.916173
    ## 2196 ENSCGRG00015005615  1474.753455      0.6310300 0.09480759  6.655902
    ## 2197 ENSCGRG00015015959  1364.114405      0.6309317 0.09909091  6.367201
    ## 2198 ENSCGRG00015024163  1269.296246      0.6305710 0.09935100  6.346902
    ## 2199 ENSCGRG00015016107  1175.073411      0.6304206 0.10161904  6.203764
    ## 2200 ENSCGRG00015023552   451.380402      0.6298217 0.15611128  4.034441
    ## 2201 ENSCGRG00015020150   998.460497      0.6295934 0.10804925  5.826911
    ## 2202 ENSCGRG00015023895   951.480891      0.6294199 0.11094752  5.673131
    ## 2203 ENSCGRG00015021531  5540.948770      0.6294072 0.07500835  8.391163
    ## 2204 ENSCGRG00015016883  1001.254589      0.6293033 0.10706838  5.877583
    ## 2205 ENSCGRG00015016449   113.228872      0.6290630 0.27652398  2.274895
    ## 2206 ENSCGRG00015015514   181.508643      0.6286324 0.21964054  2.862096
    ## 2207 ENSCGRG00015009313  1336.040337      0.6286240 0.10077378  6.237972
    ## 2208 ENSCGRG00015019375   806.011446      0.6280576 0.12833132  4.894032
    ## 2209 ENSCGRG00015015669  3851.910181      0.6276695 0.07622884  8.234016
    ## 2210 ENSCGRG00015006880   494.789147      0.6275083 0.14062116  4.462403
    ## 2211 ENSCGRG00015021507   360.171784      0.6273362 0.17460500  3.592888
    ## 2212 ENSCGRG00015002295  1204.899635      0.6271099 0.10237133  6.125836
    ## 2213 ENSCGRG00015018021   406.877389      0.6270874 0.15498515  4.046113
    ## 2214 ENSCGRG00015028809  1190.426425      0.6270574 0.11153397  5.622121
    ## 2215 ENSCGRG00015007587   461.761047      0.6270418 0.14801515  4.236335
    ## 2216 ENSCGRG00015022837  2541.978534      0.6268570 0.08248194  7.599931
    ## 2217 ENSCGRG00015007306   393.689274      0.6265952 0.15445431  4.056832
    ## 2218 ENSCGRG00015006628  1040.457753      0.6260496 0.10765433  5.815369
    ## 2219 ENSCGRG00015024842  1118.858186      0.6256507 0.10521954  5.946146
    ## 2220 ENSCGRG00015013245   744.246426      0.6251157 0.12556782  4.978311
    ## 2221 ENSCGRG00015012727   348.643382      0.6249321 0.16249602  3.845830
    ## 2222 ENSCGRG00015016473   358.884523      0.6248773 0.16204546  3.856185
    ## 2223 ENSCGRG00015013710   701.938729      0.6244771 0.13163445  4.744025
    ## 2224 ENSCGRG00015021753   526.716543      0.6243494 0.13774605  4.532612
    ## 2225 ENSCGRG00015001635   623.786305      0.6243284 0.12843243  4.861143
    ## 2226 ENSCGRG00015006208  2570.059138      0.6242551 0.08008540  7.794868
    ## 2227 ENSCGRG00015017103   848.522602      0.6238231 0.11356293  5.493193
    ## 2228 ENSCGRG00015012566  1334.877807      0.6237774 0.10364520  6.018392
    ## 2229 ENSCGRG00015011468  2751.205959      0.6236053 0.08156381  7.645613
    ## 2230 ENSCGRG00015005746   352.868954      0.6229944 0.16374611  3.804636
    ## 2231 ENSCGRG00015028377  1152.197622      0.6211764 0.10302514  6.029367
    ## 2232 ENSCGRG00015017978   125.394132      0.6211522 0.26602472  2.334942
    ## 2233 ENSCGRG00015007238  1692.361886      0.6211480 0.09266173  6.703393
    ## 2234 ENSCGRG00015021467  3115.006467      0.6211118 0.08370291  7.420433
    ## 2235 ENSCGRG00015019585  1248.976023      0.6210494 0.10555664  5.883565
    ## 2236 ENSCGRG00015021653   515.407451      0.6210470 0.13824007  4.492525
    ## 2237 ENSCGRG00015026448   174.676300      0.6210150 0.23135777  2.684219
    ## 2238 ENSCGRG00015003197  8113.381934      0.6208690 0.06856494  9.055195
    ## 2239 ENSCGRG00015011522  1372.155455      0.6207905 0.10169139  6.104652
    ## 2240 ENSCGRG00015017302   303.860086      0.6205563 0.17311317  3.584686
    ## 2241 ENSCGRG00015007333  2967.990924      0.6205074 0.08860674  7.002937
    ## 2242 ENSCGRG00015016349   362.461565      0.6203741 0.16050163  3.865220
    ## 2243 ENSCGRG00015009391   443.913551      0.6200147 0.15451156  4.012740
    ## 2244 ENSCGRG00015001349  1229.546483      0.6198576 0.09919531  6.248860
    ## 2245 ENSCGRG00015016918  3923.671074      0.6198245 0.08284868  7.481405
    ## 2246 ENSCGRG00015003414   287.379847      0.6197935 0.18647694  3.323700
    ## 2247 ENSCGRG00015002070   611.955615      0.6196419 0.13747989  4.507145
    ## 2248 ENSCGRG00015005089   186.799930      0.6194801 0.22022724  2.812913
    ## 2249 ENSCGRG00015022112   230.999029      0.6193614 0.19925764  3.108344
    ## 2250 ENSCGRG00015028822   273.908504      0.6191731 0.18296701  3.384070
    ## 2251 ENSCGRG00015001944   809.318317      0.6191522 0.12417273  4.986217
    ## 2252 ENSCGRG00015002261  1947.707932      0.6190070 0.08670252  7.139435
    ## 2253 ENSCGRG00015004369   872.485648      0.6184943 0.11494804  5.380643
    ## 2254 ENSCGRG00015020037   621.345613      0.6184418 0.13001431  4.756721
    ## 2255 ENSCGRG00015009823   668.539533      0.6182607 0.13175243  4.692594
    ## 2256 ENSCGRG00015028331   638.118604      0.6176598 0.12779584  4.833176
    ## 2257 ENSCGRG00015024520   287.531551      0.6176360 0.17843473  3.461412
    ## 2258 ENSCGRG00015002056   372.506335      0.6176162 0.15758582  3.919237
    ## 2259 ENSCGRG00015014388   812.299912      0.6174443 0.12025120  5.134620
    ## 2260 ENSCGRG00015006476   137.557799      0.6173050 0.25076583  2.461679
    ## 2261 ENSCGRG00015018499   844.137865      0.6171999 0.11544460  5.346286
    ## 2262 ENSCGRG00015015664   196.187818      0.6171956 0.21783517  2.833315
    ## 2263 ENSCGRG00015015618  1229.911572      0.6170954 0.10152261  6.078404
    ## 2264 ENSCGRG00015001400  1017.566973      0.6170888 0.11251291  5.484605
    ## 2265 ENSCGRG00015008244  2204.072471      0.6168747 0.08987996  6.863317
    ## 2266 ENSCGRG00015022396  2231.973876      0.6166025 0.08406858  7.334517
    ## 2267 ENSCGRG00015001974   703.701149      0.6163707 0.12606374  4.889358
    ## 2268 ENSCGRG00015006689   583.859070      0.6153886 0.13248809  4.644860
    ## 2269 ENSCGRG00015019855   375.509372      0.6153348 0.16726655  3.678768
    ## 2270 ENSCGRG00015028460   811.347865      0.6148277 0.11968872  5.136889
    ## 2271 ENSCGRG00015028844  2762.668641      0.6145145 0.08204489  7.489978
    ## 2272 ENSCGRG00015028191   903.555331      0.6142018 0.11273605  5.448140
    ## 2273 ENSCGRG00015010243  4405.199843      0.6140274 0.07619312  8.058830
    ## 2274 ENSCGRG00015008800  1581.047229      0.6138915 0.25820372  2.377547
    ## 2275 ENSCGRG00015018405   837.491240      0.6137919 0.11350587  5.407579
    ## 2276 ENSCGRG00015008622   141.446646      0.6136450 0.27038382  2.269533
    ## 2277 ENSCGRG00015001542   566.039535      0.6136232 0.13356288  4.594265
    ## 2278 ENSCGRG00015010101  1484.507359      0.6133336 0.09541373  6.428148
    ## 2279 ENSCGRG00015019685   800.796852      0.6129906 0.11717030  5.231621
    ## 2280 ENSCGRG00015019685   800.796852      0.6129906 0.11717030  5.231621
    ## 2281 ENSCGRG00015024725   986.781432      0.6128205 0.10806811  5.670687
    ## 2282 ENSCGRG00015023176   284.890272      0.6128096 0.17750753  3.452302
    ## 2283 ENSCGRG00015019269   343.848396      0.6127889 0.17131336  3.577006
    ## 2284 ENSCGRG00015004738   836.075252      0.6127006 0.11915327  5.142121
    ## 2285 ENSCGRG00015018005  1168.936945      0.6124632 0.10760445  5.691802
    ## 2286 ENSCGRG00015017740  1206.692666      0.6124458 0.10083155  6.073950
    ## 2287 ENSCGRG00015009486  1266.479361      0.6123462 0.10086381  6.071020
    ## 2288 ENSCGRG00015011160  2483.976517      0.6121792 0.08216144  7.450931
    ## 2289 ENSCGRG00015022579   393.831501      0.6119295 0.15852736  3.860087
    ## 2290 ENSCGRG00015020556   656.484573      0.6114538 0.12549365  4.872388
    ## 2291 ENSCGRG00015020036   918.557244      0.6113106 0.11007698  5.553483
    ## 2292 ENSCGRG00015015910   448.169420      0.6110925 0.15143776  4.035272
    ## 2293 ENSCGRG00015008592   869.855461      0.6103417 0.11237030  5.431521
    ## 2294 ENSCGRG00015017933   815.377934      0.6102376 0.11523353  5.295660
    ## 2295 ENSCGRG00015024868  9142.176935      0.6102369 0.08949179  6.818915
    ## 2296 ENSCGRG00015003052   232.226014      0.6102116 0.19610738  3.111620
    ## 2297 ENSCGRG00015025028   291.912037      0.6101029 0.17727134  3.441633
    ## 2298 ENSCGRG00015005781  1936.368946      0.6100363 0.08632247  7.066946
    ## 2299 ENSCGRG00015022261  2713.835001      0.6099266 0.07959933  7.662459
    ## 2300 ENSCGRG00015000827   246.123539      0.6097029 0.19130453  3.187080
    ## 2301 ENSCGRG00015001245   143.069259      0.6092763 0.24903630  2.446536
    ## 2302 ENSCGRG00015024062   363.250898      0.6092096 0.16747559  3.637602
    ## 2303 ENSCGRG00015025744   581.103377      0.6091960 0.13226744  4.605790
    ## 2304 ENSCGRG00015022288   221.197615      0.6090806 0.20587014  2.958567
    ## 2305 ENSCGRG00015005997   265.225511      0.6088657 0.19009915  3.202885
    ## 2306 ENSCGRG00015006070  6491.347921      0.6086488 0.06914753  8.802176
    ## 2307 ENSCGRG00015009821   759.203966      0.6086393 0.11910603  5.110063
    ## 2308 ENSCGRG00015001169  1045.701742      0.6085777 0.11206079  5.430781
    ## 2309 ENSCGRG00015009578  1300.554798      0.6084252 0.09925537  6.129897
    ## 2310 ENSCGRG00015015991  4100.427162      0.6084055 0.07719323  7.881591
    ## 2311 ENSCGRG00015014057   521.370633      0.6077021 0.14220679  4.273369
    ## 2312 ENSCGRG00015009091   804.425009      0.6076720 0.11771762  5.162116
    ## 2313 ENSCGRG00015004274   297.694087      0.6076686 0.17393831  3.493587
    ## 2314 ENSCGRG00015017115   321.152983      0.6076222 0.17117837  3.549644
    ## 2315 ENSCGRG00015024817   564.407833      0.6075111 0.13470495  4.509939
    ## 2316 ENSCGRG00015010706   875.308963      0.6072653 0.11273199  5.386806
    ## 2317 ENSCGRG00015010996  1082.456494      0.6071609 0.10431591  5.820406
    ## 2318 ENSCGRG00015017651   903.744533      0.6067125 0.11097877  5.466924
    ## 2319 ENSCGRG00015025671  5312.359493      0.6065303 0.07005735  8.657624
    ## 2320 ENSCGRG00015018723   515.417971      0.6063565 0.13777094  4.401193
    ## 2321 ENSCGRG00015024342  1182.632949      0.6063202 0.10070244  6.020908
    ## 2322 ENSCGRG00015026380   256.832977      0.6062661 0.18876697  3.211717
    ## 2323 ENSCGRG00015002923  4279.312320      0.6061804 0.07396141  8.195901
    ## 2324 ENSCGRG00015026128  1244.995674      0.6061044 0.09867078  6.142693
    ## 2325 ENSCGRG00015027167   148.262032      0.6056772 0.24015039  2.522074
    ## 2326 ENSCGRG00015004232  1661.051736      0.6055614 0.09008319  6.722247
    ## 2327 ENSCGRG00015010240  5133.097991      0.6053039 0.07013514  8.630536
    ## 2328 ENSCGRG00015020336  8329.739918      0.6051179 0.07418256  8.157146
    ## 2329 ENSCGRG00015006147   495.063430      0.6050578 0.13967039  4.332040
    ## 2330 ENSCGRG00015028495  1455.092842      0.6049632 0.09496866  6.370135
    ## 2331 ENSCGRG00015011165   975.662373      0.6042786 0.10739538  5.626672
    ## 2332 ENSCGRG00015010082   682.107365      0.6042063 0.14071338  4.293880
    ## 2333 ENSCGRG00015025144  1467.812374      0.6041284 0.10372324  5.824427
    ## 2334 ENSCGRG00015022518  3027.377204      0.6039556 0.08754963  6.898437
    ## 2335 ENSCGRG00015012185  1644.341971      0.6036539 0.09812612  6.151817
    ## 2336 ENSCGRG00015021200  2060.250180      0.6036470 0.08471407  7.125699
    ## 2337 ENSCGRG00015003790   408.996000      0.6036267 0.16123971  3.743660
    ## 2338 ENSCGRG00015000258  1443.010762      0.6033756 0.09421124  6.404496
    ## 2339 ENSCGRG00015014967  1354.033468      0.6025800 0.10995400  5.480292
    ## 2340 ENSCGRG00015023616  2742.996914      0.6024618 0.08515316  7.075038
    ## 2341 ENSCGRG00015013308  2056.311707      0.6022530 0.09637897  6.248801
    ## 2342 ENSCGRG00015023194   399.617161      0.6021515 0.17078047  3.525880
    ## 2343 ENSCGRG00015022671  3808.749774      0.6019495 0.07389637  8.145860
    ## 2344 ENSCGRG00015017457   784.600586      0.6018901 0.11721999  5.134706
    ## 2345 ENSCGRG00015022830   507.698305      0.6018055 0.14044796  4.284900
    ## 2346 ENSCGRG00015009493   666.825747      0.6016130 0.12392093  4.854813
    ## 2347 ENSCGRG00015015335  1706.612292      0.6016101 0.09079677  6.625897
    ## 2348 ENSCGRG00015016439  1538.623294      0.6009401 0.09400548  6.392607
    ## 2349 ENSCGRG00015026112  2535.708062      0.6009305 0.08028660  7.484817
    ## 2350 ENSCGRG00015023351   149.941214      0.6008364 0.24020033  2.501397
    ## 2351 ENSCGRG00015001580  1649.538438      0.6007621 0.09177902  6.545746
    ## 2352 ENSCGRG00015015186  3343.913975      0.6006068 0.08546901  7.027188
    ## 2353 ENSCGRG00015023263   938.614626      0.6005215 0.11260098  5.333181
    ## 2354 ENSCGRG00015008897   469.112671      0.6003998 0.15112677  3.972822
    ## 2355 ENSCGRG00015010086  3930.611732      0.6001686 0.07592023  7.905252
    ## 2356 ENSCGRG00015002358   231.817524      0.5999418 0.19495748  3.077296
    ## 2357 ENSCGRG00015024156   952.688813      0.5997967 0.11091291  5.407817
    ## 2358 ENSCGRG00015000560  5939.239500      0.5997637 0.06997985  8.570520
    ## 2359 ENSCGRG00015026035  7093.902612      0.5997177 0.06748745  8.886359
    ## 2360 ENSCGRG00015000106   169.475707      0.5993295 0.22691854  2.641166
    ## 2361 ENSCGRG00015009673   414.776871      0.5992815 0.15145274  3.956888
    ## 2362 ENSCGRG00015010130   402.224261      0.5988923 0.16289965  3.676449
    ## 2363 ENSCGRG00015009328   140.362000      0.5986135 0.25221917  2.373386
    ## 2364 ENSCGRG00015019661  1299.056564      0.5983742 0.09915599  6.034675
    ## 2365 ENSCGRG00015019192   357.917691      0.5975770 0.17242572  3.465707
    ## 2366 ENSCGRG00015013303   542.526572      0.5974628 0.13934798  4.287560
    ## 2367 ENSCGRG00015005035   622.260967      0.5972354 0.12877542  4.637806
    ## 2368 ENSCGRG00015024220   852.931792      0.5970842 0.12395348  4.817002
    ## 2369 ENSCGRG00015026382   981.376834      0.5967279 0.10835905  5.506950
    ## 2370 ENSCGRG00015005061 25697.216044      0.5966872 0.06792265  8.784805
    ## 2371 ENSCGRG00015005061 25697.216044      0.5966872 0.06792265  8.784805
    ## 2372 ENSCGRG00015006190   199.648030      0.5964548 0.21449610  2.780726
    ## 2373 ENSCGRG00015010839  1051.187377      0.5964126 0.10490797  5.685103
    ## 2374 ENSCGRG00015010839  1051.187377      0.5964126 0.10490797  5.685103
    ## 2375 ENSCGRG00015005774   336.060338      0.5961703 0.16561855  3.599659
    ## 2376 ENSCGRG00015023643  4594.438840      0.5951592 0.07345316  8.102568
    ## 2377 ENSCGRG00015026286  1086.134328      0.5949675 0.10333874  5.757449
    ## 2378 ENSCGRG00015013632  1323.124640      0.5947812 0.09791044  6.074748
    ## 2379 ENSCGRG00015028723   659.221099      0.5947734 0.12463928  4.771958
    ## 2380 ENSCGRG00015003251  4945.102623      0.5943870 0.07621574  7.798744
    ## 2381 ENSCGRG00015014654   177.093904      0.5942212 0.22722862  2.615081
    ## 2382 ENSCGRG00015023179  1381.396909      0.5941065 0.09555337  6.217536
    ## 2383 ENSCGRG00015026810   552.654270      0.5937452 0.13558330  4.379191
    ## 2384 ENSCGRG00015020735  1019.750232      0.5933933 0.10871032  5.458482
    ## 2385 ENSCGRG00015008968  2063.085380      0.5927992 0.08931596  6.637102
    ## 2386 ENSCGRG00015027957  2139.155760      0.5926530 0.08483777  6.985721
    ## 2387 ENSCGRG00015014435  3118.103202      0.5925642 0.08873127  6.678190
    ## 2388 ENSCGRG00015018422   265.005634      0.5923850 0.19388712  3.055309
    ## 2389 ENSCGRG00015022875   403.023212      0.5921934 0.15254484  3.882094
    ## 2390 ENSCGRG00015021003  3463.682216      0.5921387 0.08658039  6.839178
    ## 2391 ENSCGRG00015002674   864.068429      0.5917774 0.11928763  4.960929
    ## 2392 ENSCGRG00015025677   472.417421      0.5912857 0.14291822  4.137231
    ## 2393 ENSCGRG00015020835   512.943539      0.5911925 0.14052469  4.207036
    ## 2394 ENSCGRG00015025134  2321.834840      0.5903155 0.08301091  7.111300
    ## 2395 ENSCGRG00015025813   665.870044      0.5902689 0.12394731  4.762257
    ## 2396 ENSCGRG00015017702   816.017229      0.5902469 0.11947288  4.940426
    ## 2397 ENSCGRG00015016577   621.298939      0.5901478 0.13038118  4.526327
    ## 2398 ENSCGRG00015028548  5959.983177      0.5900072 0.07147115  8.255180
    ## 2399 ENSCGRG00015008966   485.982250      0.5899600 0.14901592  3.959040
    ## 2400 ENSCGRG00015015825   645.323262      0.5896732 0.12556822  4.696038
    ## 2401 ENSCGRG00015022240   636.921842      0.5895341 0.13723585  4.295773
    ## 2402 ENSCGRG00015009334  1743.540224      0.5893380 0.09278385  6.351731
    ## 2403 ENSCGRG00015025113  1125.792995      0.5891998 0.10305955  5.717081
    ## 2404 ENSCGRG00015022848   590.329770      0.5891526 0.13054463  4.513035
    ## 2405 ENSCGRG00015019653   879.432339      0.5886574 0.11735018  5.016246
    ## 2406 ENSCGRG00015006646  8785.443800      0.5884513 0.06788833  8.667930
    ## 2407 ENSCGRG00015009570  2517.431243      0.5881554 0.08077844  7.281094
    ## 2408 ENSCGRG00015008079   258.518624      0.5877679 0.18769093  3.131573
    ## 2409 ENSCGRG00015011958   203.869156      0.5877409 0.20777495  2.828738
    ## 2410 ENSCGRG00015001512  1271.417794      0.5875668 0.10325572  5.690405
    ## 2411 ENSCGRG00015020587  1036.934392      0.5873307 0.10594325  5.543823
    ## 2412 ENSCGRG00015002868  1496.064854      0.5869815 0.09747598  6.021806
    ## 2413 ENSCGRG00015011952   582.112960      0.5869805 0.13622715  4.308836
    ## 2414 ENSCGRG00015020801   457.434918      0.5865395 0.15280883  3.838387
    ## 2415 ENSCGRG00015002356  1008.669663      0.5865251 0.10641908  5.511466
    ## 2416 ENSCGRG00015005864  2128.372663      0.5857599 0.08909125  6.574831
    ## 2417 ENSCGRG00015015352   362.021647      0.5853636 0.15952937  3.669316
    ## 2418 ENSCGRG00015002651   290.065995      0.5851880 0.17596506  3.325592
    ## 2419 ENSCGRG00015023699   380.241859      0.5849391 0.16275474  3.593991
    ## 2420 ENSCGRG00015006914  2114.399639      0.5845645 0.08613942  6.786260
    ## 2421 ENSCGRG00015004515   558.348080      0.5843296 0.13398225  4.361246
    ## 2422 ENSCGRG00015021587   493.434493      0.5842422 0.14176617  4.121168
    ## 2423 ENSCGRG00015004125  1271.765503      0.5840290 0.09840689  5.934839
    ## 2424 ENSCGRG00015015301   563.784528      0.5839547 0.13747489  4.247719
    ## 2425 ENSCGRG00015012657   652.563427      0.5838760 0.13298281  4.390613
    ## 2426 ENSCGRG00015005598   215.342002      0.5832070 0.20119237  2.898753
    ## 2427 ENSCGRG00015023939   354.381493      0.5831423 0.16766628  3.477994
    ## 2428 ENSCGRG00015000599   296.897097      0.5829142 0.17676474  3.297684
    ## 2429 ENSCGRG00015008737   478.333044      0.5825966 0.14734365  3.953998
    ## 2430 ENSCGRG00015022171  1052.289589      0.5825798 0.11064329  5.265388
    ## 2431 ENSCGRG00015001411   671.183053      0.5824155 0.12812641  4.545631
    ## 2432 ENSCGRG00015028797   228.568021      0.5823199 0.19943184  2.919894
    ## 2433 ENSCGRG00015023617  1084.537953      0.5820043 0.10453171  5.567730
    ## 2434 ENSCGRG00015027032  1052.297337      0.5816414 0.10834549  5.368395
    ## 2435 ENSCGRG00015000677   446.807682      0.5814541 0.14658522  3.966663
    ## 2436 ENSCGRG00015005644   138.435767      0.5813638 0.24744192  2.349496
    ## 2437 ENSCGRG00015023907  1169.583535      0.5806809 0.10066766  5.768296
    ## 2438 ENSCGRG00015007057  2843.482287      0.5805882 0.07855072  7.391253
    ## 2439 ENSCGRG00015012016   854.062059      0.5800834 0.11680449  4.966276
    ## 2440 ENSCGRG00015002532   757.258056      0.5800139 0.12034314  4.819668
    ## 2441 ENSCGRG00015022008  1074.072980      0.5793842 0.10604708  5.463462
    ## 2442 ENSCGRG00015024889   366.604286      0.5793408 0.16101851  3.597976
    ## 2443 ENSCGRG00015015336  3062.438640      0.5792803 0.07904645  7.328354
    ## 2444 ENSCGRG00015013458   515.086262      0.5789127 0.14701195  3.937861
    ## 2445 ENSCGRG00015007156 20588.700135      0.5788139 0.06288405  9.204462
    ## 2446 ENSCGRG00015023736  1689.367047      0.5787612 0.09237027  6.265665
    ## 2447 ENSCGRG00015002093   290.152966      0.5786246 0.18580342  3.114176
    ## 2448 ENSCGRG00015023768   181.745411      0.5785011 0.22392758  2.583429
    ## 2449 ENSCGRG00015022095   294.859874      0.5784589 0.17486931  3.307950
    ## 2450 ENSCGRG00015014252   271.659101      0.5783223 0.19754414  2.927560
    ## 2451 ENSCGRG00015028173   605.448377      0.5781220 0.13366602  4.325123
    ## 2452 ENSCGRG00015002703   922.301737      0.5780260 0.11167103  5.176150
    ## 2453 ENSCGRG00015007945  1013.479607      0.5779857 0.10920743  5.292549
    ## 2454 ENSCGRG00015027745   609.506487      0.5777462 0.13799412  4.186745
    ## 2455 ENSCGRG00015015268   920.546300      0.5776339 0.11241191  5.138548
    ## 2456 ENSCGRG00015009450   397.037402      0.5775135 0.15549925  3.713931
    ## 2457 ENSCGRG00015019800  5168.029588      0.5774925 0.08051543  7.172445
    ## 2458 ENSCGRG00015015187  2268.318178      0.5773677 0.08501143  6.791648
    ## 2459 ENSCGRG00015003173   487.213080      0.5773405 0.14253854  4.050417
    ## 2460 ENSCGRG00015016075   195.605779      0.5772294 0.21298396  2.710201
    ## 2461 ENSCGRG00015006866  2118.304774      0.5769536 0.08798689  6.557268
    ## 2462 ENSCGRG00015022973   531.386965      0.5766669 0.13587326  4.244153
    ## 2463 ENSCGRG00015028810   297.155118      0.5763161 0.20037264  2.876222
    ## 2464 ENSCGRG00015003369   359.833564      0.5762329 0.16278285  3.539887
    ## 2465 ENSCGRG00015007048   617.118007      0.5759814 0.12832248  4.488546
    ## 2466 ENSCGRG00015023469   573.573929      0.5758866 0.13165217  4.374304
    ## 2467 ENSCGRG00015007154   459.944108      0.5758595 0.15040435  3.828742
    ## 2468 ENSCGRG00015011088   305.695290      0.5757838 0.18341738  3.139200
    ## 2469 ENSCGRG00015013563  1955.709686      0.5753822 0.08944977  6.432461
    ## 2470 ENSCGRG00015020787   236.280359      0.5753081 0.19588683  2.936941
    ## 2471 ENSCGRG00015018052   732.608757      0.5753011 0.12077516  4.763406
    ## 2472 ENSCGRG00015007519  1803.277031      0.5747107 0.08831078  6.507821
    ## 2473 ENSCGRG00015004317   675.446491      0.5746856 0.12454595  4.614246
    ## 2474 ENSCGRG00015007705   724.275412      0.5741011 0.12772621  4.494779
    ## 2475 ENSCGRG00015010166   481.871728      0.5738107 0.14351810  3.998177
    ## 2476 ENSCGRG00015005377   424.092624      0.5736308 0.15368373  3.732541
    ## 2477 ENSCGRG00015016643   517.595401      0.5735068 0.13708856  4.183477
    ## 2478 ENSCGRG00015020199  1295.914860      0.5734424 0.09851159  5.821066
    ## 2479 ENSCGRG00015017055  1127.063949      0.5729980 0.10493942  5.460274
    ## 2480 ENSCGRG00015028783   580.914197      0.5728950 0.13206585  4.337950
    ## 2481 ENSCGRG00015003438   504.535364      0.5725895 0.13975967  4.096958
    ## 2482 ENSCGRG00015011233  1010.497365      0.5722534 0.10797806  5.299720
    ## 2483 ENSCGRG00015022561  5631.576563      0.5719169 0.07083205  8.074268
    ## 2484 ENSCGRG00015023110  1009.435136      0.5716687 0.10611784  5.387112
    ## 2485 ENSCGRG00015026822  2112.223893      0.5716580 0.08806803  6.491095
    ## 2486 ENSCGRG00015012035   969.539996      0.5714311 0.10778954  5.301359
    ## 2487 ENSCGRG00015010459  1586.334859      0.5706943 0.09983530  5.716358
    ## 2488 ENSCGRG00015028463  3194.172634      0.5702667 0.07823131  7.289495
    ## 2489 ENSCGRG00015000568   714.085855      0.5698394 0.12426594  4.585644
    ## 2490 ENSCGRG00015008308   386.451003      0.5696877 0.15546404  3.664434
    ## 2491 ENSCGRG00015004450   347.900794      0.5696022 0.17326259  3.287508
    ## 2492 ENSCGRG00015012356  2181.654337      0.5695395 0.08541874  6.667617
    ## 2493 ENSCGRG00015012426   558.119113      0.5691816 0.13315171  4.274685
    ## 2494 ENSCGRG00015009402   503.097961      0.5689372 0.14282035  3.983586
    ## 2495 ENSCGRG00015008307   317.271809      0.5686945 0.16891291  3.366791
    ## 2496 ENSCGRG00015024178  2075.528023      0.5686377 0.08887243  6.398359
    ## 2497 ENSCGRG00015009420   845.004295      0.5685794 0.11488948  4.948924
    ## 2498 ENSCGRG00015011799  1473.684749      0.5685197 0.09866388  5.762186
    ## 2499 ENSCGRG00015002536   595.557137      0.5677372 0.13018535  4.360991
    ## 2500 ENSCGRG00015019590   703.097802      0.5676390 0.12151676  4.671282
    ## 2501 ENSCGRG00015002200   937.107764      0.5674578 0.10980394  5.167918
    ## 2502 ENSCGRG00015004928   347.773516      0.5672981 0.16487808  3.440713
    ## 2503 ENSCGRG00015028563   539.204030      0.5672689 0.13511512  4.198412
    ## 2504 ENSCGRG00015014743   756.789732      0.5670976 0.12305923  4.608331
    ## 2505 ENSCGRG00015025865   636.627914      0.5668562 0.13022054  4.353047
    ## 2506 ENSCGRG00015005650   832.766937      0.5665910 0.11774346  4.812080
    ## 2507 ENSCGRG00015019992   552.607859      0.5663481 0.14643988  3.867444
    ## 2508 ENSCGRG00015007512   548.898615      0.5663080 0.13365070  4.237224
    ## 2509 ENSCGRG00015019298   448.141910      0.5660709 0.14706982  3.848994
    ## 2510 ENSCGRG00015018417  2274.326988      0.5658407 0.08952133  6.320736
    ## 2511 ENSCGRG00015005753   344.660342      0.5657335 0.16306624  3.469348
    ## 2512 ENSCGRG00015001267   913.313092      0.5655076 0.11145755  5.073748
    ## 2513 ENSCGRG00015016967   570.836471      0.5654167 0.13497003  4.189202
    ## 2514 ENSCGRG00015007191  1459.851398      0.5653839 0.09528260  5.933757
    ## 2515 ENSCGRG00015007191  1459.851398      0.5653839 0.09528260  5.933757
    ## 2516 ENSCGRG00015020467  1765.413884      0.5652294 0.09872251  5.725436
    ## 2517 ENSCGRG00015011660   182.214462      0.5651714 0.21897392  2.580999
    ## 2518 ENSCGRG00015027396   674.085876      0.5650296 0.13182279  4.286281
    ## 2519 ENSCGRG00015008756  1410.885813      0.5649570 0.09786884  5.772593
    ## 2520 ENSCGRG00015016452   808.295606      0.5648414 0.11974416  4.717068
    ## 2521 ENSCGRG00015001773   608.724543      0.5647815 0.12890578  4.381351
    ## 2522 ENSCGRG00015007569  1472.066737      0.5646915 0.09347030  6.041400
    ## 2523 ENSCGRG00015022351   196.612898      0.5644769 0.21263533  2.654671
    ## 2524 ENSCGRG00015016887   374.087846      0.5642601 0.16703332  3.378129
    ## 2525 ENSCGRG00015001969  1489.173446      0.5639237 0.09810354  5.748250
    ## 2526 ENSCGRG00015023644  1700.032053      0.5638281 0.10174654  5.541497
    ## 2527 ENSCGRG00015010246   315.965064      0.5636334 0.17254072  3.266669
    ## 2528 ENSCGRG00015002590  1986.659894      0.5636123 0.08608154  6.547423
    ## 2529 ENSCGRG00015014728  2293.446371      0.5635871 0.08263228  6.820424
    ## 2530 ENSCGRG00015027239   406.003521      0.5633417 0.15536986  3.625811
    ## 2531 ENSCGRG00015000859   729.115519      0.5629975 0.12458134  4.519116
    ## 2532 ENSCGRG00015028431   288.852726      0.5619255 0.17897659  3.139659
    ## 2533 ENSCGRG00015022975  1453.455646      0.5619199 0.09429834  5.958959
    ## 2534 ENSCGRG00015015930  2655.074762      0.5619195 0.09542190  5.888789
    ## 2535 ENSCGRG00015002430  1836.342032      0.5618508 0.08898623  6.313908
    ## 2536 ENSCGRG00015023842   942.003459      0.5617693 0.11438292  4.911304
    ## 2537 ENSCGRG00015023558   729.587568      0.5616362 0.12182121  4.610332
    ## 2538 ENSCGRG00015013420   734.477338      0.5616192 0.12098218  4.642165
    ## 2539 ENSCGRG00015021646  1540.126088      0.5615441 0.09315138  6.028296
    ## 2540 ENSCGRG00015023116   454.538973      0.5614726 0.14942128  3.757648
    ## 2541 ENSCGRG00015004372  1075.949578      0.5614457 0.10974590  5.115869
    ## 2542 ENSCGRG00015024420  4269.369332      0.5613310 0.07817795  7.180170
    ## 2543 ENSCGRG00015010426  2161.684964      0.5609921 0.09509793  5.899099
    ## 2544 ENSCGRG00015028796   388.920705      0.5608788 0.15603262  3.594625
    ## 2545 ENSCGRG00015002267  1954.425364      0.5608064 0.09214609  6.086057
    ## 2546 ENSCGRG00015003492   168.065160      0.5607715 0.22977334  2.440542
    ## 2547 ENSCGRG00015014646   626.653803      0.5606654 0.13322767  4.208325
    ## 2548 ENSCGRG00015020090  2646.771763      0.5604327 0.09243342  6.063096
    ## 2549 ENSCGRG00015021962  3427.155116      0.5602608 0.08346531  6.712499
    ## 2550 ENSCGRG00015022441  3608.754434      0.5602160 0.08266806  6.776692
    ## 2551 ENSCGRG00015007678  4420.632193      0.5600527 0.07593895  7.375039
    ## 2552 ENSCGRG00015023966   669.726353      0.5594762 0.12639347  4.426464
    ## 2553 ENSCGRG00015018351   167.662771      0.5589921 0.23240330  2.405267
    ## 2554 ENSCGRG00015018538   845.560605      0.5587215 0.11600651  4.816294
    ## 2555 ENSCGRG00015024616   824.030152      0.5586985 0.11756175  4.752383
    ## 2556 ENSCGRG00015007936  1346.002190      0.5585981 0.09606469  5.814812
    ## 2557 ENSCGRG00015022852  3327.567153      0.5584288 0.08803549  6.343224
    ## 2558 ENSCGRG00015011697   296.264018      0.5582411 0.17476485  3.194241
    ## 2559 ENSCGRG00015000942   895.343380      0.5581673 0.11530404  4.840830
    ## 2560 ENSCGRG00015028045 10009.888611      0.5581028 0.06383115  8.743424
    ## 2561 ENSCGRG00015000549  1047.428450      0.5579538 0.10656450  5.235832
    ## 2562 ENSCGRG00015001096   429.891886      0.5576360 0.14901986  3.742024
    ## 2563 ENSCGRG00015002826   199.352937      0.5575710 0.20861539  2.672722
    ## 2564 ENSCGRG00015019916  1733.823585      0.5574880 0.10028107  5.559255
    ## 2565 ENSCGRG00015014287   892.484870      0.5568901 0.11434993  4.870052
    ## 2566 ENSCGRG00015027010  1733.019616      0.5568374 0.08970620  6.207346
    ## 2567 ENSCGRG00015027260   971.802490      0.5567579 0.10889940  5.112589
    ## 2568 ENSCGRG00015027212   517.131507      0.5563425 0.13941885  3.990439
    ## 2569 ENSCGRG00015004771   353.147514      0.5563148 0.16371906  3.397984
    ## 2570 ENSCGRG00015017360   642.471918      0.5562335 0.12917276  4.306120
    ## 2571 ENSCGRG00015021918  2276.729867      0.5561435 0.08548832  6.505491
    ## 2572 ENSCGRG00015003560   415.807594      0.5559850 0.15480137  3.591602
    ## 2573 ENSCGRG00015015325   715.325739      0.5549983 0.12307628  4.509384
    ## 2574 ENSCGRG00015017964  1549.228150      0.5546345 0.09395771  5.903023
    ## 2575 ENSCGRG00015000914   192.739827      0.5543464 0.23623079  2.346631
    ## 2576 ENSCGRG00015021677   588.123034      0.5536468 0.13310210  4.159565
    ## 2577 ENSCGRG00015022213   250.312011      0.5534066 0.19386511  2.854596
    ## 2578 ENSCGRG00015002514  1677.587423      0.5533484 0.08988015  6.156515
    ## 2579 ENSCGRG00015026193  4095.307212      0.5530686 0.08558586  6.462149
    ## 2580 ENSCGRG00015008034   834.223842      0.5526230 0.11349637  4.869081
    ## 2581 ENSCGRG00015007073   204.934743      0.5525339 0.20876943  2.646623
    ## 2582 ENSCGRG00015027190   331.501239      0.5524272 0.16858734  3.276801
    ## 2583 ENSCGRG00015016804  1966.227566      0.5521802 0.08950627  6.169179
    ## 2584 ENSCGRG00015013623   846.925367      0.5521404 0.11748777  4.699556
    ## 2585 ENSCGRG00015025121   953.470747      0.5521179 0.11562349  4.775136
    ## 2586 ENSCGRG00015022603   864.405659      0.5519120 0.12156551  4.540038
    ## 2587 ENSCGRG00015022887   288.372727      0.5518008 0.17950000  3.074099
    ## 2588 ENSCGRG00015014178   351.900112      0.5517094 0.16210812  3.403342
    ## 2589 ENSCGRG00015014396   456.050982      0.5516546 0.14947735  3.690556
    ## 2590 ENSCGRG00015002469  4955.885905      0.5515864 0.07053357  7.820197
    ## 2591 ENSCGRG00015026227   813.074815      0.5514743 0.11750148  4.693339
    ## 2592 ENSCGRG00015017412   446.458679      0.5511603 0.15256537  3.612617
    ## 2593 ENSCGRG00015024830   724.553470      0.5511507 0.12027192  4.582538
    ## 2594 ENSCGRG00015000254   243.534020      0.5510103 0.18999383  2.900149
    ## 2595 ENSCGRG00015023500   506.042240      0.5509481 0.14390250  3.828621
    ## 2596 ENSCGRG00015010728   229.100406      0.5509370 0.19649987  2.803753
    ## 2597 ENSCGRG00015005582  1032.140784      0.5508391 0.10672754  5.161171
    ## 2598 ENSCGRG00015025708  3198.017537      0.5505058 0.07852389  7.010679
    ## 2599 ENSCGRG00015014970   586.865729      0.5503752 0.13035689  4.222065
    ## 2600 ENSCGRG00015027229  2940.556514      0.5503458 0.07861556  7.000469
    ## 2601 ENSCGRG00015002466  1426.641618      0.5498120 0.09772528  5.626098
    ## 2602 ENSCGRG00015013669  1118.227521      0.5497246 0.10387199  5.292327
    ## 2603 ENSCGRG00015028168   947.054659      0.5494178 0.12203512  4.502129
    ## 2604 ENSCGRG00015014773   713.464921      0.5493311 0.12129833  4.528761
    ## 2605 ENSCGRG00015000602   214.740543      0.5492364 0.21059037  2.608079
    ## 2606 ENSCGRG00015002940   308.247438      0.5491635 0.17140066  3.203975
    ## 2607 ENSCGRG00015012248  1120.753926      0.5491076 0.10412994  5.273292
    ## 2608 ENSCGRG00015006696  3912.707328      0.5490123 0.07466477  7.353030
    ## 2609 ENSCGRG00015003804   535.372897      0.5489903 0.13667334  4.016806
    ## 2610 ENSCGRG00015014102  2900.882992      0.5487971 0.08185537  6.704472
    ## 2611 ENSCGRG00015001631  1096.079996      0.5486556 0.11040554  4.969457
    ## 2612 ENSCGRG00015025628   318.802222      0.5483999 0.17215406  3.185518
    ## 2613 ENSCGRG00015014753  1177.988831      0.5476670 0.10318073  5.307842
    ## 2614 ENSCGRG00015014753  1177.988831      0.5476670 0.10318073  5.307842
    ## 2615 ENSCGRG00015021862  1793.861243      0.5473831 0.09088655  6.022707
    ## 2616 ENSCGRG00015000597  2535.030142      0.5472800 0.08404009  6.512131
    ## 2617 ENSCGRG00015000585   359.577888      0.5466026 0.16504127  3.311915
    ## 2618 ENSCGRG00015017585  1445.435464      0.5462708 0.10405821  5.249666
    ## 2619 ENSCGRG00015003381   532.179612      0.5462015 0.13662364  3.997855
    ## 2620 ENSCGRG00015002370  1445.109775      0.5461181 0.09402503  5.808221
    ## 2621 ENSCGRG00015009889   286.388015      0.5460938 0.18272399  2.988627
    ## 2622 ENSCGRG00015015984  9362.649503      0.5460044 0.06435659  8.484049
    ## 2623 ENSCGRG00015013446  1874.646180      0.5454895 0.08789516  6.206139
    ## 2624 ENSCGRG00015001456   836.640875      0.5451212 0.11491221  4.743806
    ## 2625 ENSCGRG00015028420  1073.454421      0.5446930 0.10700086  5.090548
    ## 2626 ENSCGRG00015024869   458.175220      0.5443181 0.14901173  3.652854
    ## 2627 ENSCGRG00015025042  1079.845055      0.5442055 0.10902765  4.991444
    ## 2628 ENSCGRG00015016482  2210.486665      0.5441169 0.09983713  5.450045
    ## 2629 ENSCGRG00015028648  1056.572803      0.5440907 0.11057219  4.920683
    ## 2630 ENSCGRG00015007049  1474.759066      0.5439775 0.09962340  5.460339
    ## 2631 ENSCGRG00015026023  1751.275206      0.5439766 0.10382989  5.239114
    ## 2632 ENSCGRG00015016387   744.950644      0.5438931 0.12619037  4.310099
    ## 2633 ENSCGRG00015025273  5290.160657      0.5436142 0.08608621  6.314766
    ## 2634 ENSCGRG00015015777   524.135300      0.5433467 0.13704795  3.964646
    ## 2635 ENSCGRG00015005084   905.182636      0.5432668 0.11480288  4.732171
    ## 2636 ENSCGRG00015024629   725.997658      0.5428457 0.12003306  4.522468
    ## 2637 ENSCGRG00015002956   349.975795      0.5428440 0.16459858  3.297987
    ## 2638 ENSCGRG00015005280  2612.830741      0.5426813 0.08023800  6.763395
    ## 2639 ENSCGRG00015000977   195.009364      0.5421770 0.22005010  2.463880
    ## 2640 ENSCGRG00015015858   243.369699      0.5419539 0.19256383  2.814412
    ## 2641 ENSCGRG00015008607  1304.665023      0.5418473 0.10364331  5.228000
    ## 2642 ENSCGRG00015001618   585.480534      0.5417865 0.14033040  3.860792
    ## 2643 ENSCGRG00015002030   226.338649      0.5416203 0.20881249  2.593812
    ## 2644 ENSCGRG00015016884  4101.451663      0.5415344 0.07412231  7.305957
    ## 2645 ENSCGRG00015010754  3149.163363      0.5415001 0.07707300  7.025808
    ## 2646 ENSCGRG00015019514  3126.265044      0.5408850 0.07911608  6.836600
    ## 2647 ENSCGRG00015027771   704.543316      0.5405015 0.12533042  4.312612
    ## 2648 ENSCGRG00015009054   166.412525      0.5404820 0.24215436  2.231973
    ## 2649 ENSCGRG00015025147  3135.379497      0.5401309 0.07708683  7.006786
    ## 2650 ENSCGRG00015024242  1550.773050      0.5399552 0.09629441  5.607337
    ## 2651 ENSCGRG00015004804  2071.415427      0.5398616 0.08955622  6.028186
    ## 2652 ENSCGRG00015009537   479.888103      0.5396647 0.14369757  3.755559
    ## 2653 ENSCGRG00015003538   845.311833      0.5395966 0.11556597  4.669166
    ## 2654 ENSCGRG00015010184   342.289777      0.5393605 0.16416051  3.285568
    ## 2655 ENSCGRG00015025965  1460.544802      0.5391340 0.09768311  5.519214
    ## 2656 ENSCGRG00015010939  2004.041924      0.5391254 0.09351532  5.765102
    ## 2657 ENSCGRG00015026207   405.257654      0.5390446 0.15688079  3.436014
    ## 2658 ENSCGRG00015000692  1182.678393      0.5390146 0.10327035  5.219451
    ## 2659 ENSCGRG00015000158  1944.927007      0.5386585 0.10114895  5.325399
    ## 2660 ENSCGRG00015001199  2165.312193      0.5385788 0.09370322  5.747708
    ## 2661 ENSCGRG00015025903   314.837342      0.5385164 0.16927011  3.181403
    ## 2662 ENSCGRG00015003648   478.430640      0.5381743 0.15086379  3.567286
    ## 2663 ENSCGRG00015017415  1117.683513      0.5379721 0.10888116  4.940911
    ## 2664 ENSCGRG00015018036   762.816707      0.5378515 0.11947961  4.501617
    ## 2665 ENSCGRG00015002597   515.949359      0.5372371 0.15151325  3.545809
    ## 2666 ENSCGRG00015018342  1142.845815      0.5370941 0.10406683  5.161050
    ## 2667 ENSCGRG00015013101   459.444765      0.5368289 0.14611183  3.674096
    ## 2668 ENSCGRG00015018683 14997.605075      0.5368063 0.06502849  8.254940
    ## 2669 ENSCGRG00015010418   844.842668      0.5357498 0.12378200  4.328172
    ## 2670 ENSCGRG00015019105  2600.971674      0.5357139 0.08272799  6.475606
    ## 2671 ENSCGRG00015002873  2253.427229      0.5356445 0.08774724  6.104403
    ## 2672 ENSCGRG00015008724   488.919235      0.5352930 0.14510112  3.689103
    ## 2673 ENSCGRG00015008176  1373.149645      0.5348993 0.09927986  5.387793
    ## 2674 ENSCGRG00015011196   162.013609      0.5343169 0.23309814  2.292240
    ## 2675 ENSCGRG00015002352  1057.254187      0.5343119 0.10609062  5.036373
    ## 2676 ENSCGRG00015014869   682.524538      0.5341111 0.12414696  4.302249
    ## 2677 ENSCGRG00015007255   499.910720      0.5339263 0.14449180  3.695202
    ## 2678 ENSCGRG00015002970   644.990411      0.5338475 0.14204898  3.758193
    ## 2679 ENSCGRG00015001342   762.517461      0.5338146 0.12389200  4.308709
    ## 2680 ENSCGRG00015025867   309.206634      0.5338064 0.18403664  2.900544
    ## 2681 ENSCGRG00015003312  3951.508100      0.5337575 0.07354026  7.258032
    ## 2682 ENSCGRG00015007636   912.007669      0.5333372 0.11168982  4.775164
    ## 2683 ENSCGRG00015014205  1102.213885      0.5332695 0.10348627  5.153047
    ## 2684 ENSCGRG00015026054   737.212737      0.5329151 0.11942440  4.462363
    ## 2685 ENSCGRG00015012312   508.702306      0.5327506 0.13784921  3.864734
    ## 2686 ENSCGRG00015013400  1641.920082      0.5326235 0.09580448  5.559485
    ## 2687 ENSCGRG00015005909   208.414084      0.5326135 0.20682908  2.575138
    ## 2688 ENSCGRG00015023163   662.446941      0.5322381 0.12416802  4.286435
    ## 2689 ENSCGRG00015004062   456.803608      0.5321441 0.14905596  3.570096
    ## 2690 ENSCGRG00015021235  2027.375275      0.5321022 0.08851198  6.011641
    ## 2691 ENSCGRG00015016503  2049.591087      0.5313567 0.08619650  6.164481
    ## 2692 ENSCGRG00015016750   335.616915      0.5311580 0.17258614  3.077640
    ## 2693 ENSCGRG00015007235   800.771148      0.5310198 0.11774456  4.509931
    ## 2694 ENSCGRG00015013592   606.682858      0.5308874 0.12934435  4.104450
    ## 2695 ENSCGRG00015013592   606.682858      0.5308874 0.12934435  4.104450
    ## 2696 ENSCGRG00015023157   503.079554      0.5304357 0.14406890  3.681819
    ## 2697 ENSCGRG00015007157  2961.390839      0.5302133 0.07754623  6.837383
    ## 2698 ENSCGRG00015004647   408.959108      0.5300697 0.15238361  3.478522
    ## 2699 ENSCGRG00015006663  2784.902870      0.5295765 0.07968163  6.646155
    ## 2700 ENSCGRG00015018243   231.189534      0.5294852 0.19791615  2.675301
    ## 2701 ENSCGRG00015025069  1061.929555      0.5291088 0.10544891  5.017679
    ## 2702 ENSCGRG00015007415   241.502437      0.5287369 0.19250884  2.746559
    ## 2703 ENSCGRG00015017599   694.419213      0.5287025 0.12674616  4.171350
    ## 2704 ENSCGRG00015007842   158.680763      0.5285830 0.23228159  2.275613
    ## 2705 ENSCGRG00015016758   223.770240      0.5280313 0.19828979  2.662927
    ## 2706 ENSCGRG00015019283   902.097865      0.5279612 0.11089012  4.761121
    ## 2707 ENSCGRG00015008256   882.729425      0.5278040 0.11115510  4.748356
    ## 2708 ENSCGRG00015006016  1056.582867      0.5277907 0.10955837  4.817438
    ## 2709 ENSCGRG00015020732   528.740155      0.5277668 0.15337138  3.441103
    ## 2710 ENSCGRG00015008347  1077.094385      0.5275498 0.10366587  5.088944
    ## 2711 ENSCGRG00015002920  1422.919886      0.5275215 0.09772445  5.398050
    ## 2712 ENSCGRG00015011211  1123.129257      0.5272446 0.10691851  4.931275
    ## 2713 ENSCGRG00015023883  1949.262964      0.5272255 0.08949481  5.891129
    ## 2714 ENSCGRG00015006035   663.347189      0.5271090 0.12985997  4.059057
    ## 2715 ENSCGRG00015013164   416.471873      0.5270749 0.15348695  3.434005
    ## 2716 ENSCGRG00015028566  1324.555665      0.5262847 0.10325598  5.096893
    ## 2717 ENSCGRG00015014950   616.306002      0.5261720 0.12976859  4.054694
    ## 2718 ENSCGRG00015025667  2655.573975      0.5261067 0.08400250  6.262989
    ## 2719 ENSCGRG00015006009   851.474668      0.5260087 0.11605365  4.532462
    ## 2720 ENSCGRG00015000073  3606.359945      0.5258579 0.07488039  7.022638
    ## 2721 ENSCGRG00015007815  2966.248700      0.5258481 0.07910214  6.647710
    ## 2722 ENSCGRG00015005049   948.632494      0.5257167 0.11285516  4.658330
    ## 2723 ENSCGRG00015013316  1832.691312      0.5255290 0.08898966  5.905507
    ## 2724 ENSCGRG00015022512   612.764842      0.5253311 0.12980918  4.046948
    ## 2725 ENSCGRG00015013556  1833.900001      0.5250341 0.09256238  5.672220
    ## 2726 ENSCGRG00015003094   474.596915      0.5246876 0.14335049  3.660173
    ## 2727 ENSCGRG00015012240   586.947220      0.5245221 0.13862428  3.783768
    ## 2728 ENSCGRG00015004689  1522.711909      0.5243935 0.09601513  5.461572
    ## 2729 ENSCGRG00015022189  1682.499342      0.5233252 0.10261709  5.099786
    ## 2730 ENSCGRG00015013261  2691.509584      0.5232532 0.08226111  6.360881
    ## 2731 ENSCGRG00015016035   426.586280      0.5230892 0.15195111  3.442484
    ## 2732 ENSCGRG00015017004   726.128950      0.5230726 0.12422052  4.210839
    ## 2733 ENSCGRG00015015256  1147.059304      0.5230368 0.10392231  5.032960
    ## 2734 ENSCGRG00015026364  1433.286811      0.5230287 0.09616420  5.438913
    ## 2735 ENSCGRG00015023053  1469.427218      0.5229405 0.09390924  5.568573
    ## 2736 ENSCGRG00015004076  2451.452988      0.5222487 0.08141453  6.414687
    ## 2737 ENSCGRG00015024698   724.412418      0.5217718 0.12063019  4.325383
    ## 2738 ENSCGRG00015023143  3357.616589      0.5217340 0.07579880  6.883144
    ## 2739 ENSCGRG00015011064   988.691408      0.5216424 0.11576142  4.506185
    ## 2740 ENSCGRG00015005603   699.589209      0.5212129 0.12201214  4.271812
    ## 2741 ENSCGRG00015021315  7277.895277      0.5210350 0.06806438  7.655032
    ## 2742 ENSCGRG00015012037  1235.216912      0.5210131 0.10002614  5.208769
    ## 2743 ENSCGRG00015022418   162.726004      0.5209848 0.23051758  2.260065
    ## 2744 ENSCGRG00015028556   497.447217      0.5205413 0.14421964  3.609365
    ## 2745 ENSCGRG00015019188  6568.065638      0.5201421 0.07140532  7.284360
    ## 2746 ENSCGRG00015024065  1039.429841      0.5195539 0.11734536  4.427563
    ## 2747 ENSCGRG00015018841   433.272059      0.5192046 0.15056538  3.448366
    ## 2748 ENSCGRG00015026576  1470.102631      0.5186946 0.09528250  5.443755
    ## 2749 ENSCGRG00015001510   330.434642      0.5185602 0.16582000  3.127247
    ## 2750 ENSCGRG00015004547  1016.322448      0.5183975 0.10605171  4.888158
    ## 2751 ENSCGRG00015009119  2547.337415      0.5183974 0.08176162  6.340351
    ## 2752 ENSCGRG00015012406   160.652188      0.5178708 0.23084428  2.243377
    ## 2753 ENSCGRG00015002649   631.586256      0.5176761 0.13288482  3.895675
    ## 2754 ENSCGRG00015011965   907.556398      0.5173933 0.11450495  4.518524
    ## 2755 ENSCGRG00015013828  3493.230565      0.5172048 0.07535257  6.863798
    ## 2756 ENSCGRG00015024726  1464.675985      0.5170639 0.09593856  5.389532
    ## 2757 ENSCGRG00015001308  1428.672406      0.5169901 0.09489538  5.448001
    ## 2758 ENSCGRG00015016591   974.503666      0.5164909 0.11230826  4.598869
    ## 2759 ENSCGRG00015027093  1261.885703      0.5164799 0.09865085  5.235433
    ## 2760 ENSCGRG00015019790   451.704839      0.5160369 0.15315425  3.369393
    ## 2761 ENSCGRG00015010140   483.272093      0.5159058 0.14090263  3.661435
    ## 2762 ENSCGRG00015006405  1179.314318      0.5158270 0.10589806  4.870977
    ## 2763 ENSCGRG00015012416   711.806000      0.5157932 0.12322566  4.185761
    ## 2764 ENSCGRG00015015674   297.126716      0.5156698 0.18547357  2.780287
    ## 2765 ENSCGRG00015028780   797.588549      0.5156356 0.12170103  4.236904
    ## 2766 ENSCGRG00015019323  1188.394977      0.5155828 0.10092234  5.108708
    ## 2767 ENSCGRG00015019420   459.685204      0.5154931 0.14419112  3.575068
    ## 2768 ENSCGRG00015019420   459.685204      0.5154931 0.14419112  3.575068
    ## 2769 ENSCGRG00015022501   188.939794      0.5154438 0.23171299  2.224493
    ## 2770 ENSCGRG00015013750   284.765123      0.5151052 0.20062843  2.567458
    ## 2771 ENSCGRG00015010109   670.553541      0.5144972 0.12331906  4.172082
    ## 2772 ENSCGRG00015001163  1367.475540      0.5142170 0.09753350  5.272209
    ## 2773 ENSCGRG00015008971  1483.597861      0.5134182 0.09326630  5.504863
    ## 2774 ENSCGRG00015028638 10226.087089      0.5129863 0.06501323  7.890491
    ## 2775 ENSCGRG00015013811  2045.980943      0.5127800 0.08910649  5.754687
    ## 2776 ENSCGRG00015008540  1138.717969      0.5122347 0.10214836  5.014615
    ## 2777 ENSCGRG00015014599   734.237017      0.5119941 0.11923846  4.293867
    ## 2778 ENSCGRG00015026465  1588.761321      0.5117843 0.09468530  5.405109
    ## 2779 ENSCGRG00015025864   265.702402      0.5117583 0.18519190  2.763395
    ## 2780 ENSCGRG00015014196   415.461257      0.5111838 0.14991815  3.409753
    ## 2781 ENSCGRG00015004811   444.847377      0.5110736 0.15390736  3.320657
    ## 2782 ENSCGRG00015010648   570.979129      0.5101165 0.14305538  3.565867
    ## 2783 ENSCGRG00015022277   564.365395      0.5098615 0.13532012  3.767818
    ## 2784 ENSCGRG00015012483  2240.586465      0.5094758 0.08929984  5.705226
    ## 2785 ENSCGRG00015006494  1314.352582      0.5091776 0.10348544  4.920283
    ## 2786 ENSCGRG00015012214  1405.389624      0.5091383 0.09858136  5.164651
    ## 2787 ENSCGRG00015003294  5878.149719      0.5089872 0.06951822  7.321638
    ## 2788 ENSCGRG00015008171  1010.193347      0.5089524 0.10634011  4.786081
    ## 2789 ENSCGRG00015007489  2490.008848      0.5088712 0.08425759  6.039470
    ## 2790 ENSCGRG00015014803   418.990963      0.5075533 0.15088534  3.363835
    ## 2791 ENSCGRG00015007236   373.626135      0.5074912 0.16137719  3.144752
    ## 2792 ENSCGRG00015007236   373.626135      0.5074912 0.16137719  3.144752
    ## 2793 ENSCGRG00015011727 10584.428135      0.5073375 0.06910043  7.342031
    ## 2794 ENSCGRG00015016580   322.309832      0.5072852 0.17082666  2.969590
    ## 2795 ENSCGRG00015004772   545.435436      0.5071969 0.13616035  3.724997
    ## 2796 ENSCGRG00015015760  2024.061703      0.5071399 0.08527081  5.947403
    ## 2797 ENSCGRG00015010478   416.506997      0.5069520 0.15075020  3.362861
    ## 2798 ENSCGRG00015021521   920.543435      0.5067144 0.11060837  4.581157
    ## 2799 ENSCGRG00015017547  1739.132402      0.5064959 0.09216525  5.495519
    ## 2800 ENSCGRG00015012548  1058.455565      0.5061097 0.11305527  4.476657
    ## 2801 ENSCGRG00015025321   345.411610      0.5053122 0.16591267  3.045652
    ## 2802 ENSCGRG00015014334   262.249895      0.5052830 0.18471414  2.735486
    ## 2803 ENSCGRG00015004608   254.217327      0.5051802 0.18646519  2.709247
    ## 2804 ENSCGRG00015002554  1105.827665      0.5051298 0.10779980  4.685814
    ## 2805 ENSCGRG00015021335   183.123095      0.5046761 0.21718089  2.323759
    ## 2806 ENSCGRG00015024746  1983.633269      0.5046307 0.08586769  5.876841
    ## 2807 ENSCGRG00015015898 12471.761543      0.5045918 0.06737390  7.489426
    ## 2808 ENSCGRG00015016213  6796.884797      0.5045667 0.08043511  6.272966
    ## 2809 ENSCGRG00015023548  1149.982886      0.5045488 0.10312026  4.892819
    ## 2810 ENSCGRG00015018918  2684.391883      0.5043852 0.08447612  5.970744
    ## 2811 ENSCGRG00015003155  3361.048895      0.5038511 0.07641230  6.593848
    ## 2812 ENSCGRG00015025263   396.318685      0.5038432 0.15333483  3.285902
    ## 2813 ENSCGRG00015022369  1353.674354      0.5036785 0.09672185  5.207495
    ## 2814 ENSCGRG00015015470   892.476032      0.5035955 0.11222361  4.487430
    ## 2815 ENSCGRG00015019485  1278.169402      0.5032454 0.10005600  5.029637
    ## 2816 ENSCGRG00015014524   828.273870      0.5028271 0.12323212  4.080325
    ## 2817 ENSCGRG00015000945   568.446804      0.5019006 0.13450512  3.731461
    ## 2818 ENSCGRG00015000193  1219.239697      0.5018344 0.09981035  5.027879
    ## 2819 ENSCGRG00015000062  3183.355410      0.5017630 0.08012493  6.262259
    ## 2820 ENSCGRG00015025114   251.578028      0.5013105 0.19779153  2.534540
    ## 2821 ENSCGRG00015004685  1437.904554      0.5010788 0.09427729  5.314947
    ## 2822 ENSCGRG00015019832   860.154194      0.5006681 0.11522096  4.345287
    ## 2823 ENSCGRG00015001147  1999.615468      0.5003282 0.08915699  5.611766
    ## 2824 ENSCGRG00015008380   791.060660      0.5001348 0.11680885  4.281651
    ## 2825 ENSCGRG00015028185   564.486723      0.5000245 0.13423573  3.724973
    ##             pvalue          padj significant Mouse.gene.stable.ID    GeneSymbol
    ## 1     8.620252e-03  1.834057e-02        True   ENSMUSG00000047953           Gp5
    ## 2     1.777749e-26  3.293992e-25        True   ENSMUSG00000109392        Gm5737
    ## 3     3.502474e-12  2.367394e-11        True   ENSMUSG00000024810          Il33
    ## 4    5.729765e-174 5.719738e-171        True   ENSMUSG00000058427         Cxcl2
    ## 5    5.729765e-174 5.719738e-171        True   ENSMUSG00000029379         Cxcl3
    ## 6     3.162151e-13  2.348019e-12        True   ENSMUSG00000056758         Hmga2
    ## 7     2.615811e-10  1.484182e-09        True   ENSMUSG00000039103          Nexn
    ## 8     1.843708e-02  3.611885e-02        True   ENSMUSG00000065394         Mir25
    ## 9     1.428734e-02  2.875834e-02        True   ENSMUSG00000061937       Csn1s2a
    ## 10    1.126758e-42  4.465652e-41        True   ENSMUSG00000021765           Fst
    ## 11    1.070710e-08  5.218607e-08        True   ENSMUSG00000041923          Nol4
    ## 12   1.074849e-113 2.959912e-111        True   ENSMUSG00000017861         Mybl2
    ## 13    5.008950e-65  4.124116e-63        True   ENSMUSG00000003190       Bcl2l12
    ## 14    3.144421e-05  1.016860e-04        True   ENSMUSG00000065287       Gm24451
    ## 15    8.177599e-45  3.483003e-43        True   ENSMUSG00000028873         Cdca8
    ## 16    1.147981e-02  2.373227e-02        True   ENSMUSG00000022425         Enpp2
    ## 17   3.810062e-123 1.322920e-120        True   ENSMUSG00000029177         Cenpa
    ## 18    6.955786e-03  1.510507e-02        True   ENSMUSG00000000317         Bcl6b
    ## 19    6.504230e-86  1.093532e-83        True   ENSMUSG00000000204         Slfn4
    ## 20    6.504230e-86  1.093532e-83        True   ENSMUSG00000018986         Slfn3
    ## 21    8.651460e-05  2.628517e-04        True   ENSMUSG00000078588        Ccdc24
    ## 22    1.408202e-42  5.553530e-41        True   ENSMUSG00000026873         Phf19
    ## 23    5.181152e-50  2.660880e-48        True   ENSMUSG00000028066          Pmf1
    ## 24   1.600547e-116 4.647989e-114        True   ENSMUSG00000020649          Rrm2
    ## 25    4.924409e-03  1.103432e-02        True   ENSMUSG00000029254         Stap1
    ## 26    1.179935e-35  3.426531e-34        True   ENSMUSG00000064036           Mro
    ## 27    4.133084e-09  2.093677e-08        True   ENSMUSG00000028572         Hook1
    ## 28    1.582898e-04  4.639760e-04        True   ENSMUSG00000074682        Zcchc3
    ## 29    1.204716e-29  2.600233e-28        True   ENSMUSG00000046295        Ankle1
    ## 30    2.885012e-06  1.072362e-05        True   ENSMUSG00000077625       Snord4a
    ## 31   2.737435e-106 6.726511e-104        True   ENSMUSG00000005410          Mcm5
    ## 32   2.671973e-127 9.924824e-125        True   ENSMUSG00000028560          Usp1
    ## 33    1.515999e-21  2.076633e-20        True   ENSMUSG00000028212         Ccne2
    ## 34    1.709862e-76  2.117048e-74        True   ENSMUSG00000030867          Plk1
    ## 35    3.841831e-08  1.779116e-07        True   ENSMUSG00000020955         Ap4s1
    ## 36    6.338860e-71  6.574304e-69        True   ENSMUSG00000012519          Mlkl
    ## 37    2.649196e-66  2.312184e-64        True   ENSMUSG00000032327         Stra6
    ## 38    9.682346e-31  2.251040e-29        True   ENSMUSG00000017499          Cdc6
    ## 39    1.026003e-03  2.623651e-03        True   ENSMUSG00000027925     Sprr2j-ps
    ## 40    7.082417e-30  1.551720e-28        True   ENSMUSG00000030498          Gas2
    ## 41    9.785389e-34  2.562168e-32        True   ENSMUSG00000021965          Ska3
    ## 42    9.083010e-21  1.191082e-19        True   ENSMUSG00000075266         Cenpw
    ## 43    2.768437e-30  6.286339e-29        True   ENSMUSG00000024791         Cdca5
    ## 44    1.623193e-43  6.613684e-42        True   ENSMUSG00000026259          Ngef
    ## 45    6.146658e-26  1.104324e-24        True   ENSMUSG00000026683          Nuf2
    ## 46    3.228824e-11  1.989613e-10        True   ENSMUSG00000002068         Ccne1
    ## 47    8.292484e-55  4.979232e-53        True   ENSMUSG00000022385         Gtse1
    ## 48    5.626746e-04  1.499715e-03        True   ENSMUSG00000010796          Asz1
    ## 49    4.940413e-24  7.946453e-23        True   ENSMUSG00000039693       Msantd3
    ## 50    1.461629e-06  5.636199e-06        True   ENSMUSG00000035916         Ptprq
    ## 51    3.547319e-09  1.808997e-08        True   ENSMUSG00000075012          Fjx1
    ## 52    1.793572e-22  2.585463e-21        True   ENSMUSG00000025049          Taf5
    ## 53    1.577382e-91  2.929529e-89        True   ENSMUSG00000028693          Nasp
    ## 54    1.089516e-05  3.767429e-05        True   ENSMUSG00000050295         Foxc1
    ## 55    5.087567e-56  3.173304e-54        True   ENSMUSG00000031167          Rbm3
    ## 56    3.449211e-12  2.334356e-11        True   ENSMUSG00000044201        Cdc25c
    ## 57    2.086205e-50  1.081846e-48        True   ENSMUSG00000026429         Ube2t
    ## 58   2.656535e-119 8.159649e-117        True   ENSMUSG00000016995         Matn4
    ## 59    1.929736e-80  2.801977e-78        True   ENSMUSG00000030677         Kif22
    ## 60    1.157339e-26  2.172152e-25        True   ENSMUSG00000020897         Aurkb
    ## 61    1.246619e-06  4.845703e-06        True   ENSMUSG00000063689        H2ac21
    ## 62    4.294577e-78  5.668842e-76        True   ENSMUSG00000036768         Kif15
    ## 63    6.952169e-24  1.102682e-22        True   ENSMUSG00000021714         Cenpk
    ## 64    1.817495e-77  2.360084e-75        True   ENSMUSG00000054717         Hmgb2
    ## 65    1.183595e-69  1.166937e-67        True   ENSMUSG00000030177        Ccdc77
    ## 66    3.339635e-26  6.096075e-25        True   ENSMUSG00000039231       Suv39h1
    ## 67    2.003401e-10  1.150191e-09        True   ENSMUSG00000100642          <NA>
    ## 68    2.003401e-10  1.150191e-09        True   ENSMUSG00000101174         Hoxd4
    ## 69    4.923067e-74  5.739506e-72        True   ENSMUSG00000027715         Ccna2
    ## 70   1.351668e-105 3.222215e-103        True   ENSMUSG00000105827        H2bc18
    ## 71    2.226747e-20  2.824909e-19        True   ENSMUSG00000016624        Phf21b
    ## 72    4.002633e-68  3.760591e-66        True   ENSMUSG00000031134          Rbmx
    ## 73   7.364837e-135 2.940779e-132        True   ENSMUSG00000019970          Sgk1
    ## 74    1.529572e-51  8.299794e-50        True   ENSMUSG00000051220        Ercc6l
    ## 75    1.735133e-69  1.689850e-67        True   ENSMUSG00000005481        Ddx39a
    ## 76    6.080703e-49  3.016180e-47        True   ENSMUSG00000040204         Pclaf
    ## 77    5.762167e-83  8.765079e-81        True   ENSMUSG00000041431         Ccnb1
    ## 78    5.724230e-06  2.052703e-05        True   ENSMUSG00000031937         Vstm5
    ## 79    1.599583e-51  8.631262e-50        True   ENSMUSG00000028068        Iqgap3
    ## 80    2.573390e-97  5.269511e-95        True   ENSMUSG00000019961          Tmpo
    ## 81    1.249463e-36  3.815761e-35        True   ENSMUSG00000042489         Clspn
    ## 82   5.889948e-100  1.254323e-97        True   ENSMUSG00000030978          Rrm1
    ## 83    1.143389e-42  4.520347e-41        True   ENSMUSG00000018474          Chd3
    ## 84    5.839181e-24  9.345030e-23        True   ENSMUSG00000051378        Kif18b
    ## 85    1.307447e-66  1.160141e-64        True   ENSMUSG00000021377           Dek
    ## 86    1.872584e-43  7.610410e-42        True   ENSMUSG00000028883        Sema3a
    ## 87    2.617670e-57  1.692689e-55        True   ENSMUSG00000027306        Nusap1
    ## 88    3.956773e-75  4.716238e-73        True   ENSMUSG00000028678         Kif2c
    ## 89    1.174641e-49  5.918412e-48        True   ENSMUSG00000032218         Ccnb2
    ## 90    9.861579e-33  2.464932e-31        True   ENSMUSG00000097878        Gm8764
    ## 91    9.861579e-33  2.464932e-31        True   ENSMUSG00000097427        Gm6763
    ## 92    9.861579e-33  2.464932e-31        True   ENSMUSG00000091101        Gm4302
    ## 93    9.861579e-33  2.464932e-31        True   ENSMUSG00000086727 4931428L18Rik
    ## 94    9.861579e-33  2.464932e-31        True   ENSMUSG00000091779       Gm21293
    ## 95    9.861579e-33  2.464932e-31        True   ENSMUSG00000096744        Gm4307
    ## 96    9.861579e-33  2.464932e-31        True   ENSMUSG00000117091        Gm5698
    ## 97    9.861579e-33  2.464932e-31        True   ENSMUSG00000090854        Gm4340
    ## 98    9.861579e-33  2.464932e-31        True   ENSMUSG00000025134        Alyref
    ## 99    9.861579e-33  2.464932e-31        True   ENSMUSG00000095022       Gm20765
    ## 100   9.861579e-33  2.464932e-31        True   ENSMUSG00000060244       Alyref2
    ## 101   9.861579e-33  2.464932e-31        True   ENSMUSG00000097550       Gm21304
    ## 102   9.861579e-33  2.464932e-31        True   ENSMUSG00000112931        Gm4303
    ## 103   9.861579e-33  2.464932e-31        True   ENSMUSG00000112856        Gm4305
    ## 104   9.861579e-33  2.464932e-31        True   ENSMUSG00000094314        Gm4301
    ## 105   9.861579e-33  2.464932e-31        True   ENSMUSG00000096640        Gm4312
    ## 106   9.861579e-33  2.464932e-31        True   ENSMUSG00000094144       Gm21312
    ## 107   6.038376e-65  4.945895e-63        True   ENSMUSG00000066551         Hmgb1
    ## 108   1.749399e-23  2.715394e-22        True   ENSMUSG00000019303       Psmc3ip
    ## 109   1.015223e-10  5.973072e-10        True   ENSMUSG00000114004       Gm48552
    ## 110   1.587799e-34  4.305659e-33        True   ENSMUSG00000033031         Cip2a
    ## 111   1.517499e-55  9.286398e-54        True   ENSMUSG00000042029        Ncapg2
    ## 112   3.588087e-18  3.890626e-17        True   ENSMUSG00000039748          Exo1
    ## 113   2.623415e-10  1.487968e-09        True   ENSMUSG00000018509         Cenpv
    ## 114   1.295359e-84  2.068947e-82        True   ENSMUSG00000028312          Smc2
    ## 115   7.136091e-62  5.140217e-60        True   ENSMUSG00000042606        Hirip3
    ## 116   2.201108e-16  2.083942e-15        True   ENSMUSG00000027454         Gins1
    ## 117   2.447976e-30  5.593573e-29        True   ENSMUSG00000046591         Ticrr
    ## 118   5.043826e-78  6.603278e-76        True   ENSMUSG00000041859          Mcm3
    ## 119   1.555199e-17  1.602558e-16        True   ENSMUSG00000078521         Aunip
    ## 120   2.449101e-04  6.933782e-04        True   ENSMUSG00000026162         Nhej1
    ## 121   1.592360e-69  1.560318e-67        True   ENSMUSG00000027699          Ect2
    ## 122   2.145529e-30  4.909511e-29        True   ENSMUSG00000027331        Knstrn
    ## 123   1.437134e-83  2.207106e-81        True   ENSMUSG00000020358       Hnrnpab
    ## 124   3.011529e-72  3.272119e-70        True   ENSMUSG00000028832         Stmn1
    ## 125   1.945999e-96  3.934368e-94        True   ENSMUSG00000038252        Ncapd2
    ## 126   2.170370e-02  4.171497e-02        True   ENSMUSG00000050222         Il17d
    ## 127   4.571231e-12  3.060004e-11        True   ENSMUSG00000026708         Cenpl
    ## 128  2.533446e-103 5.864376e-101        True   ENSMUSG00000004897          Hdgf
    ## 129   7.464571e-15  6.265062e-14        True   ENSMUSG00000022514        Il1rap
    ## 130   1.160541e-39  4.020860e-38        True   ENSMUSG00000023505         Cdca3
    ## 131   1.003330e-83  1.555844e-81        True   ENSMUSG00000040618          Pck2
    ## 132   8.990051e-35  2.484240e-33        True   ENSMUSG00000028702        Rad54l
    ## 133   1.965643e-05  6.551596e-05        True   ENSMUSG00000022978        Mis18a
    ## 134   5.198047e-32  1.269468e-30        True   ENSMUSG00000034192          Lsm3
    ## 135   5.987523e-36  1.777560e-34        True   ENSMUSG00000015749        Anp32e
    ## 136   6.906834e-57  4.377617e-55        True   ENSMUSG00000040084         Bub1b
    ## 137   4.581986e-48  2.191122e-46        True   ENSMUSG00000026622          Nek2
    ## 138   8.329422e-79  1.137073e-76        True   ENSMUSG00000013736         Trnt1
    ## 139   1.299632e-43  5.322492e-42        True   ENSMUSG00000022322        Shcbp1
    ## 140   1.976041e-23  3.052352e-22        True   ENSMUSG00000021569        Trip13
    ## 141   1.150517e-23  1.806889e-22        True   ENSMUSG00000020185          E2f7
    ## 142   2.944473e-23  4.491798e-22        True   ENSMUSG00000021697       Depdc1b
    ## 143   7.109840e-12  4.661673e-11        True   ENSMUSG00000026586         Prrx1
    ## 144   6.667968e-64  5.272316e-62        True   ENSMUSG00000023905     Tnfrsf12a
    ## 145   5.490274e-38  1.757328e-36        True   ENSMUSG00000028587          Orc1
    ## 146   5.553815e-31  1.310274e-29        True   ENSMUSG00000056394          Lig1
    ## 147   5.540431e-18  5.891596e-17        True   ENSMUSG00000019773         Fbxo5
    ## 148   4.498690e-41  1.671002e-39        True   ENSMUSG00000032783         Troap
    ## 149   2.389238e-68  2.258042e-66        True   ENSMUSG00000038943          Prc1
    ## 150   1.148800e-13  8.907107e-13        True   ENSMUSG00000026955        Sapcd2
    ## 151   1.463849e-26  2.721838e-25        True   ENSMUSG00000051235          Gen1
    ## 152   2.437489e-23  3.736236e-22        True   ENSMUSG00000035365        Parpbp
    ## 153   4.979645e-42  1.930458e-40        True   ENSMUSG00000028884          Rpa2
    ## 154   1.986962e-34  5.369840e-33        True   ENSMUSG00000001403         Ube2c
    ## 155   2.021703e-07  8.585654e-07        True   ENSMUSG00000047428          Dlk2
    ## 156   1.535678e-04  4.511284e-04        True   ENSMUSG00000018102         H2bc4
    ## 157   6.076092e-13  4.403237e-12        True   ENSMUSG00000023345         Poc1a
    ## 158   1.353839e-36  4.110936e-35        True   ENSMUSG00000009575          Cbx5
    ## 159   4.760568e-80  6.788910e-78        True   ENSMUSG00000028333        Anp32b
    ## 160   9.019082e-81  1.321585e-78        True   ENSMUSG00000024795        Kif20b
    ## 161   5.482554e-03  1.216044e-02        True   ENSMUSG00000006270          Vax1
    ## 162   3.292542e-62  2.434652e-60        True   ENSMUSG00000027326          Knl1
    ## 163   1.649473e-86  2.802701e-84        True   ENSMUSG00000066878       Gm10184
    ## 164   1.649473e-86  2.802701e-84        True   ENSMUSG00000018362         Kpna2
    ## 165   7.003985e-18  7.379132e-17        True   ENSMUSG00000033970          Rfc3
    ## 166   2.679143e-41  1.004490e-39        True   ENSMUSG00000028175       Depdc1a
    ## 167   4.709619e-37  1.472056e-35        True   ENSMUSG00000017550         Atad5
    ## 168   3.485988e-78  4.639851e-76        True   ENSMUSG00000037628         Cdkn3
    ## 169   9.122883e-67  8.232242e-65        True   ENSMUSG00000023015       Racgap1
    ## 170   4.483286e-20  5.572532e-19        True   ENSMUSG00000026669         Mcm10
    ## 171  1.002990e-122 3.408458e-120        True   ENSMUSG00000025364         Pa2g4
    ## 172   6.343239e-14  5.003171e-13        True   ENSMUSG00000061979         Rcc1l
    ## 173   1.030070e-09  5.519626e-09        True   ENSMUSG00000079845         Xlr4a
    ## 174   1.030070e-09  5.519626e-09        True   ENSMUSG00000031362         Xlr4c
    ## 175   1.030070e-09  5.519626e-09        True   ENSMUSG00000067768         Xlr4b
    ## 176   1.165286e-43  4.784560e-42        True   ENSMUSG00000005233         Spc25
    ## 177   1.199929e-54  7.124636e-53        True   ENSMUSG00000032477        Cdc25a
    ## 178   9.897972e-45  4.193380e-43        True   ENSMUSG00000029414         Kntc1
    ## 179   6.341862e-55  3.822348e-53        True   ENSMUSG00000006398         Cdc20
    ## 180   1.092453e-48  5.368818e-47        True   ENSMUSG00000015880         Ncapg
    ## 181   2.497003e-04  7.060035e-04        True   ENSMUSG00000074218        Cox7a1
    ## 182   2.204490e-60  1.571880e-58        True   ENSMUSG00000010048         Ifrd2
    ## 183   4.109719e-52  2.279182e-50        True   ENSMUSG00000020708         Psmc5
    ## 184   1.740875e-12  1.210503e-11        True   ENSMUSG00000029591           Ung
    ## 185   2.133253e-02  4.108563e-02        True   ENSMUSG00000065336          <NA>
    ## 186   2.584270e-12  1.767707e-11        True   ENSMUSG00000033762        Recql4
    ## 187   9.845359e-10  5.291052e-09        True   ENSMUSG00000034883          Lrr1
    ## 188   8.113674e-31  1.891848e-29        True   ENSMUSG00000053693         Mast1
    ## 189   5.755047e-14  4.552729e-13        True   ENSMUSG00000023908        Pkmyt1
    ## 190   6.991841e-26  1.246358e-24        True   ENSMUSG00000027654        Fam83d
    ## 191   4.323431e-93  8.123981e-91        True   ENSMUSG00000020914         Top2a
    ## 192   6.601239e-35  1.836847e-33        True   ENSMUSG00000022033           Pbk
    ## 193   5.001605e-81  7.396817e-79        True   ENSMUSG00000034349          Smc4
    ## 194   4.091382e-23  6.194080e-22        True   ENSMUSG00000029363          Rfc5
    ## 195   4.757129e-45  2.042496e-43        True   ENSMUSG00000028044         Cks1b
    ## 196   4.757129e-45  2.042496e-43        True   ENSMUSG00000062687       Cks1brt
    ## 197   1.895015e-64  1.520964e-62        True   ENSMUSG00000019942          Cdk1
    ## 198   1.554025e-59  1.093431e-57        True   ENSMUSG00000055612         Cdca7
    ## 199   4.750816e-16  4.373489e-15        True   ENSMUSG00000051278         Zgrf1
    ## 200   2.410811e-57  1.571652e-55        True   ENSMUSG00000026456        Cyb5r1
    ## 201   2.077894e-03  5.024696e-03        True   ENSMUSG00000036139         Hoxc9
    ## 202   5.611809e-42  2.159803e-40        True   ENSMUSG00000010097          Nxf1
    ## 203   1.137712e-47  5.376195e-46        True   ENSMUSG00000079434          Neu2
    ## 204   2.009874e-35  5.732449e-34        True   ENSMUSG00000027018          Hat1
    ## 205   1.463221e-15  1.294051e-14        True   ENSMUSG00000055240        Zfp101
    ## 206   4.797974e-32  1.175357e-30        True   ENSMUSG00000022881          Rfc4
    ## 207   1.004053e-04  3.022379e-04        True   ENSMUSG00000034773          Hrob
    ## 208   1.782021e-02  3.503070e-02        True   ENSMUSG00000019803         Nr2e1
    ## 209   1.445549e-37  4.590121e-36        True   ENSMUSG00000022203           Efs
    ## 210   4.184239e-43  1.691916e-41        True   ENSMUSG00000025747          Tyms
    ## 211   3.558601e-23  5.407990e-22        True   ENSMUSG00000068101         Cenpm
    ## 212   8.045956e-08  3.576677e-07        True   ENSMUSG00000034037          Fgd5
    ## 213   4.165955e-13  3.060655e-12        True   ENSMUSG00000025499          Hras
    ## 214   4.856499e-32  1.187871e-30        True   ENSMUSG00000001517         Foxm1
    ## 215   5.460625e-30  1.206322e-28        True   ENSMUSG00000032400        Zwilch
    ## 216   1.504611e-65  1.264823e-63        True   ENSMUSG00000029730          Mcm7
    ## 217   8.523723e-16  7.687234e-15        True   ENSMUSG00000031756         Cenpn
    ## 218   5.859773e-48  2.793800e-46        True   ENSMUSG00000038685         Rtel1
    ## 219   1.150693e-20  1.495432e-19        True   ENSMUSG00000044906 4930503L19Rik
    ## 220   4.103629e-28  8.307118e-27        True   ENSMUSG00000061479         Snrpa
    ## 221   1.154569e-54  6.880886e-53        True   ENSMUSG00000002059         Rab34
    ## 222   1.442874e-41  5.474011e-40        True   ENSMUSG00000034023        Fancd2
    ## 223   1.837471e-08  8.768474e-08        True   ENSMUSG00000021176       Efcab11
    ## 224   1.889540e-32  4.664565e-31        True   ENSMUSG00000047534      Mis18bp1
    ## 225   2.855686e-38  9.232999e-37        True   ENSMUSG00000038379           Ttk
    ## 226   1.327926e-49  6.669696e-48        True   ENSMUSG00000033813         Tcea1
    ## 227   2.903073e-11  1.799996e-10        True   ENSMUSG00000010538         Tsacc
    ## 228   1.504594e-21  2.062779e-20        True   ENSMUSG00000024829        Mrpl21
    ## 229   9.757780e-06  3.396192e-05        True   ENSMUSG00000033268         Duox1
    ## 230   9.143460e-23  1.347226e-21        True   ENSMUSG00000036533      Cdc42ep3
    ## 231   2.967801e-10  1.679126e-09        True   ENSMUSG00000040482           Dxo
    ## 232   1.661715e-20  2.136949e-19        True   ENSMUSG00000071653 1810009A15Rik
    ## 233   1.661715e-20  2.136949e-19        True   ENSMUSG00000116347          <NA>
    ## 234   2.029073e-40  7.250192e-39        True   ENSMUSG00000007080          Pole
    ## 235   8.117447e-13  5.813985e-12        True   ENSMUSG00000026784         Pdss1
    ## 236   5.025763e-59  3.474956e-57        True   ENSMUSG00000037544        Dlgap5
    ## 237   5.651675e-40  1.988294e-38        True   ENSMUSG00000003541          Ier3
    ## 238   1.389519e-40  4.998512e-39        True   ENSMUSG00000048922         Cdca2
    ## 239   1.335613e-03  3.345736e-03        True   ENSMUSG00000053560          Ier2
    ## 240   8.211318e-08  3.645113e-07        True   ENSMUSG00000062822 4833420G17Rik
    ## 241   2.775808e-26  5.090150e-25        True   ENSMUSG00000036109         Mbnl3
    ## 242   2.858148e-14  2.304409e-13        True   ENSMUSG00000030346      Rad51ap1
    ## 243   5.940808e-62  4.313027e-60        True   ENSMUSG00000020840          Blmh
    ## 244   5.331872e-42  2.062001e-40        True   ENSMUSG00000019960         Dusp6
    ## 245   7.378197e-44  3.060898e-42        True   ENSMUSG00000018446         C1qbp
    ## 246   3.416863e-67  3.118522e-65        True   ENSMUSG00000027597          Ahcy
    ## 247   3.416863e-67  3.118522e-65        True   ENSMUSG00000048087        Gm4737
    ## 248   6.012404e-96  1.200376e-93        True   ENSMUSG00000054766           Set
    ## 249   2.254952e-07  9.530588e-07        True   ENSMUSG00000031706          Rfx1
    ## 250   2.425440e-13  1.828180e-12        True   ENSMUSG00000039357         Fut11
    ## 251   8.005477e-50  4.059158e-48        True   ENSMUSG00000028124          Gclm
    ## 252   9.531885e-03  2.006633e-02        True   ENSMUSG00000044595          Dnd1
    ## 253   1.412814e-85  2.326337e-83        True   ENSMUSG00000020869        Lrrc59
    ## 254   7.573310e-17  7.430032e-16        True   ENSMUSG00000029910        Mad2l1
    ## 255   4.359159e-16  4.024537e-15        True   ENSMUSG00000020652         Cenpo
    ## 256   7.100443e-03  1.538574e-02        True   ENSMUSG00000054074        Skida1
    ## 257   8.668734e-25  1.468261e-23        True   ENSMUSG00000115219     Eef1akmt4
    ## 258   2.266419e-09  1.175300e-08        True   ENSMUSG00000007050          Lsm2
    ## 259   1.341438e-26  2.500053e-25        True   ENSMUSG00000039356        Exosc2
    ## 260   8.973510e-55  5.367974e-53        True   ENSMUSG00000002055         Spag5
    ## 261   3.530650e-25  6.070133e-24        True   ENSMUSG00000034906         Ncaph
    ## 262   5.733743e-12  3.806290e-11        True   ENSMUSG00000006585          Cdt1
    ## 263   5.522085e-08  2.502802e-07        True   ENSMUSG00000068744         Psrc1
    ## 264   4.274567e-31  1.015973e-29        True   ENSMUSG00000030814         Bcl7c
    ## 265   1.662810e-13  1.272563e-12        True   ENSMUSG00000032586         Traip
    ## 266   1.207556e-11  7.758282e-11        True   ENSMUSG00000036223          Ska1
    ## 267   5.702947e-49  2.846484e-47        True   ENSMUSG00000056209          Npm3
    ## 268   1.023045e-52  5.733362e-51        True   ENSMUSG00000058290         Espl1
    ## 269   1.045061e-27  2.065807e-26        True   ENSMUSG00000020775        Mrpl38
    ## 270   7.070231e-40  2.471023e-38        True   ENSMUSG00000027342          Pcna
    ## 271   3.209401e-10  1.808770e-09        True   ENSMUSG00000047832         Cdca4
    ## 272   9.001412e-24  1.423471e-22        True   ENSMUSG00000019992         Mtfr2
    ## 273   1.156659e-28  2.389930e-27        True   ENSMUSG00000072082          Ccnf
    ## 274   1.462821e-70  1.478746e-68        True   ENSMUSG00000001918        Slc1a5
    ## 275   9.895430e-28  1.960916e-26        True   ENSMUSG00000020415         Pttg1
    ## 276   4.601594e-17  4.576380e-16        True   ENSMUSG00000044339        Alkbh2
    ## 277   2.208104e-02  4.233326e-02        True   ENSMUSG00000093413       Snora15
    ## 278   5.454853e-18  5.808328e-17        True   ENSMUSG00000005718         Tfap4
    ## 279   6.308271e-22  8.877154e-21        True   ENSMUSG00000002825         Qtrt1
    ## 280   7.696700e-04  2.006066e-03        True   ENSMUSG00000061613         U2af1
    ## 281   1.712317e-13  1.309197e-12        True   ENSMUSG00000026646       Suv39h2
    ## 282   5.101174e-43  2.057473e-41        True   ENSMUSG00000025001         Hells
    ## 283   2.369015e-27  4.586414e-26        True   ENSMUSG00000063235        Ptpmt1
    ## 284   2.449198e-02  4.641504e-02        True   ENSMUSG00000068855        H2ac20
    ## 285   9.030935e-40  3.135698e-38        True   ENSMUSG00000067367          Lyar
    ## 286   2.661724e-73  3.015110e-71        True   ENSMUSG00000018697          Aatf
    ## 287   1.423291e-35  4.110814e-34        True   ENSMUSG00000041498         Kif14
    ## 288   3.621010e-53  2.043632e-51        True   ENSMUSG00000032555        Topbp1
    ## 289   6.803072e-14  5.355282e-13        True   ENSMUSG00000026196         Bard1
    ## 290   1.924481e-14  1.574683e-13        True   ENSMUSG00000023156         Rpp14
    ## 291   8.380813e-36  2.460631e-34        True   ENSMUSG00000027752        Exosc8
    ## 292   1.644980e-11  1.048429e-10        True   ENSMUSG00000022945        Chaf1b
    ## 293   4.009669e-63  3.064231e-61        True   ENSMUSG00000053398         Phgdh
    ## 294   2.985258e-24  4.875312e-23        True   ENSMUSG00000024742          Fen1
    ## 295  2.572905e-101  5.707560e-99        True   ENSMUSG00000026074        Map4k4
    ## 296   5.372896e-72  5.798371e-70        True   ENSMUSG00000030208          Emp1
    ## 297   6.028212e-17  5.954397e-16        True   ENSMUSG00000000028         Cdc45
    ## 298   8.737387e-16  7.866603e-15        True   ENSMUSG00000027323         Rad51
    ## 299   2.127588e-39  7.307920e-38        True   ENSMUSG00000022704         Qtrt2
    ## 300   7.597652e-10  4.126137e-09        True   ENSMUSG00000039632         Odad3
    ## 301   8.392713e-23  1.241189e-21        True   ENSMUSG00000027115        Kif18a
    ## 302   4.386336e-34  1.171548e-32        True   ENSMUSG00000059336       Slc14a1
    ## 303   1.502887e-21  2.062209e-20        True   ENSMUSG00000027245          Hypk
    ## 304   1.212261e-53  6.989974e-52        True   ENSMUSG00000025260      Hsd17b10
    ## 305   1.703944e-47  8.028140e-46        True   ENSMUSG00000024841        Eif1ad
    ## 306   6.901550e-48  3.280701e-46        True   ENSMUSG00000022673          Mcm4
    ## 307   8.263710e-39  2.744033e-37        True   ENSMUSG00000025591         Tma16
    ## 308   3.319825e-12  2.249650e-11        True   ENSMUSG00000054115          Skp2
    ## 309   1.295624e-09  6.861308e-09        True   ENSMUSG00000044934        Zfp367
    ## 310   6.625264e-34  1.754871e-32        True   ENSMUSG00000024800         Rpp30
    ## 311   1.030172e-59  7.280487e-58        True   ENSMUSG00000029014        Dnajc2
    ## 312   1.879052e-18  2.087081e-17        True   ENSMUSG00000048327        Ckap2l
    ## 313   1.021342e-02  2.134914e-02        True   ENSMUSG00000040170          Fmo2
    ## 314   3.834989e-21  5.121441e-20        True   ENSMUSG00000032815         Fanca
    ## 315   8.019328e-45  3.424725e-43        True   ENSMUSG00000025758          Plk4
    ## 316   4.878895e-66  4.189555e-64        True   ENSMUSG00000020460        Rps27a
    ## 317   3.860107e-24  6.233936e-23        True   ENSMUSG00000031262         Cenpi
    ## 318   9.661481e-12  6.250027e-11        True   ENSMUSG00000060288          Ppih
    ## 319   2.136975e-64  1.706588e-62        True   ENSMUSG00000062867        Impdh2
    ## 320   1.076904e-34  2.961804e-33        True   ENSMUSG00000038539          Atf5
    ## 321   1.922857e-57  1.258683e-55        True   ENSMUSG00000021226         Acot2
    ## 322   1.922857e-57  1.258683e-55        True   ENSMUSG00000072949         Acot1
    ## 323   3.591592e-40  1.274776e-38        True   ENSMUSG00000002297          Dbf4
    ## 324   2.508254e-59  1.741819e-57        True   ENSMUSG00000027469          Tpx2
    ## 325   1.970819e-66  1.739111e-64        True   ENSMUSG00000021178         Psmc1
    ## 326   2.044677e-17  2.093435e-16        True   ENSMUSG00000022184         Fbxo4
    ## 327   2.111585e-11  1.328851e-10        True   ENSMUSG00000038214         Bend3
    ## 328   5.624411e-80  7.949831e-78        True   ENSMUSG00000059796        Eif4a1
    ## 329   2.217476e-18  2.445962e-17        True   ENSMUSG00000020739         Nup85
    ## 330   4.992323e-63  3.797018e-61        True   ENSMUSG00000016319       Slc25a5
    ## 331   1.251644e-03  3.149718e-03        True   ENSMUSG00000041911          Dlx1
    ## 332   4.408794e-12  2.953744e-11        True   ENSMUSG00000051159        Cited1
    ## 333   2.241391e-17  2.287508e-16        True   ENSMUSG00000056531        Ccdc18
    ## 334   7.517961e-20  9.208350e-19        True   ENSMUSG00000027635          Dsn1
    ## 335   4.189253e-05  1.329441e-04        True   ENSMUSG00000062248          Cks2
    ## 336   1.038949e-38  3.414422e-37        True   ENSMUSG00000031171         Ftsj1
    ## 337   1.430992e-67  1.313552e-65        True   ENSMUSG00000029752          Asns
    ## 338   8.193706e-20  9.997698e-19        True   ENSMUSG00000034329         Brip1
    ## 339   7.709609e-25  1.312770e-23        True   ENSMUSG00000040331       Nsmce4a
    ## 340   1.565983e-72  1.713143e-70        True   ENSMUSG00000024981         Acsl5
    ## 341   7.070653e-56  4.377227e-54        True   ENSMUSG00000024640         Psat1
    ## 342   2.720146e-63  2.109038e-61        True   ENSMUSG00000036777          Anln
    ## 343   1.073945e-25  1.897462e-24        True   ENSMUSG00000020534         Shmt1
    ## 344   5.040718e-73  5.590997e-71        True   ENSMUSG00000018417         Myo1b
    ## 345   5.361167e-19  6.227532e-18        True   ENSMUSG00000057497       Fam136a
    ## 346   1.122636e-32  2.801679e-31        True   ENSMUSG00000038644         Pold1
    ## 347   1.990881e-23  3.072304e-22        True   ENSMUSG00000019857         Asf1a
    ## 348   2.481567e-02  4.693934e-02        True   ENSMUSG00000077737          <NA>
    ## 349   1.532957e-51  8.299794e-50        True   ENSMUSG00000020180        Snrpd3
    ## 350   6.794530e-23  1.009509e-21        True   ENSMUSG00000030811        Fbxl19
    ## 351   6.071021e-50  3.097967e-48        True   ENSMUSG00000031403          Dkc1
    ## 352   3.607913e-19  4.237176e-18        True   ENSMUSG00000020069       Hnrnph3
    ## 353   6.761134e-26  1.207929e-24        True   ENSMUSG00000030685        Kctd13
    ## 354   6.369426e-09  3.176162e-08        True   ENSMUSG00000041346        Wrap53
    ## 355   1.662530e-73  1.924198e-71        True   ENSMUSG00000025403         Shmt2
    ## 356   6.610011e-57  4.206179e-55        True   ENSMUSG00000027405         Nop56
    ## 357   2.771842e-11  1.723982e-10        True   ENSMUSG00000036875          Dna2
    ## 358   2.919368e-13  2.174820e-12        True   ENSMUSG00000031546         Gins4
    ## 359   3.065602e-70  3.060237e-68        True   ENSMUSG00000029147         Ppm1g
    ## 360   1.148885e-10  6.729003e-10        True   ENSMUSG00000058126      Tpm3-rs7
    ## 361   9.054552e-14  7.064939e-13        True   ENSMUSG00000078768        Zfp566
    ## 362   1.972785e-15  1.728432e-14        True   ENSMUSG00000028609         Magoh
    ## 363   1.456113e-50  7.675588e-49        True   ENSMUSG00000025068         Gsto1
    ## 364   6.893422e-33  1.742116e-31        True   ENSMUSG00000035351         Nup37
    ## 365   1.359105e-21  1.868126e-20        True   ENSMUSG00000039187         Fanci
    ## 366   5.009257e-65  4.124116e-63        True   ENSMUSG00000001415          Smg5
    ## 367   4.970267e-05  1.562699e-04        True   ENSMUSG00000068536         Doxl2
    ## 368   2.145905e-02  4.130440e-02        True   ENSMUSG00000079415          Cntf
    ## 369   7.016129e-07  2.811380e-06        True   ENSMUSG00000060639          H4c9
    ## 370   7.016129e-07  2.811380e-06        True   ENSMUSG00000060093          H4c1
    ## 371   4.184540e-30  9.373838e-29        True   ENSMUSG00000037313         Tacc3
    ## 372   1.647377e-38  5.358841e-37        True   ENSMUSG00000026355          Mcm6
    ## 373   7.339078e-28  1.470762e-26        True   ENSMUSG00000036781        Rps27l
    ## 374   3.943229e-25  6.764903e-24        True   ENSMUSG00000027496         Aurka
    ## 375   5.497949e-06  1.975551e-05        True   ENSMUSG00000039065      Atpsckmt
    ## 376   2.259936e-09  1.172319e-08        True   ENSMUSG00000031971         Ccsap
    ## 377   2.820296e-26  5.165799e-25        True   ENSMUSG00000027076        Timm10
    ## 378   1.462091e-23  2.280519e-22        True   ENSMUSG00000024191         Bnip1
    ## 379   2.553145e-11  1.592923e-10        True   ENSMUSG00000098789         Jmjd7
    ## 380   8.820316e-33  2.211587e-31        True   ENSMUSG00000005732        Ranbp1
    ## 381   3.409117e-27  6.528827e-26        True   ENSMUSG00000040435      Ppp1r15a
    ## 382   2.278873e-35  6.488086e-34        True   ENSMUSG00000032397         Tipin
    ## 383   5.435132e-24  8.724616e-23        True   ENSMUSG00000037725         Ckap2
    ## 384   1.135640e-20  1.477072e-19        True   ENSMUSG00000062963          Ufc1
    ## 385   8.192055e-37  2.525936e-35        True   ENSMUSG00000003438        Timm50
    ## 386   1.452607e-14  1.196547e-13        True   ENSMUSG00000020029         Nudt4
    ## 387   3.124835e-42  1.223281e-40        True   ENSMUSG00000004264          Phb2
    ## 388   3.684599e-07  1.519112e-06        True   ENSMUSG00000027833         Shox2
    ## 389   1.727564e-28  3.539154e-27        True   ENSMUSG00000028862        Map3k6
    ## 390   2.920361e-17  2.963406e-16        True   ENSMUSG00000020330          Hmmr
    ## 391   3.416603e-05  1.099093e-04        True   ENSMUSG00000021485          Mxd3
    ## 392   1.674497e-21  2.283951e-20        True   ENSMUSG00000034311          Kif4
    ## 393   1.136423e-11  7.315978e-11        True   ENSMUSG00000026049         Tex30
    ## 394   1.468613e-08  7.065269e-08        True   ENSMUSG00000049929         Lpar4
    ## 395   2.268678e-12  1.561195e-11        True   ENSMUSG00000091625          Lsm5
    ## 396   1.539396e-24  2.566518e-23        True   ENSMUSG00000061360         Phf5a
    ## 397   7.277675e-37  2.257068e-35        True   ENSMUSG00000069565        Dazap1
    ## 398   4.579561e-35  1.280994e-33        True   ENSMUSG00000026174         Cnot9
    ## 399   4.058159e-87  7.122739e-85        True   ENSMUSG00000040945          Rcc2
    ## 400   6.551208e-20  8.042728e-19        True   ENSMUSG00000072582         Ptrh2
    ## 401   3.579938e-26  6.512389e-25        True   ENSMUSG00000073705         Cenps
    ## 402   2.121286e-13  1.609557e-12        True   ENSMUSG00000038009       Dnajc22
    ## 403   5.896591e-04  1.565758e-03        True   ENSMUSG00000037788         Vopp1
    ## 404   2.661376e-28  5.414967e-27        True   ENSMUSG00000074088       Snrnp40
    ## 405   5.828281e-09  2.913593e-08        True   ENSMUSG00000069910         Spdl1
    ## 406   2.956961e-48  1.426845e-46        True   ENSMUSG00000029247         Paics
    ## 407   9.121238e-36  2.663335e-34        True   ENSMUSG00000037364          Srrt
    ## 408   9.650396e-23  1.420609e-21        True   ENSMUSG00000024056         Ndc80
    ## 409   3.389426e-04  9.372561e-04        True   ENSMUSG00000037991          Rmi2
    ## 410   1.488105e-03  3.694128e-03        True   ENSMUSG00000048706       Lurap1l
    ## 411   5.299861e-41  1.954951e-39        True   ENSMUSG00000026434        Nucks1
    ## 412   8.753024e-22  1.216739e-20        True   ENSMUSG00000028973         Abcb8
    ## 413   1.604589e-21  2.190469e-20        True   ENSMUSG00000048668         Rhno1
    ## 414   1.107988e-34  3.040686e-33        True   ENSMUSG00000025264          Tsr2
    ## 415   4.160356e-17  4.160877e-16        True   ENSMUSG00000027330        Cdc25b
    ## 416   8.319467e-50  4.205017e-48        True   ENSMUSG00000031432         Prps1
    ## 417   8.319467e-50  4.205017e-48        True   ENSMUSG00000079104       Prps1l3
    ## 418   9.878120e-22  1.368372e-20        True   ENSMUSG00000032469          Dbr1
    ## 419   5.129987e-84  8.112490e-82        True   ENSMUSG00000037851          Iars
    ## 420   8.238980e-47  3.825378e-45        True   ENSMUSG00000061950        Ppp4r1
    ## 421   3.196218e-04  8.884441e-04        True   ENSMUSG00000028807        Zbtb8a
    ## 422   1.226895e-29  2.644530e-28        True   ENSMUSG00000038418          Egr1
    ## 423   6.644875e-23  9.881932e-22        True   ENSMUSG00000017724          Etv4
    ## 424   2.729235e-47  1.278338e-45        True   ENSMUSG00000002102         Psmc3
    ## 425   1.674890e-19  2.011379e-18        True   ENSMUSG00000021115          Vrk1
    ## 426   7.584993e-21  9.995669e-20        True   ENSMUSG00000021645          Smn1
    ## 427   1.122166e-09  5.984386e-09        True   ENSMUSG00000062190        Lancl2
    ## 428   2.289989e-05  7.558525e-05        True   ENSMUSG00000069267          H3c2
    ## 429   1.682035e-50  8.808347e-49        True   ENSMUSG00000057406          Nsd2
    ## 430   2.491026e-47  1.170196e-45        True   ENSMUSG00000031386         Hcfc1
    ## 431   6.110702e-37  1.902537e-35        True   ENSMUSG00000020899          Pfas
    ## 432   6.800217e-40  2.387100e-38        True   ENSMUSG00000030512        Snrpa1
    ## 433   1.794190e-15  1.578018e-14        True   ENSMUSG00000002635        Pdcd2l
    ## 434   1.832490e-18  2.036780e-17        True   ENSMUSG00000055884         Fancm
    ## 435   4.884068e-26  8.814501e-25        True   ENSMUSG00000030706        Mrpl48
    ## 436   2.350785e-20  2.972822e-19        True   ENSMUSG00000075470        Alg10b
    ## 437   7.414539e-04  1.937265e-03        True   ENSMUSG00000039653          Baat
    ## 438   5.389642e-43  2.168347e-41        True   ENSMUSG00000046111        Cep295
    ## 439   3.901143e-17  3.921275e-16        True   ENSMUSG00000045751        Mms22l
    ## 440   5.536942e-15  4.689079e-14        True   ENSMUSG00000028542        Slc6a9
    ## 441   9.732132e-56  6.001607e-54        True   ENSMUSG00000027610           Gss
    ## 442   1.248368e-11  8.010822e-11        True   ENSMUSG00000028541       B4galt2
    ## 443   1.243104e-13  9.619601e-13        True   ENSMUSG00000047044 D030056L22Rik
    ## 444   2.557767e-03  6.089232e-03        True   ENSMUSG00000110949         Nudt8
    ## 445   2.557767e-03  6.089232e-03        True   ENSMUSG00000024869          <NA>
    ## 446   1.842377e-50  9.585161e-49        True   ENSMUSG00000017428        Psmd11
    ## 447   8.631722e-22  1.200922e-20        True   ENSMUSG00000031917          Nip7
    ## 448   6.916178e-12  4.545893e-11        True   ENSMUSG00000058729          Lin9
    ## 449   3.037434e-39  1.027837e-37        True   ENSMUSG00000002477        Snrpd1
    ## 450   5.444879e-12  3.622057e-11        True   ENSMUSG00000069020          Urm1
    ## 451   2.435984e-04  6.899724e-04        True   ENSMUSG00000114279        H2bc14
    ## 452   1.425862e-26  2.654297e-25        True   ENSMUSG00000034765         Dusp5
    ## 453   4.449851e-26  8.049041e-25        True   ENSMUSG00000020923          Ubtf
    ## 454   3.989884e-14  3.183139e-13        True   ENSMUSG00000024902        Mrpl11
    ## 455   2.351387e-59  1.640015e-57        True   ENSMUSG00000040463       Mybbp1a
    ## 456   2.611524e-36  7.811098e-35        True   ENSMUSG00000005899         Smpd4
    ## 457   1.313172e-15  1.165190e-14        True   ENSMUSG00000021932      Rnaseh2b
    ## 458   1.368781e-39  4.732072e-38        True   ENSMUSG00000026127          Imp4
    ## 459   3.470432e-57  2.217189e-55        True   ENSMUSG00000029430           Ran
    ## 460   3.152292e-75  3.814274e-73        True   ENSMUSG00000007029          Vars
    ## 461   1.169697e-16  1.129528e-15        True   ENSMUSG00000032714         Syde1
    ## 462   1.042198e-19  1.265854e-18        True   ENSMUSG00000036983         Tfb1m
    ## 463   9.580121e-42  3.660615e-40        True   ENSMUSG00000031490      Eif4ebp1
    ## 464   5.708688e-23  8.561425e-22        True   ENSMUSG00000001768          Rin2
    ## 465   2.635154e-29  5.611824e-28        True   ENSMUSG00000028614          Ndc1
    ## 466   1.126547e-02  2.331935e-02        True   ENSMUSG00000044966        Fbxo48
    ## 467   8.961548e-45  3.806751e-43        True   ENSMUSG00000007850       Hnrnph1
    ## 468   2.098175e-24  3.472751e-23        True   ENSMUSG00000020527         Myo19
    ## 469   5.181127e-18  5.524230e-17        True   ENSMUSG00000037315         Jade3
    ## 470   4.662792e-45  2.007388e-43        True   ENSMUSG00000022391       Rangap1
    ## 471   9.029152e-42  3.458360e-40        True   ENSMUSG00000005566        Trim28
    ## 472   9.079270e-71  9.236567e-69        True   ENSMUSG00000001440         Kpnb1
    ## 473   8.568616e-17  8.360289e-16        True   ENSMUSG00000038215         Cep44
    ## 474   9.108080e-18  9.520567e-17        True   ENSMUSG00000031388         Naa10
    ## 475   6.921608e-05  2.132149e-04        True   ENSMUSG00000019952         Poc1b
    ## 476   3.036816e-20  3.822224e-19        True   ENSMUSG00000024691       Fam111a
    ## 477   3.554087e-12  2.400249e-11        True   ENSMUSG00000020413          Hus1
    ## 478   1.100317e-40  3.976077e-39        True   ENSMUSG00000067194        Eif1ax
    ## 479   3.031206e-04  8.446376e-04        True   ENSMUSG00000036480        Prss56
    ## 480   1.614434e-16  1.542210e-15        True   ENSMUSG00000028394         Pole3
    ## 481   1.206287e-35  3.496700e-34        True   ENSMUSG00000031392         Irak1
    ## 482   1.428425e-48  6.977004e-47        True   ENSMUSG00000074886          Grk6
    ## 483   9.212097e-17  8.955302e-16        True   ENSMUSG00000030726         Pold3
    ## 484   9.776155e-43  3.884198e-41        True   ENSMUSG00000020706         Ftsj3
    ## 485   6.577828e-39  2.188772e-37        True   ENSMUSG00000034274         Thoc5
    ## 486   2.109122e-11  1.327824e-10        True   ENSMUSG00000022178         Ajuba
    ## 487   3.224302e-11  1.987594e-10        True   ENSMUSG00000051238        Swsap1
    ## 488   1.183576e-26  2.216186e-25        True   ENSMUSG00000075229        Ccdc58
    ## 489   1.240922e-33  3.233281e-32        True   ENSMUSG00000000384         Tbrg4
    ## 490   5.916568e-64  4.701464e-62        True   ENSMUSG00000044533          Rps2
    ## 491   7.536784e-23  1.117711e-21        True   ENSMUSG00000019837        Gtf3c6
    ## 492   1.931545e-03  4.696398e-03        True   ENSMUSG00000023988          Bysl
    ## 493   1.560824e-29  3.346239e-28        True   ENSMUSG00000036181          H1f2
    ## 494   2.439181e-16  2.299800e-15        True   ENSMUSG00000063802        Hspbp1
    ## 495   2.696564e-21  3.637629e-20        True   ENSMUSG00000014551        Mrps25
    ## 496   3.741123e-03  8.602535e-03        True   ENSMUSG00000028655        Mfsd2a
    ## 497   1.952150e-33  5.045266e-32        True   ENSMUSG00000068882           Ssb
    ## 498   4.264070e-62  3.124116e-60        True   ENSMUSG00000004356         Utp20
    ## 499   5.482953e-23  8.238356e-22        True   ENSMUSG00000026974       Zmynd19
    ## 500   1.187789e-16  1.145614e-15        True   ENSMUSG00000022034         Esco2
    ## 501   8.312976e-25  1.409499e-23        True   ENSMUSG00000022247         Brix1
    ## 502   3.270803e-10  1.842076e-09        True   ENSMUSG00000031734          Irx3
    ## 503   1.318641e-23  2.063504e-22        True   ENSMUSG00000027905         Ddx20
    ## 504   1.563820e-04  4.586363e-04        True   ENSMUSG00000072980          Oip5
    ## 505   1.990363e-40  7.127819e-39        True   ENSMUSG00000003868        Ruvbl2
    ## 506   3.349638e-16  3.132343e-15        True   ENSMUSG00000020691        Mettl2
    ## 507   1.352880e-09  7.150296e-09        True   ENSMUSG00000035455        Fignl1
    ## 508   8.376581e-06  2.942396e-05        True   ENSMUSG00000043445           Pgp
    ## 509   2.318518e-21  3.140913e-20        True   ENSMUSG00000032113         Chek1
    ## 510   9.744390e-30  2.120400e-28        True   ENSMUSG00000027379          Bub1
    ## 511   3.553714e-03  8.222501e-03        True   ENSMUSG00000074627         Mroh8
    ## 512   1.644668e-35  4.733088e-34        True   ENSMUSG00000049327         Kmt5a
    ## 513   5.319663e-69  5.087764e-67        True   ENSMUSG00000034667          Xpot
    ## 514   1.287730e-15  1.143281e-14        True   ENSMUSG00000037608        Bclaf1
    ## 515   3.102446e-19  3.670539e-18        True   ENSMUSG00000041406      BC055324
    ## 516   1.651895e-35  4.745335e-34        True   ENSMUSG00000028622        Mrpl37
    ## 517   6.269669e-03  1.373805e-02        True   ENSMUSG00000071172         Srsf3
    ## 518   7.936662e-26  1.410060e-24        True   ENSMUSG00000074797          Itpa
    ## 519   3.841775e-39  1.289093e-37        True   ENSMUSG00000033952          Aspm
    ## 520   1.868249e-35  5.338044e-34        True   ENSMUSG00000028902         Sf3a3
    ## 521   1.065099e-22  1.560713e-21        True   ENSMUSG00000116925          <NA>
    ## 522   1.065099e-22  1.560713e-21        True   ENSMUSG00000022718         Dgcr8
    ## 523   4.507511e-05  1.424495e-04        True   ENSMUSG00000039055          Eme1
    ## 524   9.548732e-35  2.634065e-33        True   ENSMUSG00000041632        Mrps27
    ## 525   2.344056e-03  5.617293e-03        True   ENSMUSG00000052276          Ostn
    ## 526   2.349890e-17  2.393651e-16        True   ENSMUSG00000046223         Plaur
    ## 527   1.202784e-09  6.397226e-09        True   ENSMUSG00000069302        H2ac12
    ## 528   3.155362e-05  1.019778e-04        True   ENSMUSG00000030551         Nr2f2
    ## 529   9.081979e-10  4.889025e-09        True   ENSMUSG00000019039        Dalrd3
    ## 530   7.165647e-10  3.906134e-09        True   ENSMUSG00000027959         Sass6
    ## 531   7.533900e-21  9.936535e-20        True   ENSMUSG00000030942       Thumpd1
    ## 532   6.985051e-65  5.692104e-63        True   ENSMUSG00000029777          Gars
    ## 533   4.389482e-41  1.634238e-39        True   ENSMUSG00000025967        Eef1b2
    ## 534   6.790598e-08  3.045758e-07        True   ENSMUSG00000045273         Cenph
    ## 535   7.588460e-28  1.518833e-26        True   ENSMUSG00000022678          Nde1
    ## 536   1.471612e-34  3.997379e-33        True   ENSMUSG00000052906         Ubxn8
    ## 537   8.310785e-06  2.919927e-05        True   ENSMUSG00000032221          Mns1
    ## 538   2.201344e-26  4.055348e-25        True   ENSMUSG00000004268          Emg1
    ## 539   5.868768e-03  1.293088e-02        True   ENSMUSG00000067215         Usp51
    ## 540   2.096012e-20  2.667530e-19        True   ENSMUSG00000008690        Ncaph2
    ## 541   9.191779e-13  6.545301e-12        True   ENSMUSG00000024797         Vps51
    ## 542   9.006386e-36  2.634615e-34        True   ENSMUSG00000020074         Ccar1
    ## 543   2.528619e-31  6.073248e-30        True   ENSMUSG00000030603         Psmc4
    ## 544   2.595305e-13  1.948858e-12        True   ENSMUSG00000035683          Melk
    ## 545   9.052245e-11  5.345008e-10        True   ENSMUSG00000031107         Rbmx2
    ## 546   8.477679e-12  5.513253e-11        True   ENSMUSG00000025574           Tk1
    ## 547   2.897122e-21  3.895020e-20        True   ENSMUSG00000028455        Stoml2
    ## 548   4.153809e-13  3.053135e-12        True   ENSMUSG00000025395         Prim1
    ## 549   3.656279e-17  3.686748e-16        True   ENSMUSG00000047649        Cd3eap
    ## 550   1.165344e-14  9.648974e-14        True   ENSMUSG00000075705         Msrb1
    ## 551   2.832178e-39  9.624584e-38        True   ENSMUSG00000021701          Plk2
    ## 552   4.683512e-11  2.839979e-10        True   ENSMUSG00000021951     Eef1akmt1
    ## 553   3.466282e-26  6.312823e-25        True   ENSMUSG00000040464       Gtpbp10
    ## 554   1.205097e-15  1.071704e-14        True   ENSMUSG00000019139        Isyna1
    ## 555   3.534743e-09  1.803159e-08        True   ENSMUSG00000068614         Actc1
    ## 556   3.182076e-35  8.979525e-34        True   ENSMUSG00000030079        Ruvbl1
    ## 557   1.983800e-48  9.601593e-47        True   ENSMUSG00000072235        Tuba1a
    ## 558   3.251183e-13  2.411886e-12        True   ENSMUSG00000049922       Slc35c1
    ## 559   3.308005e-16  3.097037e-15        True   ENSMUSG00000037795         N4bp2
    ## 560   3.503692e-73  3.940913e-71        True   ENSMUSG00000041168         Lonp1
    ## 561   1.115227e-02  2.310898e-02        True   ENSMUSG00000038037         Socs1
    ## 562   3.022073e-16  2.831000e-15        True   ENSMUSG00000025912         Mybl1
    ## 563   1.304950e-20  1.691774e-19        True   ENSMUSG00000048351          Coa7
    ## 564   1.270802e-32  3.151748e-31        True   ENSMUSG00000031754        Nudt21
    ## 565   9.571303e-21  1.254084e-19        True   ENSMUSG00000002658        Gtf2f1
    ## 566   2.123209e-15  1.855137e-14        True   ENSMUSG00000021079         Timm9
    ## 567   5.934324e-06  2.124227e-05        True   ENSMUSG00000037474           Dtl
    ## 568   1.399049e-07  6.063939e-07        True   ENSMUSG00000040269        Mrps28
    ## 569   2.290988e-45  9.970478e-44        True   ENSMUSG00000029686          Cul1
    ## 570   7.486332e-34  1.969880e-32        True   ENSMUSG00000090553         Snrpe
    ## 571   8.107036e-38  2.579394e-36        True   ENSMUSG00000033124         Atg9a
    ## 572   9.651189e-28  1.914892e-26        True   ENSMUSG00000032342          Mto1
    ## 573   2.842453e-29  6.013201e-28        True   ENSMUSG00000038683       Pak1ip1
    ## 574   1.072511e-50  5.672235e-49        True   ENSMUSG00000026377          Nifk
    ## 575   5.913002e-46  2.630709e-44        True   ENSMUSG00000021037         Ahsa1
    ## 576   3.489242e-18  3.793749e-17        True   ENSMUSG00000035754         Wdr18
    ## 577   3.206241e-14  2.572078e-13        True   ENSMUSG00000060121        Gemin2
    ## 578   1.083695e-48  5.342213e-47        True   ENSMUSG00000032902       Slc16a1
    ## 579   4.024485e-51  2.149802e-49        True   ENSMUSG00000040010        Slc7a5
    ## 580   1.442615e-10  8.375661e-10        True   ENSMUSG00000047757         Fancb
    ## 581   5.313683e-19  6.176867e-18        True   ENSMUSG00000024613         Tcof1
    ## 582   1.875849e-31  4.532687e-30        True   ENSMUSG00000002733       Plekha3
    ## 583   3.197959e-27  6.139158e-26        True   ENSMUSG00000060098         Prmt7
    ## 584   3.975678e-10  2.221040e-09        True   ENSMUSG00000020974         Pole2
    ## 585   3.975678e-10  2.221040e-09        True   ENSMUSG00000113786          <NA>
    ## 586   8.086437e-17  7.914005e-16        True   ENSMUSG00000050410         Tcf19
    ## 587   8.984230e-19  1.024241e-17        True   ENSMUSG00000026999         Nup35
    ## 588   8.106016e-22  1.131725e-20        True   ENSMUSG00000030983         Bccip
    ## 589   1.318975e-65  1.114638e-63        True   ENSMUSG00000030662          Ipo5
    ## 590   2.735774e-14  2.211325e-13        True   ENSMUSG00000002984        Tomm40
    ## 591   1.629302e-16  1.554553e-15        True   ENSMUSG00000025154      Arhgap19
    ## 592   7.960339e-41  2.889603e-39        True   ENSMUSG00000028851          Nudc
    ## 593   5.312841e-28  1.071423e-26        True   ENSMUSG00000025962       Fastkd2
    ## 594   1.439538e-24  2.407572e-23        True   ENSMUSG00000064068          Mtx1
    ## 595   7.988963e-20  9.770269e-19        True   ENSMUSG00000031146          Plp2
    ## 596   7.988963e-20  9.770269e-19        True   ENSMUSG00000057762        Gm6169
    ## 597   8.795922e-23  1.298415e-21        True   ENSMUSG00000029617          Ccz1
    ## 598   3.996720e-03  9.153371e-03        True   ENSMUSG00000032968          Inha
    ## 599   1.687022e-18  1.879018e-17        True   ENSMUSG00000064037          Gpn1
    ## 600   3.896771e-21  5.199601e-20        True   ENSMUSG00000044783 A730008H23Rik
    ## 601   3.183472e-15  2.748455e-14        True   ENSMUSG00000047407         Tgif1
    ## 602   1.707823e-55  1.041120e-53        True   ENSMUSG00000024359         Hspa9
    ## 603   7.753175e-19  8.902495e-18        True   ENSMUSG00000027242         Wdr76
    ## 604   5.767468e-23  8.641463e-22        True   ENSMUSG00000025190          Got1
    ## 605   2.541703e-08  1.198231e-07        True   ENSMUSG00000061024          Rrs1
    ## 606   1.445750e-15  1.279309e-14        True   ENSMUSG00000016984         Etaa1
    ## 607   2.675294e-23  4.092893e-22        True   ENSMUSG00000041506          Rrp9
    ## 608   1.281566e-11  8.207369e-11        True   ENSMUSG00000027811 4930579G24Rik
    ## 609   6.756242e-14  5.321040e-13        True   ENSMUSG00000024645        Timm21
    ## 610   1.227645e-18  1.386701e-17        True   ENSMUSG00000029607       Ankrd61
    ## 611   6.639776e-22  9.335431e-21        True   ENSMUSG00000024165          Jpt2
    ## 612   7.756010e-65  6.288273e-63        True   ENSMUSG00000039630        Hnrnpu
    ## 613   1.984318e-07  8.431373e-07        True   ENSMUSG00000040234        Tm7sf3
    ## 614   2.067852e-36  6.231648e-35        True   ENSMUSG00000028741         Mrto4
    ## 615   3.217875e-20  4.043737e-19        True   ENSMUSG00000052798        Nup107
    ## 616   6.960778e-15  5.854531e-14        True   ENSMUSG00000078154       Gm12184
    ## 617   6.960778e-15  5.854531e-14        True   ENSMUSG00000029394       Cdk2ap1
    ## 618   2.651538e-05  8.664150e-05        True   ENSMUSG00000060275          Nrg2
    ## 619   2.150365e-04  6.154029e-04        True   ENSMUSG00000022354        Ndufb9
    ## 620   4.418606e-15  3.765954e-14        True   ENSMUSG00000022106        Rcbtb2
    ## 621   8.513834e-23  1.257937e-21        True   ENSMUSG00000024926          Kat5
    ## 622   9.530987e-28  1.895753e-26        True   ENSMUSG00000000399        Ndufa9
    ## 623   1.000368e-30  2.322367e-29        True   ENSMUSG00000022551          Cyc1
    ## 624   6.748488e-19  7.771222e-18        True   ENSMUSG00000037772        Mrpl23
    ## 625   6.942816e-12  4.561524e-11        True   ENSMUSG00000035356        Nfkbiz
    ## 626   9.243729e-13  6.579360e-12        True   ENSMUSG00000041718         Alg13
    ## 627   9.243729e-13  6.579360e-12        True   ENSMUSG00000031286       Glt28d2
    ## 628   8.563693e-22  1.192496e-20        True   ENSMUSG00000003779        Kif20a
    ## 629   2.452565e-03  5.855362e-03        True   ENSMUSG00000113640         Adat3
    ## 630   2.452565e-03  5.855362e-03        True   ENSMUSG00000035370          <NA>
    ## 631   9.821838e-33  2.458846e-31        True   ENSMUSG00000010608         Rbm25
    ## 632   3.650523e-24  5.925422e-23        True   ENSMUSG00000026254        Eif4e2
    ## 633   9.839036e-13  6.981301e-12        True   ENSMUSG00000023883         Phf10
    ## 634   5.823383e-18  6.171685e-17        True   ENSMUSG00000035310          <NA>
    ## 635   2.021387e-36  6.103137e-35        True   ENSMUSG00000028703        Lrrc41
    ## 636   2.142686e-46  9.750138e-45        True   ENSMUSG00000015176         Nolc1
    ## 637   1.186811e-06  4.628999e-06        True   ENSMUSG00000031669         Gins3
    ## 638   2.279245e-24  3.753000e-23        True   ENSMUSG00000029056         Pank4
    ## 639   2.288948e-11  1.437645e-10        True   ENSMUSG00000014074        Rnf168
    ## 640   2.156499e-08  1.022065e-07        True   ENSMUSG00000019923         Zwint
    ## 641   1.788802e-33  4.638109e-32        True   ENSMUSG00000014226        Cacybp
    ## 642   3.539070e-18  3.845308e-17        True   ENSMUSG00000027852          Nras
    ## 643   5.161719e-29  1.083351e-27        True   ENSMUSG00000031029         Eif3f
    ## 644   9.495230e-05  2.870133e-04        True   ENSMUSG00000049287         Iba57
    ## 645   3.726221e-54  2.172087e-52        True   ENSMUSG00000008682         Rpl10
    ## 646   2.225023e-21  3.024517e-20        True   ENSMUSG00000047719        Ubiad1
    ## 647   2.399940e-11  1.504389e-10        True   ENSMUSG00000008373        Prpf31
    ## 648   5.290074e-11  3.189966e-10        True   ENSMUSG00000022070          Bora
    ## 649   1.773383e-06  6.772950e-06        True   ENSMUSG00000024273 2700062C07Rik
    ## 650   1.026678e-13  7.979609e-13        True   ENSMUSG00000030612        Mrpl46
    ## 651   6.985738e-30  1.532640e-28        True   ENSMUSG00000001285          Myg1
    ## 652   7.688215e-06  2.708938e-05        True   ENSMUSG00000020364       Zfp354a
    ## 653   3.095305e-21  4.147501e-20        True   ENSMUSG00000021811        Dnajc9
    ## 654   1.776957e-42  6.990530e-41        True   ENSMUSG00000021500         Ddx46
    ## 655   6.915943e-33  1.745047e-31        True   ENSMUSG00000024097         Srsf7
    ## 656   4.174308e-12  2.802524e-11        True   ENSMUSG00000036672         Cenpt
    ## 657   2.618518e-31  6.279726e-30        True   ENSMUSG00000006333          Rps9
    ## 658   6.225880e-20  7.666905e-19        True   ENSMUSG00000032727         Mier3
    ## 659   2.744751e-24  4.496325e-23        True   ENSMUSG00000041147         Brca2
    ## 660   1.316217e-28  2.716100e-27        True   ENSMUSG00000003848          Nob1
    ## 661   2.759935e-03  6.526753e-03        True   ENSMUSG00000099189          <NA>
    ## 662   1.044624e-30  2.421586e-29        True   ENSMUSG00000032834          Pwp2
    ## 663   3.693828e-16  3.428112e-15        True   ENSMUSG00000025872         Thoc3
    ## 664   1.051423e-15  9.408025e-15        True   ENSMUSG00000021747      Cfap20dc
    ## 665   2.249242e-08  1.064441e-07        True   ENSMUSG00000041064          Pif1
    ## 666   5.384883e-07  2.184036e-06        True   ENSMUSG00000031381          Piga
    ## 667   2.656480e-23  4.068006e-22        True   ENSMUSG00000067148        Polr1c
    ## 668   5.279635e-58  3.499018e-56        True   ENSMUSG00000025980         Hspd1
    ## 669   3.976031e-33  1.014460e-31        True   ENSMUSG00000026526           Fh1
    ## 670   8.944792e-12  5.805210e-11        True   ENSMUSG00000031697          Orc6
    ## 671   2.765623e-39  9.418449e-38        True   ENSMUSG00000025580        Eif4a3
    ## 672   2.765623e-39  9.418449e-38        True   ENSMUSG00000094973      Eif4a3l1
    ## 673   2.765623e-39  9.418449e-38        True   ENSMUSG00000107906      Eif4a3l2
    ## 674   1.124649e-18  1.273061e-17        True   ENSMUSG00000020289         Nprl3
    ## 675   5.091835e-24  8.181770e-23        True   ENSMUSG00000024045         Akap8
    ## 676   3.174009e-05  1.025390e-04        True   ENSMUSG00000053746         Ptrh1
    ## 677   3.661601e-23  5.559229e-22        True   ENSMUSG00000004096         Cwc15
    ## 678   2.947316e-07  1.228779e-06        True   ENSMUSG00000041921       Metap1d
    ## 679   2.642812e-39  9.038757e-38        True   ENSMUSG00000026739          Bmi1
    ## 680   2.735406e-14  2.211325e-13        True   ENSMUSG00000025925         Terf1
    ## 681   5.502032e-18  5.854661e-17        True   ENSMUSG00000022013       Dnajc15
    ## 682   6.571524e-06  2.337648e-05        True   ENSMUSG00000030641         Ddias
    ## 683   2.087775e-05  6.929747e-05        True   ENSMUSG00000014791         Elmo3
    ## 684   2.434524e-45  1.056636e-43        True   ENSMUSG00000109324         Prmt1
    ## 685   2.375321e-16  2.242236e-15        True   ENSMUSG00000026662        Sephs1
    ## 686   3.339667e-40  1.187999e-38        True   ENSMUSG00000027067         Ssrp1
    ## 687   2.587895e-30  5.904837e-29        True   ENSMUSG00000094125       Gm13698
    ## 688   2.587895e-30  5.904837e-29        True   ENSMUSG00000096729       Gm13695
    ## 689   2.587895e-30  5.904837e-29        True   ENSMUSG00000096337       Gm13694
    ## 690   2.587895e-30  5.904837e-29        True   ENSMUSG00000095824       Gm13697
    ## 691   2.587895e-30  5.904837e-29        True   ENSMUSG00000094336       Gm13693
    ## 692   2.587895e-30  5.904837e-29        True   ENSMUSG00000079247       Gm13691
    ## 693   2.587895e-30  5.904837e-29        True   ENSMUSG00000096484       Gm13696
    ## 694   2.587895e-30  5.904837e-29        True   ENSMUSG00000027014         Cwc22
    ## 695   6.755719e-21  8.939714e-20        True   ENSMUSG00000046756         Mrps7
    ## 696   3.192478e-14  2.563613e-13        True   ENSMUSG00000078440          Dohh
    ## 697   2.770838e-30  6.286339e-29        True   ENSMUSG00000022721        Trmt2a
    ## 698   4.608050e-28  9.304649e-27        True   ENSMUSG00000000827       Tpd52l2
    ## 699   2.934269e-14  2.363396e-13        True   ENSMUSG00000002835        Chaf1a
    ## 700   2.065253e-13  1.570025e-12        True   ENSMUSG00000014873         Surf2
    ## 701   5.735001e-08  2.593416e-07        True   ENSMUSG00000020387         Jade2
    ## 702   3.598093e-33  9.194999e-32        True   ENSMUSG00000026750         Psmb7
    ## 703   4.253678e-30  9.502062e-29        True   ENSMUSG00000024095       Hnrnpll
    ## 704   5.866895e-20  7.230405e-19        True   ENSMUSG00000028718          Stil
    ## 705   6.594720e-23  9.816484e-22        True   ENSMUSG00000020038          Cry1
    ## 706   2.951370e-11  1.828522e-10        True   ENSMUSG00000074221        Zfp568
    ## 707   3.106480e-19  3.672591e-18        True   ENSMUSG00000029022          Miip
    ## 708   6.750533e-03  1.468330e-02        True   ENSMUSG00000050107        Haspin
    ## 709   2.410439e-09  1.246747e-08        True   ENSMUSG00000030417         Pdcd5
    ## 710   2.835137e-06  1.055051e-05        True   ENSMUSG00000031629         Cenpu
    ## 711   2.589474e-27  5.007153e-26        True   ENSMUSG00000027935         Rab13
    ## 712   2.309704e-23  3.547172e-22        True   ENSMUSG00000029376       Mthfd2l
    ## 713   4.920875e-12  3.288545e-11        True   ENSMUSG00000024217         Snrpc
    ## 714   3.413855e-11  2.096351e-10        True   ENSMUSG00000005150         Wdr83
    ## 715   8.957532e-19  1.022657e-17        True   ENSMUSG00000021266          Wars
    ## 716   4.534020e-34  1.208971e-32        True   ENSMUSG00000027613          Eif6
    ## 717   1.559187e-20  2.013205e-19        True   ENSMUSG00000020773        Trim47
    ## 718   4.643433e-22  6.586582e-21        True   ENSMUSG00000091405         H4c14
    ## 719   1.344624e-35  3.890640e-34        True   ENSMUSG00000026915         Strbp
    ## 720   7.716422e-44  3.192920e-42        True   ENSMUSG00000062203         Gspt1
    ## 721   4.301131e-16  3.973260e-15        True   ENSMUSG00000026946           Nmi
    ## 722   8.577543e-19  9.799750e-18        True   ENSMUSG00000026546        Cfap45
    ## 723   3.031566e-45  1.312200e-43        True   ENSMUSG00000013629           Cad
    ## 724   4.865067e-24  7.833151e-23        True   ENSMUSG00000005370          Msh6
    ## 725   3.745519e-24  6.061138e-23        True   ENSMUSG00000020464         Pnpt1
    ## 726   7.118283e-03  1.541812e-02        True   ENSMUSG00000034755       Pcdh11x
    ## 727   6.016414e-29  1.256133e-27        True   ENSMUSG00000095365        Rbm31y
    ## 728   7.318990e-07  2.926863e-06        True   ENSMUSG00000030271          Ogg1
    ## 729   1.111710e-43  4.576347e-42        True   ENSMUSG00000025225         Nfkb2
    ## 730   4.034934e-17  4.043035e-16        True   ENSMUSG00000028911         Srsf4
    ## 731   3.838150e-13  2.836786e-12        True   ENSMUSG00000035171 1110059E24Rik
    ## 732   9.716811e-27  1.830152e-25        True   ENSMUSG00000071359         Tbpl1
    ## 733   2.144807e-49  1.073883e-47        True   ENSMUSG00000029447         Cct6a
    ## 734   5.480025e-41  2.016750e-39        True   ENSMUSG00000005846        Rsl1d1
    ## 735   3.588496e-16  3.338116e-15        True   ENSMUSG00000022748         Cmss1
    ## 736   2.594726e-09  1.336870e-08        True   ENSMUSG00000048581 E130311K13Rik
    ## 737   5.982345e-30  1.317931e-28        True   ENSMUSG00000022814          Umps
    ## 738   1.019475e-04  3.065336e-04        True   ENSMUSG00000052760 A630001G21Rik
    ## 739   2.147285e-06  8.092598e-06        True   ENSMUSG00000042854      Trp53rkb
    ## 740   2.147285e-06  8.092598e-06        True   ENSMUSG00000039725      Trp53rka
    ## 741   2.172748e-10  1.242504e-09        True   ENSMUSG00000003423        Pih1d1
    ## 742   3.962828e-17  3.973276e-16        True   ENSMUSG00000029726         Mepce
    ## 743   5.250274e-21  6.976488e-20        True   ENSMUSG00000070044       Fam149a
    ## 744   1.118884e-04  3.347848e-04        True   ENSMUSG00000028438         Kif24
    ## 745   3.522538e-15  3.023212e-14        True   ENSMUSG00000006315       Tmem147
    ## 746   2.576523e-13  1.936576e-12        True   ENSMUSG00000028245         Nsmaf
    ## 747   3.346849e-04  9.266056e-04        True   ENSMUSG00000020921       Tmem101
    ## 748   2.076122e-05  6.895366e-05        True   ENSMUSG00000032026         Rexo2
    ## 749   3.663981e-24  5.941229e-23        True   ENSMUSG00000071708           Sms
    ## 750   8.574768e-05  2.608193e-04        True   ENSMUSG00000099481         Xndc1
    ## 751   6.696456e-07  2.690712e-06        True   ENSMUSG00000026283          Ing5
    ## 752   2.558913e-03  6.091053e-03        True   ENSMUSG00000094595          Fsbp
    ## 753   1.881310e-16  1.786462e-15        True   ENSMUSG00000061607          Mdc1
    ## 754   4.277143e-12  2.867948e-11        True   ENSMUSG00000033751    Gadd45gip1
    ## 755   1.158058e-16  1.118966e-15        True   ENSMUSG00000031590          Frg1
    ## 756   1.950649e-05  6.502977e-05        True   ENSMUSG00000025732        Mcrip2
    ## 757   2.645886e-34  7.138530e-33        True   ENSMUSG00000033885           Pxk
    ## 758   1.149505e-17  1.192201e-16        True   ENSMUSG00000002728         Naa20
    ## 759   8.478261e-10  4.581014e-09        True   ENSMUSG00000022503         Nubp1
    ## 760   7.757112e-37  2.396452e-35        True   ENSMUSG00000023150      Ivns1abp
    ## 761   3.145924e-03  7.365391e-03        True   ENSMUSG00000071537         Klrg2
    ## 762   4.191517e-13  3.076605e-12        True   ENSMUSG00000058503       Fam133b
    ## 763   1.295654e-20  1.681088e-19        True   ENSMUSG00000038510          Rpf2
    ## 764   2.341297e-24  3.851204e-23        True   ENSMUSG00000029701         Rbm28
    ## 765   4.543211e-52  2.510871e-50        True   ENSMUSG00000032803          Cdv3
    ## 766   8.227983e-19  9.426233e-18        True   ENSMUSG00000029687          Ezh2
    ## 767   3.828176e-26  6.948139e-25        True   ENSMUSG00000027940          Tpm3
    ## 768   2.893935e-03  6.816388e-03        True   ENSMUSG00000020493         Prr11
    ## 769   4.602936e-28  9.304649e-27        True   ENSMUSG00000035337         Uchl4
    ## 770   4.602936e-28  9.304649e-27        True   ENSMUSG00000022111         Uchl3
    ## 771   1.708910e-02  3.382244e-02        True   ENSMUSG00000034203        Chchd4
    ## 772   4.530642e-15  3.857325e-14        True   ENSMUSG00000063800       Prpf38a
    ## 773   1.279143e-36  3.891518e-35        True   ENSMUSG00000029762        Akr1b8
    ## 774   7.272325e-21  9.599469e-20        True   ENSMUSG00000034263        Ints14
    ## 775   1.120722e-34  3.070354e-33        True   ENSMUSG00000038845           Phb
    ## 776   1.261739e-24  2.116858e-23        True   ENSMUSG00000025209          Twnk
    ## 777   1.779648e-09  9.313414e-09        True   ENSMUSG00000062397        Zfp706
    ## 778   4.573716e-26  8.263732e-25        True   ENSMUSG00000021326        Trim27
    ## 779   4.197089e-12  2.816634e-11        True   ENSMUSG00000031671         Setd6
    ## 780   1.076110e-14  8.928635e-14        True   ENSMUSG00000034206          Polq
    ## 781   5.622529e-10  3.092391e-09        True   ENSMUSG00000021773        Comtd1
    ## 782   1.255982e-36  3.828349e-35        True   ENSMUSG00000031918         Mtmr2
    ## 783   1.709517e-35  4.902049e-34        True   ENSMUSG00000045328         Cenpe
    ## 784   5.873811e-26  1.056492e-24        True   ENSMUSG00000031862       Atp13a1
    ## 785   3.074159e-11  1.900908e-10        True   ENSMUSG00000062729          Ppox
    ## 786   5.908465e-23  8.844424e-22        True   ENSMUSG00000039615         Stub1
    ## 787   1.003207e-12  7.115107e-12        True   ENSMUSG00000021111        Papola
    ## 788   1.398978e-07  6.063939e-07        True   ENSMUSG00000044949         Ubtd2
    ## 789   7.977229e-21  1.049525e-19        True   ENSMUSG00000028114       Mettl14
    ## 790   5.617825e-05  1.748741e-04        True   ENSMUSG00000030725         Lipt2
    ## 791   8.225675e-09  4.052451e-08        True   ENSMUSG00000031843      Mphosph6
    ## 792   3.556039e-34  9.529706e-33        True   ENSMUSG00000022185         Acin1
    ## 793   1.302081e-41  4.951627e-40        True   ENSMUSG00000067150          Xpo5
    ## 794   2.448600e-02  4.640921e-02        True   ENSMUSG00000009927         Rps25
    ## 795   3.737602e-40  1.323658e-38        True   ENSMUSG00000029659         Medag
    ## 796   1.039183e-04  3.121654e-04        True   ENSMUSG00000085793         Lin52
    ## 797   4.045084e-10  2.259024e-09        True   ENSMUSG00000020248          Nfyb
    ## 798   1.189437e-10  6.956314e-10        True   ENSMUSG00000000838          Fmr1
    ## 799   2.349493e-29  5.010161e-28        True   ENSMUSG00000027404         Snrpb
    ## 800   2.160849e-20  2.743488e-19        True   ENSMUSG00000030374         Strn4
    ## 801   9.737345e-04  2.503805e-03        True   ENSMUSG00000055184        Fam72a
    ## 802   4.407759e-23  6.660429e-22        True   ENSMUSG00000029507          Pus1
    ## 803   7.415650e-34  1.954501e-32        True   ENSMUSG00000022360         Atad2
    ## 804   2.498872e-04  7.062817e-04        True   ENSMUSG00000021282          Eif5
    ## 805   9.491865e-43  3.780650e-41        True   ENSMUSG00000003429         Rps11
    ## 806   5.749606e-03  1.268758e-02        True   ENSMUSG00000042225       Ammecr1
    ## 807   2.239578e-13  1.697700e-12        True   ENSMUSG00000061589         Dot1l
    ## 808   6.033896e-49  3.002286e-47        True   ENSMUSG00000001416          Cct3
    ## 809   2.752476e-16  2.586032e-15        True   ENSMUSG00000042729         Wdr74
    ## 810   1.615836e-07  6.933941e-07        True   ENSMUSG00000032511         Scn5a
    ## 811   1.313866e-15  1.165190e-14        True   ENSMUSG00000063952         Brpf3
    ## 812   5.065389e-16  4.649678e-15        True   ENSMUSG00000020437         Myo1g
    ## 813   8.147657e-16  7.356381e-15        True   ENSMUSG00000039354      Smarcal1
    ## 814   6.615252e-15  5.572722e-14        True   ENSMUSG00000075528        Aarsd1
    ## 815   6.615252e-15  5.572722e-14        True   ENSMUSG00000097239          <NA>
    ## 816   5.172294e-15  4.391912e-14        True   ENSMUSG00000039660        Spout1
    ## 817   5.803600e-04  1.542091e-03        True   ENSMUSG00000030493        Faap24
    ## 818   3.691480e-15  3.164805e-14        True   ENSMUSG00000033294         Noc4l
    ## 819   3.184038e-33  8.162993e-32        True   ENSMUSG00000008604        Ubqln4
    ## 820   2.110847e-33  5.437815e-32        True   ENSMUSG00000035960         Apex1
    ## 821   1.436688e-38  4.702208e-37        True   ENSMUSG00000021048        Mthfd1
    ## 822   4.269299e-09  2.155841e-08        True   ENSMUSG00000031295         Phka2
    ## 823   1.771233e-50  9.245143e-49        True   ENSMUSG00000050244        Heatr1
    ## 824   1.692872e-37  5.364794e-36        True   ENSMUSG00000031320         Rps4x
    ## 825   1.723034e-04  5.018289e-04        True   ENSMUSG00000030008        Pradc1
    ## 826   3.201091e-18  3.485196e-17        True   ENSMUSG00000040263        Klhdc4
    ## 827   4.897452e-20  6.063729e-19        True   ENSMUSG00000033257         Ttll4
    ## 828   1.236295e-15  1.098226e-14        True   ENSMUSG00000074997       Pin1rt1
    ## 829   1.236295e-15  1.098226e-14        True   ENSMUSG00000032171          Pin1
    ## 830   1.018486e-45  4.469028e-44        True   ENSMUSG00000026020         Nop58
    ## 831   8.036618e-05  2.455258e-04        True   ENSMUSG00000063522          Ly6m
    ## 832   7.645836e-06  2.694600e-05        True   ENSMUSG00000023170          Gps2
    ## 833   5.875200e-07  2.373860e-06        True   ENSMUSG00000002308         Cd320
    ## 834   1.396385e-02  2.818889e-02        True   ENSMUSG00000044254         Pcsk9
    ## 835   1.324392e-16  1.272755e-15        True   ENSMUSG00000041319         Thoc6
    ## 836   1.119052e-05  3.862035e-05        True   ENSMUSG00000020704         Asic2
    ## 837   3.218057e-14  2.580262e-13        True   ENSMUSG00000060798          Intu
    ## 838   1.933467e-15  1.695845e-14        True   ENSMUSG00000053801         Grwd1
    ## 839   2.435191e-18  2.680556e-17        True   ENSMUSG00000029145        Eif2b4
    ## 840   1.027897e-09  5.512953e-09        True   ENSMUSG00000027132       Katnbl1
    ## 841   2.001563e-09  1.041674e-08        True   ENSMUSG00000045969          Ing1
    ## 842   2.342491e-13  1.772348e-12        True   ENSMUSG00000066233        Tmem42
    ## 843   1.925420e-02  3.753089e-02        True   ENSMUSG00000015120         Ube2i
    ## 844   1.336412e-16  1.283534e-15        True   ENSMUSG00000020918         Kat2a
    ## 845   9.107412e-03  1.926925e-02        True   ENSMUSG00000042323         Pbrm1
    ## 846   7.261395e-17  7.141564e-16        True   ENSMUSG00000063480         Snu13
    ## 847   3.147412e-24  5.129638e-23        True   ENSMUSG00000022556          Hsf1
    ## 848   3.301499e-07  1.369651e-06        True   ENSMUSG00000028322        Exosc3
    ## 849   3.685572e-10  2.065472e-09        True   ENSMUSG00000029559 2210016L21Rik
    ## 850   5.887193e-17  5.818704e-16        True   ENSMUSG00000044702         Palb2
    ## 851   7.579045e-13  5.440562e-12        True   ENSMUSG00000028085          Gatb
    ## 852   2.787179e-09  1.430030e-08        True   ENSMUSG00000027284         Cdan1
    ## 853   1.953938e-15  1.712859e-14        True   ENSMUSG00000028651          Ppie
    ## 854   8.564039e-13  6.111923e-12        True   ENSMUSG00000078184          <NA>
    ## 855   8.564039e-13  6.111923e-12        True   ENSMUSG00000038374         Rbm8a
    ## 856   1.874434e-39  6.452254e-38        True   ENSMUSG00000038279          Nop2
    ## 857   7.919658e-11  4.698840e-10        True   ENSMUSG00000028861        Mrps15
    ## 858   6.141770e-38  1.961927e-36        True   ENSMUSG00000005667        Mthfd2
    ## 859   3.707668e-04  1.018206e-03        True   ENSMUSG00000021391         Cenpp
    ## 860   2.113878e-24  3.491506e-23        True   ENSMUSG00000038482         Tfdp1
    ## 861   2.213408e-09  1.148929e-08        True   ENSMUSG00000033809          Alg3
    ## 862   3.207153e-10  1.808141e-09        True   ENSMUSG00000036376          Abt1
    ## 863   4.041754e-17  4.047329e-16        True   ENSMUSG00000024732        Ccdc86
    ## 864   2.287788e-02  4.374018e-02        True   ENSMUSG00000003379         Cd79a
    ## 865   9.940441e-28  1.967394e-26        True   ENSMUSG00000028932         Psmc2
    ## 866   1.452185e-19  1.749192e-18        True   ENSMUSG00000020022       Ndufa12
    ## 867   1.836354e-09  9.595465e-09        True   ENSMUSG00000075704        Txnrd2
    ## 868   1.342133e-15  1.189598e-14        True   ENSMUSG00000031928        Mre11a
    ## 869   9.471894e-29  1.964741e-27        True   ENSMUSG00000032212          Sltm
    ## 870   4.372870e-09  2.206048e-08        True   ENSMUSG00000059323         Tonsl
    ## 871   2.495505e-19  2.970060e-18        True   ENSMUSG00000020994           Pnn
    ## 872   5.955494e-23  8.906475e-22        True   ENSMUSG00000020235          Fzr1
    ## 873   8.800073e-18  9.216706e-17        True   ENSMUSG00000057388        Mrpl18
    ## 874   9.102637e-41  3.296765e-39        True   ENSMUSG00000031948          Kars
    ## 875   1.992905e-19  2.384321e-18        True   ENSMUSG00000018293          Pfn1
    ## 876   6.468432e-29  1.346986e-27        True   ENSMUSG00000095567         Noc2l
    ## 877   9.426349e-16  8.467809e-15        True   ENSMUSG00000094443         Sgo2b
    ## 878   9.426349e-16  8.467809e-15        True   ENSMUSG00000026039         Sgo2a
    ## 879   9.275379e-12  6.005122e-11        True   ENSMUSG00000020018         Snrpf
    ## 880   9.472258e-13  6.727030e-12        True   ENSMUSG00000006715          Gmnn
    ## 881   3.079754e-11  1.903631e-10        True   ENSMUSG00000025265          Fgd1
    ## 882   4.808674e-22  6.814920e-21        True   ENSMUSG00000054079         Utp18
    ## 883   2.433277e-14  1.975816e-13        True   ENSMUSG00000035704          Alg8
    ## 884   4.335515e-33  1.104415e-31        True   ENSMUSG00000028953         Abcf2
    ## 885   1.054303e-18  1.196826e-17        True   ENSMUSG00000002808         Epdr1
    ## 886   2.414326e-05  7.942659e-05        True   ENSMUSG00000024883          Rin1
    ## 887   3.792305e-03  8.707691e-03        True   ENSMUSG00000025226        Fbxl15
    ## 888   1.074388e-09  5.739173e-09        True   ENSMUSG00000021143         Pacs2
    ## 889   2.306722e-05  7.612183e-05        True   ENSMUSG00000028010          Gar1
    ## 890   1.424084e-03  3.548989e-03        True   ENSMUSG00000024799        Tm7sf2
    ## 891   2.719186e-08  1.277002e-07        True   ENSMUSG00000037913       Tmem156
    ## 892   1.851723e-07  7.886860e-07        True   ENSMUSG00000008305          Tle1
    ## 893   2.754351e-20  3.472178e-19        True   ENSMUSG00000056612      Ppp1r14b
    ## 894   2.754351e-20  3.472178e-19        True   ENSMUSG00000073730     Ppp1r14bl
    ## 895   5.941336e-06  2.125845e-05        True   ENSMUSG00000015337         Endog
    ## 896   7.252717e-19  8.345850e-18        True   ENSMUSG00000056952        Tatdn2
    ## 897   1.102356e-22  1.612348e-21        True   ENSMUSG00000006641        Slc5a6
    ## 898   1.332487e-24  2.230867e-23        True   ENSMUSG00000002660          Clpp
    ## 899   1.695557e-15  1.492913e-14        True   ENSMUSG00000096049          <NA>
    ## 900   1.695557e-15  1.492913e-14        True   ENSMUSG00000093847          <NA>
    ## 901   1.695557e-15  1.492913e-14        True   ENSMUSG00000057561         Eif1a
    ## 902   1.695557e-15  1.492913e-14        True   ENSMUSG00000072905       Eif1ad3
    ## 903   1.695557e-15  1.492913e-14        True   ENSMUSG00000113971       Eif1ad4
    ## 904   1.695557e-15  1.492913e-14        True   ENSMUSG00000079034       Eif1ad8
    ## 905   1.695557e-15  1.492913e-14        True   ENSMUSG00000096619          <NA>
    ## 906   1.695557e-15  1.492913e-14        True   ENSMUSG00000079031       Eif1ad2
    ## 907   1.695557e-15  1.492913e-14        True   ENSMUSG00000113805          <NA>
    ## 908   1.695557e-15  1.492913e-14        True   ENSMUSG00000095717          <NA>
    ## 909   1.695557e-15  1.492913e-14        True   ENSMUSG00000096803      Eif1ad16
    ## 910   1.695557e-15  1.492913e-14        True   ENSMUSG00000114075          <NA>
    ## 911   1.695557e-15  1.492913e-14        True   ENSMUSG00000092019       Eif1ad6
    ## 912   1.695557e-15  1.492913e-14        True   ENSMUSG00000095799          <NA>
    ## 913   1.695557e-15  1.492913e-14        True   ENSMUSG00000113201          <NA>
    ## 914   1.695557e-15  1.492913e-14        True   ENSMUSG00000079029       Eif1ad7
    ## 915   1.695557e-15  1.492913e-14        True   ENSMUSG00000095724      Eif1ad19
    ## 916   5.769325e-16  5.268592e-15        True   ENSMUSG00000021748          Pdhb
    ## 917   2.441783e-13  1.838763e-12        True   ENSMUSG00000020107       Anapc16
    ## 918   2.764911e-25  4.794914e-24        True   ENSMUSG00000026914        Psmd14
    ## 919   1.159002e-34  3.164373e-33        True   ENSMUSG00000032178          Ilf3
    ## 920   1.711302e-02  3.386559e-02        True   ENSMUSG00000048458         Inka2
    ## 921   1.450160e-44  6.127500e-43        True   ENSMUSG00000042688         Mapk6
    ## 922   1.258558e-12  8.867089e-12        True   ENSMUSG00000028706         Nsun4
    ## 923   2.122274e-10  1.216253e-09        True   ENSMUSG00000046179          E2f8
    ## 924   5.447245e-11  3.281908e-10        True   ENSMUSG00000042178         Armc5
    ## 925   9.725768e-34  2.554934e-32        True   ENSMUSG00000030357         Fkbp4
    ## 926   1.484069e-14  1.221203e-13        True   ENSMUSG00000079737          Bfar
    ## 927   2.946640e-22  4.217180e-21        True   ENSMUSG00000039640        Mrpl12
    ## 928   3.396395e-05  1.093694e-04        True   ENSMUSG00000028458         Tesk1
    ## 929   7.304892e-03  1.579019e-02        True   ENSMUSG00000065094       Snord1a
    ## 930   1.078024e-29  2.339428e-28        True   ENSMUSG00000002147         Stat6
    ## 931   1.148448e-24  1.936960e-23        True   ENSMUSG00000001855        Nup214
    ## 932   9.579563e-25  1.620813e-23        True   ENSMUSG00000026596          Abl2
    ## 933   8.442218e-31  1.965585e-29        True   ENSMUSG00000010517          Faf1
    ## 934   1.474902e-16  1.413993e-15        True   ENSMUSG00000021972        Hmbox1
    ## 935   8.594913e-17  8.380827e-16        True   ENSMUSG00000024660        Incenp
    ## 936   2.280845e-33  5.866288e-32        True   ENSMUSG00000070319         Eif3g
    ## 937   2.757825e-10  1.561985e-09        True   ENSMUSG00000031201         Brcc3
    ## 938   1.216455e-10  7.106516e-10        True   ENSMUSG00000029625         Cpsf4
    ## 939   2.418169e-31  5.816717e-30        True   ENSMUSG00000031826         Usp10
    ## 940   3.114990e-12  2.115332e-11        True   ENSMUSG00000029234       Tmem165
    ## 941   1.961273e-09  1.021371e-08        True   ENSMUSG00000022427        Tomm22
    ## 942   5.197713e-05  1.626760e-04        True   ENSMUSG00000053192        Mllt11
    ## 943   3.152746e-11  1.945737e-10        True   ENSMUSG00000044155          Lsm8
    ## 944   8.408897e-22  1.172986e-20        True   ENSMUSG00000021501          Caml
    ## 945   2.144980e-26  3.956077e-25        True   ENSMUSG00000022858         Tra2b
    ## 946   3.670446e-10  2.057717e-09        True   ENSMUSG00000038880        Mrps34
    ## 947   3.453868e-09  1.763593e-08        True   ENSMUSG00000026281         Dtymk
    ## 948   1.099599e-15  9.817105e-15        True   ENSMUSG00000001569          Nom1
    ## 949   1.758353e-21  2.396281e-20        True   ENSMUSG00000035367          Rmi1
    ## 950   3.454394e-10  1.941365e-09        True   ENSMUSG00000029551         Psmg3
    ## 951   2.454643e-14  1.992152e-13        True   ENSMUSG00000020444          Guk1
    ## 952   2.193579e-07  9.288400e-07        True   ENSMUSG00000028089         Chd1l
    ## 953   3.558639e-03  8.232703e-03        True   ENSMUSG00000024118         Tedc2
    ## 954   2.109911e-17  2.157458e-16        True   ENSMUSG00000037993         Dhx38
    ## 955   6.393358e-38  2.038218e-36        True   ENSMUSG00000059263         Usp47
    ## 956   1.475462e-02  2.958704e-02        True   ENSMUSG00000027016       Zfp385b
    ## 957   7.043246e-33  1.774365e-31        True   ENSMUSG00000019951     Uhrf1bp1l
    ## 958   2.491220e-10  1.416006e-09        True   ENSMUSG00000023919         Cenpq
    ## 959   1.041099e-24  1.759623e-23        True   ENSMUSG00000020181          Nav3
    ## 960   1.612434e-11  1.028507e-10        True   ENSMUSG00000051557         Pusl1
    ## 961   1.471636e-02  2.952514e-02        True   ENSMUSG00000059208        Hnrnpm
    ## 962   1.519116e-16  1.454403e-15        True   ENSMUSG00000016619         Nup50
    ## 963   1.331020e-10  7.753118e-10        True   ENSMUSG00000029504         Ddx51
    ## 964   3.596653e-10  2.017529e-09        True   ENSMUSG00000024970       Spindoc
    ## 965   5.903378e-12  3.912396e-11        True   ENSMUSG00000018565          Elp5
    ## 966   8.312009e-17  8.129786e-16        True   ENSMUSG00000078789          Dph1
    ## 967   6.153301e-11  3.683678e-10        True   ENSMUSG00000023940          Sgo1
    ## 968   3.723897e-11  2.279727e-10        True   ENSMUSG00000020492          Ska2
    ## 969   8.409031e-12  5.470837e-11        True   ENSMUSG00000041220        Elovl6
    ## 970   5.315093e-16  4.864909e-15        True   ENSMUSG00000074802        Gas2l3
    ## 971   5.858027e-20  7.225050e-19        True   ENSMUSG00000028060         Khdc4
    ## 972   2.063912e-12  1.425814e-11        True   ENSMUSG00000031683          Lsm6
    ## 973   5.078078e-10  2.809986e-09        True   ENSMUSG00000030051          Aplf
    ## 974   9.886368e-17  9.581618e-16        True   ENSMUSG00000021958         Pinx1
    ## 975   7.001887e-15  5.886007e-14        True   ENSMUSG00000038535       Zfp280d
    ## 976   1.270383e-04  3.771479e-04        True   ENSMUSG00000051396        Hspa14
    ## 977   3.385099e-07  1.401420e-06        True   ENSMUSG00000044730 9930104L06Rik
    ## 978   2.220460e-03  5.340338e-03        True   ENSMUSG00000032892        Rangrf
    ## 979   8.803627e-07  3.481345e-06        True   ENSMUSG00000030752          Kdm8
    ## 980   3.156740e-10  1.781606e-09        True   ENSMUSG00000021532       Fastkd3
    ## 981   3.680701e-13  2.725459e-12        True   ENSMUSG00000052962        Mrpl35
    ## 982   2.196402e-41  8.273803e-40        True   ENSMUSG00000033732         Sf3b3
    ## 983   3.635679e-08  1.688054e-07        True   ENSMUSG00000021891        Mettl6
    ## 984   2.674350e-27  5.165020e-26        True   ENSMUSG00000021832         Psmc6
    ## 985   6.907064e-07  2.769762e-06        True   ENSMUSG00000066042         Med18
    ## 986   2.327116e-20  2.947557e-19        True   ENSMUSG00000029817         Tra2a
    ## 987   2.426898e-16  2.289570e-15        True   ENSMUSG00000025869         Nop16
    ## 988   1.773572e-30  4.075898e-29        True   ENSMUSG00000025266         Gnl3l
    ## 989   1.657842e-12  1.156290e-11        True   ENSMUSG00000022635         Zcrb1
    ## 990   6.986361e-12  4.588247e-11        True   ENSMUSG00000033918          Parl
    ## 991   1.094367e-18  1.240541e-17        True   ENSMUSG00000060860         Ube2s
    ## 992   1.094367e-18  1.240541e-17        True   ENSMUSG00000118653        Gm2296
    ## 993   3.578664e-29  7.550650e-28        True   ENSMUSG00000099913          <NA>
    ## 994   3.578664e-29  7.550650e-28        True   ENSMUSG00000026095        Asnsd1
    ## 995   4.462238e-17  4.446092e-16        True   ENSMUSG00000071369        Map3k5
    ## 996   2.331577e-20  2.950868e-19        True   ENSMUSG00000030204         Ddx47
    ## 997   4.324098e-20  5.383047e-19        True   ENSMUSG00000001100       Poldip2
    ## 998   2.438955e-13  1.837500e-12        True   ENSMUSG00000044224       Dnajc21
    ## 999   4.872110e-31  1.152850e-29        True   ENSMUSG00000026234           Ncl
    ## 1000  3.439427e-16  3.206919e-15        True   ENSMUSG00000001473         Tubb6
    ## 1001  6.154439e-30  1.352114e-28        True   ENSMUSG00000037149          Ddx1
    ## 1002  8.914487e-54  5.158775e-52        True   ENSMUSG00000015656         Hspa8
    ## 1003  2.329522e-17  2.374418e-16        True   ENSMUSG00000027189        Trim44
    ## 1004  6.872271e-36  2.036436e-34        True   ENSMUSG00000078812         Eif5a
    ## 1005  9.655602e-24  1.525413e-22        True   ENSMUSG00000015759         Cnih1
    ## 1006  1.738935e-12  1.209680e-11        True   ENSMUSG00000024989         Cep55
    ## 1007  1.872662e-07  7.969666e-07        True   ENSMUSG00000043190         Rfesd
    ## 1008  8.673232e-20  1.056666e-18        True   ENSMUSG00000031578         Mak16
    ## 1009  6.553746e-19  7.568795e-18        True   ENSMUSG00000047613 A430005L14Rik
    ## 1010  9.199771e-12  5.961004e-11        True   ENSMUSG00000025077       Dclre1a
    ## 1011  1.265212e-11  8.105886e-11        True   ENSMUSG00000018921         Pelp1
    ## 1012  1.005105e-08  4.915349e-08        True   ENSMUSG00000059363           Fxn
    ## 1013  1.959717e-06  7.426002e-06        True   ENSMUSG00000053684      BC048403
    ## 1014  1.281788e-17  1.325953e-16        True   ENSMUSG00000024846          Cst6
    ## 1015  4.985740e-04  1.342871e-03        True   ENSMUSG00000045251        Zfp688
    ## 1016  9.460610e-27  1.784001e-25        True   ENSMUSG00000026872          Zeb2
    ## 1017  7.084112e-08  3.168508e-07        True   ENSMUSG00000027160        Ccdc34
    ## 1018  4.097949e-13  3.014852e-12        True   ENSMUSG00000029208          Guf1
    ## 1019  5.466593e-12  3.633476e-11        True   ENSMUSG00000012443         Kif11
    ## 1020  2.829327e-15  2.457314e-14        True   ENSMUSG00000020349        Ppp2ca
    ## 1021  4.159481e-21  5.536270e-20        True   ENSMUSG00000066979          Bub3
    ## 1022  3.911300e-17  3.929012e-16        True   ENSMUSG00000028247          Coq3
    ## 1023  2.134167e-15  1.863691e-14        True   ENSMUSG00000030528           Blm
    ## 1024  2.880573e-15  2.496393e-14        True   ENSMUSG00000054836          Elp6
    ## 1025  4.419976e-08  2.032705e-07        True   ENSMUSG00000004996          Mri1
    ## 1026  6.286592e-05  1.945543e-04        True   ENSMUSG00000019230          Lhx9
    ## 1027  6.802922e-43  2.730057e-41        True   ENSMUSG00000001525         Tubb5
    ## 1028  9.871383e-18  1.029150e-16        True   ENSMUSG00000022204          Ngdn
    ## 1029  9.759838e-23  1.435397e-21        True   ENSMUSG00000047215          Rpl9
    ## 1030  9.759838e-23  1.435397e-21        True   ENSMUSG00000062456      Rpl9-ps6
    ## 1031  2.707517e-13  2.026451e-12        True   ENSMUSG00000008333        Snrpb2
    ## 1032  6.477276e-08  2.910947e-07        True   ENSMUSG00000036073          Galt
    ## 1033  2.382932e-22  3.419604e-21        True   ENSMUSG00000014195        Dnajc7
    ## 1034  2.094816e-10  1.200947e-09        True   ENSMUSG00000042138       Msantd2
    ## 1035  3.602875e-09  1.835570e-08        True   ENSMUSG00000022972       Cfap298
    ## 1036  2.210841e-04  6.315785e-04        True   ENSMUSG00000041840         Haus1
    ## 1037  8.750555e-14  6.834419e-13        True   ENSMUSG00000029439        Sfswap
    ## 1038  7.316777e-41  2.680357e-39        True   ENSMUSG00000031715       Smarca5
    ## 1039  5.068793e-08  2.310467e-07        True   ENSMUSG00000033434        Gtpbp6
    ## 1040  2.012634e-06  7.612074e-06        True   ENSMUSG00000042496        Prdm10
    ## 1041  4.456928e-17  4.443574e-16        True   ENSMUSG00000025078        Nhlrc2
    ## 1042  3.510313e-12  2.371689e-11        True   ENSMUSG00000063200          Nol7
    ## 1043  1.093703e-09  5.838442e-09        True   ENSMUSG00000010554       Mettl16
    ## 1044  2.183141e-16  2.068157e-15        True   ENSMUSG00000005378         Bud23
    ## 1045  4.464368e-30  9.931042e-29        True   ENSMUSG00000041638          Gcn1
    ## 1046  2.101745e-04  6.023518e-04        True   ENSMUSG00000057229         Dmac2
    ## 1047  1.244752e-13  9.627693e-13        True   ENSMUSG00000017210         Med24
    ## 1048  5.650475e-41  2.074698e-39        True   ENSMUSG00000017485         Top2b
    ## 1049  2.804289e-12  1.911656e-11        True   ENSMUSG00000028069       Gpatch4
    ## 1050  5.360219e-13  3.898607e-12        True   ENSMUSG00000050890        Pdik1l
    ## 1051  2.415563e-02  4.584833e-02        True   ENSMUSG00000109378          <NA>
    ## 1052  2.415563e-02  4.584833e-02        True   ENSMUSG00000078765       U2af1l4
    ## 1053  1.318477e-43  5.385861e-42        True   ENSMUSG00000021546        Hnrnpk
    ## 1054  3.463832e-04  9.565063e-04        True   ENSMUSG00000019808         Adat2
    ## 1055  2.589774e-05  8.476203e-05        True   ENSMUSG00000039154           Shd
    ## 1056  6.779362e-21  8.963574e-20        True   ENSMUSG00000031256         Cstf2
    ## 1057  2.799770e-07  1.169708e-06        True   ENSMUSG00000018858        Mrpl58
    ## 1058  4.339286e-19  5.073724e-18        True   ENSMUSG00000019297          Nop9
    ## 1059  9.603865e-11  5.664436e-10        True   ENSMUSG00000038646         Ramac
    ## 1060  9.603865e-11  5.664436e-10        True   ENSMUSG00000074826       Gm10767
    ## 1061  1.653573e-06  6.341144e-06        True   ENSMUSG00000032501         Trib1
    ## 1062  3.492870e-21  4.672372e-20        True   ENSMUSG00000020024         Cep83
    ## 1063  2.319724e-39  7.950778e-38        True   ENSMUSG00000035726        Supt16
    ## 1064  3.497818e-10  1.965077e-09        True   ENSMUSG00000044018        Mrpl50
    ## 1065  4.118826e-13  3.028816e-12        True   ENSMUSG00000069495          Epc2
    ## 1066  4.559188e-10  2.536376e-09        True   ENSMUSG00000028107         Tars2
    ## 1067  1.311940e-18  1.475655e-17        True   ENSMUSG00000025986      Slc39a10
    ## 1068  4.166910e-09  2.109474e-08        True   ENSMUSG00000042111       Ccdc115
    ## 1069  3.377459e-50  1.745785e-48        True   ENSMUSG00000021270      Hsp90aa1
    ## 1070  1.170186e-27  2.304587e-26        True   ENSMUSG00000029227        Fip1l1
    ## 1071  2.045441e-38  6.640201e-37        True   ENSMUSG00000034681         Rnps1
    ## 1072  2.501064e-11  1.563483e-10        True   ENSMUSG00000002280         Ciao3
    ## 1073  2.475431e-07  1.040463e-06        True   ENSMUSG00000027080         Med19
    ## 1074  1.027517e-31  2.494148e-30        True   ENSMUSG00000028792           Ak2
    ## 1075  7.466305e-08  3.330126e-07        True   ENSMUSG00000024247         Pkdcc
    ## 1076  1.495326e-07  6.448496e-07        True   ENSMUSG00000040213         Kyat3
    ## 1077  3.348305e-10  1.885059e-09        True   ENSMUSG00000015290         Ubl4a
    ## 1078  3.185284e-19  3.760189e-18        True   ENSMUSG00000038213        Tapbpl
    ## 1079  4.453527e-08  2.046956e-07        True   ENSMUSG00000028936         Rpl22
    ## 1080  2.480601e-21  3.351960e-20        True   ENSMUSG00000030753        Thap12
    ## 1081  2.543325e-09  1.311656e-08        True   ENSMUSG00000068856         Sf3b4
    ## 1082  3.109180e-22  4.445821e-21        True   ENSMUSG00000049164       Zfp518a
    ## 1083  1.022041e-07  4.503181e-07        True   ENSMUSG00000043284        Tmem11
    ## 1084  2.789630e-31  6.680057e-30        True   ENSMUSG00000032030          Cul5
    ## 1085  3.909296e-04  1.068251e-03        True   ENSMUSG00000047989        Ino80c
    ## 1086  2.853881e-05  9.287324e-05        True   ENSMUSG00000084957         Bbip1
    ## 1087  8.467793e-03  1.806432e-02        True   ENSMUSG00000063021        H2ac15
    ## 1088  3.275260e-14  2.624810e-13        True   ENSMUSG00000052915          Msl1
    ## 1089  5.175928e-19  6.025505e-18        True   ENSMUSG00000060679         Mrps9
    ## 1090  7.021692e-36  2.073021e-34        True   ENSMUSG00000030744          Rps3
    ## 1091  1.189784e-12  8.393654e-12        True   ENSMUSG00000006763         Saal1
    ## 1092  5.833485e-16  5.324139e-15        True   ENSMUSG00000026198         Abcb6
    ## 1093  4.967666e-22  7.027773e-21        True   ENSMUSG00000039298      Cdk5rap2
    ## 1094  9.247459e-09  4.529298e-08        True   ENSMUSG00000010911          Apip
    ## 1095  4.832554e-20  5.988019e-19        True   ENSMUSG00000022407          Adsl
    ## 1096  4.003698e-16  3.704928e-15        True   ENSMUSG00000005682          Pan2
    ## 1097  1.338028e-19  1.616565e-18        True   ENSMUSG00000027751        Supt20
    ## 1098  1.290236e-08  6.240958e-08        True   ENSMUSG00000028540          Dph2
    ## 1099  3.423142e-16  3.198675e-15        True   ENSMUSG00000014859          E2f4
    ## 1100  1.774822e-18  1.974056e-17        True   ENSMUSG00000058799        Nap1l1
    ## 1101  8.307334e-09  4.090159e-08        True   ENSMUSG00000056962         Jmjd6
    ## 1102  1.192200e-09  6.345156e-09        True   ENSMUSG00000040212          Emp3
    ## 1103  6.274828e-18  6.628409e-17        True   ENSMUSG00000003808         Farsa
    ## 1104  2.783808e-04  7.806002e-04        True   ENSMUSG00000066637         Ttc32
    ## 1105  2.172511e-07  9.201629e-07        True   ENSMUSG00000035478          Mbd3
    ## 1106  4.650939e-12  3.112057e-11        True   ENSMUSG00000036023         Parp2
    ## 1107  2.438337e-32  5.991558e-31        True   ENSMUSG00000021374        Nup153
    ## 1108  7.290697e-18  7.660988e-17        True   ENSMUSG00000024858          Grk2
    ## 1109  1.307212e-32  3.237021e-31        True   ENSMUSG00000024587          Nars
    ## 1110  4.891015e-09  2.462777e-08        True   ENSMUSG00000031016          Wee1
    ## 1111  2.399732e-13  1.810511e-12        True   ENSMUSG00000046865           Fbl
    ## 1112  3.913000e-26  7.094034e-25        True   ENSMUSG00000006678         Pola1
    ## 1113  4.421879e-10  2.461703e-09        True   ENSMUSG00000053483         Usp21
    ## 1114  1.693778e-16  1.614142e-15        True   ENSMUSG00000021893         Capn7
    ## 1115  1.546599e-10  8.959841e-10        True   ENSMUSG00000039914        Coq10a
    ## 1116  9.271669e-05  2.805211e-04        True   ENSMUSG00000040195 1700012D01Rik
    ## 1117  1.695022e-11  1.077742e-10        True   ENSMUSG00000040550        Otud6b
    ## 1118  2.214130e-12  1.524971e-11        True   ENSMUSG00000054400          Cklf
    ## 1119  3.201516e-17  3.240469e-16        True   ENSMUSG00000022913         Psmg1
    ## 1120  3.860229e-23  5.855230e-22        True   ENSMUSG00000018677      Slc25a39
    ## 1121  1.016584e-10  5.978233e-10        True   ENSMUSG00000001305         Rrp15
    ## 1122  7.087696e-14  5.565619e-13        True   ENSMUSG00000024912         Fosl1
    ## 1123  4.875934e-11  2.951058e-10        True   ENSMUSG00000021681         Aggf1
    ## 1124  6.954936e-36  2.057116e-34        True   ENSMUSG00000024493          Lars
    ## 1125  5.546862e-19  6.433876e-18        True   ENSMUSG00000028729      Ebna1bp2
    ## 1126  5.151927e-11  3.108673e-10        True   ENSMUSG00000040824        Snrpd2
    ## 1127  6.400826e-09  3.189828e-08        True   ENSMUSG00000004085       Map3k20
    ## 1128  5.346352e-06  1.925410e-05        True   ENSMUSG00000025507         Pidd1
    ## 1129  7.558595e-06  2.668565e-05        True   ENSMUSG00000073676         Hspe1
    ## 1130  7.558595e-06  2.668565e-05        True   ENSMUSG00000117621     Hspe1-rs1
    ## 1131  1.494106e-26  2.774867e-25        True   ENSMUSG00000020547          Bzw2
    ## 1132  2.454505e-19  2.925623e-18        True   ENSMUSG00000018848          Rars
    ## 1133  6.749804e-18  7.116031e-17        True   ENSMUSG00000040124         Gorab
    ## 1134  7.204599e-10  3.924688e-09        True   ENSMUSG00000011254         Thg1l
    ## 1135  4.677492e-19  5.461177e-18        True   ENSMUSG00000094870        Zfp131
    ## 1136  9.138909e-39  3.022084e-37        True   ENSMUSG00000030007          Cct7
    ## 1137  6.151175e-29  1.282592e-27        True   ENSMUSG00000026245         Farsb
    ## 1138  6.102620e-03  1.339808e-02        True   ENSMUSG00000066595        Flvcr1
    ## 1139  1.128593e-20  1.469103e-19        True   ENSMUSG00000006599        Gtf2h1
    ## 1140  2.986548e-11  1.848882e-10        True   ENSMUSG00000034518        Hmgxb4
    ## 1141  8.128326e-10  4.396398e-09        True   ENSMUSG00000020171        Yeats4
    ## 1142  6.087110e-15  5.144091e-14        True   ENSMUSG00000057421         Las1l
    ## 1143  2.486196e-20  3.141576e-19        True   ENSMUSG00000023571      C1qtnf12
    ## 1144  8.962443e-10  4.831189e-09        True   ENSMUSG00000039244 E130309D02Rik
    ## 1145  3.208220e-06  1.186366e-05        True   ENSMUSG00000028608          Czib
    ## 1146  2.020707e-27  3.916836e-26        True   ENSMUSG00000039067         Psmd7
    ## 1147  1.462234e-07  6.317231e-07        True   ENSMUSG00000015016         Acsf3
    ## 1148  3.995859e-25  6.847839e-24        True   ENSMUSG00000041133         Smc1a
    ## 1149  7.149256e-18  7.522261e-17        True   ENSMUSG00000031479         Vps36
    ## 1150  4.113398e-15  3.515205e-14        True   ENSMUSG00000033166          Dis3
    ## 1151  2.387262e-14  1.940425e-13        True   ENSMUSG00000036748        Cuedc2
    ## 1152  5.144136e-17  5.101407e-16        True   ENSMUSG00000041238         Rbbp8
    ## 1153  2.409296e-21  3.258364e-20        True   ENSMUSG00000023951         Vegfa
    ## 1154  3.597496e-10  2.017529e-09        True   ENSMUSG00000026248        Mrpl44
    ## 1155  8.190318e-13  5.863548e-12        True   ENSMUSG00000024538          Ppic
    ## 1156  1.303619e-25  2.290583e-24        True   ENSMUSG00000029036        Atad3a
    ## 1157  4.594085e-42  1.789676e-40        True   ENSMUSG00000071644         Eef1g
    ## 1158  3.829912e-11  2.341935e-10        True   ENSMUSG00000072772        Grcc10
    ## 1159  4.034959e-03  9.231681e-03        True   ENSMUSG00000038895        Zfp653
    ## 1160  3.034754e-14  2.441868e-13        True   ENSMUSG00000031197          Vbp1
    ## 1161  2.430849e-12  1.668480e-11        True   ENSMUSG00000024346         Pfdn1
    ## 1162  1.013928e-16  9.814820e-16        True   ENSMUSG00000007415        Gatad1
    ## 1163  7.005928e-12  4.599206e-11        True   ENSMUSG00000020267         Hint1
    ## 1164  8.408871e-12  5.470837e-11        True   ENSMUSG00000022131        Gpr180
    ## 1165  3.232208e-10  1.820982e-09        True   ENSMUSG00000062175         Tgif2
    ## 1166  2.105832e-30  4.825588e-29        True   ENSMUSG00000026192          Atic
    ## 1167  9.720846e-07  3.830776e-06        True   ENSMUSG00000003269         Cyth2
    ## 1168  5.691495e-03  1.257846e-02        True   ENSMUSG00000000167        Pih1d2
    ## 1169  1.082418e-19  1.312709e-18        True   ENSMUSG00000041130        Zfp598
    ## 1170  1.072752e-27  2.115307e-26        True   ENSMUSG00000029169         Dhx15
    ## 1171  3.825430e-18  4.122791e-17        True   ENSMUSG00000023952        Gtpbp2
    ## 1172  1.290869e-08  6.242130e-08        True   ENSMUSG00000049482          Ctu2
    ## 1173  2.569736e-24  4.218276e-23        True   ENSMUSG00000055531         Cpsf6
    ## 1174  3.748237e-18  4.047792e-17        True   ENSMUSG00000024078         Ttc27
    ## 1175  5.290646e-11  3.189966e-10        True   ENSMUSG00000021650         Ptcd2
    ## 1176  3.238919e-25  5.580585e-24        True   ENSMUSG00000036990         Otud4
    ## 1177  3.821816e-10  2.138824e-09        True   ENSMUSG00000030037        Mrpl53
    ## 1178  9.407533e-36  2.741918e-34        True   ENSMUSG00000032399          Rpl4
    ## 1179  9.922927e-11  5.843989e-10        True   ENSMUSG00000021243          Fcf1
    ## 1180  5.752903e-04  1.530148e-03        True   ENSMUSG00000033486      Catsper2
    ## 1181  4.628643e-15  3.938662e-14        True   ENSMUSG00000024182         Axin1
    ## 1182  5.251182e-08  2.385435e-07        True   ENSMUSG00000020526        Znhit3
    ## 1183  7.318199e-09  3.621012e-08        True   ENSMUSG00000050002          Idnk
    ## 1184  2.192120e-14  1.787266e-13        True   ENSMUSG00000037722       Gnpnat1
    ## 1185  1.192582e-27  2.342917e-26        True   ENSMUSG00000026260       Ndufa10
    ## 1186  4.361807e-10  2.429954e-09        True   ENSMUSG00000060935       Tmem263
    ## 1187  4.394718e-13  3.221314e-12        True   ENSMUSG00000020521         Rnft1
    ## 1188  9.186437e-04  2.369602e-03        True   ENSMUSG00000038766        Gabpb2
    ## 1189  3.671243e-17  3.699501e-16        True   ENSMUSG00000044475         Ascc1
    ## 1190  3.056290e-03  7.173411e-03        True   ENSMUSG00000087679    Tmem250-ps
    ## 1191  7.080863e-11  4.227871e-10        True   ENSMUSG00000046598          Bdh1
    ## 1192  1.293004e-18  1.455382e-17        True   ENSMUSG00000032254         Kif23
    ## 1193  6.830045e-26  1.218877e-24        True   ENSMUSG00000041328         Pcf11
    ## 1194  1.904307e-09  9.926759e-09        True   ENSMUSG00000025525         Apool
    ## 1195  5.923375e-31  1.391296e-29        True   ENSMUSG00000047036        Zfp445
    ## 1196  1.131441e-15  1.008447e-14        True   ENSMUSG00000001017         Chtop
    ## 1197  3.671585e-12  2.477506e-11        True   ENSMUSG00000039997        Ifi203
    ## 1198  3.671585e-12  2.477506e-11        True   ENSMUSG00000073490        Ifi207
    ## 1199  2.177726e-22  3.130750e-21        True   ENSMUSG00000024695         Zfp91
    ## 1200  2.177726e-22  3.130750e-21        True   ENSMUSG00000118491       Gm44505
    ## 1201  3.056414e-05  9.892005e-05        True   ENSMUSG00000047583          Tyw3
    ## 1202  1.458140e-27  2.857597e-26        True   ENSMUSG00000035575          Utp6
    ## 1203  8.547965e-30  1.862593e-28        True   ENSMUSG00000034252         Senp6
    ## 1204  1.495444e-07  6.448496e-07        True   ENSMUSG00000040034         Nup43
    ## 1205  2.523934e-19  3.001659e-18        True   ENSMUSG00000060038          Dhps
    ## 1206  5.889671e-08  2.658842e-07        True   ENSMUSG00000034321        Exosc1
    ## 1207  2.974748e-10  1.681865e-09        True   ENSMUSG00000032411         Tfdp2
    ## 1208  1.627707e-15  1.434753e-14        True   ENSMUSG00000031730         Dhodh
    ## 1209  1.466648e-28  3.022620e-27        True   ENSMUSG00000032050           Rdx
    ## 1210  3.955874e-17  3.968795e-16        True   ENSMUSG00000029203         Ube2k
    ## 1211  1.067324e-08  5.205284e-08        True   ENSMUSG00000057469          E2f6
    ## 1212  1.159810e-09  6.178949e-09        True   ENSMUSG00000027387         Zc3h8
    ## 1213  1.204001e-07  5.270019e-07        True   ENSMUSG00000028430          Nol6
    ## 1214  8.004866e-25  1.360146e-23        True   ENSMUSG00000027593          Raly
    ## 1215  2.580962e-13  1.938999e-12        True   ENSMUSG00000020692          Nle1
    ## 1216  4.075389e-14  3.249731e-13        True   ENSMUSG00000028099        Polr3c
    ## 1217  1.606990e-18  1.793630e-17        True   ENSMUSG00000029283          Cdc7
    ## 1218  8.434682e-09  4.149022e-08        True   ENSMUSG00000024767         Otub1
    ## 1219  2.023614e-24  3.352818e-23        True   ENSMUSG00000029034        Ints11
    ## 1220  6.911471e-03  1.501701e-02        True   ENSMUSG00000003929         Zfp81
    ## 1221  2.034969e-03  4.924626e-03        True   ENSMUSG00000050106          Tmc8
    ## 1222  1.446661e-07  6.253334e-07        True   ENSMUSG00000037353        Letmd1
    ## 1223  1.002163e-11  6.475140e-11        True   ENSMUSG00000040712        Camta2
    ## 1224  2.727932e-08  1.280356e-07        True   ENSMUSG00000022751          Nit2
    ## 1225  3.925904e-18  4.222528e-17        True   ENSMUSG00000032604          Qars
    ## 1226  1.553544e-05  5.257035e-05        True   ENSMUSG00000033983          Coil
    ## 1227  3.617227e-30  8.137232e-29        True   ENSMUSG00000020372         Rack1
    ## 1228  4.396485e-07  1.799607e-06        True   ENSMUSG00000028291       Akirin2
    ## 1229  1.234244e-07  5.392054e-07        True   ENSMUSG00000027490          E2f1
    ## 1230  2.721392e-08  1.277662e-07        True   ENSMUSG00000017144          Rnd3
    ## 1231  1.864831e-11  1.180542e-10        True   ENSMUSG00000029366           Dck
    ## 1232  1.285948e-11  8.232132e-11        True   ENSMUSG00000024436       Mrps18b
    ## 1233  3.070778e-03  7.204240e-03        True   ENSMUSG00000023072         Cep89
    ## 1234  9.619027e-11  5.671284e-10        True   ENSMUSG00000039985       Sinhcaf
    ## 1235  5.001894e-04  1.346767e-03        True   ENSMUSG00000019659        Ccdc12
    ## 1236  6.562149e-06  2.335353e-05        True   ENSMUSG00000041560         Nop53
    ## 1237  3.644539e-04  1.001731e-03        True   ENSMUSG00000047003         Zfp41
    ## 1238  1.651803e-24  2.748188e-23        True   ENSMUSG00000004069        Dnaja3
    ## 1239  3.349128e-16  3.132343e-15        True   ENSMUSG00000018666          Cbx1
    ## 1240  1.978022e-02  3.841090e-02        True   ENSMUSG00000026069        Il1rl1
    ## 1241  3.353867e-14  2.686458e-13        True   ENSMUSG00000000916         Nsun5
    ## 1242  1.998479e-13  1.519986e-12        True   ENSMUSG00000033488        Cryzl2
    ## 1243  4.397139e-11  2.672417e-10        True   ENSMUSG00000038005          Hpf1
    ## 1244  1.627299e-27  3.177410e-26        True   ENSMUSG00000061904       Slc25a3
    ## 1245  3.046118e-13  2.267129e-12        True   ENSMUSG00000001909         Trmt1
    ## 1246  1.194771e-24  2.012962e-23        True   ENSMUSG00000049659         Aftph
    ## 1247  4.826032e-12  3.226512e-11        True   ENSMUSG00000031568        Rwdd4a
    ## 1248  1.024993e-03  2.621907e-03        True   ENSMUSG00000031609         Sap30
    ## 1249  2.468704e-03  5.891249e-03        True   ENSMUSG00000078762         Haus5
    ## 1250  1.456864e-05  4.950858e-05        True   ENSMUSG00000039018          Mtg1
    ## 1251  2.085136e-13  1.584386e-12        True   ENSMUSG00000029918        Mrps33
    ## 1252  6.852429e-09  3.401088e-08        True   ENSMUSG00000024590         Lmnb1
    ## 1253  5.061379e-14  4.011928e-13        True   ENSMUSG00000027944          Hax1
    ## 1254  6.679891e-34  1.766411e-32        True   ENSMUSG00000026615          Eprs
    ## 1255  9.715156e-18  1.013524e-16        True   ENSMUSG00000035024        Ncapd3
    ## 1256  2.666033e-29  5.662483e-28        True   ENSMUSG00000074656        Eif2s2
    ## 1257  4.808529e-06  1.741933e-05        True   ENSMUSG00000046679        C87436
    ## 1258  2.876260e-15  2.495363e-14        True   ENSMUSG00000027374         Mrps5
    ## 1259  2.025316e-30  4.647750e-29        True   ENSMUSG00000068739          Sars
    ## 1260  6.816460e-17  6.716378e-16        True   ENSMUSG00000024997         Prdx3
    ## 1261  6.335018e-13  4.586714e-12        True   ENSMUSG00000040688          Tbl3
    ## 1262  6.439568e-28  1.292120e-26        True   ENSMUSG00000068039          Tcp1
    ## 1263  1.687017e-28  3.463372e-27        True   ENSMUSG00000038429          Usp5
    ## 1264  4.064510e-10  2.269079e-09        True   ENSMUSG00000019863         Qrsl1
    ## 1265  1.282641e-05  4.399989e-05        True   ENSMUSG00000022394       L3mbtl2
    ## 1266  9.152253e-17  8.902545e-16        True   ENSMUSG00000041747         Utp15
    ## 1267  1.117274e-08  5.437264e-08        True   ENSMUSG00000032119         Hinfp
    ## 1268  3.115339e-25  5.385085e-24        True   ENSMUSG00000040354         Mars1
    ## 1269  1.223538e-17  1.267338e-16        True   ENSMUSG00000029246          Ppat
    ## 1270  7.435834e-17  7.308624e-16        True   ENSMUSG00000027999      Pla2g12a
    ## 1271  8.655832e-05  2.629345e-04        True   ENSMUSG00000027313         Chac1
    ## 1272  1.233537e-03  3.109052e-03        True   ENSMUSG00000015289         Lage3
    ## 1273  4.092520e-12  2.749925e-11        True   ENSMUSG00000032077         Bud13
    ## 1274  2.473876e-25  4.299538e-24        True   ENSMUSG00000059070         Rpl18
    ## 1275  2.319331e-05  7.649050e-05        True   ENSMUSG00000043342         Hoxd9
    ## 1276  1.305997e-02  2.656907e-02        True   ENSMUSG00000064307        Lrrc51
    ## 1277  7.068267e-09  3.500600e-08        True   ENSMUSG00000030652          Coq7
    ## 1278  4.219777e-30  9.439535e-29        True   ENSMUSG00000024335          Brd2
    ## 1279  6.901052e-09  3.424157e-08        True   ENSMUSG00000021131           Erh
    ## 1280  6.901052e-09  3.424157e-08        True   ENSMUSG00000063412       Gm10131
    ## 1281  1.520416e-09  8.009263e-09        True   ENSMUSG00000026029         Casp8
    ## 1282  2.410648e-07  1.015907e-06        True   ENSMUSG00000024160         Spsb3
    ## 1283  4.905766e-13  3.579483e-12        True   ENSMUSG00000075700       Selenot
    ## 1284  5.352758e-13  3.894955e-12        True   ENSMUSG00000028013          Ppa2
    ## 1285  9.766216e-29  2.020544e-27        True   ENSMUSG00000006728          Cdk4
    ## 1286  5.954980e-09  2.974138e-08        True   ENSMUSG00000089917         Uckl1
    ## 1287  4.970354e-16  4.565066e-15        True   ENSMUSG00000067629       Syngap1
    ## 1288  5.411978e-08  2.454291e-07        True   ENSMUSG00000037103        Dcaf15
    ## 1289  6.765228e-24  1.074098e-22        True   ENSMUSG00000005299         Letm1
    ## 1290  1.104007e-02  2.289134e-02        True   ENSMUSG00000028156         Eif4e
    ## 1291  2.699705e-30  6.151168e-29        True   ENSMUSG00000025393         Atp5b
    ## 1292  1.149642e-02  2.376353e-02        True   ENSMUSG00000037463        Fbxo27
    ## 1293  5.623477e-33  1.430226e-31        True   ENSMUSG00000004980     Hnrnpa2b1
    ## 1294  2.869823e-17  2.913974e-16        True   ENSMUSG00000006057        Atp5g1
    ## 1295  1.677517e-11  1.067888e-10        True   ENSMUSG00000029380         Cxcl1
    ## 1296  1.339172e-20  1.733326e-19        True   ENSMUSG00000030282          Cmas
    ## 1297  2.477228e-25  4.300684e-24        True   ENSMUSG00000018379         Srsf1
    ## 1298  1.652923e-02  3.283642e-02        True   ENSMUSG00000041872         Il17f
    ## 1299  2.884479e-13  2.150836e-12        True   ENSMUSG00000068394        Cep152
    ## 1300  1.102821e-15  9.840370e-15        True   ENSMUSG00000001785          Pwp1
    ## 1301  2.384209e-09  1.233979e-08        True   ENSMUSG00000020027         Socs2
    ## 1302  6.443446e-23  9.600254e-22        True   ENSMUSG00000027185         Nat10
    ## 1303  9.454693e-17  9.174384e-16        True   ENSMUSG00000029415         Sdad1
    ## 1304  2.149461e-10  1.230068e-09        True   ENSMUSG00000018286         Psmb6
    ## 1305  3.128310e-03  7.326299e-03        True   ENSMUSG00000022422         Dscc1
    ## 1306  1.788988e-04  5.190504e-04        True   ENSMUSG00000025271        Pfkfb1
    ## 1307  9.781297e-11  5.762703e-10        True   ENSMUSG00000025464          Paox
    ## 1308  1.169738e-06  4.565750e-06        True   ENSMUSG00000033610         Pank1
    ## 1309  3.945134e-16  3.652851e-15        True   ENSMUSG00000078652         Psme3
    ## 1310  3.695655e-04  1.015082e-03        True   ENSMUSG00000023206        Il15ra
    ## 1311  5.629518e-24  9.018521e-23        True   ENSMUSG00000000171          Sdhd
    ## 1312  2.260772e-11  1.421616e-10        True   ENSMUSG00000040620         Dhx33
    ## 1313  2.636854e-18  2.896549e-17        True   ENSMUSG00000098274         Rpl24
    ## 1314  8.587367e-20  1.047003e-18        True   ENSMUSG00000090862         Rps13
    ## 1315  1.323549e-12  9.312652e-12        True   ENSMUSG00000020454     Eif4enif1
    ## 1316  1.111076e-19  1.346442e-18        True   ENSMUSG00000019814          Ltv1
    ## 1317  7.465442e-17  7.333213e-16        True   ENSMUSG00000038446         Cdc40
    ## 1318  7.910842e-05  2.417757e-04        True   ENSMUSG00000028549       Itgb3bp
    ## 1319  9.232871e-07  3.646459e-06        True   ENSMUSG00000078713         Tomm5
    ## 1320  9.667625e-06  3.369219e-05        True   ENSMUSG00000062510          Nsl1
    ## 1321  3.777379e-31  9.004820e-30        True   ENSMUSG00000006998         Psmd2
    ## 1322  1.351502e-21  1.860878e-20        True   ENSMUSG00000066037        Hnrnpr
    ## 1323  6.490767e-12  4.287449e-11        True   ENSMUSG00000079109          Pms2
    ## 1324  6.490767e-12  4.287449e-11        True   ENSMUSG00000104633          <NA>
    ## 1325  3.558056e-10  1.996812e-09        True   ENSMUSG00000030435         U2af2
    ## 1326  1.242816e-03  3.129969e-03        True   ENSMUSG00000030042         Pole4
    ## 1327  1.202215e-09  6.396329e-09        True   ENSMUSG00000000581           C1d
    ## 1328  4.401518e-19  5.142725e-18        True   ENSMUSG00000031818        Cox4i1
    ## 1329  5.729929e-27  1.089505e-25        True   ENSMUSG00000041360          Pum3
    ## 1330  1.622545e-02  3.226906e-02        True   ENSMUSG00000092260        Zfp963
    ## 1331  1.478467e-13  1.134747e-12        True   ENSMUSG00000058704         Memo1
    ## 1332  4.699729e-06  1.702906e-05        True   ENSMUSG00000022836          Mylk
    ## 1333  2.168199e-18  2.396573e-17        True   ENSMUSG00000027810         Eif2a
    ## 1334  8.155182e-27  1.541474e-25        True   ENSMUSG00000055762         Eef1d
    ## 1335  2.707136e-12  1.847794e-11        True   ENSMUSG00000040177 2310057M21Rik
    ## 1336  1.838513e-12  1.276172e-11        True   ENSMUSG00000022024         Sugt1
    ## 1337  2.214531e-04  6.322932e-04        True   ENSMUSG00000045316         Fahd1
    ## 1338  6.801087e-08  3.049606e-07        True   ENSMUSG00000022091        Sorbs3
    ## 1339  8.225003e-14  6.433386e-13        True   ENSMUSG00000027353          Mcm8
    ## 1340  1.876561e-26  3.473050e-25        True   ENSMUSG00000013787         Ehmt2
    ## 1341  9.294991e-08  4.111315e-07        True   ENSMUSG00000028165         Cisd2
    ## 1342  2.898093e-05  9.415854e-05        True   ENSMUSG00000057147          Dph6
    ## 1343  3.321696e-07  1.377314e-06        True   ENSMUSG00000021671          Poc5
    ## 1344  2.571981e-05  8.426603e-05        True   ENSMUSG00000019214        Chtf18
    ## 1345  2.008403e-32  4.942713e-31        True   ENSMUSG00000002718         Cse1l
    ## 1346  9.809949e-19  1.114399e-17        True   ENSMUSG00000026019         Wdr12
    ## 1347  8.525725e-13  6.087299e-12        True   ENSMUSG00000019715          Gle1
    ## 1348  2.557228e-05  8.383425e-05        True   ENSMUSG00000020834        Dhrs13
    ## 1349  2.971274e-16  2.785046e-15        True   ENSMUSG00000032185         Carm1
    ## 1350  6.793285e-15  5.719681e-14        True   ENSMUSG00000023118         Sympk
    ## 1351  4.941350e-07  2.015405e-06        True   ENSMUSG00000002486          Tchp
    ## 1352  1.844757e-33  4.775438e-32        True   ENSMUSG00000039542         Ncam1
    ## 1353  1.593404e-05  5.381654e-05        True   ENSMUSG00000025010          Ccnj
    ## 1354  1.162809e-15  1.034673e-14        True   ENSMUSG00000034729        Mrps10
    ## 1355  1.211576e-09  6.437555e-09        True   ENSMUSG00000006356         Crip2
    ## 1356  1.265090e-06  4.915108e-06        True   ENSMUSG00000070697          Utp3
    ## 1357  9.013235e-16  8.110388e-15        True   ENSMUSG00000029594         Rbm19
    ## 1358  6.516047e-24  1.036597e-22        True   ENSMUSG00000024735        Prpf19
    ## 1359  1.332149e-04  3.940931e-04        True   ENSMUSG00000045538         Ddx28
    ## 1360  3.623577e-09  1.845528e-08        True   ENSMUSG00000028300       C9orf72
    ## 1361  6.385215e-12  4.226467e-11        True   ENSMUSG00000052151         Plpp2
    ## 1362  2.587895e-11  1.613973e-10        True   ENSMUSG00000004895          Prcc
    ## 1363  5.391991e-17  5.332563e-16        True   ENSMUSG00000020949         Fkbp3
    ## 1364  4.225476e-07  1.732716e-06        True   ENSMUSG00000055760        Gemin6
    ## 1365  7.451423e-24  1.180696e-22        True   ENSMUSG00000039756       Dnttip2
    ## 1366  8.229944e-12  5.363063e-11        True   ENSMUSG00000022553          Maf1
    ## 1367  6.053891e-05  1.875708e-04        True   ENSMUSG00000031530         Dusp4
    ## 1368  1.910914e-05  6.378499e-05        True   ENSMUSG00000022621         Rabl2
    ## 1369  6.425577e-09  3.200166e-08        True   ENSMUSG00000059355       Wdr83os
    ## 1370  1.378088e-13  1.060763e-12        True   ENSMUSG00000020153        Ndufs7
    ## 1371  4.714591e-15  4.005396e-14        True   ENSMUSG00000114797         Nupl1
    ## 1372  4.714591e-15  4.005396e-14        True   ENSMUSG00000063895          <NA>
    ## 1373  7.165397e-23  1.063622e-21        True   ENSMUSG00000028484         Psip1
    ## 1374  3.607622e-16  3.353954e-15        True   ENSMUSG00000020738         Sumo2
    ## 1375  2.209404e-21  3.005844e-20        True   ENSMUSG00000034487       Poglut3
    ## 1376  8.857980e-18  9.271275e-17        True   ENSMUSG00000069744         Psmb3
    ## 1377  1.052306e-19  1.277161e-18        True   ENSMUSG00000037197         Rbm17
    ## 1378  1.071531e-31  2.597040e-30        True   ENSMUSG00000026728           Vim
    ## 1379  1.246432e-16  1.200001e-15        True   ENSMUSG00000042660         Wdr55
    ## 1380  6.002646e-28  1.209007e-26        True   ENSMUSG00000041057         Wdr43
    ## 1381  6.715378e-22  9.425134e-21        True   ENSMUSG00000022841         Ap2m1
    ## 1382  1.506011e-19  1.811295e-18        True   ENSMUSG00000032350          Gclc
    ## 1383  5.127957e-22  7.248117e-21        True   ENSMUSG00000106864        Gtf3c2
    ## 1384  5.127957e-22  7.248117e-21        True   ENSMUSG00000101678          <NA>
    ## 1385  4.790759e-08  2.186853e-07        True   ENSMUSG00000039217          Il18
    ## 1386  5.207696e-39  1.740111e-37        True   ENSMUSG00000034994          Eef2
    ## 1387  1.030524e-09  5.519626e-09        True   ENSMUSG00000030269        Mtmr14
    ## 1388  3.088634e-30  6.967748e-29        True   ENSMUSG00000007739          Cct4
    ## 1389  1.489797e-06  5.737893e-06        True   ENSMUSG00000028224           Nbn
    ## 1390  8.368183e-07  3.315719e-06        True   ENSMUSG00000071451         Psmg4
    ## 1391  1.234686e-13  9.559092e-13        True   ENSMUSG00000026005           Rpe
    ## 1392  2.776145e-06  1.034062e-05        True   ENSMUSG00000007646        Rad51c
    ## 1393  2.201850e-24  3.629304e-23        True   ENSMUSG00000020857          Nme2
    ## 1394  2.247270e-04  6.407246e-04        True   ENSMUSG00000036106          Prr5
    ## 1395  3.786211e-18  4.083279e-17        True   ENSMUSG00000023051        Tarbp2
    ## 1396  8.696737e-15  7.268670e-14        True   ENSMUSG00000032601       Prkar2a
    ## 1397  1.492684e-08  7.174588e-08        True   ENSMUSG00000028318        Polr1e
    ## 1398  6.778940e-10  3.707987e-09        True   ENSMUSG00000031367         Ap1s2
    ## 1399  6.363830e-18  6.717984e-17        True   ENSMUSG00000034022         Cpsf1
    ## 1400  3.312023e-15  2.850196e-14        True   ENSMUSG00000035842         Ddx11
    ## 1401  2.206262e-15  1.925596e-14        True   ENSMUSG00000038335          Tsr1
    ## 1402  1.247445e-09  6.619335e-09        True   ENSMUSG00000087141        Plcxd2
    ## 1403  1.233941e-11  7.921424e-11        True   ENSMUSG00000059552         Trp53
    ## 1404  1.930368e-11  1.221063e-10        True   ENSMUSG00000059939 9430015G10Rik
    ## 1405  2.279199e-11  1.432639e-10        True   ENSMUSG00000022706        Mrpl40
    ## 1406  4.860416e-10  2.699121e-09        True   ENSMUSG00000026077         Npas2
    ## 1407  2.044101e-05  6.791841e-05        True   ENSMUSG00000020925        Ccdc43
    ## 1408  1.156882e-10  6.773358e-10        True   ENSMUSG00000004561       Mettl17
    ## 1409  2.832613e-15  2.458831e-14        True   ENSMUSG00000027937           Jtb
    ## 1410  1.754507e-08  8.397657e-08        True   ENSMUSG00000019731       Slc35e1
    ## 1411  6.736203e-12  4.436727e-11        True   ENSMUSG00000037572         Wdhd1
    ## 1412  3.092606e-13  2.300657e-12        True   ENSMUSG00000022466         Rpap3
    ## 1413  5.564821e-13  4.041898e-12        True   ENSMUSG00000032040          Dcps
    ## 1414  1.378480e-12  9.673583e-12        True   ENSMUSG00000034120         Srsf2
    ## 1415  4.588982e-03  1.038912e-02        True   ENSMUSG00000025362         Rps26
    ## 1416  1.561113e-04  4.580106e-04        True   ENSMUSG00000057706         Mex3b
    ## 1417  3.427514e-07  1.417878e-06        True   ENSMUSG00000029276          Glmn
    ## 1418  9.934209e-20  1.207528e-18        True   ENSMUSG00000068749         Psma5
    ## 1419  5.189852e-13  3.778137e-12        True   ENSMUSG00000061032          Rrp1
    ## 1420  1.060411e-09  5.668301e-09        True   ENSMUSG00000029993          Nfu1
    ## 1421  1.124278e-20  1.464679e-19        True   ENSMUSG00000021952          Xpo4
    ## 1422  1.006191e-09  5.400163e-09        True   ENSMUSG00000021963         Sap18
    ## 1423  1.006191e-09  5.400163e-09        True   ENSMUSG00000061104        Sap18b
    ## 1424  9.744528e-06  3.393059e-05        True   ENSMUSG00000053293        Pom121
    ## 1425  1.032382e-09  5.525875e-09        True   ENSMUSG00000028266          Lmo4
    ## 1426  5.233224e-14  4.144029e-13        True   ENSMUSG00000020737          Jpt1
    ## 1427  1.027462e-14  8.538301e-14        True   ENSMUSG00000025358          Cdk2
    ## 1428  1.582700e-13  1.214164e-12        True   ENSMUSG00000063334          Krr1
    ## 1429  3.622577e-24  5.892037e-23        True   ENSMUSG00000017999         Ddx27
    ## 1430  6.684476e-09  3.322890e-08        True   ENSMUSG00000037531        Mrpl47
    ## 1431  4.341346e-05  1.375793e-04        True   ENSMUSG00000016409          Nkap
    ## 1432  1.637760e-12  1.142783e-11        True   ENSMUSG00000037731       Themis2
    ## 1433  2.163798e-07  9.167155e-07        True   ENSMUSG00000016946         Kctd5
    ## 1434  4.001551e-11  2.443149e-10        True   ENSMUSG00000027835        Pdcd10
    ## 1435  4.083075e-18  4.385667e-17        True   ENSMUSG00000032348         Gsta4
    ## 1436  3.747385e-28  7.595589e-27        True   ENSMUSG00000022462       Slc38a2
    ## 1437  3.665020e-21  4.898552e-20        True   ENSMUSG00000037286         Stag1
    ## 1438  1.116871e-22  1.630591e-21        True   ENSMUSG00000041781         Cpsf2
    ## 1439  2.027766e-15  1.774656e-14        True   ENSMUSG00000020561        Polr1f
    ## 1440  4.467938e-11  2.714413e-10        True   ENSMUSG00000109865        Hspa14
    ## 1441  1.918527e-06  7.283745e-06        True   ENSMUSG00000020485        Supt4a
    ## 1442  8.019699e-05  2.450557e-04        True   ENSMUSG00000024764         Naa40
    ## 1443  9.238043e-19  1.050926e-17        True   ENSMUSG00000041355          Ssr2
    ## 1444  3.883423e-15  3.325793e-14        True   ENSMUSG00000025086         Trub1
    ## 1445  9.820278e-39  3.240692e-37        True   ENSMUSG00000045983        Eif4g1
    ## 1446  1.114391e-14  9.236664e-14        True   ENSMUSG00000045624          Esf1
    ## 1447  2.878814e-15  2.496222e-14        True   ENSMUSG00000027671        Actl6a
    ## 1448  9.717230e-08  4.293322e-07        True   ENSMUSG00000028016        Ints12
    ## 1449  4.413163e-13  3.233351e-12        True   ENSMUSG00000024253      Dync2li1
    ## 1450  3.289203e-11  2.026038e-10        True   ENSMUSG00000028409          Smu1
    ## 1451  2.285204e-26  4.204986e-25        True   ENSMUSG00000012405         Rpl15
    ## 1452  2.929910e-23  4.473854e-22        True   ENSMUSG00000030505         Prmt3
    ## 1453  2.217186e-18  2.445962e-17        True   ENSMUSG00000024853         Sf3b2
    ## 1454  1.198874e-07  5.250455e-07        True   ENSMUSG00000035268          Pkig
    ## 1455  9.647993e-28  1.914892e-26        True   ENSMUSG00000024974          Smc3
    ## 1456  1.210709e-16  1.167016e-15        True   ENSMUSG00000028029         Aimp1
    ## 1457  5.125412e-09  2.575120e-08        True   ENSMUSG00000020280         Pus10
    ## 1458  3.358336e-14  2.688689e-13        True   ENSMUSG00000026917          Wdr5
    ## 1459  3.072115e-04  8.555855e-04        True   ENSMUSG00000024891       Slc29a2
    ## 1460  1.990605e-13  1.514719e-12        True   ENSMUSG00000059005       Hnrnpa3
    ## 1461  2.180927e-05  7.216441e-05        True   ENSMUSG00000022554          Hgh1
    ## 1462  9.234864e-07  3.646459e-06        True   ENSMUSG00000061533        Cep128
    ## 1463  1.160653e-09  6.181379e-09        True   ENSMUSG00000032309        Fbxo22
    ## 1464  1.735859e-12  1.208067e-11        True   ENSMUSG00000028140         Mrpl9
    ## 1465  1.389206e-07  6.031096e-07        True   ENSMUSG00000036840        Siah1a
    ## 1466  1.389206e-07  6.031096e-07        True   ENSMUSG00000040749        Siah1b
    ## 1467  4.976330e-03  1.114369e-02        True   ENSMUSG00000037020         Wdr62
    ## 1468  4.689020e-11  2.842240e-10        True   ENSMUSG00000027667        Zfp639
    ## 1469  1.145912e-15  1.020206e-14        True   ENSMUSG00000031060         Rbm10
    ## 1470  5.191626e-05  1.625258e-04        True   ENSMUSG00000089857        Zfp882
    ## 1471  4.348857e-05  1.377900e-04        True   ENSMUSG00000029815        Malsu1
    ## 1472  1.961356e-10  1.127268e-09        True   ENSMUSG00000030243         Recql
    ## 1473  1.520975e-04  4.470559e-04        True   ENSMUSG00000032977       Fam207a
    ## 1474  5.122326e-08  2.332871e-07        True   ENSMUSG00000079036        Alkbh1
    ## 1475  6.309600e-20  7.758039e-19        True   ENSMUSG00000021901          Bap1
    ## 1476  2.737623e-28  5.563016e-27        True   ENSMUSG00000035242          Oaz1
    ## 1477  1.472558e-05  4.996297e-05        True   ENSMUSG00000053600        Zfp472
    ## 1478  9.780008e-10  5.257701e-09        True   ENSMUSG00000040274          Cdk6
    ## 1479  1.052223e-11  6.793090e-11        True   ENSMUSG00000037455       Slc18b1
    ## 1480  6.072901e-22  8.553472e-21        True   ENSMUSG00000058013      Septin11
    ## 1481  1.108060e-20  1.445909e-19        True   ENSMUSG00000021392          Nol8
    ## 1482  8.627780e-06  3.025975e-05        True   ENSMUSG00000024592 C330018D20Rik
    ## 1483  2.386154e-15  2.079195e-14        True   ENSMUSG00000029326        Enoph1
    ## 1484  1.804554e-17  1.852336e-16        True   ENSMUSG00000071655         Ubxn1
    ## 1485  2.859069e-17  2.904901e-16        True   ENSMUSG00000012848          Rps5
    ## 1486  7.045900e-13  5.087573e-12        True   ENSMUSG00000030880        Polr3e
    ## 1487  5.150850e-08  2.343857e-07        True   ENSMUSG00000041203          Trir
    ## 1488  5.886962e-10  3.232264e-09        True   ENSMUSG00000024442         Dele1
    ## 1489  1.194839e-22  1.738066e-21        True   ENSMUSG00000012535         Tnpo3
    ## 1490  8.383036e-23  1.240907e-21        True   ENSMUSG00000004880           Lbr
    ## 1491  2.992809e-23  4.561178e-22        True   ENSMUSG00000025794         Rpl14
    ## 1492  1.885141e-06  7.172339e-06        True   ENSMUSG00000029790         Cep41
    ## 1493  2.786042e-12  1.900840e-11        True   ENSMUSG00000034424          Gcsh
    ## 1494  3.353156e-27  6.429364e-26        True   ENSMUSG00000029202         Pds5a
    ## 1495  2.604148e-05  8.521504e-05        True   ENSMUSG00000059995       Atxn7l3
    ## 1496  2.407502e-25  4.188739e-24        True   ENSMUSG00000004099         Dnmt1
    ## 1497  9.230188e-22  1.281953e-20        True   ENSMUSG00000005779         Psmb4
    ## 1498  1.390298e-05  4.742812e-05        True   ENSMUSG00000001983         Taco1
    ## 1499  6.417458e-12  4.246050e-11        True   ENSMUSG00000026187         Xrcc5
    ## 1500  6.399947e-15  5.399892e-14        True   ENSMUSG00000029782       Tmem209
    ## 1501  1.704261e-20  2.188140e-19        True   ENSMUSG00000028426        Rad23b
    ## 1502  6.334857e-15  5.347798e-14        True   ENSMUSG00000006589          Aprt
    ## 1503  1.325241e-26  2.475643e-25        True   ENSMUSG00000028633          Ctps
    ## 1504  2.048527e-18  2.269007e-17        True   ENSMUSG00000053841         Txlna
    ## 1505  2.058365e-11  1.297916e-10        True   ENSMUSG00000041949        Tango6
    ## 1506  1.734123e-02  3.430020e-02        True   ENSMUSG00000098530          <NA>
    ## 1507  1.734123e-02  3.430020e-02        True   ENSMUSG00000041716       Gm20604
    ## 1508  1.734123e-02  3.430020e-02        True   ENSMUSG00000091931          Gon7
    ## 1509  3.125813e-19  3.692713e-18        True   ENSMUSG00000018583         G3bp1
    ## 1510  5.021664e-05  1.576758e-04        True   ENSMUSG00000048007       Timm8a1
    ## 1511  2.943623e-16  2.760749e-15        True   ENSMUSG00000037373         Ctbp1
    ## 1512  5.696006e-06  2.043500e-05        True   ENSMUSG00000020472      Zkscan17
    ## 1513  1.033795e-21  1.428354e-20        True   ENSMUSG00000025613          Cct8
    ## 1514  1.385516e-34  3.769924e-33        True   ENSMUSG00000024991         Eif3a
    ## 1515  1.831649e-06  6.980459e-06        True   ENSMUSG00000005447      Pafah1b3
    ## 1516  8.732189e-09  4.286125e-08        True   ENSMUSG00000058444        Map2k5
    ## 1517  2.207287e-19  2.636858e-18        True   ENSMUSG00000020124         Usp15
    ## 1518  4.583123e-17  4.563694e-16        True   ENSMUSG00000039275         Foxk2
    ## 1519  6.015464e-05  1.864887e-04        True   ENSMUSG00000030602          Pak4
    ## 1520  2.849145e-14  2.298310e-13        True   ENSMUSG00000026209         Dnpep
    ## 1521  7.322029e-16  6.633434e-15        True   ENSMUSG00000000708         Kat2b
    ## 1522  1.810120e-20  2.318463e-19        True   ENSMUSG00000027109           Sp3
    ## 1523  9.904838e-06  3.443624e-05        True   ENSMUSG00000051768         Xrcc1
    ## 1524  7.059082e-09  3.498221e-08        True   ENSMUSG00000025350          Rdh5
    ## 1525  8.615377e-17  8.395656e-16        True   ENSMUSG00000027889         Ampd2
    ## 1526  7.409136e-07  2.961430e-06        True   ENSMUSG00000038721         Hoxb7
    ## 1527  9.057756e-19  1.031151e-17        True   ENSMUSG00000032959         Pebp1
    ## 1528  2.457614e-05  8.073428e-05        True   ENSMUSG00000053730       Tmem39b
    ## 1529  1.241284e-07  5.418363e-07        True   ENSMUSG00000020832         Eral1
    ## 1530  8.288409e-25  1.406827e-23        True   ENSMUSG00000089989          <NA>
    ## 1531  3.674946e-05  1.176513e-04        True   ENSMUSG00000070837         Aurkc
    ## 1532  3.578604e-05  1.147740e-04        True   ENSMUSG00000117924       Tmem223
    ## 1533  1.086220e-03  2.763918e-03        True   ENSMUSG00000000301          Pemt
    ## 1534  2.484396e-09  1.283337e-08        True   ENSMUSG00000019362    D8Ertd738e
    ## 1535  2.349308e-13  1.774983e-12        True   ENSMUSG00000032235          Ice2
    ## 1536  7.071750e-16  6.410329e-15        True   ENSMUSG00000034801          Sos2
    ## 1537  1.211114e-24  2.038347e-23        True   ENSMUSG00000031532         Saraf
    ## 1538  7.323376e-09  3.622452e-08        True   ENSMUSG00000026851      BC005624
    ## 1539  1.484904e-04  4.368555e-04        True   ENSMUSG00000053559         Smagp
    ## 1540  1.501969e-02  3.010347e-02        True   ENSMUSG00000020867       Spata20
    ## 1541  1.451189e-19  1.749192e-18        True   ENSMUSG00000117748         Derpc
    ## 1542  1.393229e-13  1.071900e-12        True   ENSMUSG00000000561         Wdr77
    ## 1543  1.657747e-13  1.269297e-12        True   ENSMUSG00000022897        Dyrk1a
    ## 1544  1.685730e-14  1.383580e-13        True   ENSMUSG00000043207      Zmpste24
    ## 1545  7.512738e-08  3.348966e-07        True   ENSMUSG00000030980         Knop1
    ## 1546  1.148228e-13  8.906990e-13        True   ENSMUSG00000044221         Grsf1
    ## 1547  6.500531e-21  8.609161e-20        True   ENSMUSG00000022962          Gart
    ## 1548  7.787932e-16  7.043536e-15        True   ENSMUSG00000010376         Nedd8
    ## 1549  1.047572e-08  5.110516e-08        True   ENSMUSG00000034156       Tspoap1
    ## 1550  3.324320e-06  1.225953e-05        True   ENSMUSG00000028889          Yrdc
    ## 1551  8.153585e-28  1.625831e-26        True   ENSMUSG00000023110         Prmt5
    ## 1552  4.545514e-11  2.759443e-10        True   ENSMUSG00000029389         Ddx55
    ## 1553  6.591661e-20  8.086176e-19        True   ENSMUSG00000035049         Rrp12
    ## 1554  9.443637e-05  2.855619e-04        True   ENSMUSG00000062661          Ncs1
    ## 1555  1.795723e-27  3.489208e-26        True   ENSMUSG00000036202          Rif1
    ## 1556  6.539856e-05  2.019226e-04        True   ENSMUSG00000046798        Cldn12
    ## 1557  5.327289e-27  1.015363e-25        True   ENSMUSG00000028639          Ybx1
    ## 1558  1.706234e-16  1.625043e-15        True   ENSMUSG00000016503         Gtf3a
    ## 1559  2.639437e-13  1.978277e-12        True   ENSMUSG00000026279         Thap4
    ## 1560  2.953392e-07  1.230991e-06        True   ENSMUSG00000031931       Ankrd49
    ## 1561  3.795447e-16  3.516292e-15        True   ENSMUSG00000026926         Pmpca
    ## 1562  1.681177e-11  1.069365e-10        True   ENSMUSG00000021572         Cep72
    ## 1563  5.248160e-03  1.168273e-02        True   ENSMUSG00000071661         Zbtb3
    ## 1564  5.703841e-05  1.773788e-04        True   ENSMUSG00000063236 1110038F14Rik
    ## 1565  4.318393e-08  1.987705e-07        True   ENSMUSG00000025917         Cops5
    ## 1566  5.095620e-12  3.395379e-11        True   ENSMUSG00000032290         Ptpn9
    ## 1567  1.736731e-20  2.228038e-19        True   ENSMUSG00000028811          Yars
    ## 1568  1.863884e-09  9.728743e-09        True   ENSMUSG00000002396         Ocel1
    ## 1569  9.072918e-12  5.885972e-11        True   ENSMUSG00000029434        Vps33a
    ## 1570  1.642748e-07  7.038081e-07        True   ENSMUSG00000052253        Zfp622
    ## 1571  7.778971e-04  2.026186e-03        True   ENSMUSG00000051413        Plagl2
    ## 1572  1.127886e-14  9.343673e-14        True   ENSMUSG00000008976         Gabpa
    ## 1573  1.911834e-03  4.654849e-03        True   ENSMUSG00000031737          Irx5
    ## 1574  1.694314e-02  3.357100e-02        True   ENSMUSG00000026087        Mrpl30
    ## 1575  1.060007e-18  1.202446e-17        True   ENSMUSG00000032228         Tcf12
    ## 1576  1.176413e-11  7.561236e-11        True   ENSMUSG00000028821          Syf2
    ## 1577  1.575238e-30  3.625318e-29        True   ENSMUSG00000068823         Csde1
    ## 1578  6.668753e-06  2.369069e-05        True   ENSMUSG00000053716         Dusp7
    ## 1579  9.744800e-07  3.839269e-06        True   ENSMUSG00000030689        Ino80e
    ## 1580  5.578736e-11  3.354803e-10        True   ENSMUSG00000042447          Mios
    ## 1581  8.499013e-17  8.302522e-16        True   ENSMUSG00000036678          Aaas
    ## 1582  5.931758e-34  1.573788e-32        True   ENSMUSG00000037742        Eef1a1
    ## 1583  1.035100e-03  2.645220e-03        True   ENSMUSG00000039917        Rhbdd2
    ## 1584  2.174405e-03  5.239829e-03        True   ENSMUSG00000042831        Alkbh6
    ## 1585  1.200740e-18  1.357269e-17        True   ENSMUSG00000031311          Nono
    ## 1586  4.327932e-11  2.631356e-10        True   ENSMUSG00000034826         Nup54
    ## 1587  2.193042e-02  4.208995e-02        True   ENSMUSG00000030407         Qpctl
    ## 1588  8.598934e-07  3.404615e-06        True   ENSMUSG00000034889        Cactin
    ## 1589  3.996459e-12  2.691039e-11        True   ENSMUSG00000036980          Taf6
    ## 1590  9.187926e-26  1.626935e-24        True   ENSMUSG00000017404         Rpl19
    ## 1591  1.797722e-08  8.594200e-08        True   ENSMUSG00000040028        Elavl1
    ## 1592  2.829821e-07  1.181336e-06        True   ENSMUSG00000057177         Gsk3a
    ## 1593  1.324039e-09  7.007143e-09        True   ENSMUSG00000030682         Cdipt
    ## 1594  1.200437e-02  2.467934e-02        True   ENSMUSG00000063808       Gpatch1
    ## 1595  4.922557e-13  3.590095e-12        True   ENSMUSG00000002845       Tmem39a
    ## 1596  1.099451e-29  2.382691e-28        True   ENSMUSG00000060036          Rpl3
    ## 1597  2.323313e-14  1.890369e-13        True   ENSMUSG00000031939         Taf1d
    ## 1598  2.357646e-03  5.645627e-03        True   ENSMUSG00000071660         Ttc9c
    ## 1599  2.795305e-06  1.040714e-05        True   ENSMUSG00000033446         Lpar6
    ## 1600  1.426915e-16  1.369633e-15        True   ENSMUSG00000044857         Lemd2
    ## 1601  2.542334e-10  1.444545e-09        True   ENSMUSG00000025572          Tmc6
    ## 1602  8.748534e-09  4.292829e-08        True   ENSMUSG00000031984 2810004N23Rik
    ## 1603  2.912066e-05  9.457406e-05        True   ENSMUSG00000020973        Dnaaf2
    ## 1604  1.122562e-06  4.394501e-06        True   ENSMUSG00000040771         Oard1
    ## 1605  7.775036e-08  3.462992e-07        True   ENSMUSG00000037740        Mrps26
    ## 1606  2.241007e-17  2.287508e-16        True   ENSMUSG00000029920      Smarcad1
    ## 1607  7.086748e-11  4.229803e-10        True   ENSMUSG00000040174        Alkbh3
    ## 1608  7.086748e-11  4.229803e-10        True   ENSMUSG00000098004          <NA>
    ## 1609  3.010003e-07  1.253605e-06        True   ENSMUSG00000026500         Cox20
    ## 1610  6.592806e-10  3.608646e-09        True   ENSMUSG00000029404       Arl6ip4
    ## 1611  2.928209e-24  4.787037e-23        True   ENSMUSG00000045128        Rpl18a
    ## 1612  5.280998e-05  1.650971e-04        True   ENSMUSG00000068391        Chrac1
    ## 1613  1.243136e-14  1.026647e-13        True   ENSMUSG00000061458         Nol10
    ## 1614  1.181116e-13  9.148780e-13        True   ENSMUSG00000031157         Pqbp1
    ## 1615  3.801326e-11  2.326237e-10        True   ENSMUSG00000028248         Pnisr
    ## 1616  2.102334e-11  1.324072e-10        True   ENSMUSG00000063320 1190007I07Rik
    ## 1617  2.054346e-08  9.758144e-08        True   ENSMUSG00000033701         Acbd6
    ## 1618  1.022509e-21  1.415210e-20        True   ENSMUSG00000028798         Eif3i
    ## 1619  2.745670e-16  2.581156e-15        True   ENSMUSG00000074743          Thbd
    ## 1620  7.454777e-12  4.879824e-11        True   ENSMUSG00000020677         Ddx52
    ## 1621  1.098636e-10  6.441784e-10        True   ENSMUSG00000004100          Ppan
    ## 1622  7.328627e-07  2.929983e-06        True   ENSMUSG00000068184       Ndufaf2
    ## 1623  4.209670e-09  2.127749e-08        True   ENSMUSG00000034932        Mrpl54
    ## 1624  2.636977e-07  1.104584e-06        True   ENSMUSG00000051346        Spryd4
    ## 1625  1.174484e-02  2.420810e-02        True   ENSMUSG00000024446         Rpp21
    ## 1626  3.542720e-19  4.163674e-18        True   ENSMUSG00000022412         Mief1
    ## 1627  1.157321e-07  5.079619e-07        True   ENSMUSG00000001056          Nhp2
    ## 1628  1.100583e-10  6.450830e-10        True   ENSMUSG00000020870        Cdc34b
    ## 1629  1.100583e-10  6.450830e-10        True   ENSMUSG00000020307         Cdc34
    ## 1630  1.327901e-03  3.327460e-03        True   ENSMUSG00000027845       Dclre1b
    ## 1631  6.416775e-09  3.196779e-08        True   ENSMUSG00000057396        Zfp759
    ## 1632  6.416775e-09  3.196779e-08        True   ENSMUSG00000058093       Zfp729b
    ## 1633  6.416775e-09  3.196779e-08        True   ENSMUSG00000055480        Zfp458
    ## 1634  6.416775e-09  3.196779e-08        True   ENSMUSG00000021510       Zfp729a
    ## 1635  5.092295e-12  3.394580e-11        True   ENSMUSG00000040681         Hmgn1
    ## 1636  7.437081e-13  5.341055e-12        True   ENSMUSG00000018882        Mrpl45
    ## 1637  2.699341e-11  1.680853e-10        True   ENSMUSG00000036693         Nop14
    ## 1638  2.529804e-04  7.142659e-04        True   ENSMUSG00000078773        Rad54b
    ## 1639  1.201549e-04  3.578434e-04        True   ENSMUSG00000028690        Mmachc
    ## 1640  7.110187e-13  5.120104e-12        True   ENSMUSG00000052997          Uba2
    ## 1641  4.267547e-05  1.352882e-04        True   ENSMUSG00000040888          Gfer
    ## 1642  3.476625e-11  2.131618e-10        True   ENSMUSG00000038437         Mllt6
    ## 1643  2.106668e-25  3.677344e-24        True   ENSMUSG00000066232          Ipo7
    ## 1644  6.470141e-12  4.277363e-11        True   ENSMUSG00000024135         Srbd1
    ## 1645  1.976806e-08  9.405288e-08        True   ENSMUSG00000028233          Tgs1
    ## 1646  5.566128e-19  6.451538e-18        True   ENSMUSG00000034674           Tdg
    ## 1647  9.445171e-03  1.991003e-02        True   ENSMUSG00000055862        Izumo4
    ## 1648  4.687310e-15  3.986460e-14        True   ENSMUSG00000021810           Ecd
    ## 1649  1.732247e-17  1.779257e-16        True   ENSMUSG00000026427         Eif2d
    ## 1650  1.877562e-12  1.302146e-11        True   ENSMUSG00000000959         Oxa1l
    ## 1651  2.114012e-04  6.054330e-04        True   ENSMUSG00000063049          Ing2
    ## 1652  3.559614e-08  1.654661e-07        True   ENSMUSG00000059734        Ndufs8
    ## 1653  1.877255e-09  9.795334e-09        True   ENSMUSG00000026694     Eef1aknmt
    ## 1654  4.295171e-07  1.759038e-06        True   ENSMUSG00000030002        Dusp11
    ## 1655  4.179799e-11  2.545168e-10        True   ENSMUSG00000003299         Mrpl4
    ## 1656  1.239908e-07  5.413837e-07        True   ENSMUSG00000033272       Slc35a4
    ## 1657  5.756405e-29  1.203420e-27        True   ENSMUSG00000026491        Ahctf1
    ## 1658  2.378887e-13  1.796481e-12        True   ENSMUSG00000045193         Cirbp
    ## 1659  2.601026e-16  2.448061e-15        True   ENSMUSG00000027227          Sord
    ## 1660  1.015655e-14  8.448984e-14        True   ENSMUSG00000021177          Tdp1
    ## 1661  1.782979e-09  9.327788e-09        True   ENSMUSG00000043702         Pde12
    ## 1662  1.540340e-03  3.816086e-03        True   ENSMUSG00000028687         Mutyh
    ## 1663  1.880504e-15  1.651205e-14        True   ENSMUSG00000006345          Ggt1
    ## 1664  1.375850e-03  3.437366e-03        True   ENSMUSG00000033126          Ybey
    ## 1665  4.234391e-10  2.359794e-09        True   ENSMUSG00000062580       Timm17a
    ## 1666  1.501413e-23  2.339568e-22        True   ENSMUSG00000003660      Snrnp200
    ## 1667  5.696614e-12  3.783215e-11        True   ENSMUSG00000035529         Prdm4
    ## 1668  1.690939e-13  1.293471e-12        True   ENSMUSG00000027502          Rtf2
    ## 1669  1.814140e-07  7.730907e-07        True   ENSMUSG00000042275          Pelo
    ## 1670  2.808083e-05  9.149471e-05        True   ENSMUSG00000037525       Bcdin3d
    ## 1671  2.315569e-20  2.935259e-19        True   ENSMUSG00000040385        Ppp1ca
    ## 1672  2.285269e-14  1.861312e-13        True   ENSMUSG00000039929          Urb1
    ## 1673  2.160691e-23  3.321516e-22        True   ENSMUSG00000035133       Arhgap5
    ## 1674  1.625431e-18  1.812945e-17        True   ENSMUSG00000020664           Dld
    ## 1675  4.288222e-03  9.762185e-03        True   ENSMUSG00000023755        Rhebl1
    ## 1676  3.925281e-12  2.644226e-11        True   ENSMUSG00000045410        Akr1e1
    ## 1677  1.787901e-23  2.769772e-22        True   ENSMUSG00000028759        Hp1bp3
    ## 1678  1.513719e-10  8.775724e-10        True   ENSMUSG00000033411       Ctdspl2
    ## 1679  9.452058e-03  1.992191e-02        True   ENSMUSG00000091780          Sco2
    ## 1680  1.149737e-19  1.391182e-18        True   ENSMUSG00000035569       Ankrd11
    ## 1681  8.441870e-15  7.063046e-14        True   ENSMUSG00000021488          Nsd1
    ## 1682  3.179297e-25  5.489700e-24        True   ENSMUSG00000032518          Rpsa
    ## 1683  4.883285e-16  4.490261e-15        True   ENSMUSG00000001674         Ddx18
    ## 1684  2.500970e-17  2.545921e-16        True   ENSMUSG00000007812        Zfp655
    ## 1685  1.465186e-05  4.975962e-05        True   ENSMUSG00000008435         Rdh13
    ## 1686  5.356877e-08  2.430683e-07        True   ENSMUSG00000025237         Parp6
    ## 1687  2.389754e-08  1.129934e-07        True   ENSMUSG00000006392          Med8
    ## 1688  2.341658e-11  1.468432e-10        True   ENSMUSG00000030335        Mrpl51
    ## 1689  3.098761e-03  7.264554e-03        True   ENSMUSG00000041625         Ggact
    ## 1690  2.840247e-11  1.763095e-10        True   ENSMUSG00000005262          Ufd1
    ## 1691  1.907046e-09  9.937792e-09        True   ENSMUSG00000027599         Armc1
    ## 1692  7.907014e-08  3.518831e-07        True   ENSMUSG00000069844          Sco1
    ## 1693  3.134248e-08  1.462893e-07        True   ENSMUSG00000036315        Polr1h
    ## 1694  8.026680e-22  1.122611e-20        True   ENSMUSG00000038759        Nup205
    ## 1695  1.961811e-06  7.432174e-06        True   ENSMUSG00000035772         Mrps2
    ## 1696  1.407043e-09  7.431646e-09        True   ENSMUSG00000021737         Psmd6
    ## 1697  4.399498e-09  2.218781e-08        True   ENSMUSG00000028677        Rnf220
    ## 1698  2.977523e-06  1.104949e-05        True   ENSMUSG00000060090           Rp2
    ## 1699  4.440160e-13  3.251638e-12        True   ENSMUSG00000048170         Mcmbp
    ## 1700  2.817500e-11  1.750335e-10        True   ENSMUSG00000020224          Llph
    ## 1701  5.546663e-10  3.052392e-09        True   ENSMUSG00000029454      Mapkapk5
    ## 1702  5.546663e-10  3.052392e-09        True   ENSMUSG00000105340          <NA>
    ## 1703  2.790663e-04  7.823849e-04        True   ENSMUSG00000014980        Tsen15
    ## 1704  3.602634e-20  4.505972e-19        True   ENSMUSG00000063884         Ptcd3
    ## 1705  1.535856e-18  1.719039e-17        True   ENSMUSG00000027423          Snx5
    ## 1706  9.289421e-14  7.237592e-13        True   ENSMUSG00000022742          Cpox
    ## 1707  7.025921e-12  4.610436e-11        True   ENSMUSG00000031068         Glrx3
    ## 1708  1.597521e-06  6.135033e-06        True   ENSMUSG00000071652         Ints5
    ## 1709  5.043467e-03  1.127737e-02        True   ENSMUSG00000054065          Pkp3
    ## 1710  2.703021e-03  6.401486e-03        True   ENSMUSG00000036615         Rfxap
    ## 1711  4.064600e-19  4.759515e-18        True   ENSMUSG00000050114        Prdx6b
    ## 1712  4.064600e-19  4.759515e-18        True   ENSMUSG00000026701         Prdx6
    ## 1713  8.619543e-10  4.655778e-09        True   ENSMUSG00000019988         Nedd1
    ## 1714  6.711726e-04  1.768388e-03        True   ENSMUSG00000040302         Rbm48
    ## 1715  5.409329e-07  2.193394e-06        True   ENSMUSG00000059920 4930453N24Rik
    ## 1716  5.003673e-13  3.647589e-12        True   ENSMUSG00000063953          Amd2
    ## 1717  5.003673e-13  3.647589e-12        True   ENSMUSG00000075232          Amd1
    ## 1718  1.876906e-07  7.985602e-07        True   ENSMUSG00000070699         Sars2
    ## 1719  1.117887e-15  9.969232e-15        True   ENSMUSG00000074643         Cpne1
    ## 1720  4.471487e-08  2.054620e-07        True   ENSMUSG00000035890        Rnf126
    ## 1721  5.284032e-15  4.482026e-14        True   ENSMUSG00000017264       Exosc10
    ## 1722  9.380796e-19  1.066406e-17        True   ENSMUSG00000029623         Pdap1
    ## 1723  1.563365e-21  2.136020e-20        True   ENSMUSG00000061477          Rps7
    ## 1724  1.006604e-20  1.316147e-19        True   ENSMUSG00000031299         Pdha1
    ## 1725  3.569037e-09  1.818911e-08        True   ENSMUSG00000027427        Polr3f
    ## 1726  1.636946e-13  1.255175e-12        True   ENSMUSG00000037773        Pced1a
    ## 1727  1.239032e-06  4.818558e-06        True   ENSMUSG00000032583         Mon1a
    ## 1728  1.030594e-02  2.151719e-02        True   ENSMUSG00000051373         Plpp7
    ## 1729  2.027459e-05  6.743559e-05        True   ENSMUSG00000022833        Ccdc14
    ## 1730  6.343834e-05  1.962497e-04        True   ENSMUSG00000027394           Ttl
    ## 1731  8.299500e-21  1.091026e-19        True   ENSMUSG00000031545         Gpat4
    ## 1732  6.533114e-20  8.026684e-19        True   ENSMUSG00000009470         Tnpo1
    ## 1733  5.631876e-23  8.454165e-22        True   ENSMUSG00000023484          Prph
    ## 1734  1.535887e-19  1.845838e-18        True   ENSMUSG00000019777         Hdac2
    ## 1735  2.399634e-10  1.365406e-09        True   ENSMUSG00000010045       Tmem115
    ## 1736  3.081212e-11  1.903795e-10        True   ENSMUSG00000031601         Cnot7
    ## 1737  7.159972e-08  3.198855e-07        True   ENSMUSG00000024067         Dpy30
    ## 1738  3.865585e-17  3.887980e-16        True   ENSMUSG00000041438          Utp4
    ## 1739  4.992928e-11  3.019578e-10        True   ENSMUSG00000007833      Aldh16a1
    ## 1740  9.701489e-13  6.886764e-12        True   ENSMUSG00000058440          Nrf1
    ## 1741  8.152077e-05  2.489103e-04        True   ENSMUSG00000018923         Med11
    ## 1742  1.168417e-07  5.121283e-07        True   ENSMUSG00000027086       Fastkd1
    ## 1743  2.910532e-08  1.361658e-07        True   ENSMUSG00000026436          Elk4
    ## 1744  4.176425e-13  3.066936e-12        True   ENSMUSG00000039130        Zc3hc1
    ## 1745  1.126883e-08  5.479017e-08        True   ENSMUSG00000003604          Aven
    ## 1746  1.597062e-04  4.679557e-04        True   ENSMUSG00000020453         Patz1
    ## 1747  7.327455e-14  5.748238e-13        True   ENSMUSG00000001829          Clpb
    ## 1748  3.803083e-15  3.258736e-14        True   ENSMUSG00000027722        Spata5
    ## 1749  6.406622e-07  2.578145e-06        True   ENSMUSG00000030188        Magohb
    ## 1750  4.008519e-04  1.093494e-03        True   ENSMUSG00000047669        Msl3l2
    ## 1751  6.487320e-08  2.914641e-07        True   ENSMUSG00000023027          Atf1
    ## 1752  4.788202e-08  2.186670e-07        True   ENSMUSG00000038695         Josd2
    ## 1753  2.418093e-11  1.515174e-10        True   ENSMUSG00000037361         Sf3b6
    ## 1754  1.898965e-23  2.936134e-22        True   ENSMUSG00000000787         Ddx3x
    ## 1755  1.202251e-04  3.579858e-04        True   ENSMUSG00000028218        Cibar1
    ## 1756  2.762219e-05  9.011063e-05        True   ENSMUSG00000018196         Glrx2
    ## 1757  5.624969e-07  2.277941e-06        True   ENSMUSG00000019373         Cops3
    ## 1758  2.772670e-13  2.071333e-12        True   ENSMUSG00000017221         Psmd3
    ## 1759  1.390794e-04  4.106055e-04        True   ENSMUSG00000048546          Tob2
    ## 1760  2.825441e-04  7.914054e-04        True   ENSMUSG00000028470         Hint2
    ## 1761  2.387837e-03  5.713637e-03        True   ENSMUSG00000048450          Msx1
    ## 1762  8.353562e-05  2.547701e-04        True   ENSMUSG00000090394 4930523C07Rik
    ## 1763  5.542255e-03  1.228263e-02        True   ENSMUSG00000044786         Zfp36
    ## 1764  4.918976e-10  2.728930e-09        True   ENSMUSG00000015363         Trabd
    ## 1765  4.647135e-18  4.968142e-17        True   ENSMUSG00000049517         Rps23
    ## 1766  1.037812e-10  6.094093e-10        True   ENSMUSG00000020978        Klhdc2
    ## 1767  3.920768e-13  2.895169e-12        True   ENSMUSG00000032381        Ciao2a
    ## 1768  1.684389e-03  4.141397e-03        True   ENSMUSG00000034300        Fam53c
    ## 1769  2.905399e-04  8.115605e-04        True   ENSMUSG00000048997       Atxn7l2
    ## 1770  8.008509e-11  4.748029e-10        True   ENSMUSG00000018974         Sart3
    ## 1771  8.180163e-18  8.573069e-17        True   ENSMUSG00000016921         Srsf6
    ## 1772  8.801861e-15  7.348841e-14        True   ENSMUSG00000042590         Ipo11
    ## 1773  1.182396e-08  5.731483e-08        True   ENSMUSG00000034032         Rpap1
    ## 1774  6.713870e-16  6.106716e-15        True   ENSMUSG00000020430          Pes1
    ## 1775  1.428923e-22  2.071031e-21        True   ENSMUSG00000040648       Ppip5k2
    ## 1776  2.513936e-04  7.101624e-04        True   ENSMUSG00000004018         Fancl
    ## 1777  5.642414e-18  5.996050e-17        True   ENSMUSG00000047246         H2bc6
    ## 1778  1.363765e-03  3.410907e-03        True   ENSMUSG00000020133 2310011J03Rik
    ## 1779  1.401551e-05  4.777117e-05        True   ENSMUSG00000036561        Ppp6r2
    ## 1780  6.445642e-24  1.026419e-22        True   ENSMUSG00000058355         Abce1
    ## 1781  1.462300e-06  5.636791e-06        True   ENSMUSG00000029836          Cbx3
    ## 1782  5.910790e-05  1.834217e-04        True   ENSMUSG00000020328        Nudcd2
    ## 1783  4.661980e-10  2.592658e-09        True   ENSMUSG00000048012        Zfp473
    ## 1784  2.919562e-05  9.477894e-05        True   ENSMUSG00000118125          <NA>
    ## 1785  2.919562e-05  9.477894e-05        True   ENSMUSG00000079478         Znrd2
    ## 1786  1.006969e-20  1.316147e-19        True   ENSMUSG00000021149        Gtpbp4
    ## 1787  1.699752e-24  2.825020e-23        True   ENSMUSG00000022234          Cct5
    ## 1788  2.879575e-20  3.627174e-19        True   ENSMUSG00000050953          Gja1
    ## 1789  7.543567e-17  7.405400e-16        True   ENSMUSG00000030751         Psma1
    ## 1790  7.101269e-10  3.873684e-09        True   ENSMUSG00000029486         Mrpl1
    ## 1791  2.951203e-06  1.095945e-05        True   ENSMUSG00000024369         Nelfe
    ## 1792  1.024481e-07  4.512690e-07        True   ENSMUSG00000013833         Med16
    ## 1793  1.408548e-04  4.155398e-04        True   ENSMUSG00000022668        Gtpbp8
    ## 1794  1.537158e-12  1.074934e-11        True   ENSMUSG00000027649       Ctnnbl1
    ## 1795  1.156234e-08  5.611475e-08        True   ENSMUSG00000056305         Usp39
    ## 1796  2.715773e-18  2.975057e-17        True   ENSMUSG00000003360         Ddx23
    ## 1797  1.003106e-15  8.980724e-15        True   ENSMUSG00000036112        Metap2
    ## 1798  1.073921e-02  2.231095e-02        True   ENSMUSG00000002661        Alkbh7
    ## 1799  5.770271e-06  2.068285e-05        True   ENSMUSG00000025413          Ttc4
    ## 1800  7.066686e-09  3.500600e-08        True   ENSMUSG00000068290        Ddrgk1
    ## 1801  7.346764e-32  1.786035e-30        True   ENSMUSG00000023944      Hsp90ab1
    ## 1802  7.327079e-10  3.988688e-09        True   ENSMUSG00000025762        Larp1b
    ## 1803  5.994507e-23  8.956433e-22        True   ENSMUSG00000031660          Brd7
    ## 1804  1.646865e-11  1.049211e-10        True   ENSMUSG00000028676        Srsf10
    ## 1805  2.507069e-15  2.182175e-14        True   ENSMUSG00000030278         Cidec
    ## 1806  1.250302e-18  1.410298e-17        True   ENSMUSG00000040782          Cop1
    ## 1807  1.597698e-09  8.396984e-09        True   ENSMUSG00000029466        Anapc7
    ## 1808  1.152182e-08  5.593512e-08        True   ENSMUSG00000050619       Zscan29
    ## 1809  2.113069e-03  5.100489e-03        True   ENSMUSG00000036114        Rpp25l
    ## 1810  1.899985e-14  1.555436e-13        True   ENSMUSG00000017478        Zc3h18
    ## 1811  2.906818e-08  1.360319e-07        True   ENSMUSG00000038812       Trmt112
    ## 1812  1.689044e-17  1.737116e-16        True   ENSMUSG00000052146         Rps10
    ## 1813  8.973371e-19  1.023733e-17        True   ENSMUSG00000020463       Ppp4r3b
    ## 1814  5.658752e-10  3.111243e-09        True   ENSMUSG00000053897       Slc39a8
    ## 1815  1.924199e-02  3.751166e-02        True   ENSMUSG00000018983          E2f2
    ## 1816  7.035405e-07  2.818397e-06        True   ENSMUSG00000026097        Ormdl1
    ## 1817  1.506350e-09  7.940406e-09        True   ENSMUSG00000029141      Slc4a1ap
    ## 1818  8.515883e-11  5.036512e-10        True   ENSMUSG00000034820         Cpsf7
    ## 1819  3.822684e-07  1.572390e-06        True   ENSMUSG00000000355         Mcts1
    ## 1820  1.632230e-10  9.431975e-10        True   ENSMUSG00000016181         Utp25
    ## 1821  2.081354e-05  6.909870e-05        True   ENSMUSG00000024537         Psmg2
    ## 1822  1.316831e-13  1.016059e-12        True   ENSMUSG00000063888        Rpl7l1
    ## 1823  2.539155e-12  1.739082e-11        True   ENSMUSG00000022314         Rad21
    ## 1824  1.716165e-04  5.001931e-04        True   ENSMUSG00000009640         Dmap1
    ## 1825  2.670522e-10  1.514149e-09        True   ENSMUSG00000024498        Tcerg1
    ## 1826  1.287059e-07  5.602865e-07        True   ENSMUSG00000025898       Cwf19l2
    ## 1827  5.374224e-17  5.318284e-16        True   ENSMUSG00000021039          Snw1
    ## 1828  1.067935e-08  5.206674e-08        True   ENSMUSG00000009535          Rnmt
    ## 1829  2.512867e-20  3.172768e-19        True   ENSMUSG00000000751          Rpa1
    ## 1830  1.305562e-06  5.067422e-06        True   ENSMUSG00000078695         Cisd3
    ## 1831  3.985144e-05  1.268448e-04        True   ENSMUSG00000031429        Psmd10
    ## 1832  2.893913e-15  2.506593e-14        True   ENSMUSG00000032078          Zpr1
    ## 1833  6.078586e-07  2.452935e-06        True   ENSMUSG00000022827         Rabl3
    ## 1834  2.324497e-06  8.731624e-06        True   ENSMUSG00000040414      Slc25a28
    ## 1835  3.667611e-05  1.174447e-04        True   ENSMUSG00000025940        Tmem70
    ## 1836  2.020679e-06  7.640692e-06        True   ENSMUSG00000071573          Rnls
    ## 1837  5.113252e-13  3.724071e-12        True   ENSMUSG00000000420        Galnt1
    ## 1838  1.802847e-11  1.144478e-10        True   ENSMUSG00000071054          Safb
    ## 1839  6.932562e-08  3.105073e-07        True   ENSMUSG00000056900         Usp13
    ## 1840  1.913554e-06  7.268319e-06        True   ENSMUSG00000023791          Pigx
    ## 1841  2.703357e-03  6.401486e-03        True   ENSMUSG00000026888         Grb14
    ## 1842  2.331644e-16  2.203610e-15        True   ENSMUSG00000027429        Sec23b
    ## 1843  1.152309e-02  2.380942e-02        True   ENSMUSG00000098640       Gm14214
    ## 1844  3.318323e-07  1.376273e-06        True   ENSMUSG00000020766         Galk1
    ## 1845  8.827014e-08  3.907569e-07        True   ENSMUSG00000039656          Rxrb
    ## 1846  3.675849e-07  1.515896e-06        True   ENSMUSG00000006906        Stambp
    ## 1847  2.089839e-08  9.919436e-08        True   ENSMUSG00000081906      Rpl9-ps1
    ## 1848  1.054638e-05  3.655530e-05        True   ENSMUSG00000029463       Fam216a
    ## 1849  1.143919e-22  1.667032e-21        True   ENSMUSG00000025060           Slk
    ## 1850  4.020800e-12  2.706288e-11        True   ENSMUSG00000024826          Dpf2
    ## 1851  3.806505e-06  1.393160e-05        True   ENSMUSG00000026172         Bcs1l
    ## 1852  3.772783e-18  4.071547e-17        True   ENSMUSG00000027455        Nsfl1c
    ## 1853  1.555003e-07  6.690869e-07        True   ENSMUSG00000021774        Ube2e1
    ## 1854  5.348393e-04  1.430657e-03        True   ENSMUSG00000021906        Oxnad1
    ## 1855  1.209880e-17  1.254004e-16        True   ENSMUSG00000027170         Eif3m
    ## 1856  3.372598e-11  2.073408e-10        True   ENSMUSG00000031575         Ash2l
    ## 1857  1.002697e-09  5.383217e-09        True   ENSMUSG00000051256         Jagn1
    ## 1858  1.238009e-20  1.607601e-19        True   ENSMUSG00000020075         Ddx21
    ## 1859  5.789532e-10  3.180956e-09        True   ENSMUSG00000029440         Psmd9
    ## 1860  1.601251e-11  1.021781e-10        True   ENSMUSG00000052033         Pfdn4
    ## 1861  1.474795e-17  1.523637e-16        True   ENSMUSG00000041459        Tardbp
    ## 1862  3.986578e-18  4.284901e-17        True   ENSMUSG00000021012        Zc3h14
    ## 1863  6.324100e-17  6.242802e-16        True   ENSMUSG00000027566         Psma7
    ## 1864  5.407940e-05  1.688673e-04        True   ENSMUSG00000011158          Brf1
    ## 1865  1.733112e-05  5.830091e-05        True   ENSMUSG00000030423          Pop4
    ## 1866  4.687823e-04  1.267331e-03        True   ENSMUSG00000075327         Zbtb2
    ## 1867  1.172846e-03  2.966852e-03        True   ENSMUSG00000055660        Mettl4
    ## 1868  5.660983e-07  2.290783e-06        True   ENSMUSG00000021606        Ndufs6
    ## 1869  5.646422e-11  3.394229e-10        True   ENSMUSG00000007589         Tinf2
    ## 1870  6.659753e-07  2.676637e-06        True   ENSMUSG00000026199        Ankzf1
    ## 1871  1.369575e-13  1.055227e-12        True   ENSMUSG00000028967        Errfi1
    ## 1872  7.927660e-10  4.295135e-09        True   ENSMUSG00000021775         Nr1d2
    ## 1873  4.280666e-07  1.753547e-06        True   ENSMUSG00000042369         Rbm45
    ## 1874  3.829382e-07  1.574334e-06        True   ENSMUSG00000052406         Rexo4
    ## 1875  4.856080e-07  1.982651e-06        True   ENSMUSG00000021260        Hhipl1
    ## 1876  4.954352e-04  1.335317e-03        True   ENSMUSG00000029273       Sult1d1
    ## 1877  3.266197e-21  4.372817e-20        True   ENSMUSG00000030057          Cnbp
    ## 1878  7.071415e-12  4.638384e-11        True   ENSMUSG00000039285          Azi2
    ## 1879  2.262352e-06  8.514205e-06        True   ENSMUSG00000018659          Pnpo
    ## 1880  3.089863e-11  1.908402e-10        True   ENSMUSG00000089911       Mfsd14a
    ## 1881  7.365287e-18  7.734277e-17        True   ENSMUSG00000022641           Bbx
    ## 1882  1.759616e-07  7.518617e-07        True   ENSMUSG00000033075         Senp1
    ## 1883  6.331528e-13  4.586266e-12        True   ENSMUSG00000060073         Psma3
    ## 1884  3.061734e-06  1.134091e-05        True   ENSMUSG00000020993      Trappc6b
    ## 1885  1.423842e-04  4.196641e-04        True   ENSMUSG00000028331          Trmo
    ## 1886  7.097186e-11  4.234451e-10        True   ENSMUSG00000038250         Usp38
    ## 1887  6.843104e-04  1.799145e-03        True   ENSMUSG00000020333         Acsl6
    ## 1888  7.949679e-04  2.068626e-03        True   ENSMUSG00000038827       Abitram
    ## 1889  4.855575e-05  1.529348e-04        True   ENSMUSG00000029229         Chic2
    ## 1890  6.621132e-12  4.366339e-11        True   ENSMUSG00000059486        Kbtbd2
    ## 1891  6.001138e-10  3.292689e-09        True   ENSMUSG00000024404         Riok3
    ## 1892  2.152775e-03  5.191624e-03        True   ENSMUSG00000014767           Tbp
    ## 1893  3.294335e-06  1.215456e-05        True   ENSMUSG00000031533        Mrps31
    ## 1894  6.275549e-05  1.942790e-04        True   ENSMUSG00000020477        Mrps24
    ## 1895  3.686438e-07  1.519479e-06        True   ENSMUSG00000043998         Mgat2
    ## 1896  1.766220e-04  5.130036e-04        True   ENSMUSG00000040663         Clcf1
    ## 1897  1.841836e-13  1.405533e-12        True   ENSMUSG00000036438         Calm2
    ## 1898  7.974232e-10  4.318902e-09        True   ENSMUSG00000031922         Cep57
    ## 1899  1.531417e-08  7.356330e-08        True   ENSMUSG00000022022         Mtrf1
    ## 1900  7.540051e-06  2.663195e-05        True   ENSMUSG00000024414        Mrpl27
    ## 1901  8.950991e-06  3.135202e-05        True   ENSMUSG00000009566          Fpgs
    ## 1902  2.687194e-06  1.002797e-05        True   ENSMUSG00000024604         Rbm22
    ## 1903  1.016526e-17  1.057717e-16        True   ENSMUSG00000038914         Dido1
    ## 1904  9.906233e-18  1.032109e-16        True   ENSMUSG00000062937          Mtap
    ## 1905  3.410332e-06  1.255354e-05        True   ENSMUSG00000039308         Ndst2
    ## 1906  1.740786e-06  6.653228e-06        True   ENSMUSG00000031774      Psme3ip1
    ## 1907  3.782235e-06  1.384912e-05        True   ENSMUSG00000035769          Xylb
    ## 1908  6.948638e-11  4.150473e-10        True   ENSMUSG00000031924         Cyb5b
    ## 1909  5.177152e-05  1.621362e-04        True   ENSMUSG00000021235          Coq6
    ## 1910  4.923015e-05  1.549673e-04        True   ENSMUSG00000072258         Taf1a
    ## 1911  1.414385e-02  2.851264e-02        True   ENSMUSG00000096199        Ptrhd1
    ## 1912  2.738523e-09  1.407779e-08        True   ENSMUSG00000022779         Top3b
    ## 1913  2.460674e-07  1.034805e-06        True   ENSMUSG00000034175        Rhbdd3
    ## 1914  1.451586e-05  4.935022e-05        True   ENSMUSG00000050705 2310061I04Rik
    ## 1915  1.772158e-12  1.231719e-11        True   ENSMUSG00000024785          Rcl1
    ## 1916  1.670325e-03  4.111965e-03        True   ENSMUSG00000018761         Mpdu1
    ## 1917  1.016303e-11  6.563846e-11        True   ENSMUSG00000029480         Dhx37
    ## 1918  2.663649e-16  2.505524e-15        True   ENSMUSG00000057110         Cntrl
    ## 1919  1.276596e-04  3.787813e-04        True   ENSMUSG00000021846         Peli2
    ## 1920  1.454840e-21  1.997997e-20        True   ENSMUSG00000028452           Vcp
    ## 1921  2.491820e-09  1.286755e-08        True   ENSMUSG00000024007         Ppil1
    ## 1922  4.731872e-23  7.143427e-22        True   ENSMUSG00000041028         Ghitm
    ## 1923  9.501283e-03  2.000455e-02        True   ENSMUSG00000074754        Smim26
    ## 1924  3.883201e-14  3.101124e-13        True   ENSMUSG00000020929        Eftud2
    ## 1925  2.153325e-10  1.231837e-09        True   ENSMUSG00000002949        Timm44
    ## 1926  2.659283e-18  2.919180e-17        True   ENSMUSG00000031353         Rbbp7
    ## 1927  1.044541e-04  3.135978e-04        True   ENSMUSG00000034266          Batf
    ## 1928  1.784475e-05  5.986482e-05        True   ENSMUSG00000026820        Ptges2
    ## 1929  1.500026e-12  1.049887e-11        True   ENSMUSG00000057541          Pus7
    ## 1930  1.117204e-18  1.265531e-17        True   ENSMUSG00000024966         Stip1
    ## 1931  9.510831e-07  3.751716e-06        True   ENSMUSG00000093593          <NA>
    ## 1932  4.867885e-06  1.763035e-05        True   ENSMUSG00000032044        Rpusd4
    ## 1933  8.225265e-11  4.872920e-10        True   ENSMUSG00000021840     Mapk1ip1l
    ## 1934  5.330509e-05  1.665797e-04        True   ENSMUSG00000007338        Mrpl49
    ## 1935  4.804899e-04  1.296568e-03        True   ENSMUSG00000062526         Mppe1
    ## 1936  8.993871e-05  2.727361e-04        True   ENSMUSG00000034317        Trim59
    ## 1937  3.478767e-20  4.354457e-19        True   ENSMUSG00000034024          Cct2
    ## 1938  1.803710e-07  7.692621e-07        True   ENSMUSG00000003135        Cnot11
    ## 1939  8.440350e-11  4.996637e-10        True   ENSMUSG00000029152        Ociad1
    ## 1940  3.265697e-15  2.813361e-14        True   ENSMUSG00000029390         Tmed2
    ## 1941  1.544363e-06  5.939456e-06        True   ENSMUSG00000118135          <NA>
    ## 1942  1.544363e-06  5.939456e-06        True   ENSMUSG00000057411        Antkmt
    ## 1943  1.488339e-12  1.042620e-11        True   ENSMUSG00000007411         Mark3
    ## 1944  2.876390e-04  8.047243e-04        True   ENSMUSG00000034259        Exosc4
    ## 1945  1.415223e-10  8.222605e-10        True   ENSMUSG00000020116          Pno1
    ## 1946  1.669833e-02  3.313938e-02        True   ENSMUSG00000089832        Shkbp1
    ## 1947  3.249101e-08  1.514730e-07        True   ENSMUSG00000039629        Strip2
    ## 1948  2.540852e-13  1.911563e-12        True   ENSMUSG00000003068         Stk11
    ## 1949  1.428871e-09  7.541945e-09        True   ENSMUSG00000029050           Ski
    ## 1950  3.003038e-05  9.733061e-05        True   ENSMUSG00000025626          Phf6
    ## 1951  1.849545e-09  9.660215e-09        True   ENSMUSG00000001847          Rac1
    ## 1952  3.756147e-03  8.632112e-03        True   ENSMUSG00000013419        Zfp651
    ## 1953  3.802435e-06  1.391989e-05        True   ENSMUSG00000021962         Dcp1a
    ## 1954  2.471766e-11  1.545773e-10        True   ENSMUSG00000024212         Mllt1
    ## 1955  1.575482e-18  1.760923e-17        True   ENSMUSG00000040549         Ckap5
    ## 1956  1.582295e-03  3.910927e-03        True   ENSMUSG00000045100      Slc25a26
    ## 1957  5.356013e-15  4.540671e-14        True   ENSMUSG00000063511       Snrnp70
    ## 1958  2.972932e-07  1.238812e-06        True   ENSMUSG00000029521         Chek2
    ## 1959  4.151153e-11  2.528689e-10        True   ENSMUSG00000039515          Ptpa
    ## 1960  5.959514e-14  4.707485e-13        True   ENSMUSG00000025995         Wdr75
    ## 1961  2.082017e-03  5.033906e-03        True   ENSMUSG00000023971         Rrp36
    ## 1962  7.577341e-03  1.632609e-02        True   ENSMUSG00000025381         Cnpy2
    ## 1963  4.636838e-08  2.123877e-07        True   ENSMUSG00000024422         Dhx16
    ## 1964  6.130379e-04  1.622980e-03        True   ENSMUSG00000009563         Tor2a
    ## 1965  3.655159e-07  1.508143e-06        True   ENSMUSG00000048379         Socs4
    ## 1966  2.314477e-09  1.199832e-08        True   ENSMUSG00000040455         Usp45
    ## 1967  4.385174e-05  1.388305e-04        True   ENSMUSG00000039048       Foxred1
    ## 1968  8.623480e-09  4.235370e-08        True   ENSMUSG00000026849         Tor1a
    ## 1969  6.914269e-09  3.429649e-08        True   ENSMUSG00000025487        Psmd13
    ## 1970  5.979105e-10  3.281727e-09        True   ENSMUSG00000015748         Prpf3
    ## 1971  3.271192e-06  1.207755e-05        True   ENSMUSG00000021189         Atxn3
    ## 1972  1.216320e-03  3.068077e-03        True   ENSMUSG00000075227        Znhit2
    ## 1973  9.242834e-16  8.312305e-15        True   ENSMUSG00000021134         Srsf5
    ## 1974  1.464261e-09  7.723638e-09        True   ENSMUSG00000110234       Timm10b
    ## 1975  1.464261e-09  7.723638e-09        True   ENSMUSG00000089847       Timm10b
    ## 1976  2.186578e-18  2.415216e-17        True   ENSMUSG00000043733        Ptpn11
    ## 1977  3.373697e-05  1.087042e-04        True   ENSMUSG00000060950       Trmt61a
    ## 1978  5.952298e-03  1.309866e-02        True   ENSMUSG00000042202       Slc35e2
    ## 1979  1.432973e-02  2.884002e-02        True   ENSMUSG00000047867        Gimap6
    ## 1980  8.350127e-03  1.784190e-02        True   ENSMUSG00000057278         Snrpg
    ## 1981  2.437844e-04  6.903766e-04        True   ENSMUSG00000021868          Ppif
    ## 1982  8.711830e-17  8.484472e-16        True   ENSMUSG00000018160          Med1
    ## 1983  9.107420e-08  4.029466e-07        True   ENSMUSG00000036632          Alg5
    ## 1984  2.188774e-10  1.250773e-09        True   ENSMUSG00000020288         Ahsa2
    ## 1985  8.478504e-08  3.760585e-07        True   ENSMUSG00000067995        Gtf2f2
    ## 1986  3.668288e-03  8.455750e-03        True   ENSMUSG00000038930         Rccd1
    ## 1987  1.403537e-13  1.079311e-12        True   ENSMUSG00000030704         Rab6a
    ## 1988  2.773014e-05  9.040739e-05        True   ENSMUSG00000028393          Alad
    ## 1989  9.407751e-10  5.062689e-09        True   ENSMUSG00000003923          Tfam
    ## 1990  2.965540e-21  3.983650e-20        True   ENSMUSG00000005981         Trap1
    ## 1991  7.051492e-13  5.089310e-12        True   ENSMUSG00000001380          Hars
    ## 1992  2.567379e-07  1.077409e-06        True   ENSMUSG00000025899        Alkbh8
    ## 1993  1.171994e-07  5.135552e-07        True   ENSMUSG00000095105       Edaradd
    ## 1994  1.081071e-20  1.411846e-19        True   ENSMUSG00000020608          Smc6
    ## 1995  3.088801e-03  7.244396e-03        True   ENSMUSG00000022787         Wdr53
    ## 1996  2.311469e-06  8.688818e-06        True   ENSMUSG00000034930          Rtkn
    ## 1997  2.090782e-13  1.587920e-12        True   ENSMUSG00000024999         Noc3l
    ## 1998  2.633801e-08  1.239819e-07        True   ENSMUSG00000035342         Lzts2
    ## 1999  2.409489e-09  1.246659e-08        True   ENSMUSG00000021764        Ndufs4
    ## 2000  3.090109e-03  7.246398e-03        True   ENSMUSG00000039737       Prkrip1
    ## 2001  4.752574e-14  3.774645e-13        True   ENSMUSG00000030846         Tial1
    ## 2002  4.497368e-13  3.290516e-12        True   ENSMUSG00000016018         Mtrex
    ## 2003  3.639994e-13  2.696567e-12        True   ENSMUSG00000042508         Dmtf1
    ## 2004  1.329218e-04  3.932989e-04        True   ENSMUSG00000042569        Dhrs7b
    ## 2005  4.450828e-03  1.010068e-02        True   ENSMUSG00000011658           Fuz
    ## 2006  4.474742e-04  1.211366e-03        True   ENSMUSG00000029127        Zbtb49
    ## 2007  1.596911e-12  1.115254e-11        True   ENSMUSG00000062014          Gmfb
    ## 2008  1.320757e-05  4.522970e-05        True   ENSMUSG00000022130          Tgds
    ## 2009  7.139275e-03  1.545940e-02        True   ENSMUSG00000052298      Cdc42se2
    ## 2010  6.953831e-08  3.113725e-07        True   ENSMUSG00000031358          Msl3
    ## 2011  3.903054e-10  2.181994e-09        True   ENSMUSG00000027641          Rbl1
    ## 2012  4.905108e-13  3.579483e-12        True   ENSMUSG00000027782         Kpna4
    ## 2013  3.073237e-09  1.570241e-08        True   ENSMUSG00000031885          Cbfb
    ## 2014  2.565566e-08  1.208973e-07        True   ENSMUSG00000022023          Wbp4
    ## 2015  1.769043e-02  3.480556e-02        True   ENSMUSG00000049728        Zfp668
    ## 2016  2.096893e-17  2.145521e-16        True   ENSMUSG00000032295        Man2c1
    ## 2017  2.214664e-22  3.180990e-21        True   ENSMUSG00000056076         Eif3b
    ## 2018  4.226619e-06  1.538108e-05        True   ENSMUSG00000051615         Rap2a
    ## 2019  4.245393e-17  4.243267e-16        True   ENSMUSG00000028948          Nol9
    ## 2020  7.123139e-13  5.127120e-12        True   ENSMUSG00000019143         Hars2
    ## 2021  3.805733e-05  1.214489e-04        True   ENSMUSG00000019866        Crybg1
    ## 2022  5.901119e-05  1.831928e-04        True   ENSMUSG00000030678           Maz
    ## 2023  5.204694e-07  2.117946e-06        True   ENSMUSG00000020257         Wdr82
    ## 2024  2.092325e-07  8.873767e-07        True   ENSMUSG00000029267          Mtf2
    ## 2025  1.142784e-02  2.363402e-02        True   ENSMUSG00000068264         Ap5s1
    ## 2026  8.088237e-03  1.732868e-02        True   ENSMUSG00000041375         Ccdc9
    ## 2027  4.092283e-11  2.494730e-10        True   ENSMUSG00000020697          Lig3
    ## 2028  6.766341e-07  2.717425e-06        True   ENSMUSG00000020537          Drg2
    ## 2029  1.749674e-15  1.539713e-14        True   ENSMUSG00000029578         Wipi2
    ## 2030  4.933962e-05  1.552507e-04        True   ENSMUSG00000056310          Tyw1
    ## 2031  1.980374e-10  1.137789e-09        True   ENSMUSG00000022799      Arhgap31
    ## 2032  5.041229e-10  2.791904e-09        True   ENSMUSG00000010936         Vac14
    ## 2033  1.150311e-11  7.402406e-11        True   ENSMUSG00000078185          Chml
    ## 2034  2.449311e-04  6.933782e-04        True   ENSMUSG00000027854         Sike1
    ## 2035  1.747830e-05  5.873416e-05        True   ENSMUSG00000045160         Bola3
    ## 2036  4.280456e-04  1.161921e-03        True   ENSMUSG00000040811          Eml2
    ## 2037  3.103060e-10  1.752549e-09        True   ENSMUSG00000026766        Mmadhc
    ## 2038  2.212557e-04  6.318428e-04        True   ENSMUSG00000026565        Pou2f1
    ## 2039  2.118800e-23  3.263402e-22        True   ENSMUSG00000042406          Atf4
    ## 2040  3.853535e-10  2.155820e-09        True   ENSMUSG00000038525        Armc10
    ## 2041  1.914155e-08  9.118069e-08        True   ENSMUSG00000014550          Rbsn
    ## 2042  2.986570e-10  1.687951e-09        True   ENSMUSG00000021549         Rasa1
    ## 2043  6.183696e-07  2.493461e-06        True   ENSMUSG00000038000           Acd
    ## 2044  3.158097e-13  2.346099e-12        True   ENSMUSG00000000326          Comt
    ## 2045  3.547828e-18  3.849587e-17        True   ENSMUSG00000040675       Mthfd1l
    ## 2046  1.443196e-03  3.589338e-03        True   ENSMUSG00000025956      Mettl21a
    ## 2047  8.835650e-03  1.874890e-02        True   ENSMUSG00000019891        Dcbld1
    ## 2048  2.666162e-06  9.956498e-06        True   ENSMUSG00000025157       Zdhhc16
    ## 2049  6.801766e-07  2.730965e-06        True   ENSMUSG00000070730         Rmdn3
    ## 2050  2.630739e-14  2.130738e-13        True   ENSMUSG00000000563        Atp5pb
    ## 2051  1.028829e-07  4.530591e-07        True   ENSMUSG00000028018         Gstcd
    ## 2052  8.237905e-14  6.440324e-13        True   ENSMUSG00000014769         Psmb1
    ## 2053  9.739345e-16  8.729338e-15        True   ENSMUSG00000029191          Rfc1
    ## 2054  2.353159e-09  1.218698e-08        True   ENSMUSG00000039069          Mtg2
    ## 2055  4.188720e-11  2.549628e-10        True   ENSMUSG00000033364         Usp37
    ## 2056  1.478954e-03  3.673122e-03        True   ENSMUSG00000001524        Gtf2h4
    ## 2057  8.822628e-10  4.757428e-09        True   ENSMUSG00000067873       Htatsf1
    ## 2058  8.485933e-11  5.021761e-10        True   ENSMUSG00000063785        Utp14a
    ## 2059  1.113418e-06  4.361911e-06        True   ENSMUSG00000015672        Mrpl32
    ## 2060  5.822968e-15  4.923475e-14        True   ENSMUSG00000025428        Atp5a1
    ## 2061  6.783029e-09  3.368736e-08        True   ENSMUSG00000043183         Simc1
    ## 2062  5.206748e-08  2.366596e-07        True   ENSMUSG00000026374           Tsn
    ## 2063  6.932031e-09  3.437392e-08        True   ENSMUSG00000048109         Rbm15
    ## 2064  4.567076e-12  3.058505e-11        True   ENSMUSG00000025817         Nudt5
    ## 2065  4.985754e-09  2.508109e-08        True   ENSMUSG00000069089          Cdk7
    ## 2066  1.380950e-06  5.345744e-06        True   ENSMUSG00000038023      Atp6v0a2
    ## 2067  6.968509e-04  1.830910e-03        True   ENSMUSG00000008384       Sertad1
    ## 2068  1.270469e-12  8.947060e-12        True   ENSMUSG00000022665        Ccdc80
    ## 2069  4.024396e-16  3.721926e-15        True   ENSMUSG00000042520        Ubap2l
    ## 2070  1.633577e-03  4.027708e-03        True   ENSMUSG00000040552         C3ar1
    ## 2071  7.088520e-18  7.463272e-17        True   ENSMUSG00000010095        Slc3a2
    ## 2072  4.453091e-13  3.259614e-12        True   ENSMUSG00000015671         Psma2
    ## 2073  2.503691e-12  1.717001e-11        True   ENSMUSG00000028879         Stx12
    ## 2074  1.551552e-07  6.677821e-07        True   ENSMUSG00000034617          Mtrr
    ## 2075  1.483148e-07  6.400659e-07        True   ENSMUSG00000041671       Pyroxd1
    ## 2076  5.465485e-09  2.742530e-08        True   ENSMUSG00000026806         Ddx31
    ## 2077  2.143623e-08  1.016264e-07        True   ENSMUSG00000035828          Pim3
    ## 2078  1.653453e-06  6.341144e-06        True   ENSMUSG00000024847           Aip
    ## 2079  6.917611e-04  1.817836e-03        True   ENSMUSG00000071757          Zhx2
    ## 2080  1.511237e-14  1.242919e-13        True   ENSMUSG00000041846       Ppp4r3a
    ## 2081  1.452210e-13  1.115666e-12        True   ENSMUSG00000022682          Rrn3
    ## 2082  4.001560e-06  1.458866e-05        True   ENSMUSG00000029111         Nelfa
    ## 2083  1.782910e-13  1.361867e-12        True   ENSMUSG00000039041         Adrm1
    ## 2084  1.782910e-13  1.361867e-12        True   ENSMUSG00000042165        Gm9774
    ## 2085  1.705482e-02  3.376343e-02        True   ENSMUSG00000035530          Eif1
    ## 2086  1.570982e-15  1.385518e-14        True   ENSMUSG00000039768       Dnajc11
    ## 2087  1.916039e-12  1.327102e-11        True   ENSMUSG00000015714         Cers2
    ## 2088  8.044349e-08  3.576677e-07        True   ENSMUSG00000001082        Mfsd10
    ## 2089  1.291433e-11  8.263928e-11        True   ENSMUSG00000040322      Slc25a24
    ## 2090  3.751789e-16  3.479882e-15        True   ENSMUSG00000053289         Ddx10
    ## 2091  1.645345e-10  9.497451e-10        True   ENSMUSG00000048039       Isg20l2
    ## 2092  2.779986e-03  6.569307e-03        True   ENSMUSG00000025208        Mrpl43
    ## 2093  1.820311e-05  6.095180e-05        True   ENSMUSG00000038544          Inip
    ## 2094  1.411175e-20  1.825043e-19        True   ENSMUSG00000040725      Hnrnpul1
    ## 2095  4.156842e-08  1.916659e-07        True   ENSMUSG00000027332           Ivd
    ## 2096  1.804381e-06  6.883107e-06        True   ENSMUSG00000028102        Pex11b
    ## 2097  1.804684e-11  1.145189e-10        True   ENSMUSG00000022974        Paxbp1
    ## 2098  3.924139e-12  2.644226e-11        True   ENSMUSG00000030619           Eed
    ## 2099  4.521085e-18  4.839864e-17        True   ENSMUSG00000056537          Rlim
    ## 2100  3.807836e-11  2.329328e-10        True   ENSMUSG00000061559         Wdr61
    ## 2101  3.281552e-15  2.825496e-14        True   ENSMUSG00000061315          Naca
    ## 2102  1.998340e-04  5.751933e-04        True   ENSMUSG00000021431       Snrnp48
    ## 2103  2.561539e-13  1.926220e-12        True   ENSMUSG00000063316         Rpl27
    ## 2104  8.731596e-10  4.711522e-09        True   ENSMUSG00000033014        Trim33
    ## 2105  1.483926e-07  6.402285e-07        True   ENSMUSG00000028277        Ube2j1
    ## 2106  4.314734e-15  3.683320e-14        True   ENSMUSG00000055401         Fbxo6
    ## 2107  2.794606e-13  2.086744e-12        True   ENSMUSG00000079523        Tmsb10
    ## 2108  2.794606e-13  2.086744e-12        True   ENSMUSG00000091955        Gm9844
    ## 2109  4.449616e-05  1.407312e-04        True   ENSMUSG00000042148         Cox10
    ## 2110  1.336418e-09  7.067968e-09        True   ENSMUSG00000064181        Rab3ip
    ## 2111  2.567617e-15  2.233659e-14        True   ENSMUSG00000020089          Ppa1
    ## 2112  2.986471e-07  1.244129e-06        True   ENSMUSG00000074238         Ap1ar
    ## 2113  9.986301e-08  4.408546e-07        True   ENSMUSG00000070871        Ccnyl1
    ## 2114  2.859700e-04  8.001950e-04        True   ENSMUSG00000078970         Wdr92
    ## 2115  7.266325e-12  4.760367e-11        True   ENSMUSG00000032580          Rbm5
    ## 2116  3.308689e-11  2.036469e-10        True   ENSMUSG00000032215       Rsl24d1
    ## 2117  4.754831e-05  1.499687e-04        True   ENSMUSG00000019845         Tube1
    ## 2118  1.499312e-03  3.720214e-03        True   ENSMUSG00000023104          Rfc2
    ## 2119  2.036251e-16  1.931295e-15        True   ENSMUSG00000026229         Psmd1
    ## 2120  1.009655e-13  7.851128e-13        True   ENSMUSG00000042719         Naa25
    ## 2121  4.228803e-13  3.102547e-12        True   ENSMUSG00000036285          Noa1
    ## 2122  1.871227e-07  7.965681e-07        True   ENSMUSG00000008035       Mid1ip1
    ## 2123  1.726192e-04  5.024739e-04        True   ENSMUSG00000011096        Akt1s1
    ## 2124  5.169853e-16  4.740796e-15        True   ENSMUSG00000036752        Tubb4b
    ## 2125  9.306664e-13  6.621204e-12        True   ENSMUSG00000028837         Psmb2
    ## 2126  1.248711e-07  5.449293e-07        True   ENSMUSG00000037958         Nsrp1
    ## 2127  6.851520e-06  2.429134e-05        True   ENSMUSG00000000339          Rtca
    ## 2128  8.406058e-13  6.004542e-12        True   ENSMUSG00000030663 1110004F10Rik
    ## 2129  1.229325e-07  5.372033e-07        True   ENSMUSG00000022021        Diaph3
    ## 2130  5.918262e-04  1.570468e-03        True   ENSMUSG00000045690         Wdr89
    ## 2131  4.976991e-20  6.157436e-19        True   ENSMUSG00000004865         Srpk1
    ## 2132  1.384455e-02  2.798699e-02        True   ENSMUSG00000020544         Cox11
    ## 2133  3.996876e-06  1.457491e-05        True   ENSMUSG00000031458         Coprs
    ## 2134  2.215743e-07  9.377278e-07        True   ENSMUSG00000029911         Ssbp1
    ## 2135  1.350145e-09  7.138205e-09        True   ENSMUSG00000052397           Ezr
    ## 2136  2.700421e-08  1.270056e-07        True   ENSMUSG00000021018        Polr2h
    ## 2137  5.699889e-11  3.425080e-10        True   ENSMUSG00000006673        Qrich1
    ## 2138  1.424179e-10  8.271632e-10        True   ENSMUSG00000035851        Ythdc1
    ## 2139  5.021894e-05  1.576758e-04        True   ENSMUSG00000064128         Cenpj
    ## 2140  1.058295e-15  9.458918e-15        True   ENSMUSG00000073838          Tufm
    ## 2141  1.033883e-09  5.532055e-09        True   ENSMUSG00000032498          Mlh1
    ## 2142  4.314427e-17  4.309571e-16        True   ENSMUSG00000025781        Atp5c1
    ## 2143  1.424041e-06  5.500553e-06        True   ENSMUSG00000114378          <NA>
    ## 2144  1.424041e-06  5.500553e-06        True   ENSMUSG00000033111 3830406C13Rik
    ## 2145  6.700184e-09  3.329662e-08        True   ENSMUSG00000011306         Sugp1
    ## 2146  3.019927e-09  1.544485e-08        True   ENSMUSG00000026790          Odf2
    ## 2147  5.268106e-10  2.908475e-09        True   ENSMUSG00000040112        Mrps35
    ## 2148  3.453560e-04  9.538346e-04        True   ENSMUSG00000014907          Naf1
    ## 2149  7.784934e-12  5.087601e-11        True   ENSMUSG00000031770       Herpud1
    ## 2150  3.693814e-07  1.521733e-06        True   ENSMUSG00000021537         Cetn3
    ## 2151  9.026339e-10  4.860711e-09        True   ENSMUSG00000026558          Uck2
    ## 2152  4.601574e-08  2.109539e-07        True   ENSMUSG00000030096        Slc6a6
    ## 2153  7.086007e-13  5.107581e-12        True   ENSMUSG00000029148         Nrbp1
    ## 2154  1.418711e-08  6.835491e-08        True   ENSMUSG00000022702          Hira
    ## 2155  2.945545e-09  1.508376e-08        True   ENSMUSG00000027498         Cstf1
    ## 2156  6.025600e-06  2.154004e-05        True   ENSMUSG00000029062        Cdk11b
    ## 2157  9.207086e-12  5.963324e-11        True   ENSMUSG00000025728          Pigq
    ## 2158  2.200758e-03  5.297739e-03        True   ENSMUSG00000006941         Eif1b
    ## 2159  3.567315e-16  3.320347e-15        True   ENSMUSG00000049658          Bdp1
    ## 2160  1.746721e-13  1.334863e-12        True   ENSMUSG00000036180       Gatad2a
    ## 2161  5.311418e-07  2.156979e-06        True   ENSMUSG00000057572       Zbtb8os
    ## 2162  1.291602e-09  6.844550e-09        True   ENSMUSG00000001151          Pcnt
    ## 2163  2.896487e-09  1.485159e-08        True   ENSMUSG00000021948         Prkcd
    ## 2164  2.908729e-09  1.490684e-08        True   ENSMUSG00000026048         Ercc5
    ## 2165  2.908729e-09  1.490684e-08        True   ENSMUSG00000041684          Bivm
    ## 2166  1.333104e-08  6.440514e-08        True   ENSMUSG00000030747         Dgat2
    ## 2167  3.460018e-05  1.112388e-04        True   ENSMUSG00000062110         Scfd2
    ## 2168  2.013032e-05  6.698879e-05        True   ENSMUSG00000022092        Ppp3cc
    ## 2169  3.365806e-19  3.964502e-18        True   ENSMUSG00000025982         Sf3b1
    ## 2170  5.807201e-18  6.158873e-17        True   ENSMUSG00000063550         Nup98
    ## 2171  1.356820e-08  6.549147e-08        True   ENSMUSG00000028410        Dnaja1
    ## 2172  2.697607e-04  7.578922e-04        True   ENSMUSG00000027601         Mtfr1
    ## 2173  7.457134e-09  3.686331e-08        True   ENSMUSG00000029516           Cit
    ## 2174  8.232904e-19  9.426233e-18        True   ENSMUSG00000000131          Xpo6
    ## 2175  3.591295e-18  3.891463e-17        True   ENSMUSG00000030082       Sec61a1
    ## 2176  4.271954e-04  1.159810e-03        True   ENSMUSG00000036934 4921524J17Rik
    ## 2177  4.942273e-05  1.554816e-04        True   ENSMUSG00000046985         Tapt1
    ## 2178  2.552852e-05  8.370797e-05        True   ENSMUSG00000060475          Wtap
    ## 2179  1.322692e-05  4.527656e-05        True   ENSMUSG00000079555         Haus3
    ## 2180  9.345838e-09  4.576080e-08        True   ENSMUSG00000029029        Wrap73
    ## 2181  1.251107e-21  1.724132e-20        True   ENSMUSG00000035247        Hectd1
    ## 2182  5.146864e-11  3.106792e-10        True   ENSMUSG00000001016          Ilf2
    ## 2183  1.793594e-16  1.706211e-15        True   ENSMUSG00000031004         Mki67
    ## 2184  2.042679e-12  1.412367e-11        True   ENSMUSG00000054405        Dnajc8
    ## 2185  1.980622e-05  6.597391e-05        True   ENSMUSG00000002221        Paxip1
    ## 2186  2.604685e-10  1.478395e-09        True   ENSMUSG00000027395        Polr1b
    ## 2187  3.126783e-08  1.460263e-07        True   ENSMUSG00000027669          Gnb4
    ## 2188  8.348678e-07  3.309632e-06        True   ENSMUSG00000042901          Aida
    ## 2189  4.944623e-04  1.332920e-03        True   ENSMUSG00000022571         Pycrl
    ## 2190  6.144831e-08  2.767773e-07        True   ENSMUSG00000039849         Pcif1
    ## 2191  3.584030e-11  2.195785e-10        True   ENSMUSG00000040731         Eif4h
    ## 2192  5.916598e-07  2.389378e-06        True   ENSMUSG00000021400        Wrnip1
    ## 2193  4.985184e-11  3.016036e-10        True   ENSMUSG00000022372           Sla
    ## 2194  4.861866e-10  2.699121e-09        True   ENSMUSG00000022656       Nectin3
    ## 2195  3.543537e-03  8.203707e-03        True   ENSMUSG00000032184        Lysmd2
    ## 2196  2.815676e-11  1.749882e-10        True   ENSMUSG00000022390        Zc3h7b
    ## 2197  1.925089e-10  1.107221e-09        True   ENSMUSG00000038722         Bud31
    ## 2198  2.196940e-10  1.254990e-09        True   ENSMUSG00000038127        Ccdc50
    ## 2199  5.512827e-10  3.035190e-09        True   ENSMUSG00000055239         Kcmf1
    ## 2200  5.473251e-05  1.707398e-04        True   ENSMUSG00000067365       Tmem128
    ## 2201  5.646274e-09  2.828805e-08        True   ENSMUSG00000029500         Pgam5
    ## 2202  1.402107e-08  6.763654e-08        True   ENSMUSG00000037761         Actr5
    ## 2203  4.813580e-17  4.784225e-16        True   ENSMUSG00000024608         Rps14
    ## 2204  4.163000e-09  2.108162e-08        True   ENSMUSG00000027509          Rae1
    ## 2205  2.291223e-02  4.379538e-02        True   ENSMUSG00000028850       Gpatch3
    ## 2206  4.208489e-03  9.598800e-03        True   ENSMUSG00000110404        Rnf223
    ## 2207  4.432802e-10  2.466924e-09        True   ENSMUSG00000035967        Ints6l
    ## 2208  9.879082e-07  3.889295e-06        True   ENSMUSG00000028675         Pnrc2
    ## 2209  1.810394e-16  1.720143e-15        True   ENSMUSG00000052738        Suclg1
    ## 2210  8.104557e-06  2.850507e-05        True   ENSMUSG00000031393         Mecp2
    ## 2211  3.270334e-04  9.073088e-04        True   ENSMUSG00000022559         Fbxl6
    ## 2212  9.020891e-10  4.859415e-09        True   ENSMUSG00000038518        Jarid2
    ## 2213  5.207514e-05  1.628954e-04        True   ENSMUSG00000044433       Camsap3
    ## 2214  1.886276e-08  8.990630e-08        True   ENSMUSG00000026034          Clk1
    ## 2215  2.271974e-05  7.502165e-05        True   ENSMUSG00000020495          Smg8
    ## 2216  2.962885e-14  2.385242e-13        True   ENSMUSG00000017858         Ift52
    ## 2217  4.974279e-05  1.563518e-04        True   ENSMUSG00000033931         Rbm34
    ## 2218  6.050042e-09  3.020671e-08        True   ENSMUSG00000074781         Ube2n
    ## 2219  2.745292e-09  1.410804e-08        True   ENSMUSG00000001376         Vps50
    ## 2220  6.414139e-07  2.580520e-06        True   ENSMUSG00000036916       Zfp280c
    ## 2221  1.201450e-04  3.578434e-04        True   ENSMUSG00000030888          Rrp8
    ## 2222  1.151704e-04  3.437678e-04        True   ENSMUSG00000028848          Gpn2
    ## 2223  2.095134e-06  7.910989e-06        True   ENSMUSG00000031352          Hccs
    ## 2224  5.825885e-06  2.087282e-05        True   ENSMUSG00000017299       Dnttip1
    ## 2225  1.167101e-06  4.556573e-06        True   ENSMUSG00000031787        Katnb1
    ## 2226  6.447593e-15  5.437220e-14        True   ENSMUSG00000030138          Bms1
    ## 2227  3.947299e-08  1.826898e-07        True   ENSMUSG00000021494         Ddx41
    ## 2228  1.761585e-09  9.224930e-09        True   ENSMUSG00000032594         Ip6k1
    ## 2229  2.079521e-14  1.697195e-13        True   ENSMUSG00000001783          Rtcb
    ## 2230  1.420128e-04  4.187242e-04        True   ENSMUSG00000050312         Nsun3
    ## 2231  1.646027e-09  8.645294e-09        True   ENSMUSG00000025402          Nab2
    ## 2232  1.954646e-02  3.804156e-02        True   ENSMUSG00000053769        Lysmd1
    ## 2233  2.036344e-11  1.285045e-10        True   ENSMUSG00000033712         Ccar2
    ## 2234  1.167379e-13  9.046764e-13        True   ENSMUSG00000013662         Atad1
    ## 2235  4.015215e-09  2.037198e-08        True   ENSMUSG00000037331         Larp1
    ## 2236  7.038358e-06  2.493162e-05        True   ENSMUSG00000017307         Acot8
    ## 2237  7.269943e-03  1.571890e-02        True   ENSMUSG00000022313         Utp23
    ## 2238  1.363234e-19  1.645773e-18        True   ENSMUSG00000030536        Iqgap1
    ## 2239  1.030250e-09  5.519626e-09        True   ENSMUSG00000033658        Ddx19b
    ## 2240  3.374840e-04  9.337077e-04        True   ENSMUSG00000016308         Ube2a
    ## 2241  2.506511e-12  1.718197e-11        True   ENSMUSG00000093904        Tomm20
    ## 2242  1.109890e-04  3.322804e-04        True   ENSMUSG00000032478          Nme6
    ## 2243  6.001800e-05  1.861013e-04        True   ENSMUSG00000028261       Ndufaf4
    ## 2244  4.134583e-10  2.307392e-09        True   ENSMUSG00000078429        Ctdsp2
    ## 2245  7.353225e-14  5.765622e-13        True   ENSMUSG00000052337          Immt
    ## 2246  8.883160e-04  2.296566e-03        True   ENSMUSG00000113949        Scamp4
    ## 2247  6.570559e-06  2.337648e-05        True   ENSMUSG00000007603         Dus3l
    ## 2248  4.909494e-03  1.101017e-02        True   ENSMUSG00000024477        Pggt1b
    ## 2249  1.881387e-03  4.589815e-03        True   ENSMUSG00000033697      Arhgap39
    ## 2250  7.141986e-04  1.873100e-03        True   ENSMUSG00000038079       Tmem237
    ## 2251  6.157296e-07  2.483443e-06        True   ENSMUSG00000025888         Casp1
    ## 2252  9.371531e-13  6.664385e-12        True   ENSMUSG00000033047         Eif3l
    ## 2253  7.422039e-08  3.312233e-07        True   ENSMUSG00000020471         Pold2
    ## 2254  1.967629e-06  7.452447e-06        True   ENSMUSG00000031520         Vegfc
    ## 2255  2.697622e-06  1.005987e-05        True   ENSMUSG00000022671          Mzt2
    ## 2256  1.343717e-06  5.207921e-06        True   ENSMUSG00000039994      Timeless
    ## 2257  5.373506e-04  1.436412e-03        True   ENSMUSG00000054469        Lclat1
    ## 2258  8.882974e-05  2.695779e-04        True   ENSMUSG00000021368        Tbc1d7
    ## 2259  2.827143e-07  1.180526e-06        True   ENSMUSG00000014905        Dnajb9
    ## 2260  1.382883e-02  2.796582e-02        True   ENSMUSG00000020091      Eif4ebp2
    ## 2261  8.977726e-08  3.973185e-07        True   ENSMUSG00000021583         Erap1
    ## 2262  4.606799e-03  1.042650e-02        True   ENSMUSG00000001034         Mapk7
    ## 2263  1.213849e-09  6.447490e-09        True   ENSMUSG00000024927          Rela
    ## 2264  4.143954e-08  1.912373e-07        True   ENSMUSG00000022124         Fbxl3
    ## 2265  6.727946e-12  4.433117e-11        True   ENSMUSG00000027162         Lin7c
    ## 2266  2.225221e-13  1.687618e-12        True   ENSMUSG00000035891          Cerk
    ## 2267  1.011654e-06  3.976900e-06        True   ENSMUSG00000068917          Clk2
    ## 2268  3.403078e-06  1.252973e-05        True   ENSMUSG00000021639        Gtf2h2
    ## 2269  2.343635e-04  6.655503e-04        True   ENSMUSG00000016833       Mrps18c
    ## 2270  2.793238e-07  1.167284e-06        True   ENSMUSG00000092417        Gpank1
    ## 2271  6.888492e-14  5.419852e-13        True   ENSMUSG00000049439       Cyp20a1
    ## 2272  5.089917e-08  2.319434e-07        True   ENSMUSG00000041126         H2az2
    ## 2273  7.702787e-16  6.974428e-15        True   ENSMUSG00000022672         Prkdc
    ## 2274  1.742822e-02  3.444339e-02        True   ENSMUSG00000020108         Ddit4
    ## 2275  6.388236e-08  2.872548e-07        True   ENSMUSG00000005802       Slc30a4
    ## 2276  2.323594e-02  4.433984e-02        True   ENSMUSG00000028799        Zfp362
    ## 2277  4.342774e-06  1.578579e-05        True   ENSMUSG00000068922         Msto1
    ## 2278  1.291680e-10  7.532209e-10        True   ENSMUSG00000040661       Rad54l2
    ## 2279  1.680301e-07  7.195113e-07        True   ENSMUSG00000048222        Mfap1b
    ## 2280  1.680301e-07  7.195113e-07        True   ENSMUSG00000068479        Mfap1a
    ## 2281  1.422258e-08  6.850513e-08        True   ENSMUSG00000030822         Prr14
    ## 2282  5.558255e-04  1.482354e-03        True   ENSMUSG00000038888          Ctu1
    ## 2283  3.475523e-04  9.592373e-04        True   ENSMUSG00000020514        Mrpl22
    ## 2284  2.716536e-07  1.137016e-06        True   ENSMUSG00000028433         Ubap2
    ## 2285  1.257057e-08  6.086002e-08        True   ENSMUSG00000035297         Cops4
    ## 2286  1.248018e-09  6.620172e-09        True   ENSMUSG00000002017        Fam98a
    ## 2287  1.271004e-09  6.739868e-09        True   ENSMUSG00000038697         Taf5l
    ## 2288  9.268402e-14  7.224740e-13        True   ENSMUSG00000004591          Pkn2
    ## 2289  1.133464e-04  3.387667e-04        True   ENSMUSG00000034333         Zbed4
    ## 2290  1.102571e-06  4.322598e-06        True   ENSMUSG00000024068         Spast
    ## 2291  2.800334e-08  1.312025e-07        True   ENSMUSG00000029501        Ankle2
    ## 2292  5.453908e-05  1.701890e-04        True   ENSMUSG00000017405          Nek8
    ## 2293  5.587559e-08  2.530323e-07        True   ENSMUSG00000091512       Lamtor3
    ## 2294  1.185874e-07  5.194947e-07        True   ENSMUSG00000039828         Wdr70
    ## 2295  9.173067e-12  5.946113e-11        True   ENSMUSG00000028081        Rps3a1
    ## 2296  1.860639e-03  4.541278e-03        True   ENSMUSG00000021218          Gdi2
    ## 2297  5.782140e-04  1.537156e-03        True   ENSMUSG00000051510          Mafg
    ## 2298  1.583803e-12  1.106584e-11        True   ENSMUSG00000027433          Xrn2
    ## 2299  1.824061e-14  1.495580e-13        True   ENSMUSG00000026153       Fam135a
    ## 2300  1.437170e-03  3.576577e-03        True   ENSMUSG00000043631          Ecm2
    ## 2301  1.442363e-02  2.899977e-02        True   ENSMUSG00000006732        Mettl1
    ## 2302  2.751878e-04  7.721889e-04        True   ENSMUSG00000024014          Pim1
    ## 2303  4.109036e-06  1.495659e-05        True   ENSMUSG00000033233        Trim45
    ## 2304  3.090730e-03  7.246791e-03        True   ENSMUSG00000029346          Srrd
    ## 2305  1.360584e-03  3.403483e-03        True   ENSMUSG00000040829       Zmynd15
    ## 2306  1.341883e-18  1.507212e-17        True   ENSMUSG00000022346           Myc
    ## 2307  3.220518e-07  1.337792e-06        True   ENSMUSG00000005204         Senp3
    ## 2308  5.610786e-08  2.539401e-07        True   ENSMUSG00000031776        Arl2bp
    ## 2309  8.793620e-10  4.743387e-09        True   ENSMUSG00000039509        Nup133
    ## 2310  3.232392e-15  2.789182e-14        True   ENSMUSG00000022241          Tars
    ## 2311  1.925414e-05  6.422872e-05        True   ENSMUSG00000039789        Zfp597
    ## 2312  2.441743e-07  1.027926e-06        True   ENSMUSG00000022035        Ccdc25
    ## 2313  4.765777e-04  1.286881e-03        True   ENSMUSG00000027088      Phospho2
    ## 2314  3.857530e-04  1.056093e-03        True   ENSMUSG00000021597          Slf1
    ## 2315  6.484639e-06  2.309668e-05        True   ENSMUSG00000029427        Zcchc8
    ## 2316  7.172085e-08  3.203371e-07        True   ENSMUSG00000037376         Trmt6
    ## 2317  5.870502e-09  2.932864e-08        True   ENSMUSG00000062949        Atp11c
    ## 2318  4.579117e-08  2.100226e-07        True   ENSMUSG00000003099         Ppp5c
    ## 2319  4.816974e-18  5.142829e-17        True   ENSMUSG00000027620         Rbm39
    ## 2320  1.076573e-05  3.728323e-05        True   ENSMUSG00000046709        Mapk10
    ## 2321  1.734409e-09  9.086075e-09        True   ENSMUSG00000058835          Abi1
    ## 2322  1.319442e-03  3.308860e-03        True   ENSMUSG00000029165         Agbl5
    ## 2323  2.487226e-16  2.343716e-15        True   ENSMUSG00000009079         Ewsr1
    ## 2324  8.113381e-10  4.392175e-09        True   ENSMUSG00000032307        Ube2q2
    ## 2325  1.166650e-02  2.405905e-02        True   ENSMUSG00000046768          Rhoj
    ## 2326  1.789430e-11  1.136413e-10        True   ENSMUSG00000036078       Sigmar1
    ## 2327  6.106490e-18  6.459130e-17        True   ENSMUSG00000027184       Caprin1
    ## 2328  3.430333e-16  3.200308e-15        True   ENSMUSG00000000740         Rpl13
    ## 2329  1.477340e-05  5.009782e-05        True   ENSMUSG00000061878         Sphk1
    ## 2330  1.888617e-10  1.086635e-09        True   ENSMUSG00000031864        Ints10
    ## 2331  1.837192e-08  8.768474e-08        True   ENSMUSG00000030166         Rad52
    ## 2332  1.755778e-05  5.896732e-05        True   ENSMUSG00000022792         Yars2
    ## 2333  5.730902e-09  2.867606e-08        True   ENSMUSG00000019782         Rwdd1
    ## 2334  5.257785e-12  3.500515e-11        True   ENSMUSG00000008892         Vdac3
    ## 2335  7.660016e-10  4.158592e-09        True   ENSMUSG00000035021         Baz1a
    ## 2336  1.035534e-12  7.333269e-12        True   ENSMUSG00000019854         Reps1
    ## 2337  1.813590e-04  5.258606e-04        True   ENSMUSG00000001383         Zmat2
    ## 2338  1.508666e-10  8.749608e-10        True   ENSMUSG00000032939         Nup93
    ## 2339  4.246252e-08  1.955063e-07        True   ENSMUSG00000029066        Mrpl20
    ## 2340  1.494083e-12  1.046185e-11        True   ENSMUSG00000024026          Glo1
    ## 2341  4.136143e-10  2.307456e-09        True   ENSMUSG00000036932         Aifm1
    ## 2342  4.220778e-04  1.146696e-03        True   ENSMUSG00000051154        Commd3
    ## 2343  3.765949e-16  3.490989e-15        True   ENSMUSG00000048874          Phf3
    ## 2344  2.825860e-07  1.180299e-06        True   ENSMUSG00000041264         Uspl1
    ## 2345  1.828214e-05  6.120361e-05        True   ENSMUSG00000029387        Gtf2h3
    ## 2346  1.205001e-06  4.694214e-06        True   ENSMUSG00000032508         Myd88
    ## 2347  3.451456e-11  2.117813e-10        True   ENSMUSG00000000078          Klf6
    ## 2348  1.630806e-10  9.427159e-10        True   ENSMUSG00000007564       Ppp2r1a
    ## 2349  7.164677e-14  5.623303e-13        True   ENSMUSG00000019978       Epb41l2
    ## 2350  1.237044e-02  2.532760e-02        True   ENSMUSG00000031841         Cdh13
    ## 2351  5.919931e-11  3.551959e-10        True   ENSMUSG00000029201          Ugdh
    ## 2352  2.107374e-12  1.453324e-11        True   ENSMUSG00000021771         Vdac2
    ## 2353  9.650678e-08  4.265097e-07        True   ENSMUSG00000033845        Mrpl15
    ## 2354  7.102607e-05  2.184534e-04        True   ENSMUSG00000026620         Mark1
    ## 2355  2.673919e-15  2.324869e-14        True   ENSMUSG00000005045          Chd5
    ## 2356  2.088881e-03  5.048431e-03        True   ENSMUSG00000005148          Klf5
    ## 2357  6.379745e-08  2.869538e-07        True   ENSMUSG00000014077          Chp1
    ## 2358  1.030187e-17  1.071234e-16        True   ENSMUSG00000016554         Eif3d
    ## 2359  6.314394e-19  7.302933e-18        True   ENSMUSG00000029467        Atp2a2
    ## 2360  8.262126e-03  1.766805e-02        True   ENSMUSG00000051316          Taf7
    ## 2361  7.593267e-05  2.326931e-04        True   ENSMUSG00000021975         Ints9
    ## 2362  2.365029e-04  6.711842e-04        True   ENSMUSG00000029715          Pop7
    ## 2363  1.762583e-02  3.476410e-02        True   ENSMUSG00000078931           Pdf
    ## 2364  1.592833e-09  8.376896e-09        True   ENSMUSG00000092232          <NA>
    ## 2365  5.288395e-04  1.416981e-03        True   ENSMUSG00000037243        Zfp692
    ## 2366  1.806463e-05  6.055159e-05        True   ENSMUSG00000036188        Ankmy2
    ## 2367  3.521277e-06  1.292916e-05        True   ENSMUSG00000027035         Cers6
    ## 2368  1.457309e-06  5.620898e-06        True   ENSMUSG00000000759       Tubgcp3
    ## 2369  3.651034e-08  1.694691e-07        True   ENSMUSG00000019984         Med23
    ## 2370  1.566359e-18  1.751953e-17        True   ENSMUSG00000059040         Eno1b
    ## 2371  1.566359e-18  1.751953e-17        True   ENSMUSG00000063524          Eno1
    ## 2372  5.423752e-03  1.204173e-02        True   ENSMUSG00000028295         Smim8
    ## 2373  1.307338e-08  6.319858e-08        True   ENSMUSG00000037070        Rbmxl1
    ## 2374  1.307338e-08  6.319858e-08        True   ENSMUSG00000049235        Gm7324
    ## 2375  3.186348e-04  8.860088e-04        True   ENSMUSG00000059689        Zfp637
    ## 2376  5.381104e-16  4.922508e-15        True   ENSMUSG00000016933         Plcg1
    ## 2377  8.539458e-09  4.195393e-08        True   ENSMUSG00000001761           Smo
    ## 2378  1.241826e-09  6.591705e-09        True   ENSMUSG00000017686         Rhot1
    ## 2379  1.824433e-06  6.956277e-06        True   ENSMUSG00000056870         Gulp1
    ## 2380  6.252649e-15  5.281190e-14        True   ENSMUSG00000020580         Rock2
    ## 2381  8.920634e-03  1.890688e-02        True   ENSMUSG00000022948         Setd4
    ## 2382  5.050224e-10  2.795916e-09        True   ENSMUSG00000030780         Rusf1
    ## 2383  1.191207e-05  4.099539e-05        True   ENSMUSG00000024240          Epc1
    ## 2384  4.802226e-08  2.191462e-07        True   ENSMUSG00000018189         Uchl5
    ## 2385  3.199099e-11  1.973581e-10        True   ENSMUSG00000026977       Marchf7
    ## 2386  2.833967e-12  1.930240e-11        True   ENSMUSG00000021116        Eif2s1
    ## 2387  2.419116e-11  1.515221e-10        True   ENSMUSG00000022956         Atp5o
    ## 2388  2.248290e-03  5.403203e-03        True   ENSMUSG00000069114        Zbtb10
    ## 2389  1.035608e-04  3.111747e-04        True   ENSMUSG00000035757       Selenoo
    ## 2390  7.964874e-12  5.198813e-11        True   ENSMUSG00000022802          Lmln
    ## 2391  7.015687e-07  2.811380e-06        True   ENSMUSG00000027953       Slc50a1
    ## 2392  3.515225e-05  1.129227e-04        True   ENSMUSG00000034793         G6pc3
    ## 2393  2.587416e-05  8.470220e-05        True   ENSMUSG00000073792          Alg6
    ## 2394  1.149548e-12  8.113382e-12        True   ENSMUSG00000025132       Arhgdia
    ## 2395  1.914399e-06  7.269800e-06        True   ENSMUSG00000003437          Paf1
    ## 2396  7.795225e-07  3.101004e-06        True   ENSMUSG00000002329          Mdp1
    ## 2397  6.001780e-06  2.146040e-05        True   ENSMUSG00000026273        Mterf4
    ## 2398  1.516739e-16  1.453231e-15        True   ENSMUSG00000017146         Brca1
    ## 2399  7.525160e-05  2.307388e-04        True   ENSMUSG00000020781        Tsen54
    ## 2400  2.652557e-06  9.909424e-06        True   ENSMUSG00000031379           Pir
    ## 2401  1.740854e-05  5.852044e-05        True   ENSMUSG00000022772         Senp5
    ## 2402  2.129059e-10  1.219703e-09        True   ENSMUSG00000038965        Ube2l3
    ## 2403  1.083694e-08  5.277062e-08        True   ENSMUSG00000031583           Wrn
    ## 2404  6.390634e-06  2.278884e-05        True   ENSMUSG00000029388        Eif2b1
    ## 2405  5.269079e-07  2.140873e-06        True   ENSMUSG00000024583         Txnl1
    ## 2406  4.400462e-18  4.713896e-17        True   ENSMUSG00000005610        Eif4g2
    ## 2407  3.311243e-13  2.455300e-12        True   ENSMUSG00000021000          Mia2
    ## 2408  1.738724e-03  4.260648e-03        True   ENSMUSG00000026563         Tada1
    ## 2409  4.673197e-03  1.055285e-02        True   ENSMUSG00000029027          Dffb
    ## 2410  1.267386e-08  6.134147e-08        True   ENSMUSG00000034394           Lif
    ## 2411  2.959377e-08  1.383699e-07        True   ENSMUSG00000020873       Slc35b1
    ## 2412  1.724813e-09  9.041257e-09        True   ENSMUSG00000030127        Cops7a
    ## 2413  1.641156e-05  5.535913e-05        True   ENSMUSG00000025785        Exosc7
    ## 2414  1.238450e-04  3.681467e-04        True   ENSMUSG00000025034         Trim8
    ## 2415  3.558569e-08  1.654657e-07        True   ENSMUSG00000035027        Map2k2
    ## 2416  4.870861e-11  2.949105e-10        True   ENSMUSG00000032407        U2surp
    ## 2417  2.432005e-04  6.889674e-04        True   ENSMUSG00000023066          Rttn
    ## 2418  8.823090e-04  2.282144e-03        True   ENSMUSG00000021692         Dimt1
    ## 2419  3.256510e-04  9.039446e-04        True   ENSMUSG00000043300      B3galnt1
    ## 2420  1.150778e-11  7.402425e-11        True   ENSMUSG00000037570         Mcrs1
    ## 2421  1.293237e-05  4.434431e-05        True   ENSMUSG00000006191        Cdkal1
    ## 2422  3.769569e-05  1.203910e-04        True   ENSMUSG00000049950         Rpp38
    ## 2423  2.941346e-09  1.506709e-08        True   ENSMUSG00000024654        Asrgl1
    ## 2424  2.159582e-05  7.148777e-05        True   ENSMUSG00000030031        Kbtbd8
    ## 2425  1.130318e-05  3.898389e-05        True   ENSMUSG00000058267        Mrps14
    ## 2426  3.746498e-03  8.613656e-03        True   ENSMUSG00000067928        Zfp760
    ## 2427  5.051809e-04  1.359062e-03        True   ENSMUSG00000025193          Cutc
    ## 2428  9.748588e-04  2.506107e-03        True   ENSMUSG00000020783         Ncbp3
    ## 2429  7.685589e-05  2.353868e-04        True   ENSMUSG00000020755       Sap30bp
    ## 2430  1.398939e-07  6.063939e-07        True   ENSMUSG00000055491         Pprc1
    ## 2431  5.477080e-06  1.968495e-05        True   ENSMUSG00000006395           Hyi
    ## 2432  3.501503e-03  8.115803e-03        True   ENSMUSG00000025971         Maip1
    ## 2433  2.580795e-08  1.215226e-07        True   ENSMUSG00000025198        Erlin1
    ## 2434  7.944057e-08  3.534331e-07        True   ENSMUSG00000020634        Ubxn2a
    ## 2435  7.288601e-05  2.237861e-04        True   ENSMUSG00000030610          Det1
    ## 2436  1.879884e-02  3.674644e-02        True   ENSMUSG00000062116        Zfp954
    ## 2437  8.007698e-09  3.948717e-08        True   ENSMUSG00000024019         Cmtr1
    ## 2438  1.454516e-13  1.116900e-12        True   ENSMUSG00000019943        Atp2b1
    ## 2439  6.825074e-07  2.738947e-06        True   ENSMUSG00000035202         Lars2
    ## 2440  1.437976e-06  5.549011e-06        True   ENSMUSG00000051579        Tceal8
    ## 2441  4.669373e-08  2.138166e-07        True   ENSMUSG00000032058       Ppp2r1b
    ## 2442  3.207030e-04  8.912943e-04        True   ENSMUSG00000038957          Edc3
    ## 2443  2.329974e-13  1.763713e-12        True   ENSMUSG00000061838        Suclg2
    ## 2444  8.221106e-05  2.509220e-04        True   ENSMUSG00000014303         Glis2
    ## 2445  3.433878e-20  4.305016e-19        True   ENSMUSG00000031328          Flna
    ## 2446  3.712378e-10  2.079765e-09        True   ENSMUSG00000019794        Katna1
    ## 2447  1.844594e-03  4.506938e-03        True   ENSMUSG00000075486        Commd6
    ## 2448  9.782346e-03  2.053676e-02        True   ENSMUSG00000024258        Polr2d
    ## 2449  9.398155e-04  2.419915e-03        True   ENSMUSG00000034748         Sirt6
    ## 2450  3.416334e-03  7.942383e-03        True   ENSMUSG00000001844        Zdhhc4
    ## 2451  1.524468e-05  5.160831e-05        True   ENSMUSG00000025353        Ormdl2
    ## 2452  2.265117e-07  9.571018e-07        True   ENSMUSG00000034620        Rxylt1
    ## 2453  1.206231e-07  5.278336e-07        True   ENSMUSG00000020516       Rps6kb1
    ## 2454  2.829837e-05  9.216588e-05        True   ENSMUSG00000015247     Nipsnap3b
    ## 2455  2.768701e-07  1.157636e-06        True   ENSMUSG00000038070         Cntln
    ## 2456  2.040646e-04  5.864063e-04        True   ENSMUSG00000021666          Gfm2
    ## 2457  7.366996e-13  5.293102e-12        True   ENSMUSG00000020850         Prpf8
    ## 2458  1.108601e-11  7.145510e-11        True   ENSMUSG00000030779         Rbbp6
    ## 2459  5.112646e-05  1.602103e-04        True   ENSMUSG00000026171         Rnf25
    ## 2460  6.724238e-03  1.463408e-02        True   ENSMUSG00000047423      AI837181
    ## 2461  5.480262e-11  3.298307e-10        True   ENSMUSG00000026353         Ubxn4
    ## 2462  2.194203e-05  7.257363e-05        True   ENSMUSG00000034544         Rsrc1
    ## 2463  4.024672e-03  9.210783e-03        True   ENSMUSG00000026035         Ppil3
    ## 2464  4.002982e-04  1.092257e-03        True   ENSMUSG00000025722         Wdr73
    ## 2465  7.171080e-06  2.537924e-05        True   ENSMUSG00000027430          Dtd1
    ## 2466  1.218203e-05  4.191543e-05        True   ENSMUSG00000022614          Lmf2
    ## 2467  1.287998e-04  3.819907e-04        True   ENSMUSG00000026966         Ssna1
    ## 2468  1.694098e-03  4.160919e-03        True   ENSMUSG00000032526        Ss18l2
    ## 2469  1.255543e-10  7.329506e-10        True   ENSMUSG00000034432         Cops8
    ## 2470  3.314668e-03  7.728741e-03        True   ENSMUSG00000064326         Siva1
    ## 2471  1.903521e-06  7.237095e-06        True   ENSMUSG00000025737         Wdr24
    ## 2472  7.624866e-11  4.535730e-10        True   ENSMUSG00000020184          Mdm2
    ## 2473  3.945247e-06  1.439285e-05        True   ENSMUSG00000042133          Ppig
    ## 2474  6.964227e-06  2.467450e-05        True   ENSMUSG00000031851         Ntpcr
    ## 2475  6.383233e-05  1.973539e-04        True   ENSMUSG00000032698          Lmo2
    ## 2476  1.895580e-04  5.472922e-04        True   ENSMUSG00000028416          Bag1
    ## 2477  2.870844e-05  9.338721e-05        True   ENSMUSG00000029640         Usp12
    ## 2478  5.847361e-09  2.922217e-08        True   ENSMUSG00000025816       Sec61a2
    ## 2479  4.754004e-08  2.171938e-07        True   ENSMUSG00000001910         Nacc1
    ## 2480  1.438180e-05  4.890485e-05        True   ENSMUSG00000046994         Mars2
    ## 2481  4.186140e-05  1.328717e-04        True   ENSMUSG00000040667         Nup88
    ## 2482  1.159807e-07  5.087732e-07        True   ENSMUSG00000035293          G2e3
    ## 2483  6.788288e-16  6.170890e-15        True   ENSMUSG00000024120        Lrpprc
    ## 2484  7.159871e-08  3.198855e-07        True   ENSMUSG00000020863        Luc7l3
    ## 2485  8.521457e-11  5.037184e-10        True   ENSMUSG00000022336         Eif3e
    ## 2486  1.149437e-07  5.046400e-07        True   ENSMUSG00000029028        Lrrc47
    ## 2487  1.088312e-08  5.297935e-08        True   ENSMUSG00000069895        Atxn1l
    ## 2488  3.111181e-13  2.312321e-12        True   ENSMUSG00000024392          Bag6
    ## 2489  4.525884e-06  1.642782e-05        True   ENSMUSG00000004393         Ddx56
    ## 2490  2.478863e-04  7.011226e-04        True   ENSMUSG00000022053          Ebf2
    ## 2491  1.010782e-03  2.590118e-03        True   ENSMUSG00000028630         Dyrk2
    ## 2492  2.599897e-11  1.620826e-10        True   ENSMUSG00000005501         Usp40
    ## 2493  1.914077e-05  6.386388e-05        True   ENSMUSG00000028256         Odf2l
    ## 2494  6.788301e-05  2.093103e-04        True   ENSMUSG00000030615      Tmem126a
    ## 2495  7.604830e-04  1.983739e-03        True   ENSMUSG00000071477        Zfp777
    ## 2496  1.570553e-10  9.092016e-10        True   ENSMUSG00000028700       Pomgnt1
    ## 2497  7.462472e-07  2.979020e-06        True   ENSMUSG00000030614      Tmem126b
    ## 2498  8.303121e-09  4.089345e-08        True   ENSMUSG00000025439        Clns1a
    ## 2499  1.294746e-05  4.437699e-05        True   ENSMUSG00000042625         Safb2
    ## 2500  2.993260e-06  1.110531e-05        True   ENSMUSG00000002205          Vrk3
    ## 2501  2.367158e-07  9.991609e-07        True   ENSMUSG00000002372        Ranbp3
    ## 2502  5.801844e-04  1.541881e-03        True   ENSMUSG00000003680         Taf6l
    ## 2503  2.687936e-05  8.774109e-05        True   ENSMUSG00000041354          Rgl2
    ## 2504  4.059142e-06  1.478509e-05        True   ENSMUSG00000066148         Prpf4
    ## 2505  1.342582e-05  4.588855e-05        True   ENSMUSG00000030733         Sh2b1
    ## 2506  1.493672e-06  5.750043e-06        True   ENSMUSG00000036822        Topors
    ## 2507  1.099819e-04  3.293631e-04        True   ENSMUSG00000035372 1810055G02Rik
    ## 2508  2.263000e-05  7.477170e-05        True   ENSMUSG00000051671          Coa6
    ## 2509  1.186040e-04  3.536201e-04        True   ENSMUSG00000060733          Ipmk
    ## 2510  2.603209e-10  1.478082e-09        True   ENSMUSG00000046671        Mtfr1l
    ## 2511  5.217235e-04  1.400499e-03        True   ENSMUSG00000028619       Tceanc2
    ## 2512  3.900546e-07  1.602766e-06        True   ENSMUSG00000040521          Tsfm
    ## 2513  2.799376e-05  9.122962e-05        True   ENSMUSG00000021504       B4galt7
    ## 2514  2.960792e-09  1.515212e-08        True   ENSMUSG00000003166         Dgcr2
    ## 2515  2.960792e-09  1.515212e-08        True   ENSMUSG00000092470          <NA>
    ## 2516  1.031684e-08  5.037622e-08        True   ENSMUSG00000005493          Msh4
    ## 2517  9.851494e-03  2.066338e-02        True   ENSMUSG00000020898          Ctc1
    ## 2518  1.816887e-05  6.086268e-05        True   ENSMUSG00000003031        Cdkn1b
    ## 2519  7.806076e-09  3.852863e-08        True   ENSMUSG00000032872        Cyb5r4
    ## 2520  2.392674e-06  8.977166e-06        True   ENSMUSG00000024862          Klc2
    ## 2521  1.179454e-05  4.059967e-05        True   ENSMUSG00000003778          Brd8
    ## 2522  1.527825e-09  8.045637e-09        True   ENSMUSG00000036403        Cep135
    ## 2523  7.938574e-03  1.704691e-02        True   ENSMUSG00000031821         Gins2
    ## 2524  7.298079e-04  1.909680e-03        True   ENSMUSG00000031577          Tti2
    ## 2525  9.017191e-09  4.421940e-08        True   ENSMUSG00000024370         Cdc23
    ## 2526  2.998969e-08  1.401801e-07        True   ENSMUSG00000054312        Mrps21
    ## 2527  1.088209e-03  2.768537e-03        True   ENSMUSG00000031723        Txnl4b
    ## 2528  5.853834e-11  3.513620e-10        True   ENSMUSG00000021413        Prpf4b
    ## 2529  9.077230e-12  5.886379e-11        True   ENSMUSG00000033499        Larp4b
    ## 2530  2.880560e-04  8.056086e-04        True   ENSMUSG00000033502        Cdc14a
    ## 2531  6.209841e-06  2.215898e-05        True   ENSMUSG00000027487      Cdk5rap1
    ## 2532  1.691443e-03  4.155627e-03        True   ENSMUSG00000061207         Stk19
    ## 2533  2.538498e-09  1.309590e-08        True   ENSMUSG00000036097          Slf2
    ## 2534  3.890347e-09  1.975727e-08        True   ENSMUSG00000022205          Sub1
    ## 2535  2.720759e-10  1.541538e-09        True   ENSMUSG00000004929         Thop1
    ## 2536  9.047275e-07  3.576809e-06        True   ENSMUSG00000039230          Tbcd
    ## 2537  4.020274e-06  1.465354e-05        True   ENSMUSG00000002608        Ccdc97
    ## 2538  3.447779e-06  1.267678e-05        True   ENSMUSG00000026803          Ttf1
    ## 2539  1.656973e-09  8.697065e-09        True   ENSMUSG00000045822        Zswim3
    ## 2540  1.715179e-04  4.999970e-04        True   ENSMUSG00000048416          Mlf1
    ## 2541  3.122991e-07  1.298969e-06        True   ENSMUSG00000071647          Eml3
    ## 2542  6.962455e-13  5.031871e-12        True   ENSMUSG00000003810         Mast2
    ## 2543  3.654922e-09  1.859121e-08        True   ENSMUSG00000030056          Isy1
    ## 2544  3.248586e-04  9.020588e-04        True   ENSMUSG00000048495          Tyw5
    ## 2545  1.157252e-09  6.167375e-09        True   ENSMUSG00000024943          Smc5
    ## 2546  1.466524e-02  2.943153e-02        True   ENSMUSG00000028629          Exo5
    ## 2547  2.572701e-05  8.427233e-05        True   ENSMUSG00000068329         Htra2
    ## 2548  1.335261e-09  7.064187e-09        True   ENSMUSG00000022193         Psmb5
    ## 2549  1.913194e-11  1.210679e-10        True   ENSMUSG00000037601          Nme1
    ## 2550  1.229589e-11  7.896658e-11        True   ENSMUSG00000053641       Dennd4a
    ## 2551  1.642969e-13  1.259189e-12        True   ENSMUSG00000058006          Mdn1
    ## 2552  9.579016e-06  3.339796e-05        True   ENSMUSG00000049739        Zfp646
    ## 2553  1.616064e-02  3.215619e-02        True   ENSMUSG00000036860        Mrpl55
    ## 2554  1.462488e-06  5.636791e-06        True   ENSMUSG00000019470          Xab2
    ## 2555  2.010329e-06  7.605157e-06        True   ENSMUSG00000061882        Ccdc62
    ## 2556  6.070203e-09  3.029790e-08        True   ENSMUSG00000026159         Agfg1
    ## 2557  2.250056e-10  1.283496e-09        True   ENSMUSG00000027293          Ehd4
    ## 2558  1.401990e-03  3.496656e-03        True   ENSMUSG00000032551 1110059G10Rik
    ## 2559  1.292978e-06  5.019798e-06        True   ENSMUSG00000035198         Tubg1
    ## 2560  2.261498e-18  2.492798e-17        True   ENSMUSG00000021957           Tkt
    ## 2561  1.642435e-07  7.038081e-07        True   ENSMUSG00000078656         Vps25
    ## 2562  1.825438e-04  5.287024e-04        True   ENSMUSG00000022634          Yaf2
    ## 2563  7.523851e-03  1.621740e-02        True   ENSMUSG00000026176        Ctdsp1
    ## 2564  2.709294e-08  1.273480e-07        True   ENSMUSG00000030521     Mphosph10
    ## 2565  1.115691e-06  4.369743e-06        True   ENSMUSG00000039512      Uhrf1bp1
    ## 2566  5.388693e-10  2.972995e-09        True   ENSMUSG00000021096         Ppm1a
    ## 2567  3.177724e-07  1.320703e-06        True   ENSMUSG00000038611         Phrf1
    ## 2568  6.595101e-05  2.035890e-04        True   ENSMUSG00000022300        Dcaf13
    ## 2569  6.788432e-04  1.786830e-03        True   ENSMUSG00000044700       Tmem201
    ## 2570  1.661427e-05  5.599559e-05        True   ENSMUSG00000006456         Rbm14
    ## 2571  7.744028e-11  4.599762e-10        True   ENSMUSG00000024817         Uhrf2
    ## 2572  3.286510e-04  9.113218e-04        True   ENSMUSG00000010607         Pigyl
    ## 2573  6.501601e-06  2.314837e-05        True   ENSMUSG00000063406         Tmed5
    ## 2574  3.569006e-09  1.818911e-08        True   ENSMUSG00000002319          Ipo4
    ## 2575  1.894402e-02  3.698043e-02        True   ENSMUSG00000031848          Lsm4
    ## 2576  3.188548e-05  1.029878e-04        True   ENSMUSG00000059820        Nkapd1
    ## 2577  4.309155e-03  9.805645e-03        True   ENSMUSG00000055041        Commd5
    ## 2578  7.436332e-10  4.044028e-09        True   ENSMUSG00000032712         Resf1
    ## 2579  1.032262e-10  6.063735e-10        True   ENSMUSG00000032301         Psma4
    ## 2580  1.121182e-06  4.390176e-06        True   ENSMUSG00000039759         Thap3
    ## 2581  8.129999e-03  1.741306e-02        True   ENSMUSG00000070532       Ccdc190
    ## 2582  1.049902e-03  2.680472e-03        True   ENSMUSG00000058886         Deaf1
    ## 2583  6.864541e-10  3.750956e-09        True   ENSMUSG00000032199        Polr2m
    ## 2584  2.607275e-06  9.747986e-06        True   ENSMUSG00000029913         Prdm5
    ## 2585  1.795855e-06  6.853859e-06        True   ENSMUSG00000032299        Commd4
    ## 2586  5.624412e-06  2.019914e-05        True   ENSMUSG00000047187         Rab2a
    ## 2587  2.111392e-03  5.097211e-03        True   ENSMUSG00000026134         Prim2
    ## 2588  6.656690e-04  1.755045e-03        True   ENSMUSG00000030729        Pgm2l1
    ## 2589  2.237644e-04  6.383219e-04        True   ENSMUSG00000017561         Crlf3
    ## 2590  5.274086e-15  4.475967e-14        True   ENSMUSG00000033228        Scaf11
    ## 2591  2.687813e-06  1.002797e-05        True   ENSMUSG00000029462         Vps29
    ## 2592  3.031219e-04  8.446376e-04        True   ENSMUSG00000049960        Mrps16
    ## 2593  4.593660e-06  1.666363e-05        True   ENSMUSG00000024563         Smad2
    ## 2594  3.729859e-03  8.581509e-03        True   ENSMUSG00000025384       Faap100
    ## 2595  1.288632e-04  3.820685e-04        True   ENSMUSG00000025200       Cwf19l1
    ## 2596  5.051165e-03  1.129142e-02        True   ENSMUSG00000026960       Arl6ip6
    ## 2597  2.454095e-07  1.032582e-06        True   ENSMUSG00000020079       Supv3l1
    ## 2598  2.371640e-12  1.629240e-11        True   ENSMUSG00000027618          Nfs1
    ## 2599  2.420748e-05  7.960507e-05        True   ENSMUSG00000035125         Gcfc2
    ## 2600  2.551064e-12  1.745741e-11        True   ENSMUSG00000020458          Rtn4
    ## 2601  1.843317e-08  8.793743e-08        True   ENSMUSG00000003235        Eif2b5
    ## 2602  1.207694e-07  5.283290e-07        True   ENSMUSG00000070565        Rasal2
    ## 2603  6.727612e-06  2.389447e-05        True   ENSMUSG00000002679          Med6
    ## 2604  5.933069e-06  2.124227e-05        True   ENSMUSG00000042487          Leo1
    ## 2605  9.105189e-03  1.926710e-02        True   ENSMUSG00000098948          <NA>
    ## 2606  1.355441e-03  3.392214e-03        True   ENSMUSG00000021716      Srek1ip1
    ## 2607  1.339982e-07  5.823725e-07        True   ENSMUSG00000021981        Cab39l
    ## 2608  1.937632e-13  1.475816e-12        True   ENSMUSG00000039838       Slc45a1
    ## 2609  5.899223e-05  1.831695e-04        True   ENSMUSG00000009406          Elk1
    ## 2610  2.021353e-11  1.276594e-10        True   ENSMUSG00000025651        Uqcrc1
    ## 2611  6.714078e-07  2.697114e-06        True   ENSMUSG00000009549         Srp14
    ## 2612  1.444950e-03  3.593141e-03        True   ENSMUSG00000063626         Unc5d
    ## 2613  1.109309e-07  4.876930e-07        True   ENSMUSG00000021514        Zfp369
    ## 2614  1.109309e-07  4.876930e-07        True   ENSMUSG00000058638        Zfp110
    ## 2615  1.715234e-09  8.993996e-09        True   ENSMUSG00000042410          Agps
    ## 2616  7.409223e-11  4.412383e-10        True   ENSMUSG00000022119         Rbm26
    ## 2617  9.265977e-04  2.388191e-03        True   ENSMUSG00000099081          <NA>
    ## 2618  1.523753e-07  6.565252e-07        True   ENSMUSG00000022142        Nup155
    ## 2619  6.391905e-05  1.975455e-04        True   ENSMUSG00000048490         Nrip1
    ## 2620  6.314020e-09  3.149517e-08        True   ENSMUSG00000032180         Tmed1
    ## 2621  2.802342e-03  6.618218e-03        True   ENSMUSG00000045435        Tmem60
    ## 2622  2.174908e-17  2.222497e-16        True   ENSMUSG00000032216         Nedd4
    ## 2623  5.430226e-10  2.994875e-09        True   ENSMUSG00000026492         Tfb2m
    ## 2624  2.097397e-06  7.917661e-06        True   ENSMUSG00000021754        Map3k1
    ## 2625  3.570308e-07  1.474257e-06        True   ENSMUSG00000034254        Agpat1
    ## 2626  2.593419e-04  7.301619e-04        True   ENSMUSG00000042462        Dctpp1
    ## 2627  5.992941e-07  2.418985e-06        True   ENSMUSG00000009630        Ppp2cb
    ## 2628  5.035699e-08  2.296693e-07        True   ENSMUSG00000002844         Adprh
    ## 2629  8.624265e-07  3.412952e-06        True   ENSMUSG00000045665         Mfsd5
    ## 2630  4.752275e-08  2.171769e-07        True   ENSMUSG00000056167        Cnot10
    ## 2631  1.613498e-07  6.927631e-07        True   ENSMUSG00000005882         Uqcc1
    ## 2632  1.631812e-05  5.506719e-05        True   ENSMUSG00000021540         Smad5
    ## 2633  2.705709e-10  1.533555e-09        True   ENSMUSG00000022884        Eif4a2
    ## 2634  7.350485e-05  2.255994e-04        True   ENSMUSG00000049562         Ap5b1
    ## 2635  2.221316e-06  8.365682e-06        True   ENSMUSG00000041219     Arhgap11a
    ## 2636  6.112262e-06  2.183029e-05        True   ENSMUSG00000030815         Phkg2
    ## 2637  9.738066e-04  2.503805e-03        True   ENSMUSG00000038346        Zfp384
    ## 2638  1.347950e-11  8.618677e-11        True   ENSMUSG00000020076         Ddx50
    ## 2639  1.374422e-02  2.780879e-02        True   ENSMUSG00000027324        Rpusd2
    ## 2640  4.886655e-03  1.096695e-02        True   ENSMUSG00000053453         Thoc7
    ## 2641  1.713532e-07  7.331510e-07        True   ENSMUSG00000026970         Rbms1
    ## 2642  1.130202e-04  3.379181e-04        True   ENSMUSG00000033356         Pus7l
    ## 2643  9.491839e-03  1.998730e-02        True   ENSMUSG00000029536          Gatc
    ## 2644  2.753010e-13  2.058238e-12        True   ENSMUSG00000039191          Rbpj
    ## 2645  2.128314e-12  1.467131e-11        True   ENSMUSG00000061136       Prpf40a
    ## 2646  8.109471e-12  5.286713e-11        True   ENSMUSG00000028668          Eloa
    ## 2647  1.613368e-05  5.447932e-05        True   ENSMUSG00000025474       Tubgcp2
    ## 2648  2.561675e-02  4.831157e-02        True   ENSMUSG00000040836        Gpr161
    ## 2649  2.438540e-12  1.673039e-11        True   ENSMUSG00000020361         Hspa4
    ## 2650  2.054636e-08  9.758144e-08        True   ENSMUSG00000021418         Rpp40
    ## 2651  1.658097e-09  8.700108e-09        True   ENSMUSG00000054309         Cpsf3
    ## 2652  1.729552e-04  5.033601e-04        True   ENSMUSG00000035329        Fbxo33
    ## 2653  3.024254e-06  1.121249e-05        True   ENSMUSG00000001774       Chordc1
    ## 2654  1.017771e-03  2.604685e-03        True   ENSMUSG00000015053         Gata2
    ## 2655  3.405192e-08  1.584262e-07        True   ENSMUSG00000024431         Nr3c1
    ## 2656  8.160832e-09  4.021747e-08        True   ENSMUSG00000002365          Snx9
    ## 2657  5.903400e-04  1.567045e-03        True   ENSMUSG00000029464          Gpn3
    ## 2658  1.794538e-07  7.657592e-07        True   ENSMUSG00000038299         Wdr36
    ## 2659  1.007316e-07  4.443208e-07        True   ENSMUSG00000027099          Mtx2
    ## 2660  9.046107e-09  4.434758e-08        True   ENSMUSG00000030298         Sec13
    ## 2661  1.465638e-03  3.642885e-03        True   ENSMUSG00000019842      Traf3ip2
    ## 2662  3.606979e-04  9.926027e-04        True   ENSMUSG00000047368       Abhd17b
    ## 2663  7.775850e-07  3.095610e-06        True   ENSMUSG00000024982        Zdhhc6
    ## 2664  6.743844e-06  2.393615e-05        True   ENSMUSG00000063576        Klhdc3
    ## 2665  3.914094e-04  1.069379e-03        True   ENSMUSG00000031349         Nsdhl
    ## 2666  2.455686e-07  1.032979e-06        True   ENSMUSG00000015605           Srf
    ## 2667  2.386928e-04  6.770380e-04        True   ENSMUSG00000030929          Eri2
    ## 2668  1.519784e-16  1.454403e-15        True   ENSMUSG00000005413         Hmox1
    ## 2669  1.503519e-05  5.094328e-05        True   ENSMUSG00000022674        Ube2v2
    ## 2670  9.443188e-11  5.571725e-10        True   ENSMUSG00000056999           Ide
    ## 2671  1.031856e-09  5.524911e-09        True   ENSMUSG00000042842     Serpinb6b
    ## 2672  2.250461e-04  6.414055e-04        True   ENSMUSG00000022760         Thap7
    ## 2673  7.132823e-08  3.188510e-07        True   ENSMUSG00000032563         Mrpl3
    ## 2674  2.189179e-02  4.202592e-02        True   ENSMUSG00000015790         Surf1
    ## 2675  4.744367e-07  1.938527e-06        True   ENSMUSG00000022889        Mrpl39
    ## 2676  1.690730e-05  5.694715e-05        True   ENSMUSG00000016253        Nelfcd
    ## 2677  2.197124e-04  6.278846e-04        True   ENSMUSG00000020329        Polrmt
    ## 2678  1.711447e-04  4.990002e-04        True   ENSMUSG00000021040         Slirp
    ## 2679  1.642101e-05  5.537930e-05        True   ENSMUSG00000031783        Polr2c
    ## 2680  3.725155e-03  8.571990e-03        True   ENSMUSG00000007594        Hapln4
    ## 2681  3.927629e-13  2.898895e-12        True   ENSMUSG00000031672          Got2
    ## 2682  1.795610e-06  6.853859e-06        True   ENSMUSG00000022369          Mtbp
    ## 2683  2.562884e-07  1.076088e-06        True   ENSMUSG00000020549         Elac2
    ## 2684  8.106062e-06  2.850507e-05        True   ENSMUSG00000028070          Naxe
    ## 2685  1.112103e-04  3.328183e-04        True   ENSMUSG00000033904        Ccp110
    ## 2686  2.705725e-08  1.272177e-07        True   ENSMUSG00000020720        Psmd12
    ## 2687  1.002000e-02  2.098052e-02        True   ENSMUSG00000050931         Sgms2
    ## 2688  1.815633e-05  6.083341e-05        True   ENSMUSG00000020864       Ankrd40
    ## 2689  3.568504e-04  9.833703e-04        True   ENSMUSG00000020482       Ccdc117
    ## 2690  1.836547e-09  9.595465e-09        True   ENSMUSG00000028180        Zranb2
    ## 2691  7.071479e-10  3.860070e-09        True   ENSMUSG00000032737        Inppl1
    ## 2692  2.086470e-03  5.043908e-03        True   ENSMUSG00000015126          Tsr3
    ## 2693  6.484876e-06  2.309668e-05        True   ENSMUSG00000032436         Cmtm7
    ## 2694  4.052778e-05  1.288948e-04        True   ENSMUSG00000054027        Nt5dc3
    ## 2695  4.052778e-05  1.288948e-04        True   ENSMUSG00000112743        Nt5dc3
    ## 2696  2.315755e-04  6.587220e-04        True   ENSMUSG00000024145          Pigf
    ## 2697  8.065295e-12  5.260061e-11        True   ENSMUSG00000022752       Tomm70a
    ## 2698  5.041875e-04  1.356618e-03        True   ENSMUSG00000022707          Gbe1
    ## 2699  3.008478e-11  1.861736e-10        True   ENSMUSG00000026356          Dars
    ## 2700  7.466228e-03  1.610841e-02        True   ENSMUSG00000020229       Slc5a4a
    ## 2701  5.229942e-07  2.126595e-06        True   ENSMUSG00000025137         Pcyt2
    ## 2702  6.022409e-03  1.323107e-02        True   ENSMUSG00000023087          Noct
    ## 2703  3.028009e-05  9.806034e-05        True   ENSMUSG00000019338        Zfp687
    ## 2704  2.286917e-02  4.372877e-02        True   ENSMUSG00000042570         Mier2
    ## 2705  7.746413e-03  1.665891e-02        True   ENSMUSG00000042709        Atpaf2
    ## 2706  1.925209e-06  7.305641e-06        True   ENSMUSG00000037275        Gemin5
    ## 2707  2.050765e-06  7.752619e-06        True   ENSMUSG00000018068         Ints2
    ## 2708  1.454131e-06  5.609997e-06        True   ENSMUSG00000028907         Utp11
    ## 2709  5.793470e-04  1.539912e-03        True   ENSMUSG00000015133         Lrrk1
    ## 2710  3.600638e-07  1.486031e-06        True   ENSMUSG00000031143        Ccdc22
    ## 2711  6.736908e-08  3.023374e-07        True   ENSMUSG00000022433        Csnk1e
    ## 2712  8.169446e-07  3.240993e-06        True   ENSMUSG00000033706         Smyd5
    ## 2713  3.835652e-09  1.948570e-08        True   ENSMUSG00000020687         Cdc27
    ## 2714  4.927130e-05  1.550662e-04        True   ENSMUSG00000023723        Mrps23
    ## 2715  5.947341e-04  1.577922e-03        True   ENSMUSG00000058239          Usf2
    ## 2716  3.452733e-07  1.427201e-06        True   ENSMUSG00000002307          Daxx
    ## 2717  5.019989e-05  1.576758e-04        True   ENSMUSG00000030045        Mrpl19
    ## 2718  3.776680e-10  2.115047e-09        True   ENSMUSG00000009863          Sdhb
    ## 2719  5.830023e-06  2.088296e-05        True   ENSMUSG00000013858       Tmem259
    ## 2720  2.177174e-12  1.500165e-11        True   ENSMUSG00000039703        Nploc4
    ## 2721  2.976885e-11  1.843614e-10        True   ENSMUSG00000021595         Nsun2
    ## 2722  3.187841e-06  1.179435e-05        True   ENSMUSG00000020156        Pwwp3a
    ## 2723  3.515646e-09  1.793991e-08        True   ENSMUSG00000006676         Usp19
    ## 2724  5.188968e-05  1.624744e-04        True   ENSMUSG00000020700        Map3k3
    ## 2725  1.409591e-08  6.795420e-08        True   ENSMUSG00000018433         Nol11
    ## 2726  2.520448e-04  7.118761e-04        True   ENSMUSG00000058173         Smco4
    ## 2727  1.544718e-04  4.535339e-04        True   ENSMUSG00000025076         Casp7
    ## 2728  4.719367e-08  2.157348e-07        True   ENSMUSG00000049680         Urgcp
    ## 2729  3.400371e-07  1.407378e-06        True   ENSMUSG00000027282         Mtch2
    ## 2730  2.005993e-10  1.151266e-09        True   ENSMUSG00000055013         Agap1
    ## 2731  5.763988e-04  1.532841e-03        True   ENSMUSG00000002814         Top3a
    ## 2732  2.544237e-05  8.344263e-05        True   ENSMUSG00000070426        Rnf121
    ## 2733  4.829648e-07  1.972364e-06        True   ENSMUSG00000001105         Ift20
    ## 2734  5.360653e-08  2.431706e-07        True   ENSMUSG00000022680        Pdxdc1
    ## 2735  2.568339e-08  1.209717e-07        True   ENSMUSG00000020694          Tlk2
    ## 2736  1.411127e-10  8.201790e-10        True   ENSMUSG00000040250        Ints13
    ## 2737  1.522671e-05  5.155841e-05        True   ENSMUSG00000031527          Eri1
    ## 2738  5.854596e-12  3.884903e-11        True   ENSMUSG00000027774          Gfm1
    ## 2739  6.600343e-06  2.346854e-05        True   ENSMUSG00000030245        Golt1b
    ## 2740  1.938908e-05  6.465187e-05        True   ENSMUSG00000035958          Tdp2
    ## 2741  1.932638e-14  1.580547e-13        True   ENSMUSG00000020719          Ddx5
    ## 2742  1.900974e-07  8.085846e-07        True   ENSMUSG00000033596         Rfwd3
    ## 2743  2.381720e-02  4.530289e-02        True   ENSMUSG00000031482      Slc25a15
    ## 2744  3.069479e-04  8.550004e-04        True   ENSMUSG00000024319         Vps52
    ## 2745  3.232014e-13  2.398779e-12        True   ENSMUSG00000020849         Ywhae
    ## 2746  9.530380e-06  3.324290e-05        True   ENSMUSG00000063108         Zfp26
    ## 2747  5.639884e-04  1.502589e-03        True   ENSMUSG00000024824         Rad9a
    ## 2748  5.216909e-08  2.370540e-07        True   ENSMUSG00000027710         Acad9
    ## 2749  1.764514e-03  4.320529e-03        True   ENSMUSG00000021252         Erg28
    ## 2750  1.017839e-06  3.999242e-06        True   ENSMUSG00000026203        Dnajb2
    ## 2751  2.292425e-10  1.306731e-09        True   ENSMUSG00000029017         Pmpcb
    ## 2752  2.487251e-02  4.702458e-02        True   ENSMUSG00000039427          Alg1
    ## 2753  9.792556e-05  2.952184e-04        True   ENSMUSG00000042747       Krtcap2
    ## 2754  6.227223e-06  2.221604e-05        True   ENSMUSG00000071533          Pcnp
    ## 2755  6.705338e-12  4.420043e-11        True   ENSMUSG00000015961          Adss
    ## 2756  7.064144e-08  3.160463e-07        True   ENSMUSG00000029422         Rsrc2
    ## 2757  5.093920e-08  2.320596e-07        True   ENSMUSG00000034290          Nek9
    ## 2758  4.247913e-06  1.545153e-05        True   ENSMUSG00000031093        Dock11
    ## 2759  1.645988e-07  7.050071e-07        True   ENSMUSG00000031657        Heatr3
    ## 2760  7.533381e-04  1.967029e-03        True   ENSMUSG00000021179         Nrde2
    ## 2761  2.508065e-04  7.087547e-04        True   ENSMUSG00000028483        Snapc3
    ## 2762  1.110476e-06  4.352520e-06        True   ENSMUSG00000031993         Snx19
    ## 2763  2.842119e-05  9.250934e-05        True   ENSMUSG00000019947        Arid5b
    ## 2764  5.431082e-03  1.205297e-02        True   ENSMUSG00000036733         Rbm42
    ## 2765  2.266229e-05  7.486289e-05        True   ENSMUSG00000025979          Mob4
    ## 2766  3.243689e-07  1.346717e-06        True   ENSMUSG00000037916        Ndufv1
    ## 2767  3.501367e-04  9.660362e-04        True   ENSMUSG00000109061          <NA>
    ## 2768  3.501367e-04  9.660362e-04        True   ENSMUSG00000002948        Map2k7
    ## 2769  2.611531e-02  4.915896e-02        True   ENSMUSG00000040699         Limd2
    ## 2770  1.024471e-02  2.140333e-02        True   ENSMUSG00000039477        Tnrc18
    ## 2771  3.018294e-05  9.776553e-05        True   ENSMUSG00000028252          Ccnc
    ## 2772  1.347914e-07  5.856604e-07        True   ENSMUSG00000001755         Coasy
    ## 2773  3.694563e-08  1.713900e-07        True   ENSMUSG00000018481        Appbp2
    ## 2774  3.009989e-15  2.604309e-14        True   ENSMUSG00000058655         Eif4b
    ## 2775  8.680258e-09  4.261945e-08        True   ENSMUSG00000036390       Gadd45a
    ## 2776  5.313989e-07  2.157474e-06        True   ENSMUSG00000019894       Slc6a15
    ## 2777  1.755876e-05  5.896732e-05        True   ENSMUSG00000068328          Aup1
    ## 2778  6.476911e-08  2.910947e-07        True   ENSMUSG00000033054          Npat
    ## 2779  5.720354e-03  1.263525e-02        True   ENSMUSG00000020375         Rufy1
    ## 2780  6.502180e-04  1.717143e-03        True   ENSMUSG00000002210          Smg9
    ## 2781  8.980575e-04  2.320248e-03        True   ENSMUSG00000020659         Cbll1
    ## 2782  3.626547e-04  9.974722e-04        True   ENSMUSG00000038876        Rnf146
    ## 2783  1.646810e-04  4.816489e-04        True   ENSMUSG00000039765        Cc2d2a
    ## 2784  1.161886e-08  5.635480e-08        True   ENSMUSG00000043131         Mob1a
    ## 2785  8.641931e-07  3.419096e-06        True   ENSMUSG00000031129        Slc9a9
    ## 2786  2.408885e-07  1.015432e-06        True   ENSMUSG00000032582          Rbm6
    ## 2787  2.449624e-13  1.843798e-12        True   ENSMUSG00000028961           Pgd
    ## 2788  1.700695e-06  6.512466e-06        True   ENSMUSG00000022228       Zscan26
    ## 2789  1.546211e-09  8.134417e-09        True   ENSMUSG00000034659       Tmem109
    ## 2790  7.686759e-04  2.003801e-03        True   ENSMUSG00000025645        Ccdc51
    ## 2791  1.662279e-03  4.093421e-03        True   ENSMUSG00000101892 9130401M01Rik
    ## 2792  1.662279e-03  4.093421e-03        True   ENSMUSG00000022362          <NA>
    ## 2793  2.103769e-13  1.597025e-12        True   ENSMUSG00000031960          Aars
    ## 2794  2.981971e-03  7.010309e-03        True   ENSMUSG00000067722      BC003965
    ## 2795  1.953178e-04  5.630578e-04        True   ENSMUSG00000062054          Iah1
    ## 2796  2.724296e-09  1.401367e-08        True   ENSMUSG00000062234           Gak
    ## 2797  7.713906e-04  2.010222e-03        True   ENSMUSG00000037221        Mospd3
    ## 2798  4.624096e-06  1.677022e-05        True   ENSMUSG00000022438         Parvb
    ## 2799  3.895630e-08  1.803507e-07        True   ENSMUSG00000052144        Ppp4r2
    ## 2800  7.582099e-06  2.675089e-05        True   ENSMUSG00000015668        Pdzd11
    ## 2801  2.321767e-03  5.567222e-03        True   ENSMUSG00000055334         Snupn
    ## 2802  6.228818e-03  1.365263e-02        True   ENSMUSG00000037938        Chchd5
    ## 2803  6.743619e-03  1.467226e-02        True   ENSMUSG00000029681         Bcl7b
    ## 2804  2.788494e-06  1.038420e-05        True   ENSMUSG00000033186          Mzt1
    ## 2805  2.013840e-02  3.903052e-02        True   ENSMUSG00000020718         Polg2
    ## 2806  4.181698e-09  2.115619e-08        True   ENSMUSG00000025156          Gps1
    ## 2807  6.917543e-14  5.437352e-13        True   ENSMUSG00000063229          Ldha
    ## 2808  3.542339e-10  1.988690e-09        True   ENSMUSG00000025290         Rps24
    ## 2809  9.940174e-07  3.911418e-06        True   ENSMUSG00000025199          Chuk
    ## 2810  2.361746e-09  1.222749e-08        True   ENSMUSG00000019977         Hbs1l
    ## 2811  4.285708e-11  2.607669e-10        True   ENSMUSG00000001228         Uhrf1
    ## 2812  1.016565e-03  2.602016e-03        True   ENSMUSG00000053134        Supt7l
    ## 2813  1.914074e-07  8.139400e-07        True   ENSMUSG00000051329        Nup160
    ## 2814  7.208763e-06  2.550695e-05        True   ENSMUSG00000029265           Dr1
    ## 2815  4.914091e-07  2.005311e-06        True   ENSMUSG00000024188         Luc7l
    ## 2816  4.497282e-05  1.421825e-04        True   ENSMUSG00000024833         Pola2
    ## 2817  1.903728e-04  5.494459e-04        True   ENSMUSG00000027079          Clp1
    ## 2818  4.959346e-07  2.022228e-06        True   ENSMUSG00000029171          Pgm2
    ## 2819  3.794403e-10  2.124227e-09        True   ENSMUSG00000030447        Cyfip1
    ## 2820  1.125952e-02  2.331005e-02        True   ENSMUSG00000018239       Zcchc10
    ## 2821  1.066886e-07  4.694297e-07        True   ENSMUSG00000038028         Tigar
    ## 2822  1.390939e-05  4.743985e-05        True   ENSMUSG00000042694          Stn1
    ## 2823  2.002722e-08  9.520084e-08        True   ENSMUSG00000027108          Ola1
    ## 2824  1.855116e-05  6.203918e-05        True   ENSMUSG00000018572         Phf23
    ## 2825  1.953358e-04  5.630578e-04        True   ENSMUSG00000015971         Actr8
    ##                                                                                                                          GeneDescription
    ## 1                                                                                                              glycoprotein 5 (platelet)
    ## 2                                                                                                                    predicted gene 5737
    ## 3                                                                                                                         interleukin 33
    ## 4                                                                                                       chemokine (C-X-C motif) ligand 2
    ## 5                                                                                                       chemokine (C-X-C motif) ligand 3
    ## 6                                                                                                          high mobility group AT-hook 2
    ## 7                                                                                                                                nexilin
    ## 8                                                                                                                            microRNA 25
    ## 9                                                                                                                 casein alpha s2-like A
    ## 10                                                                                                                           follistatin
    ## 11                                                                                                                   nucleolar protein 4
    ## 12                                                                                                        myeloblastosis oncogene-like 2
    ## 13                                                                                                           BCL2-like 12 (proline rich)
    ## 14                                                                                                                 predicted gene, 24451
    ## 15                                                                                                      cell division cycle associated 8
    ## 16                                                                                    ectonucleotide pyrophosphatase/phosphodiesterase 2
    ## 17                                                                                                                  centromere protein A
    ## 18                                                                                                       B cell CLL/lymphoma 6, member B
    ## 19                                                                                                                            schlafen 4
    ## 20                                                                                                                            schlafen 3
    ## 21                                                                                                      coiled-coil domain containing 24
    ## 22                                                                                                                 PHD finger protein 19
    ## 23                                                                                                          polyamine-modulated factor 1
    ## 24                                                                                                           ribonucleotide reductase M2
    ## 25                                                                                            signal transducing adaptor family member 1
    ## 26                                                                                                                               maestro
    ## 27                                                                                                  hook microtubule tethering protein 1
    ## 28                                                                                                 zinc finger, CCHC domain containing 3
    ## 29                                                                                            ankyrin repeat and LEM domain containing 1
    ## 30                                                                                                       small nucleolar RNA, C/D box 4A
    ## 31                                                                                        minichromosome maintenance complex component 5
    ## 32                                                                                                        ubiquitin specific peptidase 1
    ## 33                                                                                                                             cyclin E2
    ## 34                                                                                                                    polo like kinase 1
    ## 35                                                                                         adaptor-related protein complex AP-4, sigma 1
    ## 36                                                                                                      mixed lineage kinase domain-like
    ## 37                                                                                                    stimulated by retinoic acid gene 6
    ## 38                                                                                                                 cell division cycle 6
    ## 39                                                                                             small proline-rich protein 2J, pseudogene
    ## 40                                                                                                              growth arrest specific 2
    ## 41                                                                                  spindle and kinetochore associated complex subunit 3
    ## 42                                                                                                                  centromere protein W
    ## 43                                                                                                      cell division cycle associated 5
    ## 44                                                                                           neuronal guanine nucleotide exchange factor
    ## 45                                                                                             NUF2, NDC80 kinetochore complex component
    ## 46                                                                                                                             cyclin E1
    ## 47                                                                                                     G two S phase expressed protein 1
    ## 48                                                                      ankyrin repeat, SAM and basic leucine zipper domain containing 1
    ## 49                                                                                         Myb/SANT-like DNA-binding domain containing 3
    ## 50                                                                                        protein tyrosine phosphatase, receptor type, Q
    ## 51                                                                                                                    four jointed box 1
    ## 52                                                                                          TATA-box binding protein associated factor 5
    ## 53                                                                                 nuclear autoantigenic sperm protein (histone-binding)
    ## 54                                                                                                                       forkhead box C1
    ## 55                                                                                               RNA binding motif (RNP1, RRM) protein 3
    ## 56                                                                                                               cell division cycle 25C
    ## 57                                                                                                      ubiquitin-conjugating enzyme E2T
    ## 58                                                                                                                            matrilin 4
    ## 59                                                                                                              kinesin family member 22
    ## 60                                                                                                                       aurora kinase B
    ## 61                                                                                                              H2A clustered histone 21
    ## 62                                                                                                              kinesin family member 15
    ## 63                                                                                                                  centromere protein K
    ## 64                                                                                                             high mobility group box 2
    ## 65                                                                                                      coiled-coil domain containing 77
    ## 66                                                                                                       suppressor of variegation 3-9 1
    ## 67                                                                                                                                  <NA>
    ## 68                                                                                                                           homeobox D4
    ## 69                                                                                                                             cyclin A2
    ## 70                                                                                                              H2B clustered histone 18
    ## 71                                                                                                                PHD finger protein 21B
    ## 72                                                                                               RNA binding motif protein, X chromosome
    ## 73                                                                                               serum/glucocorticoid regulated kinase 1
    ## 74                                             excision repair cross-complementing rodent repair deficiency complementation group 6 like
    ## 75                                                                                                                 DEAD box helicase 39a
    ## 76                                                                                                          PCNA clamp associated factor
    ## 77                                                                                                                             cyclin B1
    ## 78                                                                                           V-set and transmembrane domain containing 5
    ## 79                                                                                       IQ motif containing GTPase activating protein 3
    ## 80                                                                                                                          thymopoietin
    ## 81                                                                                                                               claspin
    ## 82                                                                                                           ribonucleotide reductase M1
    ## 83                                                                                           chromodomain helicase DNA binding protein 3
    ## 84                                                                                                             kinesin family member 18B
    ## 85                                                                                                      DEK proto-oncogene (DNA binding)
    ## 86                                                sema domain, immunoglobulin domain (Ig), short basic domain, secreted, (semaphorin) 3A
    ## 87                                                                                            nucleolar and spindle associated protein 1
    ## 88                                                                                                              kinesin family member 2C
    ## 89                                                                                                                             cyclin B2
    ## 90                                                                                                                   predicted gene 8764
    ## 91                                                                                                                   predicted gene 6763
    ## 92                                                                                                                   predicted gene 4302
    ## 93                                                                                                            RIKEN cDNA 4931428L18 gene
    ## 94                                                                                                                 predicted gene, 21293
    ## 95                                                                                                                   predicted gene 4307
    ## 96                                                                                                              THO complex 4 pseudogene
    ## 97                                                                                                                   predicted gene 4340
    ## 98                                                                                                                 Aly/REF export factor
    ## 99                                                                                                                 predicted gene, 20765
    ## 100                                                                                                              Aly/REF export factor 2
    ## 101                                                                                                                predicted gene, 21304
    ## 102                                                                                                                  predicted gene 4303
    ## 103                                                                                                                  predicted gene 4305
    ## 104                                                                                                                  predicted gene 4301
    ## 105                                                                                                                  predicted gene 4312
    ## 106                                                                                                                predicted gene, 21312
    ## 107                                                                                                            high mobility group box 1
    ## 108                                                           proteasome (prosome, macropain) 26S subunit, ATPase 3, interacting protein
    ## 109                                                                                                                predicted gene, 48552
    ## 110                                                                    cell proliferation regulating inhibitor of protein phosphatase 2A
    ## 111                                                                                             non-SMC condensin II complex, subunit G2
    ## 112                                                                                                                        exonuclease 1
    ## 113                                                                                                                 centromere protein V
    ## 114                                                                                              structural maintenance of chromosomes 2
    ## 115                                                                                                           HIRA interacting protein 3
    ## 116                                                                                                GINS complex subunit 1 (Psf1 homolog)
    ## 117                                                                              TOPBP1-interacting checkpoint and replication regulator
    ## 118                                                                                       minichromosome maintenance complex component 3
    ## 119                                                                                       aurora kinase A and ninein interacting protein
    ## 120                                                                                                  non-homologous end joining factor 1
    ## 121                                                                                                                        ect2 oncogene
    ## 122                                                                                           kinetochore-localized astrin/SPAG5 binding
    ## 123                                                                                          heterogeneous nuclear ribonucleoprotein A/B
    ## 124                                                                                                                           stathmin 1
    ## 125                                                                                              non-SMC condensin I complex, subunit D2
    ## 126                                                                                                                      interleukin 17D
    ## 127                                                                                                                 centromere protein L
    ## 128                                                                                                        heparin binding growth factor
    ## 129                                                                                             interleukin 1 receptor accessory protein
    ## 130                                                                                                     cell division cycle associated 3
    ## 131                                                                                  phosphoenolpyruvate carboxykinase 2 (mitochondrial)
    ## 132                                                                                                           RAD54 like (S. cerevisiae)
    ## 133                                                                                                          MIS18 kinetochore protein A
    ## 134                                                                   LSM3 homolog, U6 small nuclear RNA and mRNA degradation associated
    ## 135                                                                     acidic (leucine-rich) nuclear phosphoprotein 32 family, member E
    ## 136                                                                                    BUB1B, mitotic checkpoint serine/threonine kinase
    ## 137                                                                            NIMA (never in mitosis gene a)-related expressed kinase 2
    ## 138                                                                                          tRNA nucleotidyl transferase, CCA-adding, 1
    ## 139                                                                                                     Shc SH2-domain binding protein 1
    ## 140                                                                                               thyroid hormone receptor interactor 13
    ## 141                                                                                                           E2F transcription factor 7
    ## 142                                                                                                             DEP domain containing 1B
    ## 143                                                                                                            paired related homeobox 1
    ## 144                                                                               tumor necrosis factor receptor superfamily, member 12a
    ## 145                                                                                                origin recognition complex, subunit 1
    ## 146                                                                                                         ligase I, DNA, ATP-dependent
    ## 147                                                                                                                      F-box protein 5
    ## 148                                                                                                         trophinin associated protein
    ## 149                                                                                                   protein regulator of cytokinesis 1
    ## 150                                                                                                   suppressor APC domain containing 2
    ## 151                                                                                         GEN1, Holliday junction 5' flap endonuclease
    ## 152                                                                                                                PARP1 binding protein
    ## 153                                                                                                               replication protein A2
    ## 154                                                                                                     ubiquitin-conjugating enzyme E2C
    ## 155                                                                                              delta like non-canonical Notch ligand 2
    ## 156                                                                                                              H2B clustered histone 4
    ## 157                                                                                                            POC1 centriolar protein A
    ## 158                                                                                                                          chromobox 5
    ## 159                                                                     acidic (leucine-rich) nuclear phosphoprotein 32 family, member B
    ## 160                                                                                                            kinesin family member 20B
    ## 161                                                                                                          ventral anterior homeobox 1
    ## 162                                                                                                               kinetochore scaffold 1
    ## 163                                                                                            karyopherin (importin) alpha 2 pseudogene
    ## 164                                                                                                       karyopherin (importin) alpha 2
    ## 165                                                                                                 replication factor C (activator 1) 3
    ## 166                                                                                                             DEP domain containing 1a
    ## 167                                                                                               ATPase family, AAA domain containing 5
    ## 168                                                                                                  cyclin-dependent kinase inhibitor 3
    ## 169                                                                                                      Rac GTPase-activating protein 1
    ## 170                                                                          minichromosome maintenance 10 replication initiation factor
    ## 171                                                                                                         proliferation-associated 2G4
    ## 172                                                                                          reculator of chromosome condensation 1 like
    ## 173                                                                                                     X-linked lymphocyte-regulated 4A
    ## 174                                                                                                     X-linked lymphocyte-regulated 4C
    ## 175                                                                                                     X-linked lymphocyte-regulated 4B
    ## 176                                                                  SPC25, NDC80 kinetochore complex component, homolog (S. cerevisiae)
    ## 177                                                                                                              cell division cycle 25A
    ## 178                                                                                                             kinetochore associated 1
    ## 179                                                                                                               cell division cycle 20
    ## 180                                                                                               non-SMC condensin I complex, subunit G
    ## 181                                                                                                     cytochrome c oxidase subunit 7A1
    ## 182                                                                                         interferon-related developmental regulator 2
    ## 183                                                                                  protease (prosome, macropain) 26S subunit, ATPase 5
    ## 184                                                                                                               uracil DNA glycosylase
    ## 185                                                                                                                                 <NA>
    ## 186                                                                                                                  RecQ protein-like 4
    ## 187                                                                                                        leucine rich repeat protein 1
    ## 188                                                                                     microtubule associated serine/threonine kinase 1
    ## 189                                                                             protein kinase, membrane associated tyrosine/threonine 1
    ## 190                                                                                         family with sequence similarity 83, member D
    ## 191                                                                                                         topoisomerase (DNA) II alpha
    ## 192                                                                                                                   PDZ binding kinase
    ## 193                                                                                              structural maintenance of chromosomes 4
    ## 194                                                                                                 replication factor C (activator 1) 5
    ## 195                                                                                                              CDC28 protein kinase 1b
    ## 196                                                                                                   CDC28 protein kinase 1b, retrogene
    ## 197                                                                                                            cyclin-dependent kinase 1
    ## 198                                                                                                     cell division cycle associated 7
    ## 199                                                                                                   zinc finger, GRF-type containing 1
    ## 200                                                                                                            cytochrome b5 reductase 1
    ## 201                                                                                                                          homeobox C9
    ## 202                                                                                                          nuclear RNA export factor 1
    ## 203                                                                                                                      neuraminidase 2
    ## 204                                                                                                           histone aminotransferase 1
    ## 205                                                                                                              zinc finger protein 101
    ## 206                                                                                                 replication factor C (activator 1) 4
    ## 207                                                                                         homologous recombination factor with OB-fold
    ## 208                                                                                      nuclear receptor subfamily 2, group E, member 1
    ## 209                                                                                                   embryonal Fyn-associated substrate
    ## 210                                                                                                                 thymidylate synthase
    ## 211                                                                                                                 centromere protein M
    ## 212                                                                                              FYVE, RhoGEF and PH domain containing 5
    ## 213                                                                                                    Harvey rat sarcoma virus oncogene
    ## 214                                                                                                                      forkhead box M1
    ## 215                                                                                                           zwilch kinetochore protein
    ## 216                                                                                       minichromosome maintenance complex component 7
    ## 217                                                                                                                 centromere protein N
    ## 218                                                                                          regulator of telomere elongation helicase 1
    ## 219                                                                                                           RIKEN cDNA 4930503L19 gene
    ## 220                                                                                        small nuclear ribonucleoprotein polypeptide A
    ## 221                                                                                                    RAB34, member RAS oncogene family
    ## 222                                                                                             Fanconi anemia, complementation group D2
    ## 223                                                                                                    EF-hand calcium binding domain 11
    ## 224                                                                                                              MIS18 binding protein 1
    ## 225                                                                                                                   Ttk protein kinase
    ## 226                                                                                            transcription elongation factor A (SII) 1
    ## 227                                                                                                        TSSK6 activating co-chaperone
    ## 228                                                                                                  mitochondrial ribosomal protein L21
    ## 229                                                                                                                       dual oxidase 1
    ## 230                                                                                        CDC42 effector protein (Rho GTPase binding) 3
    ## 231                                                                                                            decapping exoribonuclease
    ## 232                                                                                                           RIKEN cDNA 1810009A15 gene
    ## 233                                                                                                                                 <NA>
    ## 234                                                                                                   polymerase (DNA directed), epsilon
    ## 235                                                                                   prenyl (solanesyl) diphosphate synthase, subunit 1
    ## 236                                                                                                             DLG associated protein 5
    ## 237                                                                                                           immediate early response 3
    ## 238                                                                                                     cell division cycle associated 2
    ## 239                                                                                                           immediate early response 2
    ## 240                                                                                                           RIKEN cDNA 4833420G17 gene
    ## 241                                                                                                   muscleblind like splicing factor 3
    ## 242                                                                                                           RAD51 associated protein 1
    ## 243                                                                                                                  bleomycin hydrolase
    ## 244                                                                                                       dual specificity phosphatase 6
    ## 245                                                                               complement component 1, q subcomponent binding protein
    ## 246                                                                                                     S-adenosylhomocysteine hydrolase
    ## 247                                                                                                                  predicted gene 4737
    ## 248                                                                                                                 SET nuclear oncogene
    ## 249                                                                          regulatory factor X, 1 (influences HLA class II expression)
    ## 250                                                                                                                fucosyltransferase 11
    ## 251                                                                                          glutamate-cysteine ligase, modifier subunit
    ## 252                                                                                         DND microRNA-mediated repression inhibitor 1
    ## 253                                                                                                    leucine rich repeat containing 59
    ## 254                                                                                                 MAD2 mitotic arrest deficient-like 1
    ## 255                                                                                                                 centromere protein O
    ## 256                                                                                                         SKI/DACH domain containing 1
    ## 257                                                                                                     EEF1A lysine methyltransferase 4
    ## 258                                                                   LSM2 homolog, U6 small nuclear RNA and mRNA degradation associated
    ## 259                                                                                                                  exosome component 2
    ## 260                                                                                                           sperm associated antigen 5
    ## 261                                                                                               non-SMC condensin I complex, subunit H
    ## 262                                                                                     chromatin licensing and DNA replication factor 1
    ## 263                                                                                                    proline/serine-rich coiled-coil 1
    ## 264                                                                                                               B cell CLL/lymphoma 7C
    ## 265                                                                                                             TRAF-interacting protein
    ## 266                                                                                 spindle and kinetochore associated complex subunit 1
    ## 267                                                                                                                      nucleoplasmin 3
    ## 268                                                                                                extra spindle pole bodies 1, separase
    ## 269                                                                                                  mitochondrial ribosomal protein L38
    ## 270                                                                                                   proliferating cell nuclear antigen
    ## 271                                                                                                     cell division cycle associated 4
    ## 272                                                                                                    mitochondrial fission regulator 2
    ## 273                                                                                                                             cyclin F
    ## 274                                                                   solute carrier family 1 (neutral amino acid transporter), member 5
    ## 275                                                                                                  pituitary tumor-transforming gene 1
    ## 276                                                                            alkB homolog 2, alpha-ketoglutarate-dependent dioxygenase
    ## 277                                                                                                    small nucleolar RNA, H/ACA box 15
    ## 278                                                                                                             transcription factor AP4
    ## 279                                                                                  queuine tRNA-ribosyltransferase catalytic subunit 1
    ## 280                                                                         U2 small nuclear ribonucleoprotein auxiliary factor (U2AF) 1
    ## 281                                                                                                      suppressor of variegation 3-9 2
    ## 282                                                                                                          helicase, lymphoid specific
    ## 283                                                                                        protein tyrosine phosphatase, mitochondrial 1
    ## 284                                                                                                             H2A clustered histone 20
    ## 285                                                                                                          Ly1 antibody reactive clone
    ## 286                                                                                          apoptosis antagonizing transcription factor
    ## 287                                                                                                             kinesin family member 14
    ## 288                                                                                             topoisomerase (DNA) II binding protein 1
    ## 289                                                                                                       BRCA1 associated RING domain 1
    ## 290                                                                                                            ribonuclease P 14 subunit
    ## 291                                                                                                                  exosome component 8
    ## 292                                                                                         chromatin assembly factor 1, subunit B (p60)
    ## 293                                                                                                     3-phosphoglycerate dehydrogenase
    ## 294                                                                                               flap structure specific endonuclease 1
    ## 295                                                                              mitogen-activated protein kinase kinase kinase kinase 4
    ## 296                                                                                                        epithelial membrane protein 1
    ## 297                                                                                                               cell division cycle 45
    ## 298                                                                                                                    RAD51 recombinase
    ## 299                                                                                  queuine tRNA-ribosyltransferase accessory subunit 2
    ## 300                                                                                           outer dynein arm docking complex subunit 3
    ## 301                                                                                                            kinesin family member 18A
    ## 302                                                                                solute carrier family 14 (urea transporter), member 1
    ## 303                                                                                                     huntingtin interacting protein K
    ## 304                                                                                            hydroxysteroid (17-beta) dehydrogenase 10
    ## 305                                                                        eukaryotic translation initiation factor 1A domain containing
    ## 306                                                                                       minichromosome maintenance complex component 4
    ## 307                                                                                                  translation machinery associated 16
    ## 308                                                                                                  S-phase kinase-associated protein 2
    ## 309                                                                                                              zinc finger protein 367
    ## 310                                                                                                        ribonuclease P/MRP 30 subunit
    ## 311                                                                                     DnaJ heat shock protein family (Hsp40) member C2
    ## 312                                                                                               cytoskeleton associated protein 2-like
    ## 313                                                                                                    flavin containing monooxygenase 2
    ## 314                                                                                              Fanconi anemia, complementation group A
    ## 315                                                                                                                   polo like kinase 4
    ## 316                                                                                                               ribosomal protein S27A
    ## 317                                                                                                                 centromere protein I
    ## 318                                                                                                          peptidyl prolyl isomerase H
    ## 319                                                                                                inosine monophosphate dehydrogenase 2
    ## 320                                                                                                    activating transcription factor 5
    ## 321                                                                                                              acyl-CoA thioesterase 2
    ## 322                                                                                                              acyl-CoA thioesterase 1
    ## 323                                                                                                                     DBF4 zinc finger
    ## 324                                                                                                         TPX2, microtubule-associated
    ## 325                                                                                  protease (prosome, macropain) 26S subunit, ATPase 1
    ## 326                                                                                                                      F-box protein 4
    ## 327                                                                                                              BEN domain containing 3
    ## 328                                                                                         eukaryotic translation initiation factor 4A1
    ## 329                                                                                                                       nucleoporin 85
    ## 330                                          solute carrier family 25 (mitochondrial carrier, adenine nucleotide translocator), member 5
    ## 331                                                                                                               distal-less homeobox 1
    ## 332                                                      Cbp/p300-interacting transactivator with Glu/Asp-rich carboxy-terminal domain 1
    ## 333                                                                                                     coiled-coil domain containing 18
    ## 334                                                                                    DSN1 homolog, MIS12 kinetochore complex component
    ## 335                                                                                            CDC28 protein kinase regulatory subunit 2
    ## 336                                                                                       FtsJ RNA methyltransferase homolog 1 (E. coli)
    ## 337                                                                                                                asparagine synthetase
    ## 338                                                                                      BRCA1 interacting protein C-terminal helicase 1
    ## 339                                                                                          NSE4 homolog A, SMC5-SMC6 complex component
    ## 340                                                                                       acyl-CoA synthetase long-chain family member 5
    ## 341                                                                                                     phosphoserine aminotransferase 1
    ## 342                                                                                                       anillin, actin binding protein
    ## 343                                                                                          serine hydroxymethyltransferase 1 (soluble)
    ## 344                                                                                                                            myosin IB
    ## 345                                                                                        family with sequence similarity 136, member A
    ## 346                                                                                polymerase (DNA directed), delta 1, catalytic subunit
    ## 347                                                                                         anti-silencing function 1A histone chaperone
    ## 348                                                                                                                                 <NA>
    ## 349                                                                                                   small nuclear ribonucleoprotein D3
    ## 350                                                                                             F-box and leucine-rich repeat protein 19
    ## 351                                                                                                   dyskeratosis congenita 1, dyskerin
    ## 352                                                                                           heterogeneous nuclear ribonucleoprotein H3
    ## 353                                                                               potassium channel tetramerisation domain containing 13
    ## 354                                                                                             WD repeat containing, antisense to Trp53
    ## 355                                                                                    serine hydroxymethyltransferase 2 (mitochondrial)
    ## 356                                                                                                              NOP56 ribonucleoprotein
    ## 357                                                                                                  DNA replication helicase/nuclease 2
    ## 358                                                                                                GINS complex subunit 4 (Sld5 homolog)
    ## 359                                                             protein phosphatase 1G (formerly 2C), magnesium-dependent, gamma isoform
    ## 360                                                                                                    tropomyosin 3, related sequence 7
    ## 361                                                                                                              zinc finger protein 566
    ## 362                                                                                   mago homolog, exon junction complex core component
    ## 363                                                                                                    glutathione S-transferase omega 1
    ## 364                                                                                                                       nucleoporin 37
    ## 365                                                                                              Fanconi anemia, complementation group I
    ## 366                                                                      Smg-5 homolog, nonsense mediated mRNA decay factor (C. elegans)
    ## 367                                                                                                       diamine oxidase-like protein 2
    ## 368                                                                                                          ciliary neurotrophic factor
    ## 369                                                                                                               H4 clustered histone 9
    ## 370                                                                                                               H4 clustered histone 1
    ## 371                                                                                transforming, acidic coiled-coil containing protein 3
    ## 372                                                                                       minichromosome maintenance complex component 6
    ## 373                                                                                                           ribosomal protein S27-like
    ## 374                                                                                                                      aurora kinase A
    ## 375                                                                                    ATP synthase C subunit lysine N-methyltransferase
    ## 376                                                                                      centriole, cilia and spindle associated protein
    ## 377                                                                                       translocase of inner mitochondrial membrane 10
    ## 378                                                                                            BCL2/adenovirus E1B interacting protein 1
    ## 379                                                                                                          jumonji domain containing 7
    ## 380                                                                                                                RAN binding protein 1
    ## 381                                                                                        protein phosphatase 1, regulatory subunit 15A
    ## 382                                                                                                         timeless interacting protein
    ## 383                                                                                                    cytoskeleton associated protein 2
    ## 384                                                                                         ubiquitin-fold modifier conjugating enzyme 1
    ## 385                                                                                       translocase of inner mitochondrial membrane 50
    ## 386                                                                          nudix (nucleoside diphosphate linked moiety X)-type motif 4
    ## 387                                                                                                                         prohibitin 2
    ## 388                                                                                                             short stature homeobox 2
    ## 389                                                                                     mitogen-activated protein kinase kinase kinase 6
    ## 390                                                                                        hyaluronan mediated motility receptor (RHAMM)
    ## 391                                                                                                           Max dimerization protein 3
    ## 392                                                                                                              kinesin family member 4
    ## 393                                                                                                                  testis expressed 30
    ## 394                                                                                                     lysophosphatidic acid receptor 4
    ## 395                                                                   LSM5 homolog, U6 small nuclear RNA and mRNA degradation associated
    ## 396                                                                                                                PHD finger protein 5A
    ## 397                                                                                                             DAZ associated protein 1
    ## 398                                                                                            CCR4-NOT transcription complex, subunit 9
    ## 399                                                                                               regulator of chromosome condensation 2
    ## 400                                                                                                            peptidyl-tRNA hydrolase 2
    ## 401                                                                                                                 centromere protein S
    ## 402                                                                                    DnaJ heat shock protein family (Hsp40) member C22
    ## 403                                                                            vesicular, overexpressed in cancer, prosurvival protein 1
    ## 404                                                                                              small nuclear ribonucleoprotein 40 (U5)
    ## 405                                                                                              spindle apparatus coiled-coil protein 1
    ## 406                    phosphoribosylaminoimidazole carboxylase, phosphoribosylaminoribosylaminoimidazole, succinocarboxamide synthetase
    ## 407                                                                                  serrate RNA effector molecule homolog (Arabidopsis)
    ## 408                                                                                                  NDC80 kinetochore complex component
    ## 409                                                                                                   RecQ mediated genome instability 2
    ## 410                                                                                                  leucine rich adaptor protein 1-like
    ## 411                                                                        nuclear casein kinase and cyclin-dependent kinase substrate 1
    ## 412                                                                               ATP-binding cassette, sub-family B (MDR/TAP), member 8
    ## 413                                                                                          RAD9-HUS1-RAD1 interacting nuclear orphan 1
    ## 414                                                                                                           TSR2 20S rRNA accumulation
    ## 415                                                                                                              cell division cycle 25B
    ## 416                                                                                            phosphoribosyl pyrophosphate synthetase 1
    ## 417                                                                                     phosphoribosyl pyrophosphate synthetase 1-like 3
    ## 418                                                                                                            debranching RNA lariats 1
    ## 419                                                                                                           isoleucine-tRNA synthetase
    ## 420                                                                                          protein phosphatase 4, regulatory subunit 1
    ## 421                                                                                             zinc finger and BTB domain containing 8a
    ## 422                                                                                                              early growth response 1
    ## 423                                                                                                                        ets variant 4
    ## 424                                                                                proteasome (prosome, macropain) 26S subunit, ATPase 3
    ## 425                                                                                                            vaccinia related kinase 1
    ## 426                                                                                                              survival motor neuron 1
    ## 427                                                                           LanC (bacterial lantibiotic synthetase component C)-like 2
    ## 428                                                                                                               H3 clustered histone 2
    ## 429                                                                                        nuclear receptor binding SET domain protein 2
    ## 430                                                                                                                  host cell factor C1
    ## 431                                                                   phosphoribosylformylglycinamidine synthase (FGAR amidotransferase)
    ## 432                                                                                       small nuclear ribonucleoprotein polypeptide A'
    ## 433                                                                                                         programmed cell death 2-like
    ## 434                                                                                              Fanconi anemia, complementation group M
    ## 435                                                                                                  mitochondrial ribosomal protein L48
    ## 436                                                                  asparagine-linked glycosylation 10B (alpha-1,2-glucosyltransferase)
    ## 437                                                                                   bile acid-Coenzyme A: amino acid N-acyltransferase
    ## 438                                                                                                              centrosomal protein 295
    ## 439                                                                                                       MMS22-like, DNA repair protein
    ## 440                                                            solute carrier family 6 (neurotransmitter transporter, glycine), member 9
    ## 441                                                                                                               glutathione synthetase
    ## 442                                                                    UDP-Gal:betaGlcNAc beta 1,4- galactosyltransferase, polypeptide 2
    ## 443                                                                                                           RIKEN cDNA D030056L22 gene
    ## 444                                                                          nudix (nucleoside diphosphate linked moiety X)-type motif 8
    ## 445                                                                                                                                 <NA>
    ## 446                                                                          proteasome (prosome, macropain) 26S subunit, non-ATPase, 11
    ## 447                                                                                          NIP7, nucleolar pre-rRNA processing protein
    ## 448                                                                                                           lin-9 homolog (C. elegans)
    ## 449                                                                                                   small nuclear ribonucleoprotein D1
    ## 450                                                                                                         ubiquitin related modifier 1
    ## 451                                                                                                             H2B clustered histone 14
    ## 452                                                                                                       dual specificity phosphatase 5
    ## 453                                                                              upstream binding transcription factor, RNA polymerase I
    ## 454                                                                                                  mitochondrial ribosomal protein L11
    ## 455                                                                                                        MYB binding protein (P160) 1a
    ## 456                                                                                                    sphingomyelin phosphodiesterase 4
    ## 457                                                                                                           ribonuclease H2, subunit B
    ## 458                                                                                           IMP4, U3 small nucleolar ribonucleoprotein
    ## 459                                                                                                      RAN, member RAS oncogene family
    ## 460                                                                                                                valyl-tRNA synthetase
    ## 461                                                                              synapse defective 1, Rho GTPase, homolog 1 (C. elegans)
    ## 462                                                                                               transcription factor B1, mitochondrial
    ## 463                                                                        eukaryotic translation initiation factor 4E binding protein 1
    ## 464                                                                                                             Ras and Rab interactor 2
    ## 465                                                                                                       NDC1 transmembrane nucleoporin
    ## 466                                                                                                                     F-box protein 48
    ## 467                                                                                           heterogeneous nuclear ribonucleoprotein H1
    ## 468                                                                                                                           myosin XIX
    ## 469                                                                                                             jade family PHD finger 3
    ## 470                                                                                                      RAN GTPase activating protein 1
    ## 471                                                                                                       tripartite motif-containing 28
    ## 472                                                                                                        karyopherin (importin) beta 1
    ## 473                                                                                                               centrosomal protein 44
    ## 474                                                                                N(alpha)-acetyltransferase 10, NatA catalytic subunit
    ## 475                                                                                                            POC1 centriolar protein B
    ## 476                                                                                        family with sequence similarity 111, member A
    ## 477                                                                                                      HUS1 checkpoint clamp component
    ## 478                                                                                eukaryotic translation initiation factor 1A, X-linked
    ## 479                                                                                                                  protease, serine 56
    ## 480                                                                                   polymerase (DNA directed), epsilon 3 (p17 subunit)
    ## 481                                                                                           interleukin-1 receptor-associated kinase 1
    ## 482                                                                                                  G protein-coupled receptor kinase 6
    ## 483                                                                                polymerase (DNA-directed), delta 3, accessory subunit
    ## 484                                                                                       FtsJ RNA methyltransferase homolog 3 (E. coli)
    ## 485                                                                                                                        THO complex 5
    ## 486                                                                                                                    ajuba LIM protein
    ## 487                                                                                         SWIM type zinc finger 7 associated protein 1
    ## 488                                                                                                     coiled-coil domain containing 58
    ## 489                                                                                     transforming growth factor beta regulated gene 4
    ## 490                                                                                                                 ribosomal protein S2
    ## 491                                                                              general transcription factor IIIC, polypeptide 6, alpha
    ## 492                                                                                                                          bystin-like
    ## 493                                                                                                  H1.2 linker histone, cluster member
    ## 494                                                                   HSPA (heat shock 70kDa) binding protein, cytoplasmic cochaperone 1
    ## 495                                                                                                  mitochondrial ribosomal protein S25
    ## 496                                                                                   major facilitator superfamily domain containing 2A
    ## 497                                                                                                           Sjogren syndrome antigen B
    ## 498                                                                                             UTP20 small subunit processome component
    ## 499                                                                                               zinc finger, MYND domain containing 19
    ## 500                                                                     establishment of sister chromatid cohesion N-acetyltransferase 2
    ## 501                                                                                                        BRX1, biogenesis of ribosomes
    ## 502                                                                                                          Iroquois related homeobox 3
    ## 503                                                                                                                 DEAD box helicase 20
    ## 504                                                                                                            Opa interacting protein 5
    ## 505                                                                                                                  RuvB-like protein 2
    ## 506                                                                                                             methyltransferase like 2
    ## 507                                                                                                                      fidgetin-like 1
    ## 508                                                                                                         phosphoglycolate phosphatase
    ## 509                                                                                                                  checkpoint kinase 1
    ## 510                                                                                     BUB1, mitotic checkpoint serine/threonine kinase
    ## 511                                                                                             maestro heat-like repeat family member 8
    ## 512                                                                                                          lysine methyltransferase 5A
    ## 513                                                                                   exportin, tRNA (nuclear export receptor for tRNAs)
    ## 514                                                                                               BCL2-associated transcription factor 1
    ## 515                                                                                                               cDNA sequence BC055324
    ## 516                                                                                                  mitochondrial ribosomal protein L37
    ## 517                                                                                           serine and arginine-rich splicing factor 3
    ## 518                                                                     inosine triphosphatase (nucleoside triphosphate pyrophosphatase)
    ## 519                                                                                                abnormal spindle microtubule assembly
    ## 520                                                                                                        splicing factor 3a, subunit 3
    ## 521                                                                                                                                 <NA>
    ## 522                                                                                                DGCR8, microprocessor complex subunit
    ## 523                                                                                  essential meiotic structure-specific endonuclease 1
    ## 524                                                                                                  mitochondrial ribosomal protein S27
    ## 525                                                                                                                            osteocrin
    ## 526                                                                                            plasminogen activator, urokinase receptor
    ## 527                                                                                                             H2A clustered histone 12
    ## 528                                                                                      nuclear receptor subfamily 2, group F, member 2
    ## 529                                                                                           DALR anticodon binding domain containing 3
    ## 530                                                                                                    SAS-6 centriolar assembly protein
    ## 531                                                                                                            THUMP domain containing 1
    ## 532                                                                                                               glycyl-tRNA synthetase
    ## 533                                                                                    eukaryotic translation elongation factor 1 beta 2
    ## 534                                                                                                                 centromere protein H
    ## 535                                                                                                      nudE neurodevelopment protein 1
    ## 536                                                                                                                 UBX domain protein 8
    ## 537                                                                                        meiosis-specific nuclear structural protein 1
    ## 538                                                                                     EMG1 N1-specific pseudouridine methyltransferase
    ## 539                                                                                                       ubiquitin specific protease 51
    ## 540                                                                                             non-SMC condensin II complex, subunit H2
    ## 541                                                                                                           VPS51 GARP complex subunit
    ## 542                                                                                        cell division cycle and apoptosis regulator 1
    ## 543                                                                               proteasome (prosome, macropain) 26S subunit, ATPase, 4
    ## 544                                                                                             maternal embryonic leucine zipper kinase
    ## 545                                                                                                RNA binding motif protein, X-linked 2
    ## 546                                                                                                                   thymidine kinase 1
    ## 547                                                                                                             stomatin (Epb7.2)-like 2
    ## 548                                                                                                             DNA primase, p49 subunit
    ## 549                                                                                 CD3E antigen, epsilon polypeptide associated protein
    ## 550                                                                                                    methionine sulfoxide reductase B1
    ## 551                                                                                                                   polo like kinase 2
    ## 552                                                                                               EEF1A alpha lysine methyltransferase 1
    ## 553                                                                                                    GTP-binding protein 10 (putative)
    ## 554                                                                                                 myo-inositol 1-phosphate synthase A1
    ## 555                                                                                                       actin, alpha, cardiac muscle 1
    ## 556                                                                                                                  RuvB-like protein 1
    ## 557                                                                                                                    tubulin, alpha 1A
    ## 558                                                                                                  solute carrier family 35, member C1
    ## 559                                                                                                              NEDD4 binding protein 2
    ## 560                                                                                                       lon peptidase 1, mitochondrial
    ## 561                                                                                                   suppressor of cytokine signaling 1
    ## 562                                                                                                       myeloblastosis oncogene-like 1
    ## 563                                                                                               cytochrome c oxidase assembly factor 7
    ## 564                                                                         nudix (nucleoside diphosphate linked moiety X)-type motif 21
    ## 565                                                                                      general transcription factor IIF, polypeptide 1
    ## 566                                                                                        translocase of inner mitochondrial membrane 9
    ## 567                                                                                             denticleless E3 ubiquitin protein ligase
    ## 568                                                                                                  mitochondrial ribosomal protein S28
    ## 569                                                                                                                             cullin 1
    ## 570                                                                                                    small nuclear ribonucleoprotein E
    ## 571                                                                                                                 autophagy related 9A
    ## 572                                                                                        mitochondrial tRNA translation optimization 1
    ## 573                                                                                                           PAK1 interacting protein 1
    ## 574                                                                           nucleolar protein interacting with the FHA domain of MKI67
    ## 575                                                                                       AHA1, activator of heat shock protein ATPase 1
    ## 576                                                                                                                  WD repeat domain 18
    ## 577                                                                                           gem nuclear organelle associated protein 2
    ## 578                                                                solute carrier family 16 (monocarboxylic acid transporters), member 1
    ## 579                                                       solute carrier family 7 (cationic amino acid transporter, y+ system), member 5
    ## 580                                                                                              Fanconi anemia, complementation group B
    ## 581                                                                                                 treacle ribosome biogenesis factor 1
    ## 582                                         pleckstrin homology domain-containing, family A (phosphoinositide binding specific) member 3
    ## 583                                                                                               protein arginine N-methyltransferase 7
    ## 584                                                                                   polymerase (DNA directed), epsilon 2 (p59 subunit)
    ## 585                                                                                                                                 <NA>
    ## 586                                                                                                              transcription factor 19
    ## 587                                                                                                                       nucleoporin 35
    ## 588                                                                                                 BRCA2 and CDKN1A interacting protein
    ## 589                                                                                                                           importin 5
    ## 590                                                                                       translocase of outer mitochondrial membrane 40
    ## 591                                                                                                     Rho GTPase activating protein 19
    ## 592                                                                                                    nudC nuclear distribution protein
    ## 593                                                                                                                FAST kinase domains 2
    ## 594                                                                                                                            metaxin 1
    ## 595                                                                                                                proteolipid protein 2
    ## 596                                                                                                     proteolipid protein 2 pseudogene
    ## 597                                                                          CCZ1 vacuolar protein trafficking and biogenesis associated
    ## 598                                                                                                                        inhibin alpha
    ## 599                                                                                                                    GPN-loop GTPase 1
    ## 600                                                                                                           RIKEN cDNA A730008H23 gene
    ## 601                                                                                                       TGFB-induced factor homeobox 1
    ## 602                                                                                                                 heat shock protein 9
    ## 603                                                                                                                  WD repeat domain 76
    ## 604                                                                                         glutamic-oxaloacetic transaminase 1, soluble
    ## 605                                                                                                      ribosome biogenesis regulator 1
    ## 606                                                                                                     Ewing tumor-associated antigen 1
    ## 607                                                                   ribosomal RNA processing 9, U3 small nucleolar RNA binding protein
    ## 608                                                                                                           RIKEN cDNA 4930579G24 gene
    ## 609                                                                                       translocase of inner mitochondrial membrane 21
    ## 610                                                                                                             ankyrin repeat domain 61
    ## 611                                                                                             Jupiter microtubule associated homolog 2
    ## 612                                                                                            heterogeneous nuclear ribonucleoprotein U
    ## 613                                                                                                 transmembrane 7 superfamily member 3
    ## 614                                                                                          mRNA turnover 4, ribosome maturation factor
    ## 615                                                                                                                      nucleoporin 107
    ## 616                                                                     CDK2 (cyclin-dependent kinase 2)-associated protein 1 pseudogene
    ## 617                                                                                CDK2 (cyclin-dependent kinase 2)-associated protein 1
    ## 618                                                                                                                         neuregulin 2
    ## 619                                                                                            NADH:ubiquinone oxidoreductase subunit B9
    ## 620                                                regulator of chromosome condensation (RCC1) and BTB (POZ) domain containing protein 2
    ## 621                                                                                                        K(lysine) acetyltransferase 5
    ## 622                                                                                            NADH:ubiquinone oxidoreductase subunit A9
    ## 623                                                                                                                       cytochrome c-1
    ## 624                                                                                                  mitochondrial ribosomal protein L23
    ## 625                                                   nuclear factor of kappa light polypeptide gene enhancer in B cells inhibitor, zeta
    ## 626                                                                                                   asparagine-linked glycosylation 13
    ## 627                                                                                           glycosyltransferase 28 domain containing 2
    ## 628                                                                                                            kinesin family member 20A
    ## 629                                                                                                 adenosine deaminase, tRNA-specific 3
    ## 630                                                                                                                                 <NA>
    ## 631                                                                                                         RNA binding motif protein 25
    ## 632                                                                                 eukaryotic translation initiation factor 4E member 2
    ## 633                                                                                                                PHD finger protein 10
    ## 634                                                                                                                                 <NA>
    ## 635                                                                                                    leucine rich repeat containing 41
    ## 636                                                                                           nucleolar and coiled-body phosphoprotein 1
    ## 637                                                                                                GINS complex subunit 3 (Psf3 homolog)
    ## 638                                                                                                                pantothenate kinase 4
    ## 639                                                                                                              ring finger protein 168
    ## 640                                                                                                                      ZW10 interactor
    ## 641                                                                                                            calcyclin binding protein
    ## 642                                                                                                           neuroblastoma ras oncogene
    ## 643                                                                                eukaryotic translation initiation factor 3, subunit F
    ## 644                                                                                          IBA57 homolog, iron-sulfur cluster assembly
    ## 645                                                                                                                ribosomal protein L10
    ## 646                                                                                           UbiA prenyltransferase domain containing 1
    ## 647                                                                                                        pre-mRNA processing factor 31
    ## 648                                                                                                      bora, aurora kinase A activator
    ## 649                                                                                                           RIKEN cDNA 2700062C07 gene
    ## 650                                                                                                  mitochondrial ribosomal protein L46
    ## 651                                                                                                      melanocyte proliferating gene 1
    ## 652                                                                                                             zinc finger protein 354A
    ## 653                                                                                     DnaJ heat shock protein family (Hsp40) member C9
    ## 654                                                                                                                 DEAD box helicase 46
    ## 655                                                                                           serine and arginine-rich splicing factor 7
    ## 656                                                                                                                 centromere protein T
    ## 657                                                                                                                 ribosomal protein S9
    ## 658                                                                                                                 MIER family member 3
    ## 659                                                                                                         breast cancer 2, early onset
    ## 660                                                                                                 NIN1/RPN12 binding protein 1 homolog
    ## 661                                                                                                                                 <NA>
    ## 662                                                                                     PWP2 periodic tryptophan protein homolog (yeast)
    ## 663                                                                                                                        THO complex 3
    ## 664                                                                                                             CFAP20 domain containing
    ## 665                                                                                                           PIF1 5'-to-3' DNA helicase
    ## 666                                                                             phosphatidylinositol glycan anchor biosynthesis, class A
    ## 667                                                                                                     polymerase (RNA) I polypeptide C
    ## 668                                                                                                    heat shock protein 1 (chaperonin)
    ## 669                                                                                                                 fumarate hydratase 1
    ## 670                                                                                                origin recognition complex, subunit 6
    ## 671                                                                                         eukaryotic translation initiation factor 4A3
    ## 672                                                                                  eukaryotic translation initiation factor 4A3 like 1
    ## 673                                                                                  eukaryotic translation initiation factor 4A3 like 2
    ## 674                                                                                                   nitrogen permease regulator-like 3
    ## 675                                                                                                     A kinase (PRKA) anchor protein 8
    ## 676                                                                                                    peptidyl-tRNA hydrolase 1 homolog
    ## 677                                                                                                 CWC15 spliceosome-associated protein
    ## 678                                                                                     methionyl aminopeptidase type 1D (mitochondrial)
    ## 679                                                                                                   Bmi1 polycomb ring finger oncogene
    ## 680                                                                                                    telomeric repeat binding factor 1
    ## 681                                                                                    DnaJ heat shock protein family (Hsp40) member C15
    ## 682                                                                                              DNA damage-induced apoptosis suppressor
    ## 683                                                                                                       engulfment and cell motility 3
    ## 684                                                                                               protein arginine N-methyltransferase 1
    ## 685                                                                                                         selenophosphate synthetase 1
    ## 686                                                                                             structure specific recognition protein 1
    ## 687                                                                              CWC22 spliceosome-associated protein homolog pseudogene
    ## 688                                                                              CWC22 spliceosome-associated protein homolog pseudogene
    ## 689                                                                              CWC22 spliceosome-associated protein homolog pseudogene
    ## 690                                                                              CWC22 spliceosome-associated protein homolog pseudogene
    ## 691                                                                              CWC22 spliceosome-associated protein homolog pseudogene
    ## 692                                                                              CWC22 spliceosome-associated protein homolog pseudogene
    ## 693                                                                              CWC22 spliceosome-associated protein homolog pseudogene
    ## 694                                                                                                 CWC22 spliceosome-associated protein
    ## 695                                                                                                    mitchondrial ribosomal protein S7
    ## 696                                                                                              deoxyhypusine hydroxylase/monooxygenase
    ## 697                                                                                                       TRM2 tRNA methyltransferase 2A
    ## 698                                                                                                             tumor protein D52-like 2
    ## 699                                                                                        chromatin assembly factor 1, subunit A (p150)
    ## 700                                                                                                                       surfeit gene 2
    ## 701                                                                                                             jade family PHD finger 2
    ## 702                                                                                 proteasome (prosome, macropain) subunit, beta type 7
    ## 703                                                                                       heterogeneous nuclear ribonucleoprotein L-like
    ## 704                                                                                                          Scl/Tal1 interrupting locus
    ## 705                                                                                                     cryptochrome 1 (photolyase-like)
    ## 706                                                                                                              zinc finger protein 568
    ## 707                                                                                            migration and invasion inhibitory protein
    ## 708                                                                                                 histone H3 associated protein kinase
    ## 709                                                                                                              programmed cell death 5
    ## 710                                                                                                                 centromere protein U
    ## 711                                                                                                    RAB13, member RAS oncogene family
    ## 712                                                                     methylenetetrahydrofolate dehydrogenase (NADP+ dependent) 2-like
    ## 713                                                                                                 U1 small nuclear ribonucleoprotein C
    ## 714                                                                                                       WD repeat domain containing 83
    ## 715                                                                                                         tryptophanyl-tRNA synthetase
    ## 716                                                                                           eukaryotic translation initiation factor 6
    ## 717                                                                                                       tripartite motif-containing 47
    ## 718                                                                                                              H4 clustered histone 14
    ## 719                                                                                            spermatid perinuclear RNA binding protein
    ## 720                                                                                                           G1 to S phase transition 1
    ## 721                                                                                                          N-myc (and STAT) interactor
    ## 722                                                                                             cilia and flagella associated protein 45
    ## 723                                                     carbamoyl-phosphate synthetase 2, aspartate transcarbamylase, and dihydroorotase
    ## 724                                                                                                                       mutS homolog 6
    ## 725                                                                                          polyribonucleotide nucleotidyltransferase 1
    ## 726                                                                                                            protocadherin 11 X-linked
    ## 727                                                                                                       RNA binding motif 31, Y-linked
    ## 728                                                                                                       8-oxoguanine DNA-glycosylase 1
    ## 729                                                       nuclear factor of kappa light polypeptide gene enhancer in B cells 2, p49/p100
    ## 730                                                                                           serine and arginine-rich splicing factor 4
    ## 731                                                                                                           RIKEN cDNA 1110059E24 gene
    ## 732                                                                                                      TATA box binding protein-like 1
    ## 733                                                                                        chaperonin containing Tcp1, subunit 6a (zeta)
    ## 734                                                                                                     ribosomal L1 domain containing 1
    ## 735                                                                                                        cms small ribosomal subunit 1
    ## 736                                                                                                           RIKEN cDNA E130311K13 gene
    ## 737                                                                                                     uridine monophosphate synthetase
    ## 738                                                                                                           RIKEN cDNA A630001G21 gene
    ## 739                                                                                transformation related protein 53 regulating kinase B
    ## 740                                                                                transformation related protein 53 regulating kinase A
    ## 741                                                                                                             PIH1 domain containing 1
    ## 742                                                                                                       methylphosphate capping enzyme
    ## 743                                                                                        family with sequence similarity 149, member A
    ## 744                                                                                                             kinesin family member 24
    ## 745                                                                                                            transmembrane protein 147
    ## 746                                                                      neutral sphingomyelinase (N-SMase) activation associated factor
    ## 747                                                                                                            transmembrane protein 101
    ## 748                                                                                                                    RNA exonuclease 2
    ## 749                                                                                                                    spermine synthase
    ## 750                                                                                                 Xrcc1 N-terminal domain containing 1
    ## 751                                                                                                 inhibitor of growth family, member 5
    ## 752                                                                                                  fibrinogen silencer binding protein
    ## 753                                                                                                  mediator of DNA damage checkpoint 1
    ## 754                                                                  growth arrest and DNA-damage-inducible, gamma interacting protein 1
    ## 755                                                                                                                   FSHD region gene 1
    ## 756                                                                                     MAPK regulated corepressor interacting protein 2
    ## 757                                                                                         PX domain containing serine/threonine kinase
    ## 758                                                                                N(alpha)-acetyltransferase 20, NatB catalytic subunit
    ## 759                                                                                                         nucleotide binding protein 1
    ## 760                                                                                                 influenza virus NS1A binding protein
    ## 761                                                                               killer cell lectin-like receptor subfamily G, member 2
    ## 762                                                                                        family with sequence similarity 133, member B
    ## 763                                                                                                 ribosome production factor 2 homolog
    ## 764                                                                                                         RNA binding motif protein 28
    ## 765                                                                        carnitine deficiency-associated gene expressed in ventricle 3
    ## 766                                                                            enhancer of zeste 2 polycomb repressive complex 2 subunit
    ## 767                                                                                                                 tropomyosin 3, gamma
    ## 768                                                                                                                      proline rich 11
    ## 769                                                                                              ubiquitin carboxyl-terminal esterase L4
    ## 770                                                                    ubiquitin carboxyl-terminal esterase L3 (ubiquitin thiolesterase)
    ## 771                                                                              coiled-coil-helix-coiled-coil-helix domain containing 4
    ## 772                                                                      PRP38 pre-mRNA processing factor 38 (yeast) domain containing A
    ## 773                                                                                              aldo-keto reductase family 1, member B8
    ## 774                                                                                                        integrator complex subunit 14
    ## 775                                                                                                                           prohibitin
    ## 776                                                                                                               twinkle mtDNA helicase
    ## 777                                                                                                              zinc finger protein 706
    ## 778                                                                                                       tripartite motif-containing 27
    ## 779                                                                                                              SET domain containing 6
    ## 780                                                                                                     polymerase (DNA directed), theta
    ## 781                                                                                     catechol-O-methyltransferase domain containing 1
    ## 782                                                                                                       myotubularin related protein 2
    ## 783                                                                                                                 centromere protein E
    ## 784                                                                                                                     ATPase type 13A1
    ## 785                                                                                                           protoporphyrinogen oxidase
    ## 786                                                                                        STIP1 homology and U-Box containing protein 1
    ## 787                                                                                                            poly (A) polymerase alpha
    ## 788                                                                                                        ubiquitin domain containing 2
    ## 789                                                                                                            methyltransferase like 14
    ## 790                                                                                            lipoyl(octanoyl) transferase 2 (putative)
    ## 791                                                                                                             M phase phosphoprotein 6
    ## 792                                                                                           apoptotic chromatin condensation inducer 1
    ## 793                                                                                                                           exportin 5
    ## 794                                                                                                                ribosomal protein S25
    ## 795                                                                                           mesenteric estrogen dependent adipogenesis
    ## 796                                                                                                          lin-52 homolog (C. elegans)
    ## 797                                                                                                  nuclear transcription factor-Y beta
    ## 798                                                                                                       FMRP translational regulator 1
    ## 799                                                                                                    small nuclear ribonucleoprotein B
    ## 800                                                                                               striatin, calmodulin binding protein 4
    ## 801                                                                                         family with sequence similarity 72, member A
    ## 802                                                                                                             pseudouridine synthase 1
    ## 803                                                                                               ATPase family, AAA domain containing 2
    ## 804                                                                                           eukaryotic translation initiation factor 5
    ## 805                                                                                                                ribosomal protein S11
    ## 806                                 Alport syndrome, mental retardation, midface hypoplasia and elliptocytosis chromosomal region gene 1
    ## 807                                                                              DOT1-like, histone H3 methyltransferase (S. cerevisiae)
    ## 808                                                                                        chaperonin containing Tcp1, subunit 3 (gamma)
    ## 809                                                                                                                  WD repeat domain 74
    ## 810                                                                                         sodium channel, voltage-gated, type V, alpha
    ## 811                                                                                             bromodomain and PHD finger containing, 3
    ## 812                                                                                                                            myosin IG
    ## 813                                        SWI/SNF related matrix associated, actin dependent regulator of chromatin, subfamily a-like 1
    ## 814                                                                                           alanyl-tRNA synthetase domain containing 1
    ## 815                                                                                                                                 <NA>
    ## 816                                                                                          SPOUT domain containing methyltransferase 1
    ## 817                                                                                    Fanconi anemia core complex associated protein 24
    ## 818                                                                                                                            NOC4 like
    ## 819                                                                                                                          ubiquilin 4
    ## 820                                                                                                 apurinic/apyrimidinic endonuclease 1
    ## 821  methylenetetrahydrofolate dehydrogenase (NADP+ dependent), methenyltetrahydrofolate cyclohydrolase, formyltetrahydrofolate synthase
    ## 822                                                                                                         phosphorylase kinase alpha 2
    ## 823                                                                                                             HEAT repeat containing 1
    ## 824                                                                                                       ribosomal protein S4, X-linked
    ## 825                                                                                              protease-associated domain containing 1
    ## 826                                                                                                            kelch domain containing 4
    ## 827                                                                                        tubulin tyrosine ligase-like family, member 4
    ## 828                                                        protein (peptidyl-prolyl cis/trans isomerase) NIMA-interacting 1, retrogene 1
    ## 829                                                                     protein (peptidyl-prolyl cis/trans isomerase) NIMA-interacting 1
    ## 830                                                                                                              NOP58 ribonucleoprotein
    ## 831                                                                                                lymphocyte antigen 6 complex, locus M
    ## 832                                                                                                       G protein pathway suppressor 2
    ## 833                                                                                                                        CD320 antigen
    ## 834                                                                                        proprotein convertase subtilisin/kexin type 9
    ## 835                                                                                                                        THO complex 6
    ## 836                                                                                            acid-sensing (proton-gated) ion channel 2
    ## 837                                                                                                inturned planar cell polarity protein
    ## 838                                                                                                glutamate-rich WD repeat containing 1
    ## 839                                                                         eukaryotic translation initiation factor 2B, subunit 4 delta
    ## 840                                                                                                         katanin p80 subunit B like 1
    ## 841                                                                                                 inhibitor of growth family, member 1
    ## 842                                                                                                             transmembrane protein 42
    ## 843                                                                                                     ubiquitin-conjugating enzyme E2I
    ## 844                                                                                                       K(lysine) acetyltransferase 2A
    ## 845                                                                                                                          polybromo 1
    ## 846                                                                            SNU13 homolog, small nuclear ribonucleoprotein (U4/U6.U5)
    ## 847                                                                                                                  heat shock factor 1
    ## 848                                                                                                                  exosome component 3
    ## 849                                                                                                           RIKEN cDNA 2210016L21 gene
    ## 850                                                                                                       partner and localizer of BRCA2
    ## 851                                                                                       glutamyl-tRNA(Gln) amidotransferase, subunit B
    ## 852                                                                                  congenital dyserythropoietic anemia, type I (human)
    ## 853                                                                                           peptidylprolyl isomerase E (cyclophilin E)
    ## 854                                                                                                                                 <NA>
    ## 855                                                                                                         RNA binding motif protein 8a
    ## 856                                                                                                               NOP2 nucleolar protein
    ## 857                                                                                                  mitochondrial ribosomal protein S15
    ## 858                                    methylenetetrahydrofolate dehydrogenase (NAD+ dependent), methenyltetrahydrofolate cyclohydrolase
    ## 859                                                                                                                 centromere protein P
    ## 860                                                                                                            transcription factor Dp 1
    ## 861                                                                    asparagine-linked glycosylation 3 (alpha-1,3-mannosyltransferase)
    ## 862                                                                                                   activator of basal transcription 1
    ## 863                                                                                                     coiled-coil domain containing 86
    ## 864                                                                                      CD79A antigen (immunoglobulin-associated alpha)
    ## 865                                                                                proteasome (prosome, macropain) 26S subunit, ATPase 2
    ## 866                                                                                           NADH:ubiquinone oxidoreductase subunit A12
    ## 867                                                                                                              thioredoxin reductase 2
    ## 868                                                                                MRE11A homolog A, double strand break repair nuclease
    ## 869                                                                                                   SAFB-like, transcription modulator
    ## 870                                                                                                     tonsoku-like, DNA repair protein
    ## 871                                                                                                                                pinin
    ## 872                                                                                           fizzy and cell division cycle 20 related 1
    ## 873                                                                                                  mitochondrial ribosomal protein L18
    ## 874                                                                                                                lysyl-tRNA synthetase
    ## 875                                                                                                                           profilin 1
    ## 876                                                                             NOC2 like nucleolar associated transcriptional repressor
    ## 877                                                                                                                         shugoshin 2B
    ## 878                                                                                                                         shugoshin 2A
    ## 879                                                                                        small nuclear ribonucleoprotein polypeptide F
    ## 880                                                                                                                              geminin
    ## 881                                                                                              FYVE, RhoGEF and PH domain containing 1
    ## 882                                                                                             UTP18 small subunit processome component
    ## 883                                                                    asparagine-linked glycosylation 8 (alpha-1,3-glucosyltransferase)
    ## 884                                                                                 ATP-binding cassette, sub-family F (GCN20), member 2
    ## 885                                                                                              ependymin related protein 1 (zebrafish)
    ## 886                                                                                                             Ras and Rab interactor 1
    ## 887                                                                                             F-box and leucine-rich repeat protein 15
    ## 888                                                                                        phosphofurin acidic cluster sorting protein 2
    ## 889                                                                                                               GAR1 ribonucleoprotein
    ## 890                                                                                                 transmembrane 7 superfamily member 2
    ## 891                                                                                                            transmembrane protein 156
    ## 892                                                                                                  transducin-like enhancer of split 1
    ## 893                                                                              protein phosphatase 1, regulatory inhibitor subunit 14B
    ## 894                                                                         protein phosphatase 1, regulatory inhibitor subunit 14B like
    ## 895                                                                                                                       endonuclease G
    ## 896                                                                                                       TatD DNase domain containing 2
    ## 897                                                             solute carrier family 5 (sodium-dependent vitamin transporter), member 6
    ## 898                                                                      caseinolytic mitochondrial matrix peptidase proteolytic subunit
    ## 899                                                                                                                                 <NA>
    ## 900                                                                                                                                 <NA>
    ## 901                                                                                          eukaryotic translation initiation factor 1A
    ## 902                                                                      eukaryotic translation initiation factor 1A domain containing 3
    ## 903                                                                      eukaryotic translation initiation factor 1A domain containing 4
    ## 904                                                                      eukaryotic translation initiation factor 1A domain containing 8
    ## 905                                                                                                                                 <NA>
    ## 906                                                                      eukaryotic translation initiation factor 1A domain containing 2
    ## 907                                                                                                                                 <NA>
    ## 908                                                                                                                                 <NA>
    ## 909                                                                     eukaryotic translation initiation factor 1A domain containing 16
    ## 910                                                                                                                                 <NA>
    ## 911                                                                      eukaryotic translation initiation factor 1A domain containing 6
    ## 912                                                                                                                                 <NA>
    ## 913                                                                                                                                 <NA>
    ## 914                                                                      eukaryotic translation initiation factor 1A domain containing 7
    ## 915                                                                     eukaryotic translation initiation factor 1A domain containing 19
    ## 916                                                                                              pyruvate dehydrogenase (lipoamide) beta
    ## 917                                                                                                anaphase promoting complex subunit 16
    ## 918                                                                          proteasome (prosome, macropain) 26S subunit, non-ATPase, 14
    ## 919                                                                                                interleukin enhancer binding factor 3
    ## 920                                                                                                           inka box actin regulator 2
    ## 921                                                                                                   mitogen-activated protein kinase 6
    ## 922                                                                                                NOL1/NOP2/Sun domain family, member 4
    ## 923                                                                                                           E2F transcription factor 8
    ## 924                                                                                                        armadillo repeat containing 5
    ## 925                                                                                                              FK506 binding protein 4
    ## 926                                                                                                     bifunctional apoptosis regulator
    ## 927                                                                                                  mitochondrial ribosomal protein L12
    ## 928                                                                                                     testis specific protein kinase 1
    ## 929                                                                                                      small nucleolar RNA, C/D box 1A
    ## 930                                                                                   signal transducer and activator of transcription 6
    ## 931                                                                                                                      nucleoporin 214
    ## 932                                                           v-abl Abelson murine leukemia viral oncogene 2 (arg, Abelson-related gene)
    ## 933                                                                                                              Fas-associated factor 1
    ## 934                                                                                                                homeobox containing 1
    ## 935                                                                                                             inner centromere protein
    ## 936                                                                                eukaryotic translation initiation factor 3, subunit G
    ## 937                                                                                            BRCA1/BRCA2-containing complex, subunit 3
    ## 938                                                                                       cleavage and polyadenylation specific factor 4
    ## 939                                                                                                      ubiquitin specific peptidase 10
    ## 940                                                                                                            transmembrane protein 165
    ## 941                                                                                       translocase of outer mitochondrial membrane 22
    ## 942                                                                      myeloid/lymphoid or mixed-lineage leukemia; translocated to, 11
    ## 943                                                                                        LSM8 homolog, U6 small nuclear RNA associated
    ## 944                                                                                                            calcium modulating ligand
    ## 945                                                                                                                   transformer 2 beta
    ## 946                                                                                                  mitochondrial ribosomal protein S34
    ## 947                                                                                                              deoxythymidylate kinase
    ## 948                                                                                                nucleolar protein with MIF4G domain 1
    ## 949                                                                                                   RecQ mediated genome instability 1
    ## 950                                                                                 proteasome (prosome, macropain) assembly chaperone 3
    ## 951                                                                                                                   guanylate kinase 1
    ## 952                                                                                     chromodomain helicase DNA binding protein 1-like
    ## 953                                                                                                  tubulin epsilon and delta complex 2
    ## 954                                                                                            DEAH (Asp-Glu-Ala-His) box polypeptide 38
    ## 955                                                                                                      ubiquitin specific peptidase 47
    ## 956                                                                                                             zinc finger protein 385B
    ## 957                                                                                                UHRF1 (ICBP90) binding protein 1-like
    ## 958                                                                                                                 centromere protein Q
    ## 959                                                                                                                   neuron navigator 3
    ## 960                                                                                                      pseudouridylate synthase-like 1
    ## 961                                                                                            heterogeneous nuclear ribonucleoprotein M
    ## 962                                                                                                                       nucleoporin 50
    ## 963                                                                                                                 DEAD box helicase 51
    ## 964                                                                               spindlin interactor and repressor of chromatin binding
    ## 965                                                                                        elongator acetyltransferase complex subunit 5
    ## 966                                                                                                           diphthamide biosynthesis 1
    ## 967                                                                                                                          shugoshin 1
    ## 968                                                                                 spindle and kinetochore associated complex subunit 2
    ## 969                                                                  ELOVL family member 6, elongation of long chain fatty acids (yeast)
    ## 970                                                                                                      growth arrest-specific 2 like 3
    ## 971                                                                                     KH domain containing 4, pre-mRNA splicing factor
    ## 972                                                                   LSM6 homolog, U6 small nuclear RNA and mRNA degradation associated
    ## 973                                                                                                       aprataxin and PNKP like factor
    ## 974                                                                                       PIN2/TERF1 interacting, telomerase inhibitor 1
    ## 975                                                                                                             zinc finger protein 280D
    ## 976                                                                                                                heat shock protein 14
    ## 977                                                                                                           RIKEN cDNA 9930104L06 gene
    ## 978                                                                                                RAN guanine nucleotide release factor
    ## 979                                                                                                    lysine (K)-specific demethylase 8
    ## 980                                                                                                                FAST kinase domains 3
    ## 981                                                                                                  mitochondrial ribosomal protein L35
    ## 982                                                                                                        splicing factor 3b, subunit 3
    ## 983                                                                                                             methyltransferase like 6
    ## 984                                                                               proteasome (prosome, macropain) 26S subunit, ATPase, 6
    ## 985                                                                                                          mediator complex subunit 18
    ## 986                                                                                                                  transformer 2 alpha
    ## 987                                                                                                              NOP16 nucleolar protein
    ## 988                                                                           guanine nucleotide binding protein-like 3 (nucleolar)-like
    ## 989                                                                                        zinc finger CCHC-type and RNA binding motif 1
    ## 990                                                                                                 presenilin associated, rhomboid-like
    ## 991                                                                                                     ubiquitin-conjugating enzyme E2S
    ## 992                                                                                          ubiquitin-conjugating enzyme E2S pseudogene
    ## 993                                                                                                                                 <NA>
    ## 994                                                                                            asparagine synthetase domain containing 1
    ## 995                                                                                     mitogen-activated protein kinase kinase kinase 5
    ## 996                                                                                                                 DEAD box helicase 47
    ## 997                                                                               polymerase (DNA-directed), delta interacting protein 2
    ## 998                                                                                    DnaJ heat shock protein family (Hsp40) member C21
    ## 999                                                                                                                            nucleolin
    ## 1000                                                                                                             tubulin, beta 6 class V
    ## 1001                                                                                                                 DEAD box helicase 1
    ## 1002                                                                                                                heat shock protein 8
    ## 1003                                                                                                      tripartite motif-containing 44
    ## 1004                                                                                         eukaryotic translation initiation factor 5A
    ## 1005                                                                                  cornichon family AMPA receptor auxiliary protein 1
    ## 1006                                                                                                              centrosomal protein 55
    ## 1007                                                                                                     Rieske (Fe-S) domain containing
    ## 1008                                                                                                                       MAK16 homolog
    ## 1009                                                                                                          RIKEN cDNA A430005L14 gene
    ## 1010                                                                                                            DNA cross-link repair 1A
    ## 1011                                                                                   proline, glutamic acid and leucine rich protein 1
    ## 1012                                                                                                                            frataxin
    ## 1013                                                                                                              cDNA sequence BC048403
    ## 1014                                                                                                                        cystatin E/M
    ## 1015                                                                                                             zinc finger protein 688
    ## 1016                                                                                                zinc finger E-box binding homeobox 2
    ## 1017                                                                                                    coiled-coil domain containing 34
    ## 1018                                                                                                                GUF1 homolog, GTPase
    ## 1019                                                                                                            kinesin family member 11
    ## 1020                                                               protein phosphatase 2 (formerly 2A), catalytic subunit, alpha isoform
    ## 1021                                                                                                     BUB3 mitotic checkpoint protein
    ## 1022                                                                                                       coenzyme Q3 methyltransferase
    ## 1023                                                                                                  Bloom syndrome, RecQ like helicase
    ## 1024                                                                                       elongator acetyltransferase complex subunit 6
    ## 1025                                                                                            methylthioribose-1-phosphate isomerase 1
    ## 1026                                                                                                              LIM homeobox protein 9
    ## 1027                                                                                                             tubulin, beta 5 class I
    ## 1028                                                                                                  neuroguidin, EIF4E binding protein
    ## 1029                                                                                                                ribosomal protein L9
    ## 1030                                                                                                  ribosomal protein L9, pseudogene 6
    ## 1031                                                                                                U2 small nuclear ribonucleoprotein B
    ## 1032                                                                                            galactose-1-phosphate uridyl transferase
    ## 1033                                                                                    DnaJ heat shock protein family (Hsp40) member C7
    ## 1034                                                                                       Myb/SANT-like DNA-binding domain containing 2
    ## 1035                                                                                            cilia and flagella associate protien 298
    ## 1036                                                                                                 HAUS augmin-like complex, subunit 1
    ## 1037                                                                                                                splicing factor SWAP
    ## 1038                                   SWI/SNF related, matrix associated, actin dependent regulator of chromatin, subfamily a, member 5
    ## 1039                                                                                                    GTP binding protein 6 (putative)
    ## 1040                                                                                                             PR domain containing 10
    ## 1041                                                                                                             NHL repeat containing 2
    ## 1042                                                                                                                 nucleolar protein 7
    ## 1043                                                                                                           methyltransferase like 16
    ## 1044                                                                        BUD23, rRNA methyltransferase and ribosome maturation factor
    ## 1045                                                                                                           GCN1 activator of EIF2AK4
    ## 1046                                                                                              distal membrane arm assembly complex 2
    ## 1047                                                                                                         mediator complex subunit 24
    ## 1048                                                                                                         topoisomerase (DNA) II beta
    ## 1049                                                                                                         G patch domain containing 4
    ## 1050                                                                                                    PDLIM1 interacting kinase 1 like
    ## 1051                                                                                                                                <NA>
    ## 1052                                                                                      U2 small nuclear RNA auxiliary factor 1-like 4
    ## 1053                                                                                           heterogeneous nuclear ribonucleoprotein K
    ## 1054                                                                                                adenosine deaminase, tRNA-specific 2
    ## 1055                                                                             src homology 2 domain-containing transforming protein D
    ## 1056                                                                                   cleavage stimulation factor, 3' pre-RNA subunit 2
    ## 1057                                                                                                 mitochondrial ribosomal protein L58
    ## 1058                                                                                                              NOP9 nucleolar protein
    ## 1059                                                                                  RNA guanine-7 methyltransferase activating subunit
    ## 1060                                                                                                                predicted gene 10767
    ## 1061                                                                                                             tribbles pseudokinase 1
    ## 1062                                                                                                              centrosomal protein 83
    ## 1063                                                                                     SPT16, facilitates chromatin remodeling subunit
    ## 1064                                                                                                 mitochondrial ribosomal protein L50
    ## 1065                                                                                                      enhancer of polycomb homolog 2
    ## 1066                                                                                threonyl-tRNA synthetase 2, mitochondrial (putative)
    ## 1067                                                                              solute carrier family 39 (zinc transporter), member 10
    ## 1068                                                                                                   coiled-coil domain containing 115
    ## 1069                                                                          heat shock protein 90, alpha (cytosolic), class A member 1
    ## 1070                                                                                                         FIP1 like 1 (S. cerevisiae)
    ## 1071                                                                                       RNA binding protein with serine rich domain 1
    ## 1072                                                                                          cytosolic iron-sulfur assembly component 3
    ## 1073                                                                                                         mediator complex subunit 19
    ## 1074                                                                                                                  adenylate kinase 2
    ## 1075                                                                                       protein kinase domain containing, cytoplasmic
    ## 1076                                                                                                       kynurenine aminotransferase 3
    ## 1077                                                                                                                   ubiquitin-like 4A
    ## 1078                                                                                                            TAP binding protein-like
    ## 1079                                                                                                               ribosomal protein L22
    ## 1080                                                                                                           THAP domain containing 12
    ## 1081                                                                                                       splicing factor 3b, subunit 4
    ## 1082                                                                                                            zinc finger protein 518A
    ## 1083                                                                                                            transmembrane protein 11
    ## 1084                                                                                                                            cullin 5
    ## 1085                                                                                                             INO80 complex subunit C
    ## 1086                                                                                                        BBSome interacting protein 1
    ## 1087                                                                                                            H2A clustered histone 15
    ## 1088                                                                                                              male specific lethal 1
    ## 1089                                                                                                  mitochondrial ribosomal protein S9
    ## 1090                                                                                                                ribosomal protein S3
    ## 1091                                                                                                              serum amyloid A-like 1
    ## 1092                                                                              ATP-binding cassette, sub-family B (MDR/TAP), member 6
    ## 1093                                                                                        CDK5 regulatory subunit associated protein 2
    ## 1094                                                                                                           APAF1 interacting protein
    ## 1095                                                                                                              adenylosuccinate lyase
    ## 1096                                                                                          PAN2 poly(A) specific ribonuclease subunit
    ## 1097                                                                                                        SPT20 SAGA complex component
    ## 1098                                                                                                                        DPH2 homolog
    ## 1099                                                                                                          E2F transcription factor 4
    ## 1100                                                                                                nucleosome assembly protein 1-like 1
    ## 1101                                                                                                         jumonji domain containing 6
    ## 1102                                                                                                       epithelial membrane protein 3
    ## 1103                                                                                         phenylalanyl-tRNA synthetase, alpha subunit
    ## 1104                                                                                                  tetratricopeptide repeat domain 32
    ## 1105                                                                                                 methyl-CpG binding domain protein 3
    ## 1106                                                                                       poly (ADP-ribose) polymerase family, member 2
    ## 1107                                                                                                                     nucleoporin 153
    ## 1108                                                                                                 G protein-coupled receptor kinase 2
    ## 1109                                                                                                         asparaginyl-tRNA synthetase
    ## 1110                                                                                                          WEE 1 homolog 1 (S. pombe)
    ## 1111                                                                                                                         fibrillarin
    ## 1112                                                                                                  polymerase (DNA directed), alpha 1
    ## 1113                                                                                                     ubiquitin specific peptidase 21
    ## 1114                                                                                                                           calpain 7
    ## 1115                                                                                                                       coenzyme Q10A
    ## 1116                                                                                                          RIKEN cDNA 1700012D01 gene
    ## 1117                                                                                                            OTU domain containing 6B
    ## 1118                                                                                                               chemokine-like factor
    ## 1119                                                                                proteasome (prosome, macropain) assembly chaperone 1
    ## 1120                                                                                                 solute carrier family 25, member 39
    ## 1121                                                                                                 ribosomal RNA processing 15 homolog
    ## 1122                                                                                                                  fos-like antigen 1
    ## 1123                                                                                    angiogenic factor with G patch and FHA domains 1
    ## 1124                                                                                                              leucyl-tRNA synthetase
    ## 1125                                                                                                             EBNA1 binding protein 2
    ## 1126                                                                                                  small nuclear ribonucleoprotein D2
    ## 1127                                                                                   mitogen-activated protein kinase kinase kinase 20
    ## 1128                                                                                                  p53 induced death domain protein 1
    ## 1129                                                                                                heat shock protein 1 (chaperonin 10)
    ## 1130                                                                            heat shock protein 1 (chaperonin 10), related sequence 1
    ## 1131                                                                                               basic leucine zipper and W2 domains 2
    ## 1132                                                                                                             arginyl-tRNA synthetase
    ## 1133                                                                                                            golgin, RAB6-interacting
    ## 1134                                                                           tRNA-histidine guanylyltransferase 1-like (S. cerevisiae)
    ## 1135                                                                                                             zinc finger protein 131
    ## 1136                                                                                         chaperonin containing Tcp1, subunit 7 (eta)
    ## 1137                                                                                          phenylalanyl-tRNA synthetase, beta subunit
    ## 1138                                                                                feline leukemia virus subgroup C cellular receptor 1
    ## 1139                                                                                    general transcription factor II H, polypeptide 1
    ## 1140                                                                                                         HMG box domain containing 4
    ## 1141                                                                                                           YEATS domain containing 4
    ## 1142                                                                                                           LAS1-like (S. cerevisiae)
    ## 1143                                                                                            C1q and tumor necrosis factor related 12
    ## 1144                                                                                                          RIKEN cDNA E130309D02 gene
    ## 1145                                                                                          CXXC motif containing zinc binding protein
    ## 1146                                                                          proteasome (prosome, macropain) 26S subunit, non-ATPase, 7
    ## 1147                                                                                                 acyl-CoA synthetase family member 3
    ## 1148                                                                                            structural maintenance of chromosomes 1A
    ## 1149                                                                                                         vacuolar protein sorting 36
    ## 1150                                                                    DIS3 homolog, exosome endoribonuclease and 3'-5' exoribonuclease
    ## 1151                                                                                                             CUE domain containing 2
    ## 1152                                                                                      retinoblastoma binding protein 8, endonuclease
    ## 1153                                                                                                vascular endothelial growth factor A
    ## 1154                                                                                                 mitochondrial ribosomal protein L44
    ## 1155                                                                                                          peptidylprolyl isomerase C
    ## 1156                                                                                             ATPase family, AAA domain containing 3A
    ## 1157                                                                                    eukaryotic translation elongation factor 1 gamma
    ## 1158                                                                                                         gene rich cluster, C10 gene
    ## 1159                                                                                                             zinc finger protein 653
    ## 1160                                                                                                 von Hippel-Lindau binding protein 1
    ## 1161                                                                                                                         prefoldin 1
    ## 1162                                                                                                GATA zinc finger domain containing 1
    ## 1163                                                                                        histidine triad nucleotide binding protein 1
    ## 1164                                                                                                      G protein-coupled receptor 180
    ## 1165                                                                                                      TGFB-induced factor homeobox 2
    ## 1166                                                  5-aminoimidazole-4-carboxamide ribonucleotide formyltransferase/IMP cyclohydrolase
    ## 1167                                                                                                                         cytohesin 2
    ## 1168                                                                                                            PIH1 domain containing 2
    ## 1169                                                                                                             zinc finger protein 598
    ## 1170                                                                                           DEAH (Asp-Glu-Ala-His) box polypeptide 15
    ## 1171                                                                                                               GTP binding protein 2
    ## 1172                                                                                                   cytosolic thiouridylase subunit 2
    ## 1173                                                                                      cleavage and polyadenylation specific factor 6
    ## 1174                                                                                                  tetratricopeptide repeat domain 27
    ## 1175                                                                                                   pentatricopeptide repeat domain 2
    ## 1176                                                                                                             OTU domain containing 4
    ## 1177                                                                                                 mitochondrial ribosomal protein L53
    ## 1178                                                                                                                ribosomal protein L4
    ## 1179                                                                                                        FCF1 rRNA processing protein
    ## 1180                                                                                                  cation channel, sperm associated 2
    ## 1181                                                                                                                              axin 1
    ## 1182                                                                                                             zinc finger, HIT type 3
    ## 1183                                                                                                idnK gluconokinase homolog (E. coli)
    ## 1184                                                                                         glucosamine-phosphate N-acetyltransferase 1
    ## 1185                                                                                          NADH:ubiquinone oxidoreductase subunit A10
    ## 1186                                                                                                           transmembrane protein 263
    ## 1187                                                                                                ring finger protein, transmembrane 1
    ## 1188                                                                                                   GA repeat binding protein, beta 2
    ## 1189                                                                                  activating signal cointegrator 1 complex subunit 1
    ## 1190                                                                                               transmembrane protein 250, pseudogene
    ## 1191                                                                                             3-hydroxybutyrate dehydrogenase, type 1
    ## 1192                                                                                                            kinesin family member 23
    ## 1193                                                                                   PCF11 cleavage and polyadenylation factor subunit
    ## 1194                                                                                                               apolipoprotein O-like
    ## 1195                                                                                                             zinc finger protein 445
    ## 1196                                                                                                           chromatin target of PRMT1
    ## 1197                                                                                                       interferon activated gene 203
    ## 1198                                                                                                       interferon activated gene 207
    ## 1199                                                                                                              zinc finger protein 91
    ## 1200                                                                             predicted readthrough transcript (NMD candidate), 44505
    ## 1201                                                                              tRNA-yW synthesizing protein 3 homolog (S. cerevisiae)
    ## 1202                                                                                             UTP6 small subunit processome component
    ## 1203                                                                                                   SUMO/sentrin specific peptidase 6
    ## 1204                                                                                                                      nucleoporin 43
    ## 1205                                                                                                              deoxyhypusine synthase
    ## 1206                                                                                                                 exosome component 1
    ## 1207                                                                                                           transcription factor Dp 2
    ## 1208                                                                                                        dihydroorotate dehydrogenase
    ## 1209                                                                                                                             radixin
    ## 1210                                                                                                    ubiquitin-conjugating enzyme E2K
    ## 1211                                                                                                          E2F transcription factor 6
    ## 1212                                                                                                  zinc finger CCCH type containing 8
    ## 1213                                                                                         nucleolar protein family 6 (RNA-associated)
    ## 1214                                                                                                 hnRNP-associated with lethal yellow
    ## 1215                                                                                                                 notchless homolog 1
    ## 1216                                                                                   polymerase (RNA) III (DNA directed) polypeptide C
    ## 1217                                                                                               cell division cycle 7 (S. cerevisiae)
    ## 1218                                                                                            OTU domain, ubiquitin aldehyde binding 1
    ## 1219                                                                                                       integrator complex subunit 11
    ## 1220                                                                                                              zinc finger protein 81
    ## 1221                                                                                            transmembrane channel-like gene family 8
    ## 1222                                                                                                           LETM1 domain containing 1
    ## 1223                                                                                        calmodulin binding transcription activator 2
    ## 1224                                                                                                          nitrilase family, member 2
    ## 1225                                                                                                          glutaminyl-tRNA synthetase
    ## 1226                                                                                                                              coilin
    ## 1227                                                                                                   receptor for activated C kinase 1
    ## 1228                                                                                                                            akirin 2
    ## 1229                                                                                                          E2F transcription factor 1
    ## 1230                                                                                                                 Rho family GTPase 3
    ## 1231                                                                                                                deoxycytidine kinase
    ## 1232                                                                                                mitochondrial ribosomal protein S18B
    ## 1233                                                                                                              centrosomal protein 89
    ## 1234                                                                                                 SIN3-HDAC complex associated factor
    ## 1235                                                                                                    coiled-coil domain containing 12
    ## 1236                                                                                                    NOP53 ribosome biogenesis factor
    ## 1237                                                                                                              zinc finger protein 41
    ## 1238                                                                                    DnaJ heat shock protein family (Hsp40) member A3
    ## 1239                                                                                                                         chromobox 1
    ## 1240                                                                                                       interleukin 1 receptor-like 1
    ## 1241                                                                                               NOL1/NOP2/Sun domain family, member 5
    ## 1242                                                                                                              crystallin zeta like 2
    ## 1243                                                                                                         histone PARylation factor 1
    ## 1244                                                       solute carrier family 25 (mitochondrial carrier, phosphate carrier), member 3
    ## 1245                                                                                                            tRNA methyltransferase 1
    ## 1246                                                                                                                          aftiphilin
    ## 1247                                                                                                            RWD domain containing 4A
    ## 1248                                                                                                         sin3 associated polypeptide
    ## 1249                                                                                                 HAUS augmin-like complex, subunit 5
    ## 1250                                                                                          mitochondrial ribosome-associated GTPase 1
    ## 1251                                                                                                 mitochondrial ribosomal protein S33
    ## 1252                                                                                                                            lamin B1
    ## 1253                                                                                                                HCLS1 associated X-1
    ## 1254                                                                                                     glutamyl-prolyl-tRNA synthetase
    ## 1255                                                                                            non-SMC condensin II complex, subunit D3
    ## 1256                                                                        eukaryotic translation initiation factor 2, subunit 2 (beta)
    ## 1257                                                                                                           expressed sequence C87436
    ## 1258                                                                                                  mitochondrial ribosomal protein S5
    ## 1259                                                                                                     seryl-aminoacyl-tRNA synthetase
    ## 1260                                                                                                                     peroxiredoxin 3
    ## 1261                                                                                                            transducin (beta)-like 3
    ## 1262                                                                                                                 t-complex protein 1
    ## 1263                                                                                     ubiquitin specific peptidase 5 (isopeptidase T)
    ## 1264                                                                             glutaminyl-tRNA synthase (glutamine-hydrolyzing)-like 1
    ## 1265                                                                                       L3MBTL2 polycomb repressive complex 1 subunit
    ## 1266                                                                                            UTP15 small subunit processome component
    ## 1267                                                                                                     histone H4 transcription factor
    ## 1268                                                                                                        methionine-tRNA synthetase 1
    ## 1269                                                                                       phosphoribosyl pyrophosphate amidotransferase
    ## 1270                                                                                                        phospholipase A2, group XIIA
    ## 1271                                                                                                  ChaC, cation transport regulator 1
    ## 1272                                                                                                          L antigen family, member 3
    ## 1273                                                                                                                       BUD13 homolog
    ## 1274                                                                                                               ribosomal protein L18
    ## 1275                                                                                                                         homeobox D9
    ## 1276                                                                                                   leucine rich repeat containing 51
    ## 1277                                                                                                                        demethyl-Q 7
    ## 1278                                                                                                            bromodomain containing 2
    ## 1279                                                                                                ERH mRNA splicing and mitosis factor
    ## 1280                                                                                          enhancer of rudimentary homolog pseudogene
    ## 1281                                                                                                                           caspase 8
    ## 1282                                                                            splA/ryanodine receptor domain and SOCS box containing 3
    ## 1283                                                                                                                     selenoprotein T
    ## 1284                                                                                                       pyrophosphatase (inorganic) 2
    ## 1285                                                                                                           cyclin-dependent kinase 4
    ## 1286                                                                                                    uridine-cytidine kinase 1-like 1
    ## 1287                                                                              synaptic Ras GTPase activating protein 1 homolog (rat)
    ## 1288                                                                                                  DDB1 and CUL4 associated factor 15
    ## 1289                                                                           leucine zipper-EF-hand containing transmembrane protein 1
    ## 1290                                                                                         eukaryotic translation initiation factor 4E
    ## 1291                                                                ATP synthase, H+ transporting mitochondrial F1 complex, beta subunit
    ## 1292                                                                                                                    F-box protein 27
    ## 1293                                                                                       heterogeneous nuclear ribonucleoprotein A2/B1
    ## 1294                                                     ATP synthase, H+ transporting, mitochondrial F0 complex, subunit C1 (subunit 9)
    ## 1295                                                                                                    chemokine (C-X-C motif) ligand 1
    ## 1296                                                                             cytidine monophospho-N-acetylneuraminic acid synthetase
    ## 1297                                                                                          serine and arginine-rich splicing factor 1
    ## 1298                                                                                                                     interleukin 17F
    ## 1299                                                                                                             centrosomal protein 152
    ## 1300                                                                                                           PWP1 homolog, endonuclein
    ## 1301                                                                                                  suppressor of cytokine signaling 2
    ## 1302                                                                                                              N-acetyltransferase 10
    ## 1303                                                                                                            SDA1 domain containing 1
    ## 1304                                                                                proteasome (prosome, macropain) subunit, beta type 6
    ## 1305                                                                                     DNA replication and sister chromatid cohesion 1
    ## 1306                                                                               6-phosphofructo-2-kinase/fructose-2,6-biphosphatase 1
    ## 1307                                                                                                    polyamine oxidase (exo-N4-amino)
    ## 1308                                                                                                               pantothenate kinase 1
    ## 1309                                                               proteaseome (prosome, macropain) activator subunit 3 (PA28 gamma, Ki)
    ## 1310                                                                                                interleukin 15 receptor, alpha chain
    ## 1311                                                               succinate dehydrogenase complex, subunit D, integral membrane protein
    ## 1312                                                                                           DEAH (Asp-Glu-Ala-His) box polypeptide 33
    ## 1313                                                                                                               ribosomal protein L24
    ## 1314                                                                                                               ribosomal protein S13
    ## 1315                                                                 eukaryotic translation initiation factor 4E nuclear import factor 1
    ## 1316                                                                                                     LTV1 ribosome biogenesis factor
    ## 1317                                                                                                              cell division cycle 40
    ## 1318                                                                                   integrin beta 3 binding protein (beta3-endonexin)
    ## 1319                                                                                       translocase of outer mitochondrial membrane 5
    ## 1320                                                                                           NSL1, MIS12 kinetochore complex component
    ## 1321                                                                          proteasome (prosome, macropain) 26S subunit, non-ATPase, 2
    ## 1322                                                                                           heterogeneous nuclear ribonucleoprotein R
    ## 1323                                                                                     PMS1 homolog2, mismatch repair system component
    ## 1324                                                                                                                                <NA>
    ## 1325                                                                        U2 small nuclear ribonucleoprotein auxiliary factor (U2AF) 2
    ## 1326                                                                                  polymerase (DNA-directed), epsilon 4 (p12 subunit)
    ## 1327                                                                                                   C1D nuclear receptor co-repressor
    ## 1328                                                                                                    cytochrome c oxidase subunit 4I1
    ## 1329                                                                                                 pumilio RNA-binding family member 3
    ## 1330                                                                                                             zinc finger protein 963
    ## 1331                                                                                                         mediator of cell motility 1
    ## 1332                                                                                                    myosin, light polypeptide kinase
    ## 1333                                                                                         eukaryotic translation initiation factor 2A
    ## 1334                                              eukaryotic translation elongation factor 1 delta (guanine nucleotide exchange protein)
    ## 1335                                                                                                          RIKEN cDNA 2310057M21 gene
    ## 1336                                                                               SGT1, suppressor of G2 allele of SKP1 (S. cerevisiae)
    ## 1337                                                                                   fumarylacetoacetate hydrolase domain containing 1
    ## 1338                                                                                                  sorbin and SH3 domain containing 3
    ## 1339                                                                 minichromosome maintenance 8 homologous recombination repair factor
    ## 1340                                                                                    euchromatic histone lysine N-methyltransferase 2
    ## 1341                                                                                                          CDGSH iron sulfur domain 2
    ## 1342                                                                                                          diphthamine biosynthesis 6
    ## 1343                                                                                                             POC5 centriolar protein
    ## 1344                                                                                   CTF18, chromosome transmission fidelity factor 18
    ## 1345                                                                                       chromosome segregation 1-like (S. cerevisiae)
    ## 1346                                                                                                                 WD repeat domain 12
    ## 1347                                                                                                    GLE1 RNA export mediator (yeast)
    ## 1348                                                                                      dehydrogenase/reductase (SDR family) member 13
    ## 1349                                                                                 coactivator-associated arginine methyltransferase 1
    ## 1350                                                                                                                           symplekin
    ## 1351                                                                                               trichoplein, keratin filament binding
    ## 1352                                                                                                     neural cell adhesion molecule 1
    ## 1353                                                                                                                            cyclin J
    ## 1354                                                                                                 mitochondrial ribosomal protein S10
    ## 1355                                                                                                             cysteine rich protein 2
    ## 1356                                                                                             UTP3 small subunit processome component
    ## 1357                                                                                                        RNA binding motif protein 19
    ## 1358                                                                                                       pre-mRNA processing factor 19
    ## 1359                                                                                                                DEAD box helicase 28
    ## 1360                                                                                            C9orf72, member of C9orf72-SMCR8 complex
    ## 1361                                                                                                          phospholipid phosphatase 2
    ## 1362                                                                           papillary renal cell carcinoma (translocation-associated)
    ## 1363                                                                                                             FK506 binding protein 3
    ## 1364                                                                                          gem nuclear organelle associated protein 6
    ## 1365                                                                        deoxynucleotidyltransferase, terminal, interacting protein 2
    ## 1366                                                                              MAF1 homolog, negative regulator of RNA polymerase III
    ## 1367                                                                                                      dual specificity phosphatase 4
    ## 1368                                                                                              RAB, member RAS oncogene family-like 2
    ## 1369                                                                                                 WD repeat domain 83 opposite strand
    ## 1370                                                                                      NADH:ubiquinone oxidoreductase core subunit S7
    ## 1371                                                                                                                  nucleoporin like 1
    ## 1372                                                                                                                                <NA>
    ## 1373                                                                                                 PC4 and SFRS1 interacting protein 1
    ## 1374                                                                                                     small ubiquitin-like modifier 2
    ## 1375                                                                                                     protein O-glucosyltransferase 3
    ## 1376                                                                                proteasome (prosome, macropain) subunit, beta type 3
    ## 1377                                                                                                        RNA binding motif protein 17
    ## 1378                                                                                                                            vimentin
    ## 1379                                                                                                                 WD repeat domain 55
    ## 1380                                                                                                                 WD repeat domain 43
    ## 1381                                                                                     adaptor-related protein complex 2, mu 1 subunit
    ## 1382                                                                                        glutamate-cysteine ligase, catalytic subunit
    ## 1383                                                                              general transcription factor IIIC, polypeptide 2, beta
    ## 1384                                                                                                                                <NA>
    ## 1385                                                                                                                      interleukin 18
    ## 1386                                                                                          eukaryotic translation elongation factor 2
    ## 1387                                                                                                     myotubularin related protein 14
    ## 1388                                                                                       chaperonin containing Tcp1, subunit 4 (delta)
    ## 1389                                                                                                                              nibrin
    ## 1390                                                                                proteasome (prosome, macropain) assembly chaperone 4
    ## 1391                                                                                                    ribulose-5-phosphate-3-epimerase
    ## 1392                                                                                                                     RAD51 paralog C
    ## 1393                                                                                            NME/NM23 nucleoside diphosphate kinase 2
    ## 1394                                                                                                              proline rich 5 (renal)
    ## 1395                                                                                    TARBP2, RISC loading complex RNA binding subunit
    ## 1396                                                                            protein kinase, cAMP dependent regulatory, type II alpha
    ## 1397                                                                                                    polymerase (RNA) I polypeptide E
    ## 1398                                                                                  adaptor-related protein complex 1, sigma 2 subunit
    ## 1399                                                                                      cleavage and polyadenylation specific factor 1
    ## 1400                                                                                                              DEAD/H box helicase 11
    ## 1401                                                                                                          TSR1 20S rRNA accumulation
    ## 1402                                                                phosphatidylinositol-specific phospholipase C, X domain containing 2
    ## 1403                                                                                                   transformation related protein 53
    ## 1404                                                                                                          RIKEN cDNA 9430015G10 gene
    ## 1405                                                                                                 mitochondrial ribosomal protein L40
    ## 1406                                                                                                       neuronal PAS domain protein 2
    ## 1407                                                                                                    coiled-coil domain containing 43
    ## 1408                                                                                                           methyltransferase like 17
    ## 1409                                                                                                    jumping translocation breakpoint
    ## 1410                                                                                                 solute carrier family 35, member E1
    ## 1411                                                                                         WD repeat and HMG-box DNA binding protein 1
    ## 1412                                                                                              RNA polymerase II associated protein 3
    ## 1413                                                                                                         decapping enzyme, scavenger
    ## 1414                                                                                          serine and arginine-rich splicing factor 2
    ## 1415                                                                                                               ribosomal protein S26
    ## 1416                                                                                                    mex3 RNA binding family member B
    ## 1417                                                                                                   glomulin, FKBP associated protein
    ## 1418                                                                                                          proteasome subunit alpha 5
    ## 1419                                                                                                          ribosomal RNA processing 1
    ## 1420                                                                                                   NFU1 iron-sulfur cluster scaffold
    ## 1421                                                                                                                          exportin 4
    ## 1422                                                                                                      Sin3-associated polypeptide 18
    ## 1423                                                                                                     Sin3-associated polypeptide 18B
    ## 1424                                                                                                   nuclear pore membrane protein 121
    ## 1425                                                                                                                   LIM domain only 4
    ## 1426                                                                                            Jupiter microtubule associated homolog 1
    ## 1427                                                                                                           cyclin-dependent kinase 2
    ## 1428                                                                     KRR1, small subunit (SSU) processome component, homolog (yeast)
    ## 1429                                                                                                                DEAD box helicase 27
    ## 1430                                                                                                 mitochondrial ribosomal protein L47
    ## 1431                                                                                                             NFKB activating protein
    ## 1432                                                                                      thymocyte selection associated family member 2
    ## 1433                                                                               potassium channel tetramerisation domain containing 5
    ## 1434                                                                                                            programmed cell death 10
    ## 1435                                                                                                  glutathione S-transferase, alpha 4
    ## 1436                                                                                                  solute carrier family 38, member 2
    ## 1437                                                                                                                   stromal antigen 1
    ## 1438                                                                                      cleavage and polyadenylation specific factor 2
    ## 1439                                                                                                          RNA polymerase I subunit F
    ## 1440                                                                                                               heat shock protein 14
    ## 1441                                                                                               SPT4A, DSIF elongation factor subunit
    ## 1442                                                                               N(alpha)-acetyltransferase 40, NatD catalytic subunit
    ## 1443                                                                                                      signal sequence receptor, beta
    ## 1444                                                                                   TruB pseudouridine (psi) synthase family member 1
    ## 1445                                                                                 eukaryotic translation initiation factor 4, gamma 1
    ## 1446                                                                                  ESF1 nucleolar pre-rRNA processing protein homolog
    ## 1447                                                                                                                       actin-like 6A
    ## 1448                                                                                                       integrator complex subunit 12
    ## 1449                                                                                     dynein cytoplasmic 2 light intermediate chain 1
    ## 1450                                                                           smu-1 suppressor of mec-8 and unc-52 homolog (C. elegans)
    ## 1451                                                                                                               ribosomal protein L15
    ## 1452                                                                                              protein arginine N-methyltransferase 3
    ## 1453                                                                                                       splicing factor 3b, subunit 2
    ## 1454                                                                                                     protein kinase inhibitor, gamma
    ## 1455                                                                                             structural maintenance of chromosomes 3
    ## 1456                                                             aminoacyl tRNA synthetase complex-interacting multifunctional protein 1
    ## 1457                                                                                                         pseudouridylate synthase 10
    ## 1458                                                                                                                  WD repeat domain 5
    ## 1459                                                                        solute carrier family 29 (nucleoside transporters), member 2
    ## 1460                                                                                          heterogeneous nuclear ribonucleoprotein A3
    ## 1461                                                                                                                        HGH1 homolog
    ## 1462                                                                                                             centrosomal protein 128
    ## 1463                                                                                                                    F-box protein 22
    ## 1464                                                                                                  mitochondrial ribosomal protein L9
    ## 1465                                                                                                 siah E3 ubiquitin protein ligase 1A
    ## 1466                                                                                                 siah E3 ubiquitin protein ligase 1B
    ## 1467                                                                                                                 WD repeat domain 62
    ## 1468                                                                                                             zinc finger protein 639
    ## 1469                                                                                                        RNA binding motif protein 10
    ## 1470                                                                                                             zinc finger protein 882
    ## 1471                                                                                 mitochondrial assembly of ribosomal large subunit 1
    ## 1472                                                                                                                   RecQ protein-like
    ## 1473                                                                                       family with sequence similarity 207, member A
    ## 1474                                                                                             alkB homolog 1, histone H2A dioxygenase
    ## 1475                                                                                                          Brca1 associated protein 1
    ## 1476                                                                                                  ornithine decarboxylase antizyme 1
    ## 1477                                                                                                             zinc finger protein 472
    ## 1478                                                                                                           cyclin-dependent kinase 6
    ## 1479                                                                                     solute carrier family 18, subfamily B, member 1
    ## 1480                                                                                                                           septin 11
    ## 1481                                                                                                                 nucleolar protein 8
    ## 1482                                                                                                          RIKEN cDNA C330018D20 gene
    ## 1483                                                                                                               enolase-phosphatase 1
    ## 1484                                                                                                                UBX domain protein 1
    ## 1485                                                                                                                ribosomal protein S5
    ## 1486                                                                                   polymerase (RNA) III (DNA directed) polypeptide E
    ## 1487                                                                                          telomerase RNA component interacting RNase
    ## 1488                                                                                                  DAP3 binding cell death enhancer 1
    ## 1489                                                                                                                       transportin 3
    ## 1490                                                                                                                    lamin B receptor
    ## 1491                                                                                                               ribosomal protein L14
    ## 1492                                                                                                              centrosomal protein 41
    ## 1493                                                                             glycine cleavage system protein H (aminomethyl carrier)
    ## 1494                                                                                                    PDS5 cohesin associated factor A
    ## 1495                                                                                                                     ataxin 7-like 3
    ## 1496                                                                                                DNA methyltransferase (cytosine-5) 1
    ## 1497                                                                                proteasome (prosome, macropain) subunit, beta type 4
    ## 1498                                                           translational activator of mitochondrially encoded cytochrome c oxidase I
    ## 1499                                                              X-ray repair complementing defective repair in Chinese hamster cells 5
    ## 1500                                                                                                           transmembrane protein 209
    ## 1501                                                                                 RAD23 homolog B, nucleotide excision repair protein
    ## 1502                                                                                                  adenine phosphoribosyl transferase
    ## 1503                                                                                                   cytidine 5'-triphosphate synthase
    ## 1504                                                                                                                       taxilin alpha
    ## 1505                                                                                                  transport and golgi organization 6
    ## 1506                                                                                                                                <NA>
    ## 1507                                                                                                                predicted gene 20604
    ## 1508                                                                                                       GON7 subunit of KEOPS complex
    ## 1509                                                                            GTPase activating protein (SH3 domain) binding protein 1
    ## 1510                                                                                     translocase of inner mitochondrial membrane 8A1
    ## 1511                                                                                                        C-terminal binding protein 1
    ## 1512                                                                                           zinc finger with KRAB and SCAN domains 17
    ## 1513                                                                                       chaperonin containing Tcp1, subunit 8 (theta)
    ## 1514                                                                               eukaryotic translation initiation factor 3, subunit A
    ## 1515                                                                   platelet-activating factor acetylhydrolase, isoform 1b, subunit 3
    ## 1516                                                                                           mitogen-activated protein kinase kinase 5
    ## 1517                                                                                                     ubiquitin specific peptidase 15
    ## 1518                                                                                                                     forkhead box K2
    ## 1519                                                                                                       p21 (RAC1) activated kinase 4
    ## 1520                                                                                                             aspartyl aminopeptidase
    ## 1521                                                                                                      K(lysine) acetyltransferase 2B
    ## 1522                                                                                                 trans-acting transcription factor 3
    ## 1523                                                              X-ray repair complementing defective repair in Chinese hamster cells 1
    ## 1524                                                                                                             retinol dehydrogenase 5
    ## 1525                                                                                                 adenosine monophosphate deaminase 2
    ## 1526                                                                                                                         homeobox B7
    ## 1527                                                                                          phosphatidylethanolamine binding protein 1
    ## 1528                                                                                                           transmembrane protein 39b
    ## 1529                                                                                                    Era (G-protein)-like 1 (E. coli)
    ## 1530                                                                                                                                <NA>
    ## 1531                                                                                                                     aurora kinase C
    ## 1532                                                                                                           transmembrane protein 223
    ## 1533                                                                                        phosphatidylethanolamine N-methyltransferase
    ## 1534                                                                                        DNA segment, Chr 8, ERATO Doi 738, expressed
    ## 1535                                                                               interactor of little elongation complex ELL subunit 2
    ## 1536                                                                                    SOS Ras/Rho guanine nucleotide exchange factor 2
    ## 1537                                                                           store-operated calcium entry-associated regulatory factor
    ## 1538                                                                                                              cDNA sequence BC005624
    ## 1539                                                                                                    small cell adhesion glycoprotein
    ## 1540                                                                                                       spermatogenesis associated 20
    ## 1541                                                                                      DERPC proline and glycine rich nuclear protein
    ## 1542                                                                                                                 WD repeat domain 77
    ## 1543                                                                   dual-specificity tyrosine-(Y)-phosphorylation regulated kinase 1a
    ## 1544                                                                                                        zinc metallopeptidase, STE24
    ## 1545                                                                                                     lysine rich nucleolar protein 1
    ## 1546                                                                                                G-rich RNA sequence binding factor 1
    ## 1547                                                                                         phosphoribosylglycinamide formyltransferase
    ## 1548                                                              neural precursor cell expressed, developmentally down-regulated gene 8
    ## 1549                                                                                                           TSPO associated protein 1
    ## 1550                                                                                                     yrdC domain containing (E.coli)
    ## 1551                                                                                              protein arginine N-methyltransferase 5
    ## 1552                                                                                                                DEAD box helicase 55
    ## 1553                                                                                                 ribosomal RNA processing 12 homolog
    ## 1554                                                                                                           neuronal calcium sensor 1
    ## 1555                                                                                              replication timing regulatory factor 1
    ## 1556                                                                                                                          claudin 12
    ## 1557                                                                                                                     Y box protein 1
    ## 1558                                                                                                  general transcription factor III A
    ## 1559                                                                                                            THAP domain containing 4
    ## 1560                                                                                                            ankyrin repeat domain 49
    ## 1561                                                                                          peptidase (mitochondrial processing) alpha
    ## 1562                                                                                                              centrosomal protein 72
    ## 1563                                                                                             zinc finger and BTB domain containing 3
    ## 1564                                                                                                          RIKEN cDNA 1110038F14 gene
    ## 1565                                                                                                          COP9 signalosome subunit 5
    ## 1566                                                                                   protein tyrosine phosphatase, non-receptor type 9
    ## 1567                                                                                                             tyrosyl-tRNA synthetase
    ## 1568                                                                                                    occludin/ELL domain containing 1
    ## 1569                                                                                                     VPS33A CORVET/HOPS core subunit
    ## 1570                                                                                                             zinc finger protein 622
    ## 1571                                                                                                    pleiomorphic adenoma gene-like 2
    ## 1572                                                                                                    GA repeat binding protein, alpha
    ## 1573                                                                                                                 Iroquois homeobox 5
    ## 1574                                                                                                 mitochondrial ribosomal protein L30
    ## 1575                                                                                                             transcription factor 12
    ## 1576                                                                                   SYF2 homolog, RNA splicing factor (S. cerevisiae)
    ## 1577                                                                                        cold shock domain containing E1, RNA binding
    ## 1578                                                                                                      dual specificity phosphatase 7
    ## 1579                                                                                                             INO80 complex subunit E
    ## 1580                                                                                            meiosis regulator for oocyte development
    ## 1581                                                                                  achalasia, adrenocortical insufficiency, alacrimia
    ## 1582                                                                                  eukaryotic translation elongation factor 1 alpha 1
    ## 1583                                                                                                        rhomboid domain containing 2
    ## 1584                                                                                                                      alkB homolog 6
    ## 1585                                                                                  non-POU-domain-containing, octamer binding protein
    ## 1586                                                                                                                      nucleoporin 54
    ## 1587                                                                                            glutaminyl-peptide cyclotransferase-like
    ## 1588                                                                                               cactin, spliceosome C complex subunit
    ## 1589                                                                                        TATA-box binding protein associated factor 6
    ## 1590                                                                                                               ribosomal protein L19
    ## 1591                                                                      ELAV (embryonic lethal, abnormal vision)-like 1 (Hu antigen R)
    ## 1592                                                                                                    glycogen synthase kinase 3 alpha
    ## 1593                                              CDP-diacylglycerol--inositol 3-phosphatidyltransferase (phosphatidylinositol synthase)
    ## 1594                                                                                                         G patch domain containing 1
    ## 1595                                                                                                           transmembrane protein 39a
    ## 1596                                                                                                                ribosomal protein L3
    ## 1597                                                                     TATA-box binding protein associated factor, RNA polymerase I, D
    ## 1598                                                                                                  tetratricopeptide repeat domain 9C
    ## 1599                                                                                                    lysophosphatidic acid receptor 6
    ## 1600                                                                                                             LEM domain containing 2
    ## 1601                                                                                            transmembrane channel-like gene family 6
    ## 1602                                                                                                          RIKEN cDNA 2810004N23 gene
    ## 1603                                                                                                  dynein, axonemal assembly factor 2
    ## 1604                                                                                                       O-acyl-ADP-ribose deacylase 1
    ## 1605                                                                                                 mitochondrial ribosomal protein S26
    ## 1606                     SWI/SNF-related, matrix-associated actin-dependent regulator of chromatin, subfamily a, containing DEAD/H box 1
    ## 1607                                                                           alkB homolog 3, alpha-ketoglutarate-dependent dioxygenase
    ## 1608                                                                                                                                <NA>
    ## 1609                                                                                            cytochrome c oxidase assembly protein 20
    ## 1610                                                                                ADP-ribosylation factor-like 6 interacting protein 4
    ## 1611                                                                                                              ribosomal protein L18A
    ## 1612                                                                                                   chromatin accessibility complex 1
    ## 1613                                                                                                                nucleolar protein 10
    ## 1614                                                                                                     polyglutamine binding protein 1
    ## 1615                                                                                                PNN interacting serine/arginine-rich
    ## 1616                                                                                                          RIKEN cDNA 1190007I07 gene
    ## 1617                                                                                         acyl-Coenzyme A binding domain containing 6
    ## 1618                                                                               eukaryotic translation initiation factor 3, subunit I
    ## 1619                                                                                                                      thrombomodulin
    ## 1620                                                                                                                DExD box helicase 52
    ## 1621                                                                                                                   peter pan homolog
    ## 1622                                                                            NADH:ubiquinone oxidoreductase complex assembly factor 2
    ## 1623                                                                                                 mitochondrial ribosomal protein L54
    ## 1624                                                                                                            SPRY domain containing 4
    ## 1625                                                                                                           ribonuclease P 21 subunit
    ## 1626                                                                                                   mitochondrial elongation factor 1
    ## 1627                                                                                                              NHP2 ribonucleoprotein
    ## 1628                                                                                                             cell division cycle 34B
    ## 1629                                                                                                              cell division cycle 34
    ## 1630                                                                                                            DNA cross-link repair 1B
    ## 1631                                                                                                             zinc finger protein 759
    ## 1632                                                                                                            zinc finger protein 729b
    ## 1633                                                                                                             zinc finger protein 458
    ## 1634                                                                                                            zinc finger protein 729a
    ## 1635                                                                                    high mobility group nucleosomal binding domain 1
    ## 1636                                                                                                 mitochondrial ribosomal protein L45
    ## 1637                                                                                                             NOP14 nucleolar protein
    ## 1638                                                                                                     RAD54 homolog B (S. cerevisiae)
    ## 1639                                                                               methylmalonic aciduria cblC type, with homocystinuria
    ## 1640                                                                                         ubiquitin-like modifier activating enzyme 2
    ## 1641                                                                                      growth factor, augmenter of liver regeneration
    ## 1642                                                                      myeloid/lymphoid or mixed-lineage leukemia; translocated to, 6
    ## 1643                                                                                                                          importin 7
    ## 1644                                                                                                             S1 RNA binding domain 1
    ## 1645                                                                                                       trimethylguanosine synthase 1
    ## 1646                                                                                                             thymine DNA glycosylase
    ## 1647                                                                                                               IZUMO family member 4
    ## 1648                                                                                                   ecdysoneless cell cycle regulator
    ## 1649                                                                                         eukaryotic translation initiation factor 2D
    ## 1650                                                                                                             oxidase assembly 1-like
    ## 1651                                                                                                inhibitor of growth family, member 2
    ## 1652                                                                                      NADH:ubiquinone oxidoreductase core subunit S8
    ## 1653                                                                                       EEF1A lysine and N-terminal methyltransferase
    ## 1654                                                                     dual specificity phosphatase 11 (RNA/RNP complex 1-interacting)
    ## 1655                                                                                                  mitochondrial ribosomal protein L4
    ## 1656                                                                                                 solute carrier family 35, member A4
    ## 1657                                                                                           AT hook containing transcription factor 1
    ## 1658                                                                                                  cold inducible RNA binding protein
    ## 1659                                                                                                              sorbitol dehydrogenase
    ## 1660                                                                                                     tyrosyl-DNA phosphodiesterase 1
    ## 1661                                                                                                                phosphodiesterase 12
    ## 1662                                                                                                                mutY DNA glycosylase
    ## 1663                                                                                                         gamma-glutamyltransferase 1
    ## 1664                                                                                                               ybeY metallopeptidase
    ## 1665                                                                                     translocase of inner mitochondrial membrane 17a
    ## 1666                                                                                            small nuclear ribonucleoprotein 200 (U5)
    ## 1667                                                                                                              PR domain containing 4
    ## 1668                                                                                                    replication termination factor 2
    ## 1669                                                                                 pelota mRNA surveillance and ribosome rescue factor
    ## 1670                                                                                                            BCDIN3 domain containing
    ## 1671                                                                                       protein phosphatase 1 catalytic subunit alpha
    ## 1672                                                                                  URB1 ribosome biogenesis 1 homolog (S. cerevisiae)
    ## 1673                                                                                                     Rho GTPase activating protein 5
    ## 1674                                                                                                      dihydrolipoamide dehydrogenase
    ## 1675                                                                                                Ras homolog enriched in brain like 1
    ## 1676                                                                                             aldo-keto reductase family 1, member E1
    ## 1677                                                                                        heterochromatin protein 1, binding protein 3
    ## 1678                                            CTD (carboxy-terminal domain, RNA polymerase II, polypeptide A) small phosphatase like 2
    ## 1679                                                                                          SCO2 cytochrome c oxidase assembly protein
    ## 1680                                                                                                            ankyrin repeat domain 11
    ## 1681                                                                                       nuclear receptor-binding SET-domain protein 1
    ## 1682                                                                                                                ribosomal protein SA
    ## 1683                                                                                                                DEAD box helicase 18
    ## 1684                                                                                                             zinc finger protein 655
    ## 1685                                                                                      retinol dehydrogenase 13 (all-trans and 9-cis)
    ## 1686                                                                                       poly (ADP-ribose) polymerase family, member 6
    ## 1687                                                                                                          mediator complex subunit 8
    ## 1688                                                                                                 mitochondrial ribosomal protein L51
    ## 1689                                                                                                gamma-glutamylamine cyclotransferase
    ## 1690                                                                         ubiquitin recognition factor in ER-associated degradation 1
    ## 1691                                                                                                       armadillo repeat containing 1
    ## 1692                                                                                          SCO1 cytochrome c oxidase assembly protein
    ## 1693                                                                                                          RNA polymerase I subunit H
    ## 1694                                                                                                                     nucleoporin 205
    ## 1695                                                                                                  mitochondrial ribosomal protein S2
    ## 1696                                                                          proteasome (prosome, macropain) 26S subunit, non-ATPase, 6
    ## 1697                                                                                                             ring finger protein 220
    ## 1698                                                                                                      retinitis pigmentosa 2 homolog
    ## 1699                                                                                  minichromosome maintenance complex binding protein
    ## 1700                                                                              LLP homolog, long-term synaptic facilitation (Aplysia)
    ## 1701                                                                                               MAP kinase-activated protein kinase 5
    ## 1702                                                                                                                                <NA>
    ## 1703                                                                                               tRNA splicing endonuclease subunit 15
    ## 1704                                                                                                   pentatricopeptide repeat domain 3
    ## 1705                                                                                                                     sorting nexin 5
    ## 1706                                                                                                          coproporphyrinogen oxidase
    ## 1707                                                                                                                      glutaredoxin 3
    ## 1708                                                                                                        integrator complex subunit 5
    ## 1709                                                                                                                       plakophilin 3
    ## 1710                                                                                              regulatory factor X-associated protein
    ## 1711                                                                                                                    peroxiredoxin 6B
    ## 1712                                                                                                                     peroxiredoxin 6
    ## 1713                                                              neural precursor cell expressed, developmentally down-regulated gene 1
    ## 1714                                                                                                        RNA binding motif protein 48
    ## 1715                                                                                                          RIKEN cDNA 4930453N24 gene
    ## 1716                                                                                                S-adenosylmethionine decarboxylase 2
    ## 1717                                                                                                S-adenosylmethionine decarboxylase 1
    ## 1718                                                                                                   seryl-aminoacyl-tRNA synthetase 2
    ## 1719                                                                                                                            copine I
    ## 1720                                                                                                             ring finger protein 126
    ## 1721                                                                                                                exosome component 10
    ## 1722                                                                                                          PDGFA associated protein 1
    ## 1723                                                                                                                ribosomal protein S7
    ## 1724                                                                                                   pyruvate dehydrogenase E1 alpha 1
    ## 1725                                                                                   polymerase (RNA) III (DNA directed) polypeptide F
    ## 1726                                                                                                    PC-esterase domain containing 1A
    ## 1727                                                                                    MON1 homolog A, secretory traffciking associated
    ## 1728                                                                                               phospholipid phosphatase 7 (inactive)
    ## 1729                                                                                                    coiled-coil domain containing 14
    ## 1730                                                                                                             tubulin tyrosine ligase
    ## 1731                                                                                              glycerol-3-phosphate acyltransferase 4
    ## 1732                                                                                                                       transportin 1
    ## 1733                                                                                                                          peripherin
    ## 1734                                                                                                               histone deacetylase 2
    ## 1735                                                                                                           transmembrane protein 115
    ## 1736                                                                                           CCR4-NOT transcription complex, subunit 7
    ## 1737                                                                        dpy-30, histone methyltransferase complex regulatory subunit
    ## 1738                                                                                             UTP4 small subunit processome component
    ## 1739                                                                                         aldehyde dehydrogenase 16 family, member A1
    ## 1740                                                                                                        nuclear respiratory factor 1
    ## 1741                                                                                                         mediator complex subunit 11
    ## 1742                                                                                                               FAST kinase domains 1
    ## 1743                                                                                                 ELK4, member of ETS oncogene family
    ## 1744                                                                                                            zinc finger, C3HC type 1
    ## 1745                                                                                             apoptosis, caspase activation inhibitor
    ## 1746                                                                                      POZ (BTB) and AT hook containing zinc finger 1
    ## 1747                                                                                                       ClpB caseinolytic peptidase B
    ## 1748                                                                                                        spermatogenesis associated 5
    ## 1749                                                                                mago homolog B, exon junction complex core component
    ## 1750                                                                                                                         MSL3 like 2
    ## 1751                                                                                                   activating transcription factor 1
    ## 1752                                                                                                        Josephin domain containing 2
    ## 1753                                                                                                       splicing factor 3B, subunit 6
    ## 1754                                                                                                       DEAD box helicase 3, X-linked
    ## 1755                                                                                            CBY1 interacting BAR domain containing 1
    ## 1756                                                                                                   glutaredoxin 2 (thioltransferase)
    ## 1757                                                                                                          COP9 signalosome subunit 3
    ## 1758                                                                          proteasome (prosome, macropain) 26S subunit, non-ATPase, 3
    ## 1759                                                                                                              transducer of ERBB2, 2
    ## 1760                                                                                        histidine triad nucleotide binding protein 2
    ## 1761                                                                                                                      msh homeobox 1
    ## 1762                                                                                                          RIKEN cDNA 4930523C07 gene
    ## 1763                                                                                                              zinc finger protein 36
    ## 1764                                                                                                              TraB domain containing
    ## 1765                                                                                                               ribosomal protein S23
    ## 1766                                                                                                           kelch domain containing 2
    ## 1767                                                                                         cytosolic iron-sulfur assembly component 2A
    ## 1768                                                                                        family with sequence similarity 53, member C
    ## 1769                                                                                                                     ataxin 7-like 2
    ## 1770                                                                             squamous cell carcinoma antigen recognized by T cells 3
    ## 1771                                                                                          serine and arginine-rich splicing factor 6
    ## 1772                                                                                                                         importin 11
    ## 1773                                                                                              RNA polymerase II associated protein 1
    ## 1774                                                                                            pescadillo ribosomal biogenesis factor 1
    ## 1775                                                                                        diphosphoinositol pentakisphosphate kinase 2
    ## 1776                                                                                             Fanconi anemia, complementation group L
    ## 1777                                                                                                             H2B clustered histone 6
    ## 1778                                                                                                          RIKEN cDNA 2310011J03 gene
    ## 1779                                                                                         protein phosphatase 6, regulatory subunit 2
    ## 1780                                                                                 ATP-binding cassette, sub-family E (OABP), member 1
    ## 1781                                                                                                                         chromobox 3
    ## 1782                                                                                                            NudC domain containing 2
    ## 1783                                                                                                             zinc finger protein 473
    ## 1784                                                                                                                                <NA>
    ## 1785                                                                                                     zinc ribbon domain containing 2
    ## 1786                                                                                                               GTP binding protein 4
    ## 1787                                                                                     chaperonin containing Tcp1, subunit 5 (epsilon)
    ## 1788                                                                                                       gap junction protein, alpha 1
    ## 1789                                                                                                          proteasome subunit alpha 1
    ## 1790                                                                                                  mitochondrial ribosomal protein L1
    ## 1791                                                                                   negative elongation factor complex member E, Rdbp
    ## 1792                                                                                                         mediator complex subunit 16
    ## 1793                                                                                                    GTP-binding protein 8 (putative)
    ## 1794                                                                                                                catenin, beta like 1
    ## 1795                                                                                                     ubiquitin specific peptidase 39
    ## 1796                                                                                                                DEAD box helicase 23
    ## 1797                                                                                                         methionine aminopeptidase 2
    ## 1798                                                                                                                      alkB homolog 7
    ## 1799                                                                                                   tetratricopeptide repeat domain 4
    ## 1800                                                                                                           DDRGK domain containing 1
    ## 1801                                                                           heat shock protein 90 alpha (cytosolic), class B member 1
    ## 1802                                                                                       La ribonucleoprotein domain family, member 1B
    ## 1803                                                                                                            bromodomain containing 7
    ## 1804                                                                                         serine and arginine-rich splicing factor 10
    ## 1805                                                                                            cell death-inducing DFFA-like effector c
    ## 1806                                                                                                           COP1, E3 ubiquitin ligase
    ## 1807                                                                                                anaphase promoting complex subunit 7
    ## 1808                                                                                                         zinc finger SCAN domains 29
    ## 1809                                                                                                  ribonuclease P/MRP 25 subunit-like
    ## 1810                                                                                                 zinc finger CCCH-type containing 18
    ## 1811                                                                                                         tRNA methyltransferase 11-2
    ## 1812                                                                                                               ribosomal protein S10
    ## 1813                                                                                         protein phosphatase 4 regulatory subunit 3B
    ## 1814                                                                          solute carrier family 39 (metal ion transporter), member 8
    ## 1815                                                                                                          E2F transcription factor 2
    ## 1816                                                                                                         ORM1-like 1 (S. cerevisiae)
    ## 1817                                                                solute carrier family 4 (anion exchanger), member 1, adaptor protein
    ## 1818                                                                                      cleavage and polyadenylation specific factor 7
    ## 1819                                                                                               malignant T cell amplified sequence 1
    ## 1820                                                                                            UTP25 small subunit processome component
    ## 1821                                                                                proteasome (prosome, macropain) assembly chaperone 2
    ## 1822                                                                                                         ribosomal protein L7-like 1
    ## 1823                                                                                                     RAD21 cohesin complex component
    ## 1824                                                                                        DNA methyltransferase 1-associated protein 1
    ## 1825                                                                                        transcription elongation regulator 1 (CA150)
    ## 1826                                                                                         CWF19-like 2, cell cycle control (S. pombe)
    ## 1827                                                                                                             SNW domain containing 1
    ## 1828                                                                                                  RNA (guanine-7-) methyltransferase
    ## 1829                                                                                                              replication protein A1
    ## 1830                                                                                                          CDGSH iron sulfur domain 3
    ## 1831                                                                         proteasome (prosome, macropain) 26S subunit, non-ATPase, 10
    ## 1832                                                                                                                    ZPR1 zinc finger
    ## 1833                                                                                              RAB, member RAS oncogene family-like 3
    ## 1834                                                                                                 solute carrier family 25, member 28
    ## 1835                                                                                                            transmembrane protein 70
    ## 1836                                                                                               renalase, FAD-dependent amine oxidase
    ## 1837                                                                                     polypeptide N-acetylgalactosaminyltransferase 1
    ## 1838                                                                                                        scaffold attachment factor B
    ## 1839                                                                                  ubiquitin specific peptidase 13 (isopeptidase T-3)
    ## 1840                                                                            phosphatidylinositol glycan anchor biosynthesis, class X
    ## 1841                                                                                             growth factor receptor bound protein 14
    ## 1842                                                                                       SEC23 homolog B, COPII coat complex component
    ## 1843                                                                                                    ribosomal protein L7A pseudogene
    ## 1844                                                                                                                     galactokinase 1
    ## 1845                                                                                                            retinoid X receptor beta
    ## 1846                                                                                                                STAM binding protein
    ## 1847                                                                                                  ribosomal protein L9, pseudogene 1
    ## 1848                                                                                       family with sequence similarity 216, member A
    ## 1849                                                                                                                   STE20-like kinase
    ## 1850                                                                                            D4, zinc and double PHD fingers family 2
    ## 1851                                                                                                                   BCS1-like (yeast)
    ## 1852                                                                                                          NSFL1 (p97) cofactor (p47)
    ## 1853                                                                                                  ubiquitin-conjugating enzyme E2E 1
    ## 1854                                                                                      oxidoreductase NAD-binding domain containing 1
    ## 1855                                                                               eukaryotic translation initiation factor 3, subunit M
    ## 1856                                                                          ASH2 like histone lysine methyltransferase complex subunit
    ## 1857                                                                                                                   jagunal homolog 1
    ## 1858                                                                                                                DExD box helicase 21
    ## 1859                                                                          proteasome (prosome, macropain) 26S subunit, non-ATPase, 9
    ## 1860                                                                                                                         prefoldin 4
    ## 1861                                                                                                             TAR DNA binding protein
    ## 1862                                                                                                 zinc finger CCCH type containing 14
    ## 1863                                                                                                          proteasome subunit alpha 7
    ## 1864                                                             BRF1, RNA polymerase III transcription initiation factor 90 kDa subunit
    ## 1865                                                               processing of precursor 4, ribonuclease P/MRP family, (S. cerevisiae)
    ## 1866                                                                                             zinc finger and BTB domain containing 2
    ## 1867                                                                                                            methyltransferase like 4
    ## 1868                                                                                      NADH:ubiquinone oxidoreductase core subunit S6
    ## 1869                                                                                           Terf1 (TRF1)-interacting nuclear factor 2
    ## 1870                                                                                  ankyrin repeat and zinc finger domain containing 1
    ## 1871                                                                                                  ERBB receptor feedback inhibitor 1
    ## 1872                                                                                     nuclear receptor subfamily 1, group D, member 2
    ## 1873                                                                                                        RNA binding motif protein 45
    ## 1874                                                                                                             REX4, 3'-5' exonuclease
    ## 1875                                                                                                 hedgehog interacting protein-like 1
    ## 1876                                                                                                sulfotransferase family 1D, member 1
    ## 1877                                                                                               cellular nucleic acid binding protein
    ## 1878                                                                                                        5-azacytidine induced gene 2
    ## 1879                                                                                                     pyridoxine 5'-phosphate oxidase
    ## 1880                                                                                 major facilitator superfamily domain containing 14A
    ## 1881                                                                                                        bobby sox HMG box containing
    ## 1882                                                                                                  SUMO1/sentrin specific peptidase 1
    ## 1883                                                                                                          proteasome subunit alpha 3
    ## 1884                                                                                             trafficking protein particle complex 6B
    ## 1885                                                                                                            tRNA methyltransferase O
    ## 1886                                                                                                     ubiquitin specific peptidase 38
    ## 1887                                                                                      acyl-CoA synthetase long-chain family member 6
    ## 1888                                                                                               actin binding transcription modulator
    ## 1889                                                                                                  cysteine-rich hydrophobic domain 2
    ## 1890                                                                                      kelch repeat and BTB (POZ) domain containing 2
    ## 1891                                                                                                                        RIO kinase 3
    ## 1892                                                                                                            TATA box binding protein
    ## 1893                                                                                                 mitochondrial ribosomal protein S31
    ## 1894                                                                                                 mitochondrial ribosomal protein S24
    ## 1895                                                                                           mannoside acetylglucosaminyltransferase 2
    ## 1896                                                                                                cardiotrophin-like cytokine factor 1
    ## 1897                                                                                                                        calmodulin 2
    ## 1898                                                                                                              centrosomal protein 57
    ## 1899                                                                                        mitochondrial translational release factor 1
    ## 1900                                                                                                 mitochondrial ribosomal protein L27
    ## 1901                                                                                                        folylpolyglutamyl synthetase
    ## 1902                                                                                                        RNA binding motif protein 22
    ## 1903                                                                                                         death inducer-obliterator 1
    ## 1904                                                                                                   methylthioadenosine phosphorylase
    ## 1905                                                                           N-deacetylase/N-sulfotransferase (heparan glucosaminyl) 2
    ## 1906                                                                                proteasome activator subunit 3 interacting protein 1
    ## 1907                                                                                                xylulokinase homolog (H. influenzae)
    ## 1908                                                                                                                cytochrome b5 type B
    ## 1909                                                                                                           coenzyme Q6 monooxygenase
    ## 1910                                                                     TATA-box binding protein associated factor, RNA polymerase I, A
    ## 1911                                                                                         peptidyl-tRNA hydrolase domain containing 1
    ## 1912                                                                                                        topoisomerase (DNA) III beta
    ## 1913                                                                                                        rhomboid domain containing 3
    ## 1914                                                                                                          RIKEN cDNA 2310061I04 gene
    ## 1915                                                                                               RNA terminal phosphate cyclase-like 1
    ## 1916                                                                                             mannose-P-dolichol utilization defect 1
    ## 1917                                                                                           DEAH (Asp-Glu-Ala-His) box polypeptide 37
    ## 1918                                                                                                                          centriolin
    ## 1919                                                                                                                           pellino 2
    ## 1920                                                                                                          valosin containing protein
    ## 1921                                                                                       peptidylprolyl isomerase (cyclophilin)-like 1
    ## 1922                                                                                      growth hormone inducible transmembrane protein
    ## 1923                                                                                                  small integral membrane protein 26
    ## 1924                                                                                elongation factor Tu GTP binding domain containing 2
    ## 1925                                                                                      translocase of inner mitochondrial membrane 44
    ## 1926                                                                       retinoblastoma binding protein 7, chromatin remodeling factor
    ## 1927                                                                                 basic leucine zipper transcription factor, ATF-like
    ## 1928                                                                                                          prostaglandin E synthase 2
    ## 1929                                                                                                          pseudouridylate synthase 7
    ## 1930                                                                                                     stress-induced phosphoprotein 1
    ## 1931                                                                                                                                <NA>
    ## 1932                                                                                    RNA pseudouridylate synthase domain containing 4
    ## 1933                                                                       mitogen-activated protein kinase 1 interacting protein 1-like
    ## 1934                                                                                                 mitochondrial ribosomal protein L49
    ## 1935                                                                                                            metallophosphoesterase 1
    ## 1936                                                                                                      tripartite motif-containing 59
    ## 1937                                                                                        chaperonin containing Tcp1, subunit 2 (beta)
    ## 1938                                                                                          CCR4-NOT transcription complex, subunit 11
    ## 1939                                                                                                            OCIA domain containing 1
    ## 1940                                                                                             transmembrane p24 trafficking protein 2
    ## 1941                                                                                                                                <NA>
    ## 1942                                                                             adenine nucleotide translocase lysine methyltransferase
    ## 1943                                                                                        MAP/microtubule affinity regulating kinase 3
    ## 1944                                                                                                                 exosome component 4
    ## 1945                                                                                                             partner of NOB1 homolog
    ## 1946                                                                                                           Sh3kbp1 binding protein 1
    ## 1947                                                                                                      striatin interacting protein 2
    ## 1948                                                                                                          serine/threonine kinase 11
    ## 1949                                                                                          ski sarcoma viral oncogene homolog (avian)
    ## 1950                                                                                                                PHD finger protein 6
    ## 1951                                                                                                           Rac family small GTPase 1
    ## 1952                                                                                                             zinc finger protein 651
    ## 1953                                                                                                                   decapping mRNA 1A
    ## 1954                                                                      myeloid/lymphoid or mixed-lineage leukemia; translocated to, 1
    ## 1955                                                                                                   cytoskeleton associated protein 5
    ## 1956                                                      solute carrier family 25 (mitochondrial carrier, phosphate carrier), member 26
    ## 1957                                                                                             small nuclear ribonucleoprotein 70 (U1)
    ## 1958                                                                                                                 checkpoint kinase 2
    ## 1959                                                                                             protein phosphatase 2 protein activator
    ## 1960                                                                                                                 WD repeat domain 75
    ## 1961                                                                                                         ribosomal RNA processing 36
    ## 1962                                                                                                    canopy FGF signaling regulator 2
    ## 1963                                                                                           DEAH (Asp-Glu-Ala-His) box polypeptide 16
    ## 1964                                                                                                           torsin family 2, member A
    ## 1965                                                                                                  suppressor of cytokine signaling 4
    ## 1966                                                                                                      ubiquitin specific petidase 45
    ## 1967                                                                                    FAD-dependent oxidoreductase domain containing 1
    ## 1968                                                                                                torsin family 1, member A (torsin A)
    ## 1969                                                                         proteasome (prosome, macropain) 26S subunit, non-ATPase, 13
    ## 1970                                                                                                        pre-mRNA processing factor 3
    ## 1971                                                                                                                            ataxin 3
    ## 1972                                                                                                zinc finger, HIT domain containing 2
    ## 1973                                                                                          serine and arginine-rich splicing factor 5
    ## 1974                                                                                     translocase of inner mitochondrial membrane 10B
    ## 1975                                                                                     translocase of inner mitochondrial membrane 10B
    ## 1976                                                                                  protein tyrosine phosphatase, non-receptor type 11
    ## 1977                                                                                                          tRNA methyltransferase 61A
    ## 1978                                                                                                 solute carrier family 35, member E2
    ## 1979                                                                                                        GTPase, IMAP family member 6
    ## 1980                                                                                       small nuclear ribonucleoprotein polypeptide G
    ## 1981                                                                                          peptidylprolyl isomerase F (cyclophilin F)
    ## 1982                                                                                                          mediator complex subunit 1
    ## 1983                                                     asparagine-linked glycosylation 5 (dolichyl-phosphate beta-glucosyltransferase)
    ## 1984                                                                                      AHA1, activator of heat shock protein ATPase 2
    ## 1985                                                                                     general transcription factor IIF, polypeptide 2
    ## 1986                                                                                                            RCC1 domain containing 1
    ## 1987                                                                                                   RAB6A, member RAS oncogene family
    ## 1988                                                                                                aminolevulinate, delta-, dehydratase
    ## 1989                                                                                               transcription factor A, mitochondrial
    ## 1990                                                                                                   TNF receptor-associated protein 1
    ## 1991                                                                                                            histidyl-tRNA synthetase
    ## 1992                                                                                              alkB homolog 8, tRNA methyltransferase
    ## 1993                                                                             EDAR (ectodysplasin-A receptor)-associated death domain
    ## 1994                                                                                             structural maintenance of chromosomes 6
    ## 1995                                                                                                                 WD repeat domain 53
    ## 1996                                                                                                                            rhotekin
    ## 1997                                                                                                 NOC3 like DNA replication regulator
    ## 1998                                                                                         leucine zipper, putative tumor suppressor 2
    ## 1999                                                                                      NADH:ubiquinone oxidoreductase core subunit S4
    ## 2000                                                                                         Prkr interacting protein 1 (IL11 inducible)
    ## 2001                                                                        Tia1 cytotoxic granule-associated RNA binding protein-like 1
    ## 2002                                                                                                           Mtr4 exosome RNA helicase
    ## 2003                                                                                    cyclin D binding myb-like transcription factor 1
    ## 2004                                                                                      dehydrogenase/reductase (SDR family) member 7B
    ## 2005                                                                                                  fuzzy planar cell polarity protein
    ## 2006                                                                                            zinc finger and BTB domain containing 49
    ## 2007                                                                                                        glia maturation factor, beta
    ## 2008                                                                                                         TDP-glucose 4,6-dehydratase
    ## 2009                                                                                                              CDC42 small effector 2
    ## 2010                                                                                                               MSL complex subunit 3
    ## 2011                                                                                               RB transcriptional corepressor like 1
    ## 2012                                                                                                      karyopherin (importin) alpha 4
    ## 2013                                                                                                            core binding factor beta
    ## 2014                                                                                                         WW domain binding protein 4
    ## 2015                                                                                                             zinc finger protein 668
    ## 2016                                                                                              mannosidase, alpha, class 2C, member 1
    ## 2017                                                                               eukaryotic translation initiation factor 3, subunit B
    ## 2018                                                                                                              RAS related protein 2a
    ## 2019                                                                                                                 nucleolar protein 9
    ## 2020                                                                                                          histidyl-tRNA synthetase 2
    ## 2021                                                                                           crystallin beta-gamma domain containing 1
    ## 2022                                                            MYC-associated zinc finger protein (purine-binding transcription factor)
    ## 2023                                                                                                      WD repeat domain containing 82
    ## 2024                                                                               metal response element binding transcription factor 2
    ## 2025                                                                                  adaptor-related protein 5 complex, sigma 1 subunit
    ## 2026                                                                                                     coiled-coil domain containing 9
    ## 2027                                                                                                      ligase III, DNA, ATP-dependent
    ## 2028                                                                                     developmentally regulated GTP binding protein 2
    ## 2029                                                                                    WD repeat domain, phosphoinositide interacting 2
    ## 2030                                                                              tRNA-yW synthesizing protein 1 homolog (S. cerevisiae)
    ## 2031                                                                                                    Rho GTPase activating protein 31
    ## 2032                                                                                                       Vac14 homolog (S. cerevisiae)
    ## 2033                                                                                                                  choroideremia-like
    ## 2034                                                                                                               suppressor of IKBKE 1
    ## 2035                                                                                                               bolA-like 3 (E. coli)
    ## 2036                                                                                    echinoderm microtubule associated protein like 2
    ## 2037                                                        methylmalonic aciduria (cobalamin deficiency) cblD type, with homocystinuria
    ## 2038                                                                                         POU domain, class 2, transcription factor 1
    ## 2039                                                                                                   activating transcription factor 4
    ## 2040                                                                                                      armadillo repeat containing 10
    ## 2041                                                                                                             rabenosyn, RAB effector
    ## 2042                                                                                                         RAS p21 protein activator 1
    ## 2043                                                                                                            adrenocortical dysplasia
    ## 2044                                                                                                        catechol-O-methyltransferase
    ## 2045                                                                    methylenetetrahydrofolate dehydrogenase (NADP+ dependent) 1-like
    ## 2046                                                                                                          methyltransferase like 21A
    ## 2047                                                                                         discoidin, CUB and LCCL domain containing 1
    ## 2048                                                                                              zinc finger, DHHC domain containing 16
    ## 2049                                                                                                 regulator of microtubule dynamics 3
    ## 2050                                                                                    ATP synthase peripheral stalk-membrane subunit b
    ## 2051                                                                             glutathione S-transferase, C-terminal domain containing
    ## 2052                                                                                proteasome (prosome, macropain) subunit, beta type 1
    ## 2053                                                                                                replication factor C (activator 1) 1
    ## 2054                                                                                          mitochondrial ribosome associated GTPase 2
    ## 2055                                                                                                     ubiquitin specific peptidase 37
    ## 2056                                                                                    general transcription factor II H, polypeptide 4
    ## 2057                                                                                                           HIV TAT specific factor 1
    ## 2058                                                                                           UTP14A small subunit processome component
    ## 2059                                                                                                 mitochondrial ribosomal protein L32
    ## 2060                                                            ATP synthase, H+ transporting, mitochondrial F1 complex, alpha subunit 1
    ## 2061                                                                                                SUMO-interacting motifs containing 1
    ## 2062                                                                                                                            translin
    ## 2063                                                                                                        RNA binding motif protein 15
    ## 2064                                                                         nudix (nucleoside diphosphate linked moiety X)-type motif 5
    ## 2065                                                                                                           cyclin-dependent kinase 7
    ## 2066                                                                                    ATPase, H+ transporting, lysosomal V0 subunit A2
    ## 2067                                                                                                           SERTA domain containing 1
    ## 2068                                                                                                    coiled-coil domain containing 80
    ## 2069                                                                                                 ubiquitin-associated protein 2-like
    ## 2070                                                                                                  complement component 3a receptor 1
    ## 2071                                          solute carrier family 3 (activators of dibasic and neutral amino acid transport), member 2
    ## 2072                                                                                                          proteasome subunit alpha 2
    ## 2073                                                                                                                         syntaxin 12
    ## 2074                                                                   5-methyltetrahydrofolate-homocysteine methyltransferase reductase
    ## 2075                                                                              pyridine nucleotide-disulphide oxidoreductase domain 1
    ## 2076                                                                                                              DEAD/H box helicase 31
    ## 2077                                                                                                         proviral integration site 3
    ## 2078                                                                                       aryl-hydrocarbon receptor-interacting protein
    ## 2079                                                                                                       zinc fingers and homeoboxes 2
    ## 2080                                                                                         protein phosphatase 4 regulatory subunit 3A
    ## 2081                                                                          RRN3 RNA polymerase I transcription factor homolog (yeast)
    ## 2082                                                                                  negative elongation factor complex member A, Whsc2
    ## 2083                                                                                                      adhesion regulating molecule 1
    ## 2084                                                                                           adhesion regulating molecule 1 pseudogene
    ## 2085                                                                                          eukaryotic translation initiation factor 1
    ## 2086                                                                                   DnaJ heat shock protein family (Hsp40) member C11
    ## 2087                                                                                                                 ceramide synthase 2
    ## 2088                                                                                  major facilitator superfamily domain containing 10
    ## 2089                                                      solute carrier family 25 (mitochondrial carrier, phosphate carrier), member 24
    ## 2090                                                                                                                DEAD box helicase 10
    ## 2091                                                                                    interferon stimulated exonuclease gene 20-like 2
    ## 2092                                                                                                 mitochondrial ribosomal protein L43
    ## 2093                                                                                                  INTS3 and NABP interacting protein
    ## 2094                                                                                    heterogeneous nuclear ribonucleoprotein U-like 1
    ## 2095                                                                                                 isovaleryl coenzyme A dehydrogenase
    ## 2096                                                                                               peroxisomal biogenesis factor 11 beta
    ## 2097                                                                                                     PAX3 and PAX7 binding protein 1
    ## 2098                                                                                                      embryonic ectoderm development
    ## 2099                                                                                         ring finger protein, LIM domain interacting
    ## 2100                                                                                                                 WD repeat domain 61
    ## 2101                                                                            nascent polypeptide-associated complex alpha polypeptide
    ## 2102                                                                                        small nuclear ribonucleoprotein 48 (U11/U12)
    ## 2103                                                                                                               ribosomal protein L27
    ## 2104                                                                                                      tripartite motif-containing 33
    ## 2105                                                                                                  ubiquitin-conjugating enzyme E2J 1
    ## 2106                                                                                                                     F-box protein 6
    ## 2107                                                                                                                   thymosin, beta 10
    ## 2108                                                                                                        thymosin, beta 10 pseudogene
    ## 2109                                                                  heme A:farnesyltransferase cytochrome c oxidase assembly factor 10
    ## 2110                                                                                                           RAB3A interacting protein
    ## 2111                                                                                                       pyrophosphatase (inorganic) 1
    ## 2112                                                                     adaptor-related protein complex 1 associated regulatory protein
    ## 2113                                                                                                                     cyclin Y-like 1
    ## 2114                                                                                                                 WD repeat domain 92
    ## 2115                                                                                                         RNA binding motif protein 5
    ## 2116                                                                                                   ribosomal L24 domain containing 1
    ## 2117                                                                                                                  tubulin, epsilon 1
    ## 2118                                                                                                replication factor C (activator 1) 2
    ## 2119                                                                          proteasome (prosome, macropain) 26S subunit, non-ATPase, 1
    ## 2120                                                                               N(alpha)-acetyltransferase 25, NatB auxiliary subunit
    ## 2121                                                                                                           nitric oxide associated 1
    ## 2122                                                             Mid1 interacting protein 1 (gastrulation specific G12-like (zebrafish))
    ## 2123                                                                                                     AKT1 substrate 1 (proline-rich)
    ## 2124                                                                                                          tubulin, beta 4B class IVB
    ## 2125                                                                                proteasome (prosome, macropain) subunit, beta type 2
    ## 2126                                                                                                nuclear speckle regulatory protein 1
    ## 2127                                                                                                   RNA 3'-terminal phosphate cyclase
    ## 2128                                                                                                          RIKEN cDNA 1110004F10 gene
    ## 2129                                                                                                         diaphanous related formin 3
    ## 2130                                                                                                                 WD repeat domain 89
    ## 2131                                                                                      serine/arginine-rich protein specific kinase 1
    ## 2132                                                                          cytochrome c oxidase assembly protein 11, copper chaperone
    ## 2133                                                                                    coordinator of PRMT5, differentiation stimulator
    ## 2134                                                                                               single-stranded DNA binding protein 1
    ## 2135                                                                                                                               ezrin
    ## 2136                                                                                    polymerase (RNA) II (DNA directed) polypeptide H
    ## 2137                                                                                                                    glutamine-rich 1
    ## 2138                                                                                                             YTH domain containing 1
    ## 2139                                                                                                                centromere protein J
    ## 2140                                                                                     Tu translation elongation factor, mitochondrial
    ## 2141                                                                                                                      mutL homolog 1
    ## 2142                                                        ATP synthase, H+ transporting, mitochondrial F1 complex, gamma polypeptide 1
    ## 2143                                                                                                                                <NA>
    ## 2144                                                                                                          RIKEN cDNA 3830406C13 gene
    ## 2145                                                                                                SURP and G patch domain containing 1
    ## 2146                                                                                                  outer dense fiber of sperm tails 2
    ## 2147                                                                                                 mitochondrial ribosomal protein S35
    ## 2148                                                                                         nuclear assembly factor 1 ribonucleoprotein
    ## 2149                                      homocysteine-inducible, endoplasmic reticulum stress-inducible, ubiquitin-like domain member 1
    ## 2150                                                                                                                           centrin 3
    ## 2151                                                                                                           uridine-cytidine kinase 2
    ## 2152                                                           solute carrier family 6 (neurotransmitter transporter, taurine), member 6
    ## 2153                                                                                                  nuclear receptor binding protein 1
    ## 2154                                                                                                        histone cell cycle regulator
    ## 2155                                                                                  cleavage stimulation factor, 3' pre-RNA, subunit 1
    ## 2156                                                                                                         cyclin-dependent kinase 11B
    ## 2157                                                                            phosphatidylinositol glycan anchor biosynthesis, class Q
    ## 2158                                                                                         eukaryotic translation initiation factor 1B
    ## 2159                                                B double prime 1, subunit of RNA polymerase III transcription initiation factor IIIB
    ## 2160                                                                                               GATA zinc finger domain containing 2A
    ## 2161                                                                             zinc finger and BTB domain containing 8 opposite strand
    ## 2162                                                                                                               pericentrin (kendrin)
    ## 2163                                                                                                             protein kinase C, delta
    ## 2164                                               excision repair cross-complementing rodent repair deficiency, complementation group 5
    ## 2165                                                                                basic, immunoglobulin-like variable motif containing
    ## 2166                                                                                                  diacylglycerol O-acyltransferase 2
    ## 2167                                                                                                     Sec1 family domain containing 2
    ## 2168                                                                             protein phosphatase 3, catalytic subunit, gamma isoform
    ## 2169                                                                                                       splicing factor 3b, subunit 1
    ## 2170                                                                                                                      nucleoporin 98
    ## 2171                                                                                    DnaJ heat shock protein family (Hsp40) member A1
    ## 2172                                                                                                   mitochondrial fission regulator 1
    ## 2173                                                                                                                              citron
    ## 2174                                                                                                                          exportin 6
    ## 2175                                                                                               Sec61 alpha 1 subunit (S. cerevisiae)
    ## 2176                                                                                                          RIKEN cDNA 4921524J17 gene
    ## 2177                                                                                   transmembrane anterior posterior transformation 1
    ## 2178                                                                                                  Wilms tumour 1-associating protein
    ## 2179                                                                                                 HAUS augmin-like complex, subunit 3
    ## 2180                                                                                            WD repeat containing, antisense to Trp73
    ## 2181                                                                                           HECT domain E3 ubiquitin protein ligase 1
    ## 2182                                                                                               interleukin enhancer binding factor 2
    ## 2183                                                                                     antigen identified by monoclonal antibody Ki 67
    ## 2184                                                                                    DnaJ heat shock protein family (Hsp40) member C8
    ## 2185                                                                    PAX interacting (with transcription-activation domain) protein 1
    ## 2186                                                                                                    polymerase (RNA) I polypeptide B
    ## 2187                                                                              guanine nucleotide binding protein (G protein), beta 4
    ## 2188                                                                                           axin interactor, dorsalization associated
    ## 2189                                                                                              pyrroline-5-carboxylate reductase-like
    ## 2190                                                                                             phosphorylated CTD interacting factor 1
    ## 2191                                                                                         eukaryotic translation initiation factor 4H
    ## 2192                                                                                               Werner helicase interacting protein 1
    ## 2193                                                                                                                    src-like adaptor
    ## 2194                                                                                                     nectin cell adhesion molecule 3
    ## 2195                                                                           LysM, putative peptidoglycan-binding, domain containing 2
    ## 2196                                                                                                 zinc finger CCCH type containing 7B
    ## 2197                                                                                                                       BUD31 homolog
    ## 2198                                                                                                    coiled-coil domain containing 50
    ## 2199                                                                                               potassium channel modulatory factor 1
    ## 2200                                                                                                           transmembrane protein 128
    ## 2201                                                                                             phosphoglycerate mutase family member 5
    ## 2202                                                                                                        ARP5 actin-related protein 5
    ## 2203                                                                                                               ribosomal protein S14
    ## 2204                                                                                                           ribonucleic acid export 1
    ## 2205                                                                                                         G patch domain containing 3
    ## 2206                                                                                                                     ring finger 223
    ## 2207                                                                                                   integrator complex subunit 6 like
    ## 2208                                                                                         proline-rich nuclear receptor coactivator 2
    ## 2209                                                                                    succinate-CoA ligase, GDP-forming, alpha subunit
    ## 2210                                                                                                        methyl CpG binding protein 2
    ## 2211                                                                                             F-box and leucine-rich repeat protein 6
    ## 2212                                                                                               jumonji, AT rich interactive domain 2
    ## 2213                                                                   calmodulin regulated spectrin-associated protein family, member 3
    ## 2214                                                                                                                   CDC-like kinase 1
    ## 2215                                                                     smg-8 homolog, nonsense mediated mRNA decay factor (C. elegans)
    ## 2216                                                                                                         intraflagellar transport 52
    ## 2217                                                                                                        RNA binding motif protein 34
    ## 2218                                                                                                    ubiquitin-conjugating enzyme E2N
    ## 2219                                                                                                   VPS50 EARP/GARPII complex subunit
    ## 2220                                                                                                            zinc finger protein 280C
    ## 2221                                                                                                          ribosomal RNA processing 8
    ## 2222                                                                                                                   GPN-loop GTPase 2
    ## 2223                                                                                                         holocytochrome c synthetase
    ## 2224                                                                        deoxynucleotidyltransferase, terminal, interacting protein 1
    ## 2225                                                                                           katanin p80 (WD40-containing) subunit B 1
    ## 2226                                                                                                    BMS1, ribosome biogenesis factor
    ## 2227                                                                                                                DEAD box helicase 41
    ## 2228                                                                                                     inositol hexaphosphate kinase 1
    ## 2229                                                                                         RNA 2',3'-cyclic phosphate and 5'-OH ligase
    ## 2230                                                                                                NOL1/NOP2/Sun domain family member 3
    ## 2231                                                                                                            Ngfi-A binding protein 2
    ## 2232                                                                           LysM, putative peptidoglycan-binding, domain containing 1
    ## 2233                                                                                      cell cycle activator and apoptosis regulator 2
    ## 2234                                                                                              ATPase family, AAA domain containing 1
    ## 2235                                                                                        La ribonucleoprotein domain family, member 1
    ## 2236                                                                                                             acyl-CoA thioesterase 8
    ## 2237                                                                                            UTP23 small subunit processome component
    ## 2238                                                                                     IQ motif containing GTPase activating protein 1
    ## 2239                                                                                                               DEAD box helicase 19b
    ## 2240                                                                                                    ubiquitin-conjugating enzyme E2A
    ## 2241                                                                                      translocase of outer mitochondrial membrane 20
    ## 2242                                                                                            NME/NM23 nucleoside diphosphate kinase 6
    ## 2243                                                                            NADH:ubiquinone oxidoreductase complex assembly factor 4
    ## 2244                                                 CTD (carboxy-terminal domain, RNA polymerase II, polypeptide A) small phosphatase 2
    ## 2245                                                                                               inner membrane protein, mitochondrial
    ## 2246                                                                                                secretory carrier membrane protein 4
    ## 2247                                                                                      dihydrouridine synthase 3-like (S. cerevisiae)
    ## 2248                                                                              protein geranylgeranyltransferase type I, beta subunit
    ## 2249                                                                                                    Rho GTPase activating protein 39
    ## 2250                                                                                                           transmembrane protein 237
    ## 2251                                                                                                                           caspase 1
    ## 2252                                                                               eukaryotic translation initiation factor 3, subunit L
    ## 2253                                                                              polymerase (DNA directed), delta 2, regulatory subunit
    ## 2254                                                                                                vascular endothelial growth factor C
    ## 2255                                                                                                mitotic spindle organizing protein 2
    ## 2256                                                                                                          timeless circadian clock 1
    ## 2257                                                                                                   lysocardiolipin acyltransferase 1
    ## 2258                                                                                                        TBC1 domain family, member 7
    ## 2259                                                                                    DnaJ heat shock protein family (Hsp40) member B9
    ## 2260                                                                       eukaryotic translation initiation factor 4E binding protein 2
    ## 2261                                                                                              endoplasmic reticulum aminopeptidase 1
    ## 2262                                                                                                  mitogen-activated protein kinase 7
    ## 2263                                                                        v-rel reticuloendotheliosis viral oncogene homolog A (avian)
    ## 2264                                                                                             F-box and leucine-rich repeat protein 3
    ## 2265                                                                                                        lin-7 homolog C (C. elegans)
    ## 2266                                                                                                                     ceramide kinase
    ## 2267                                                                                                                   CDC-like kinase 2
    ## 2268                                                                                    general transcription factor II H, polypeptide 2
    ## 2269                                                                                                mitochondrial ribosomal protein S18C
    ## 2270                                                                                                G patch domain and ankyrin repeats 1
    ## 2271                                                                              cytochrome P450, family 20, subfamily a, polypeptide 1
    ## 2272                                                                                                             H2A.Z histone variant 2
    ## 2273                                                                                protein kinase, DNA activated, catalytic polypeptide
    ## 2274                                                                                                   DNA-damage-inducible transcript 4
    ## 2275                                                                               solute carrier family 30 (zinc transporter), member 4
    ## 2276                                                                                                             zinc finger protein 362
    ## 2277                                                                       misato 1, mitochondrial distribution and morphology regulator
    ## 2278                                                                                                        RAD54 like 2 (S. cerevisiae)
    ## 2279                                                                                                microfibrillar-associated protein 1B
    ## 2280                                                                                                microfibrillar-associated protein 1A
    ## 2281                                                                                                                     proline rich 14
    ## 2282                                                                                                   cytosolic thiouridylase subunit 1
    ## 2283                                                                                                 mitochondrial ribosomal protein L22
    ## 2284                                                                                                      ubiquitin-associated protein 2
    ## 2285                                                                                                          COP9 signalosome subunit 4
    ## 2286                                                                                        family with sequence similarity 98, member A
    ## 2287                                                                                   TATA-box binding protein associated factor 5 like
    ## 2288                                                                                                                   protein kinase N2
    ## 2289                                                                                                  zinc finger, BED type containing 4
    ## 2290                                                                                                                             spastin
    ## 2291                                                                                          ankyrin repeat and LEM domain containing 2
    ## 2292                                                                           NIMA (never in mitosis gene a)-related expressed kinase 8
    ## 2293                                                                         late endosomal/lysosomal adaptor, MAPK and MTOR activator 3
    ## 2294                                                                                                                 WD repeat domain 70
    ## 2295                                                                                                              ribosomal protein S3A1
    ## 2296                                                                                guanosine diphosphate (GDP) dissociation inhibitor 2
    ## 2297                                                            v-maf musculoaponeurotic fibrosarcoma oncogene family, protein G (avian)
    ## 2298                                                                                                             5'-3' exoribonuclease 2
    ## 2299                                                                                       family with sequence similarity 135, member A
    ## 2300                                                                 extracellular matrix protein 2, female organ and adipocyte specific
    ## 2301                                                                                                            methyltransferase like 1
    ## 2302                                                                                                         proviral integration site 1
    ## 2303                                                                                                      tripartite motif-containing 45
    ## 2304                                                                                                              SRR1 domain containing
    ## 2305                                                                                                zinc finger, MYND-type containing 15
    ## 2306                                                                                                           myelocytomatosis oncogene
    ## 2307                                                                                                   SUMO/sentrin specific peptidase 3
    ## 2308                                                                                      ADP-ribosylation factor-like 2 binding protein
    ## 2309                                                                                                                     nucleoporin 133
    ## 2310                                                                                                            threonyl-tRNA synthetase
    ## 2311                                                                                                             zinc finger protein 597
    ## 2312                                                                                                    coiled-coil domain containing 25
    ## 2313                                                                                                               phosphatase, orphan 2
    ## 2314                                                                                             SMC5-SMC6 complex localization factor 1
    ## 2315                                                                                               zinc finger, CCHC domain containing 8
    ## 2316                                                                                                            tRNA methyltransferase 6
    ## 2317                                                                                                          ATPase, class VI, type 11C
    ## 2318                                                                                            protein phosphatase 5, catalytic subunit
    ## 2319                                                                                                        RNA binding motif protein 39
    ## 2320                                                                                                 mitogen-activated protein kinase 10
    ## 2321                                                                                                                    abl interactor 1
    ## 2322                                                                                                      ATP/GTP binding protein-like 5
    ## 2323                                                                                                   Ewing sarcoma breakpoint region 1
    ## 2324                                                                                    ubiquitin-conjugating enzyme E2Q family member 2
    ## 2325                                                                                                         ras homolog family member J
    ## 2326                                                                                           sigma non-opioid intracellular receptor 1
    ## 2327                                                                                                     cell cycle associated protein 1
    ## 2328                                                                                                               ribosomal protein L13
    ## 2329                                                                                                                sphingosine kinase 1
    ## 2330                                                                                                       integrator complex subunit 10
    ## 2331                                                                                                   RAD52 homolog, DNA repair protein
    ## 2332                                                                                           tyrosyl-tRNA synthetase 2 (mitochondrial)
    ## 2333                                                                                                             RWD domain containing 1
    ## 2334                                                                                                   voltage-dependent anion channel 3
    ## 2335                                                                                       bromodomain adjacent to zinc finger domain 1A
    ## 2336                                                                                     RalBP1 associated Eps domain containing protein
    ## 2337                                                                                                          zinc finger, matrin type 2
    ## 2338                                                                                                                      nucleoporin 93
    ## 2339                                                                                                 mitochondrial ribosomal protein L20
    ## 2340                                                                                                                        glyoxalase 1
    ## 2341                                                                               apoptosis-inducing factor, mitochondrion-associated 1
    ## 2342                                                                                                            COMM domain containing 3
    ## 2343                                                                                                                PHD finger protein 3
    ## 2344                                                                                                 ubiquitin specific peptidase like 1
    ## 2345                                                                                     general transcription factor IIH, polypeptide 3
    ## 2346                                                                                    myeloid differentiation primary response gene 88
    ## 2347                                                                                                               Kruppel-like factor 6
    ## 2348                                                                                  protein phosphatase 2, regulatory subunit A, alpha
    ## 2349                                                                                        erythrocyte membrane protein band 4.1 like 2
    ## 2350                                                                                                                         cadherin 13
    ## 2351                                                                                                           UDP-glucose dehydrogenase
    ## 2352                                                                                                   voltage-dependent anion channel 2
    ## 2353                                                                                                 mitochondrial ribosomal protein L15
    ## 2354                                                                                        MAP/microtubule affinity regulating kinase 1
    ## 2355                                                                                         chromodomain helicase DNA binding protein 5
    ## 2356                                                                                                               Kruppel-like factor 5
    ## 2357                                                                                                  calcineurin-like EF hand protein 1
    ## 2358                                                                               eukaryotic translation initiation factor 3, subunit D
    ## 2359                                                                            ATPase, Ca++ transporting, cardiac muscle, slow twitch 2
    ## 2360                                                                                        TATA-box binding protein associated factor 7
    ## 2361                                                                                                        integrator complex subunit 9
    ## 2362                                                                   processing of precursor 7, ribonuclease P family, (S. cerevisiae)
    ## 2363                                                                                                 peptide deformylase (mitochondrial)
    ## 2364                                                                                                                                <NA>
    ## 2365                                                                                                             zinc finger protein 692
    ## 2366                                                                                         ankyrin repeat and MYND domain containing 2
    ## 2367                                                                                                                 ceramide synthase 6
    ## 2368                                                                                         tubulin, gamma complex associated protein 3
    ## 2369                                                                                                         mediator complex subunit 23
    ## 2370                                                                                                         enolase 1B, retrotransposed
    ## 2371                                                                                                         enolase 1, alpha non-neuron
    ## 2372                                                                                                   small integral membrane protein 8
    ## 2373                                                                                          RNA binding motif protein, X-linked like-1
    ## 2374                                                                                                                   Rbmxrt pseudogene
    ## 2375                                                                                                             zinc finger protein 637
    ## 2376                                                                                                            phospholipase C, gamma 1
    ## 2377                                                                                                 smoothened, frizzled class receptor
    ## 2378                                                                                                        ras homolog family member T1
    ## 2379                                                                                    GULP, engulfment adaptor PTB domain containing 1
    ## 2380                                                                              Rho-associated coiled-coil containing protein kinase 2
    ## 2381                                                                                                             SET domain containing 4
    ## 2382                                                                                                                 RUS family member 1
    ## 2383                                                                                                      enhancer of polycomb homolog 1
    ## 2384                                                                                             ubiquitin carboxyl-terminal esterase L5
    ## 2385                                                                                           membrane associated ring-CH-type finger 7
    ## 2386                                                                         eukaryotic translation initiation factor 2, subunit 1 alpha
    ## 2387                                                                  ATP synthase, H+ transporting, mitochondrial F1 complex, O subunit
    ## 2388                                                                                            zinc finger and BTB domain containing 10
    ## 2389                                                                                                                     selenoprotein O
    ## 2390                                                                                    leishmanolysin-like (metallopeptidase M8 family)
    ## 2391                                                                              solute carrier family 50 (sugar transporter), member 1
    ## 2392                                                                                                 glucose 6 phosphatase, catalytic, 3
    ## 2393                                                                  asparagine-linked glycosylation 6 (alpha-1,3,-glucosyltransferase)
    ## 2394                                                                                          Rho GDP dissociation inhibitor (GDI) alpha
    ## 2395                                                                                           Paf1, RNA polymerase II complex component
    ## 2396                                                                                                   magnesium-dependent phosphatase 1
    ## 2397                                                                                    mitochondrial transcription termination factor 4
    ## 2398                                                                                                        breast cancer 1, early onset
    ## 2399                                                                                               tRNA splicing endonuclease subunit 54
    ## 2400                                                                                                                               pirin
    ## 2401                                                                                                   SUMO/sentrin specific peptidase 5
    ## 2402                                                                                                  ubiquitin-conjugating enzyme E2L 3
    ## 2403                                                                                                  Werner syndrome RecQ like helicase
    ## 2404                                                                      eukaryotic translation initiation factor 2B, subunit 1 (alpha)
    ## 2405                                                                                                                  thioredoxin-like 1
    ## 2406                                                                                 eukaryotic translation initiation factor 4, gamma 2
    ## 2407                                                                                                   MIA SH3 domain ER export factor 2
    ## 2408                                                                                                           transcriptional adaptor 1
    ## 2409                                                                                              DNA fragmentation factor, beta subunit
    ## 2410                                                                                                          leukemia inhibitory factor
    ## 2411                                                                                                 solute carrier family 35, member B1
    ## 2412                                                                                                         COP9 signalosome subunit 7A
    ## 2413                                                                                                                 exosome component 7
    ## 2414                                                                                                       tripartite motif-containing 8
    ## 2415                                                                                           mitogen-activated protein kinase kinase 2
    ## 2416                                                                                          U2 snRNP-associated SURP domain containing
    ## 2417                                                                                                                             rotatin
    ## 2418                                                                           DIM1 dimethyladenosine transferase 1-like (S. cerevisiae)
    ## 2419                                                             UDP-GalNAc:betaGlcNAc beta 1,3-galactosaminyltransferase, polypeptide 1
    ## 2420                                                                                                             microspherule protein 1
    ## 2421                                                                                 CDK5 regulatory subunit associated protein 1-like 1
    ## 2422                                                                                                       ribonuclease P/MRP 38 subunit
    ## 2423                                                                                                                 asparaginase like 1
    ## 2424                                                                                      kelch repeat and BTB (POZ) domain containing 8
    ## 2425                                                                                                 mitochondrial ribosomal protein S14
    ## 2426                                                                                                             zinc finger protein 760
    ## 2427                                                                                                             cutC copper transporter
    ## 2428                                                                                                       nuclear cap binding subunit 3
    ## 2429                                                                                                               SAP30 binding protein
    ## 2430                                                           peroxisome proliferative activated receptor, gamma, coactivator-related 1
    ## 2431                                                                                                hydroxypyruvate isomerase (putative)
    ## 2432                                                                                          matrix AAA peptidase interacting protein 1
    ## 2433                                                                                                          ER lipid raft associated 1
    ## 2434                                                                                                               UBX domain protein 2A
    ## 2435                                                                                                de-etiolated homolog 1 (Arabidopsis)
    ## 2436                                                                                                             zinc finger protein 954
    ## 2437                                                                                                             cap methyltransferase 1
    ## 2438                                                                                        ATPase, Ca++ transporting, plasma membrane 1
    ## 2439                                                                                               leucyl-tRNA synthetase, mitochondrial
    ## 2440                                                                                      transcription elongation factor A (SII)-like 8
    ## 2441                                                                                   protein phosphatase 2, regulatory subunit A, beta
    ## 2442                                                                                                        enhancer of mRNA decapping 3
    ## 2443                                                                              succinate-Coenzyme A ligase, GDP-forming, beta subunit
    ## 2444                                                                                                           GLIS family zinc finger 2
    ## 2445                                                                                                                      filamin, alpha
    ## 2446                                                                                          katanin p60 (ATPase-containing) subunit A1
    ## 2447                                                                                                            COMM domain containing 6
    ## 2448                                                                                    polymerase (RNA) II (DNA directed) polypeptide D
    ## 2449                                                                                                                           sirtuin 6
    ## 2450                                                                                               zinc finger, DHHC domain containing 4
    ## 2451                                                                                                         ORM1-like 2 (S. cerevisiae)
    ## 2452                                                                                                        ribitol xylosyltransferase 1
    ## 2453                                                                                          ribosomal protein S6 kinase, polypeptide 1
    ## 2454                                                                                                                  nipsnap homolog 3B
    ## 2455                                                                                                       centlein, centrosomal protein
    ## 2456                                                                                                G elongation factor, mitochondrial 2
    ## 2457                                                                                                        pre-mRNA processing factor 8
    ## 2458                                                                                  retinoblastoma binding protein 6, ubiquitin ligase
    ## 2459                                                                                                              ring finger protein 25
    ## 2460                                                                                                         expressed sequence AI837181
    ## 2461                                                                                                                UBX domain protein 4
    ## 2462                                                                                                  arginine/serine-rich coiled-coil 1
    ## 2463                                                                                       peptidylprolyl isomerase (cyclophilin)-like 3
    ## 2464                                                                                                                 WD repeat domain 73
    ## 2465                                                                                                          D-tyrosyl-tRNA deacylase 1
    ## 2466                                                                                                          lipase maturation factor 2
    ## 2467                                                                                                            SS nuclear autoantigen 1
    ## 2468                                                                              SS18, nBAF chromatin remodeling complex subunit like 2
    ## 2469                                                                                                          COP9 signalosome subunit 8
    ## 2470                                                                                                    SIVA1, apoptosis-inducing factor
    ## 2471                                                                                                                 WD repeat domain 24
    ## 2472                                                                                          transformed mouse 3T3 cell double minute 2
    ## 2473                                                                                         peptidyl-prolyl isomerase G (cyclophilin G)
    ## 2474                                                                                           nucleoside-triphosphatase, cancer-related
    ## 2475                                                                                                                   LIM domain only 2
    ## 2476                                                                                                        BCL2-associated athanogene 1
    ## 2477                                                                                                     ubiquitin specific peptidase 12
    ## 2478                                                                                              Sec61, alpha subunit 2 (S. cerevisiae)
    ## 2479                                                                 nucleus accumbens associated 1, BEN and BTB (POZ) domain containing
    ## 2480                                                                                        methionine-tRNA synthetase 2 (mitochondrial)
    ## 2481                                                                                                                      nucleoporin 88
    ## 2482                                                                                             G2/M-phase specific E3 ubiquitin ligase
    ## 2483                                                                                                   leucine-rich PPR-motif containing
    ## 2484                                                                                                         LUC7-like 3 (S. cerevisiae)
    ## 2485                                                                               eukaryotic translation initiation factor 3, subunit E
    ## 2486                                                                                                   leucine rich repeat containing 47
    ## 2487                                                                                                                       ataxin 1-like
    ## 2488                                                                                                        BCL2-associated athanogene 6
    ## 2489                                                                                                                DEAD box helicase 56
    ## 2490                                                                                                               early B cell factor 2
    ## 2491                                                                    dual-specificity tyrosine-(Y)-phosphorylation regulated kinase 2
    ## 2492                                                                                                     ubiquitin specific peptidase 40
    ## 2493                                                                                             outer dense fiber of sperm tails 2-like
    ## 2494                                                                                                          transmembrane protein 126A
    ## 2495                                                                                                             zinc finger protein 777
    ## 2496                                                                   protein O-linked mannose beta 1,2-N-acetylglucosaminyltransferase
    ## 2497                                                                                                          transmembrane protein 126B
    ## 2498                                                                                          chloride channel, nucleotide-sensitive, 1A
    ## 2499                                                                                                       scaffold attachment factor B2
    ## 2500                                                                                                           vaccinia related kinase 3
    ## 2501                                                                                                               RAN binding protein 3
    ## 2502                                                                                   TATA-box binding protein associated factor 6 like
    ## 2503                                                                               ral guanine nucleotide dissociation stimulator-like 2
    ## 2504                                                                                                        pre-mRNA processing factor 4
    ## 2505                                                                                                              SH2B adaptor protein 1
    ## 2506                                                                                       topoisomerase I binding, arginine/serine-rich
    ## 2507                                                                                                          RIKEN cDNA 1810055G02 gene
    ## 2508                                                                                              cytochrome c oxidase assembly factor 6
    ## 2509                                                                                                  inositol polyphosphate multikinase
    ## 2510                                                                                              mitochondrial fission regulator 1-like
    ## 2511                                                  transcription elongation factor A (SII) N-terminal and central domain containing 2
    ## 2512                                                                                     Ts translation elongation factor, mitochondrial
    ## 2513                                               xylosylprotein beta1,4-galactosyltransferase, polypeptide 7 (galactosyltransferase I)
    ## 2514                                                                                            DiGeorge syndrome critical region gene 2
    ## 2515                                                                                                                                <NA>
    ## 2516                                                                                                                      mutS homolog 4
    ## 2517                                                                                        CTS telomere maintenance complex component 1
    ## 2518                                                                                                cyclin-dependent kinase inhibitor 1B
    ## 2519                                                                                                           cytochrome b5 reductase 4
    ## 2520                                                                                                               kinesin light chain 2
    ## 2521                                                                                                            bromodomain containing 8
    ## 2522                                                                                                             centrosomal protein 135
    ## 2523                                                                                               GINS complex subunit 2 (Psf2 homolog)
    ## 2524                                                                                                         TELO2 interacting protein 2
    ## 2525                                                                                                        CDC23 cell division cycle 23
    ## 2526                                                                                                 mitochondrial ribosomal protein S21
    ## 2527                                                                                                                 thioredoxin-like 4B
    ## 2528                                                                                                       pre-mRNA processing factor 4B
    ## 2529                                                                                       La ribonucleoprotein domain family, member 4B
    ## 2530                                                                                                       CDC14 cell division cycle 14A
    ## 2531                                                                                        CDK5 regulatory subunit associated protein 1
    ## 2532                                                                                                          serine/threonine kinase 19
    ## 2533                                                                                             SMC5-SMC6 complex localization factor 2
    ## 2534                                                                                             SUB1 homolog, transcriptional regulator
    ## 2535                                                                                                             thimet oligopeptidase 1
    ## 2536                                                                                                        tubulin-specific chaperone d
    ## 2537                                                                                                    coiled-coil domain containing 97
    ## 2538                                                                                  transcription termination factor, RNA polymerase I
    ## 2539                                                                                                  zinc finger SWIM-type containing 3
    ## 2540                                                                                                           myeloid leukemia factor 1
    ## 2541                                                                                    echinoderm microtubule associated protein like 3
    ## 2542                                                                                    microtubule associated serine/threonine kinase 2
    ## 2543                                                                                                        ISY1 splicing factor homolog
    ## 2544                                                                                                      tRNA-yW synthesizing protein 5
    ## 2545                                                                                             structural maintenance of chromosomes 5
    ## 2546                                                                                                                       exonuclease 5
    ## 2547                                                                                                             HtrA serine peptidase 2
    ## 2548                                                                                proteasome (prosome, macropain) subunit, beta type 5
    ## 2549                                                                                            NME/NM23 nucleoside diphosphate kinase 1
    ## 2550                                                                                                      DENN/MADD domain containing 4A
    ## 2551                                                                                                                midasin AAA ATPase 1
    ## 2552                                                                                                             zinc finger protein 646
    ## 2553                                                                                                 mitochondrial ribosomal protein L55
    ## 2554                                                                                                               XPA binding protein 2
    ## 2555                                                                                                    coiled-coil domain containing 62
    ## 2556                                                                                                            ArfGAP with FG repeats 1
    ## 2557                                                                                                              EH-domain containing 4
    ## 2558                                                                                                          RIKEN cDNA 1110059G10 gene
    ## 2559                                                                                                                    tubulin, gamma 1
    ## 2560                                                                                                                       transketolase
    ## 2561                                                                                                         vacuolar protein sorting 25
    ## 2562                                                                                                             YY1 associated factor 2
    ## 2563                                                 CTD (carboxy-terminal domain, RNA polymerase II, polypeptide A) small phosphatase 1
    ## 2564                                                                    M-phase phosphoprotein 10 (U3 small nucleolar ribonucleoprotein)
    ## 2565                                                                                                    UHRF1 (ICBP90) binding protein 1
    ## 2566                                                                          protein phosphatase 1A, magnesium dependent, alpha isoform
    ## 2567                                                                                                       PHD and ring finger domains 1
    ## 2568                                                                                                  DDB1 and CUL4 associated factor 13
    ## 2569                                                                                                           transmembrane protein 201
    ## 2570                                                                                                        RNA binding motif protein 14
    ## 2571                                                                            ubiquitin-like, containing PHD and RING finger domains 2
    ## 2572                                                                       phosphatidylinositol glycan anchor biosynthesis, class Y-like
    ## 2573                                                                                             transmembrane p24 trafficking protein 5
    ## 2574                                                                                                                          importin 4
    ## 2575                                                                  LSM4 homolog, U6 small nuclear RNA and mRNA degradation associated
    ## 2576                                                                                                            NKAP domain containing 1
    ## 2577                                                                                                            COMM domain containing 5
    ## 2578                                                                                                     retroelement silencing factor 1
    ## 2579                                                                                                          proteasome subunit alpha 4
    ## 2580                                                                              THAP domain containing, apoptosis associated protein 3
    ## 2581                                                                                                   coiled-coil domain containing 190
    ## 2582                                                                                                         DEAF1, transcription factor
    ## 2583                                                                                    polymerase (RNA) II (DNA directed) polypeptide M
    ## 2584                                                                                                              PR domain containing 5
    ## 2585                                                                                                            COMM domain containing 4
    ## 2586                                                                                                   RAB2A, member RAS oncogene family
    ## 2587                                                                                                            DNA primase, p58 subunit
    ## 2588                                                                                                         phosphoglucomutase 2-like 1
    ## 2589                                                                                                     cytokine receptor-like factor 3
    ## 2590                                                                                                 SR-related CTD-associated factor 11
    ## 2591                                                                                                    VPS29 retromer complex component
    ## 2592                                                                                                 mitochondrial ribosomal protein S16
    ## 2593                                                                                                                SMAD family member 2
    ## 2594                                                                                  Fanconi anemia core complex associated protein 100
    ## 2595                                                                                         CWF19-like 1, cell cycle control (S. pombe)
    ## 2596                                                                                ADP-ribosylation factor-like 6 interacting protein 6
    ## 2597                                                                                        suppressor of var1, 3-like 1 (S. cerevisiae)
    ## 2598                                                                                            nitrogen fixation gene 1 (S. cerevisiae)
    ## 2599                                                                                               GC-rich sequence DNA binding factor 2
    ## 2600                                                                                                                         reticulon 4
    ## 2601                                                                      eukaryotic translation initiation factor 2B, subunit 5 epsilon
    ## 2602                                                                                                        RAS protein activator like 2
    ## 2603                                                                                                          mediator complex subunit 6
    ## 2604                                                                                      Leo1, Paf1/RNA polymerase II complex component
    ## 2605                                                                                                                                <NA>
    ## 2606                                                            splicing regulatory glutamine/lysine-rich protein 1interacting protein 1
    ## 2607                                                                                                     calcium binding protein 39-like
    ## 2608                                                                                                  solute carrier family 45, member 1
    ## 2609                                                                                                 ELK1, member of ETS oncogene family
    ## 2610                                                                                     ubiquinol-cytochrome c reductase core protein 1
    ## 2611                                                                                                      signal recognition particle 14
    ## 2612                                                                                                             unc-5 netrin receptor D
    ## 2613                                                                                                             zinc finger protein 369
    ## 2614                                                                                                             zinc finger protein 110
    ## 2615                                                                                                   alkylglycerone phosphate synthase
    ## 2616                                                                                                        RNA binding motif protein 26
    ## 2617                                                                                                                                <NA>
    ## 2618                                                                                                                     nucleoporin 155
    ## 2619                                                                                              nuclear receptor interacting protein 1
    ## 2620                                                                                             transmembrane p24 trafficking protein 1
    ## 2621                                                                                                            transmembrane protein 60
    ## 2622                                                                   neural precursor cell expressed, developmentally down-regulated 4
    ## 2623                                                                                              transcription factor B2, mitochondrial
    ## 2624                                                                                    mitogen-activated protein kinase kinase kinase 1
    ## 2625                                       1-acylglycerol-3-phosphate O-acyltransferase 1 (lysophosphatidic acid acyltransferase, alpha)
    ## 2626                                                                                                              dCTP pyrophosphatase 1
    ## 2627                                                                protein phosphatase 2 (formerly 2A), catalytic subunit, beta isoform
    ## 2628                                                                                                       ADP-ribosylarginine hydrolase
    ## 2629                                                                                   major facilitator superfamily domain containing 5
    ## 2630                                                                                          CCR4-NOT transcription complex, subunit 10
    ## 2631                                                                          ubiquinol-cytochrome c reductase complex assembly factor 1
    ## 2632                                                                                                                SMAD family member 5
    ## 2633                                                                                        eukaryotic translation initiation factor 4A2
    ## 2634                                                                                   adaptor-related protein complex 5, beta 1 subunit
    ## 2635                                                                                                   Rho GTPase activating protein 11A
    ## 2636                                                                                              phosphorylase kinase, gamma 2 (testis)
    ## 2637                                                                                                             zinc finger protein 384
    ## 2638                                                                                                                DExD box helicase 50
    ## 2639                                                                                    RNA pseudouridylate synthase domain containing 2
    ## 2640                                                                                                                       THO complex 7
    ## 2641                                                                            RNA binding motif, single stranded interacting protein 1
    ## 2642                                                                                                     pseudouridylate synthase 7-like
    ## 2643                                                                                      glutamyl-tRNA(Gln) amidotransferase, subunit C
    ## 2644                                                              recombination signal binding protein for immunoglobulin kappa J region
    ## 2645                                                                                                      pre-mRNA processing factor 40A
    ## 2646                                                                                                                           elongin A
    ## 2647                                                                                         tubulin, gamma complex associated protein 2
    ## 2648                                                                                                      G protein-coupled receptor 161
    ## 2649                                                                                                                heat shock protein 4
    ## 2650                                                                                                           ribonuclease P 40 subunit
    ## 2651                                                                                   cleavage and polyadenylation specificity factor 3
    ## 2652                                                                                                                    F-box protein 33
    ## 2653                                                       cysteine and histidine-rich domain (CHORD)-containing, zinc-binding protein 1
    ## 2654                                                                                                              GATA binding protein 2
    ## 2655                                                                                     nuclear receptor subfamily 3, group C, member 1
    ## 2656                                                                                                                     sorting nexin 9
    ## 2657                                                                                                                   GPN-loop GTPase 3
    ## 2658                                                                                                                 WD repeat domain 36
    ## 2659                                                                                                                           metaxin 2
    ## 2660                                                                        SEC13 homolog, nuclear pore and COPII coat complex component
    ## 2661                                                                                                         TRAF3 interacting protein 2
    ## 2662                                                                                                   abhydrolase domain containing 17B
    ## 2663                                                                                               zinc finger, DHHC domain containing 6
    ## 2664                                                                                                           kelch domain containing 3
    ## 2665                                                                                         NAD(P) dependent steroid dehydrogenase-like
    ## 2666                                                                                                               serum response factor
    ## 2667                                                                                                                   exoribonuclease 2
    ## 2668                                                                                                                    heme oxygenase 1
    ## 2669                                                                                           ubiquitin-conjugating enzyme E2 variant 2
    ## 2670                                                                                                            insulin degrading enzyme
    ## 2671                                                                        serine (or cysteine) peptidase inhibitor, clade B, member 6b
    ## 2672                                                                                                            THAP domain containing 7
    ## 2673                                                                                                  mitochondrial ribosomal protein L3
    ## 2674                                                                                                                      surfeit gene 1
    ## 2675                                                                                                 mitochondrial ribosomal protein L39
    ## 2676                                                                                 negative elongation factor complex member C/D, Th1l
    ## 2677                                                                                       polymerase (RNA) mitochondrial (DNA directed)
    ## 2678                                                                                       SRA stem-loop interacting RNA binding protein
    ## 2679                                                                                    polymerase (RNA) II (DNA directed) polypeptide C
    ## 2680                                                                                          hyaluronan and proteoglycan link protein 4
    ## 2681                                                                                glutamatic-oxaloacetic transaminase 2, mitochondrial
    ## 2682                                                                        Mdm2, transformed 3T3 cell double minute p53 binding protein
    ## 2683                                                                                                               elaC ribonuclease Z 2
    ## 2684                                                                                                                  NAD(P)HX epimerase
    ## 2685                                                                                                  centriolar coiled coil protein 110
    ## 2686                                                                         proteasome (prosome, macropain) 26S subunit, non-ATPase, 12
    ## 2687                                                                                                            sphingomyelin synthase 2
    ## 2688                                                                                                            ankyrin repeat domain 40
    ## 2689                                                                                                   coiled-coil domain containing 117
    ## 2690                                                                                        zinc finger, RAN-binding domain containing 2
    ## 2691                                                                                           inositol polyphosphate phosphatase-like 1
    ## 2692                                                                                                          TSR3 20S rRNA accumulation
    ## 2693                                                                                  CKLF-like MARVEL transmembrane domain containing 7
    ## 2694                                                                                                 5'-nucleotidase domain containing 3
    ## 2695                                                                                                 5'-nucleotidase domain containing 3
    ## 2696                                                                            phosphatidylinositol glycan anchor biosynthesis, class F
    ## 2697                                                                                     translocase of outer mitochondrial membrane 70A
    ## 2698                                                                                             glucan (1,4-alpha-), branching enzyme 1
    ## 2699                                                                                                            aspartyl-tRNA synthetase
    ## 2700                                                                                                  solute carrier family 5, member 4a
    ## 2701                                                                                      phosphate cytidylyltransferase 2, ethanolamine
    ## 2702                                                                                                                           nocturnin
    ## 2703                                                                                                             zinc finger protein 687
    ## 2704                                                                                                                MIER family member 2
    ## 2705                                                                             ATP synthase mitochondrial F1 complex assembly factor 2
    ## 2706                                                                                          gem nuclear organelle associated protein 5
    ## 2707                                                                                                        integrator complex subunit 2
    ## 2708                                                                                            UTP11 small subunit processome component
    ## 2709                                                                                                        leucine-rich repeat kinase 1
    ## 2710                                                                                                    coiled-coil domain containing 22
    ## 2711                                                                                                            casein kinase 1, epsilon
    ## 2712                                                                                                    SET and MYND domain containing 5
    ## 2713                                                                                                              cell division cycle 27
    ## 2714                                                                                                 mitochondrial ribosomal protein S23
    ## 2715                                                                                                     upstream transcription factor 2
    ## 2716                                                                                                 Fas death domain-associated protein
    ## 2717                                                                                                 mitochondrial ribosomal protein L19
    ## 2718                                                                        succinate dehydrogenase complex, subunit B, iron sulfur (Ip)
    ## 2719                                                                                                           transmembrane protein 259
    ## 2720                                                                                          NPL4 homolog, ubiquitin recognition factor
    ## 2721                                                                                                NOL1/NOP2/Sun domain family member 2
    ## 2722                                                                                        PWWP domain containing 3A, DNA repair factor
    ## 2723                                                                                                     ubiquitin specific peptidase 19
    ## 2724                                                                                    mitogen-activated protein kinase kinase kinase 3
    ## 2725                                                                                                                nucleolar protein 11
    ## 2726                                                                             single-pass membrane protein with coiled-coil domains 4
    ## 2727                                                                                                                           caspase 7
    ## 2728                                                                                                   upregulator of cell proliferation
    ## 2729                                                                                                             mitochondrial carrier 2
    ## 2730                                                                           ArfGAP with GTPase domain, ankyrin repeat and PH domain 1
    ## 2731                                                                                                       topoisomerase (DNA) III alpha
    ## 2732                                                                                                             ring finger protein 121
    ## 2733                                                                                                         intraflagellar transport 20
    ## 2734                                                                               pyridoxal-dependent decarboxylase domain containing 1
    ## 2735                                                                                                 tousled-like kinase 2 (Arabidopsis)
    ## 2736                                                                                                       integrator complex subunit 13
    ## 2737                                                                                                                   exoribonuclease 1
    ## 2738                                                                                                G elongation factor, mitochondrial 1
    ## 2739                                                                                                                  golgi transport 1B
    ## 2740                                                                                                     tyrosyl-DNA phosphodiesterase 2
    ## 2741                                                                                                                 DEAD box helicase 5
    ## 2742                                                                                                  ring finger and WD repeat domain 3
    ## 2743                                                   solute carrier family 25 (mitochondrial carrier ornithine transporter), member 15
    ## 2744                                                                                                          VPS52 GARP complex subunit
    ## 2745                                         tyrosine 3-monooxygenase/tryptophan 5-monooxygenase activation protein, epsilon polypeptide
    ## 2746                                                                                                              zinc finger protein 26
    ## 2747                                                                                                   RAD9 checkpoint clamp component A
    ## 2748                                                                                      acyl-Coenzyme A dehydrogenase family, member 9
    ## 2749                                                                                                          ergosterol biosynthesis 28
    ## 2750                                                                                    DnaJ heat shock protein family (Hsp40) member B2
    ## 2751                                                                                           peptidase (mitochondrial processing) beta
    ## 2752                                                                    asparagine-linked glycosylation 1 (beta-1,4-mannosyltransferase)
    ## 2753                                                                                                   keratinocyte associated protein 2
    ## 2754                                                                                  PEST proteolytic signal containing nuclear protein
    ## 2755                                                                                             adenylosuccinate synthetase, non muscle
    ## 2756                                                                                                  arginine/serine-rich coiled-coil 2
    ## 2757                                                                           NIMA (never in mitosis gene a)-related expressed kinase 9
    ## 2758                                                                                                         dedicator of cytokinesis 11
    ## 2759                                                                                                            HEAT repeat containing 3
    ## 2760                                                                            nrde-2 necessary for RNA interference, domain containing
    ## 2761                                                                                 small nuclear RNA activating complex, polypeptide 3
    ## 2762                                                                                                                    sorting nexin 19
    ## 2763                                                                                           AT rich interactive domain 5B (MRF1-like)
    ## 2764                                                                                                        RNA binding motif protein 42
    ## 2765                                                                                                        MOB family member 4, phocein
    ## 2766                                                                                      NADH:ubiquinone oxidoreductase core subunit V1
    ## 2767                                                                                                                                <NA>
    ## 2768                                                                                           mitogen-activated protein kinase kinase 7
    ## 2769                                                                                                             LIM domain containing 2
    ## 2770                                                                                                  trinucleotide repeat containing 18
    ## 2771                                                                                                                            cyclin C
    ## 2772                                                                                                                 Coenzyme A synthase
    ## 2773                                                                 amyloid beta precursor protein (cytoplasmic tail) binding protein 2
    ## 2774                                                                                         eukaryotic translation initiation factor 4B
    ## 2775                                                                                     growth arrest and DNA-damage-inducible 45 alpha
    ## 2776                                                                   solute carrier family 6 (neurotransmitter transporter), member 15
    ## 2777                                                                                                        ancient ubiquitous protein 1
    ## 2778                                                                                                    nuclear protein in the AT region
    ## 2779                                                                                                    RUN and FYVE domain containing 1
    ## 2780                                                                     smg-9 homolog, nonsense mediated mRNA decay factor (C. elegans)
    ## 2781                                                                                                   Casitas B-lineage lymphoma-like 1
    ## 2782                                                                                                             ring finger protein 146
    ## 2783                                                                                             coiled-coil and C2 domain containing 2A
    ## 2784                                                                                                             MOB kinase activator 1A
    ## 2785                                                                       solute carrier family 9 (sodium/hydrogen exchanger), member 9
    ## 2786                                                                                                         RNA binding motif protein 6
    ## 2787                                                                                                      phosphogluconate dehydrogenase
    ## 2788                                                                                           zinc finger and SCAN domain containing 26
    ## 2789                                                                                                           transmembrane protein 109
    ## 2790                                                                                                    coiled-coil domain containing 51
    ## 2791                                                                                                          RIKEN cDNA 9130401M01 gene
    ## 2792                                                                                                                                <NA>
    ## 2793                                                                                                              alanyl-tRNA synthetase
    ## 2794                                                                                                              cDNA sequence BC003965
    ## 2795                                                                                      isoamyl acetate-hydrolyzing esterase 1 homolog
    ## 2796                                                                                                          cyclin G associated kinase
    ## 2797                                                                                                    motile sperm domain containing 3
    ## 2798                                                                                                                        parvin, beta
    ## 2799                                                                                         protein phosphatase 4, regulatory subunit 2
    ## 2800                                                                                                            PDZ domain containing 11
    ## 2801                                                                                                                        snurportin 1
    ## 2802                                                                             coiled-coil-helix-coiled-coil-helix domain containing 5
    ## 2803                                                                                                              B cell CLL/lymphoma 7B
    ## 2804                                                                                                mitotic spindle organizing protein 1
    ## 2805                                                                               polymerase (DNA directed), gamma 2, accessory subunit
    ## 2806                                                                                                      G protein pathway suppressor 1
    ## 2807                                                                                                             lactate dehydrogenase A
    ## 2808                                                                                                               ribosomal protein S24
    ## 2809                                                                                        conserved helix-loop-helix ubiquitous kinase
    ## 2810                                                                                                           Hbs1-like (S. cerevisiae)
    ## 2811                                                                           ubiquitin-like, containing PHD and RING finger domains, 1
    ## 2812                                                                                              SPT7-like, STAGA complex gamma subunit
    ## 2813                                                                                                                     nucleoporin 160
    ## 2814                                                                                                   down-regulator of transcription 1
    ## 2815                                                                                                                           Luc7-like
    ## 2816                                                                                                  polymerase (DNA directed), alpha 2
    ## 2817                                                                                 CLP1, cleavage and polyadenylation factor I subunit
    ## 2818                                                                                                                phosphoglucomutase 2
    ## 2819                                                                                              cytoplasmic FMR1 interacting protein 1
    ## 2820                                                                                              zinc finger, CCHC domain containing 10
    ## 2821                                                                                     Trp53 induced glycolysis regulatory phosphatase
    ## 2822                                                                                                           STN1, CST complex subunit
    ## 2823                                                                                                                   Obg-like ATPase 1
    ## 2824                                                                                                               PHD finger protein 23
    ## 2825                                                                                                        ARP8 actin-related protein 8
    ##       ENTREZID
    ## 1        14729
    ## 2       436008
    ## 3        77125
    ## 4        20310
    ## 5       330122
    ## 6        15364
    ## 7        68810
    ## 8       723926
    ## 9        12993
    ## 10       14313
    ## 11      319211
    ## 12       17865
    ## 13       75736
    ## 14   115489609
    ## 15       52276
    ## 16       18606
    ## 17       12615
    ## 18       12029
    ## 19       20558
    ## 20       20557
    ## 21      381546
    ## 22       74016
    ## 23       67037
    ## 24       20135
    ## 25       56792
    ## 26       71263
    ## 27       77963
    ## 28       67917
    ## 29      234396
    ## 30   100216539
    ## 31       17218
    ## 32      230484
    ## 33       12448
    ## 34       18817
    ## 35       11782
    ## 36       74568
    ## 37       20897
    ## 38       23834
    ## 39       20764
    ## 40       14453
    ## 41      219114
    ## 42       66311
    ## 43       67849
    ## 44       53972
    ## 45       66977
    ## 46       12447
    ## 47       29870
    ## 48       74068
    ## 49       66665
    ## 50      237523
    ## 51       14221
    ## 52      226182
    ## 53       50927
    ## 54       17300
    ## 55       19652
    ## 56       12532
    ## 57       67196
    ## 58       17183
    ## 59      110033
    ## 60       20877
    ## 61      621893
    ## 62      209737
    ## 63       60411
    ## 64       97165
    ## 65       67200
    ## 66       20937
    ## 67        <NA>
    ## 68       15436
    ## 69       12428
    ## 70      319189
    ## 71      271305
    ## 72       19655
    ## 73       20393
    ## 74      236930
    ## 75       68278
    ## 76       68026
    ## 77      268697
    ## 78       69137
    ## 79      404710
    ## 80       21917
    ## 81      269582
    ## 82       20133
    ## 83      216848
    ## 84       70218
    ## 85      110052
    ## 86       20346
    ## 87      108907
    ## 88       73804
    ## 89       12442
    ## 90      667692
    ## 91      627488
    ## 92   100043227
    ## 93       70988
    ## 94   100861880
    ## 95   100043239
    ## 96      435615
    ## 97   100043292
    ## 98       21681
    ## 99      637578
    ## 100      56009
    ## 101  100861891
    ## 102  100043231
    ## 103  100043235
    ## 104  100043224
    ## 105  100043247
    ## 106  100861901
    ## 107      15289
    ## 108      19183
    ## 109  117934532
    ## 110     224171
    ## 111      76044
    ## 112      26909
    ## 113      73139
    ## 114      14211
    ## 115     233876
    ## 116      69270
    ## 117      77011
    ## 118      17215
    ## 119      69885
    ## 120      75570
    ## 121      13605
    ## 122      51944
    ## 123      15384
    ## 124      16765
    ## 125      68298
    ## 126     239114
    ## 127      70454
    ## 128      15191
    ## 129      16180
    ## 130      14793
    ## 131      74551
    ## 132      19366
    ## 133      66578
    ## 134      67678
    ## 135      66471
    ## 136      12236
    ## 137      18005
    ## 138      70047
    ## 139      20419
    ## 140      69716
    ## 141      52679
    ## 142     218581
    ## 143      18933
    ## 144      27279
    ## 145      18392
    ## 146      16881
    ## 147      67141
    ## 148      78733
    ## 149     233406
    ## 150      72080
    ## 151     209334
    ## 152      75317
    ## 153      19891
    ## 154      68612
    ## 155     106565
    ## 156      68024
    ## 157      70235
    ## 158      12419
    ## 159      67628
    ## 160     240641
    ## 161      22326
    ## 162      76464
    ## 163  100043906
    ## 164      16647
    ## 165      69263
    ## 166      76131
    ## 167     237877
    ## 168      72391
    ## 169      26934
    ## 170      70024
    ## 171      18813
    ## 172      94254
    ## 173     434794
    ## 174      72891
    ## 175      27083
    ## 176      66442
    ## 177      12530
    ## 178     208628
    ## 179     107995
    ## 180      54392
    ## 181      12865
    ## 182      15983
    ## 183      19184
    ## 184      22256
    ## 185       <NA>
    ## 186      79456
    ## 187      69706
    ## 188      56527
    ## 189     268930
    ## 190      71878
    ## 191      21973
    ## 192      52033
    ## 193      70099
    ## 194      72151
    ## 195      54124
    ## 196     624855
    ## 197      12534
    ## 198      66953
    ## 199      71643
    ## 200      72017
    ## 201      15427
    ## 202      53319
    ## 203      23956
    ## 204     107435
    ## 205      22643
    ## 206     106344
    ## 207     217216
    ## 208      21907
    ## 209      13644
    ## 210      22171
    ## 211      66570
    ## 212     232237
    ## 213      15461
    ## 214      14235
    ## 215      68014
    ## 216      17220
    ## 217      72155
    ## 218     269400
    ## 219     269033
    ## 220      53607
    ## 221      19376
    ## 222     211651
    ## 223      78767
    ## 224     217653
    ## 225      22137
    ## 226      21399
    ## 227      76927
    ## 228     353242
    ## 229      99439
    ## 230     260409
    ## 231     112403
    ## 232      66276
    ## 233       <NA>
    ## 234      18973
    ## 235      56075
    ## 236     218977
    ## 237      15937
    ## 238     108912
    ## 239      15936
    ## 240      67392
    ## 241     171170
    ## 242      19362
    ## 243     104184
    ## 244      67603
    ## 245      12261
    ## 246     269378
    ## 247      11615
    ## 248      56086
    ## 249      19724
    ## 250      73068
    ## 251      14630
    ## 252     213236
    ## 253      98238
    ## 254      56150
    ## 255      52504
    ## 256      72668
    ## 257  110599566
    ## 258      27756
    ## 259     227715
    ## 260      54141
    ## 261     215387
    ## 262      67177
    ## 263      56742
    ## 264      12055
    ## 265      22036
    ## 266      66468
    ## 267      18150
    ## 268     105988
    ## 269      60441
    ## 270      18538
    ## 271      71963
    ## 272      71804
    ## 273      12449
    ## 274      20514
    ## 275      30939
    ## 276     231642
    ## 277  100113364
    ## 278      83383
    ## 279      60507
    ## 280     108121
    ## 281      64707
    ## 282      15201
    ## 283      66461
    ## 284     319176
    ## 285      17089
    ## 286      56321
    ## 287     381293
    ## 288     235559
    ## 289      12021
    ## 290      67053
    ## 291      69639
    ## 292     110749
    ## 293     236539
    ## 294      14156
    ## 295      26921
    ## 296      13730
    ## 297      12544
    ## 298      19361
    ## 299     106248
    ## 300      77609
    ## 301     228421
    ## 302     108052
    ## 303      67693
    ## 304      15108
    ## 305      69860
    ## 306      17217
    ## 307      66282
    ## 308      27401
    ## 309     238673
    ## 310      54364
    ## 311      22791
    ## 312      70466
    ## 313      55990
    ## 314      14087
    ## 315      20873
    ## 316      78294
    ## 317     102920
    ## 318      66101
    ## 319      23918
    ## 320     107503
    ## 321     171210
    ## 322      26897
    ## 323      27214
    ## 324      72119
    ## 325      19179
    ## 326     106052
    ## 327     331623
    ## 328      13681
    ## 329     445007
    ## 330      11740
    ## 331      13390
    ## 332      12705
    ## 333      73254
    ## 334      66934
    ## 335      66197
    ## 336      54632
    ## 337      27053
    ## 338     237911
    ## 339      67872
    ## 340     433256
    ## 341     107272
    ## 342      68743
    ## 343      20425
    ## 344      17912
    ## 345      66488
    ## 346      18971
    ## 347      66403
    ## 348       <NA>
    ## 349      67332
    ## 350     233902
    ## 351     245474
    ## 352     432467
    ## 353     233877
    ## 354     216853
    ## 355     108037
    ## 356      67134
    ## 357     327762
    ## 358     109145
    ## 359      14208
    ## 360     621054
    ## 361      72556
    ## 362      17149
    ## 363      14873
    ## 364      69736
    ## 365     208836
    ## 366     229512
    ## 367     243376
    ## 368      12803
    ## 369     319158
    ## 370     326619
    ## 371      21335
    ## 372      17219
    ## 373      67941
    ## 374      20878
    ## 375      68073
    ## 376      73420
    ## 377      30059
    ## 378     224630
    ## 379     433466
    ## 380      19385
    ## 381      17872
    ## 382      66131
    ## 383      80986
    ## 384      66155
    ## 385      66525
    ## 386      71207
    ## 387      12034
    ## 388      20429
    ## 389      53608
    ## 390      15366
    ## 391      17121
    ## 392      16571
    ## 393      75623
    ## 394      78134
    ## 395      66373
    ## 396      68479
    ## 397      70248
    ## 398      58184
    ## 399     108911
    ## 400     217057
    ## 401      69928
    ## 402      72778
    ## 403     232023
    ## 404      66585
    ## 405      70385
    ## 406      67054
    ## 407      83701
    ## 408      67052
    ## 409     223970
    ## 410      52829
    ## 411      98415
    ## 412      74610
    ## 413      72440
    ## 414      69499
    ## 415      12531
    ## 416      19139
    ## 417     328099
    ## 418      83703
    ## 419     105148
    ## 420      70351
    ## 421      73680
    ## 422      13653
    ## 423      18612
    ## 424      19182
    ## 425      22367
    ## 426      20595
    ## 427      71835
    ## 428     319150
    ## 429     107823
    ## 430      15161
    ## 431     237823
    ## 432      68981
    ## 433      68079
    ## 434     104806
    ## 435      52443
    ## 436     380959
    ## 437      12012
    ## 438     319675
    ## 439     212377
    ## 440      14664
    ## 441      14854
    ## 442      53418
    ## 443     225995
    ## 444      66387
    ## 445       <NA>
    ## 446      69077
    ## 447      66164
    ## 448      72568
    ## 449      20641
    ## 450      68205
    ## 451     319186
    ## 452     240672
    ## 453      21429
    ## 454      66419
    ## 455      18432
    ## 456      77626
    ## 457      67153
    ## 458      27993
    ## 459      19384
    ## 460      22321
    ## 461      71709
    ## 462     224481
    ## 463      13685
    ## 464      74030
    ## 465      72787
    ## 466     319701
    ## 467      59013
    ## 468      66196
    ## 469     382207
    ## 470      19387
    ## 471      21849
    ## 472      16211
    ## 473     382010
    ## 474      56292
    ## 475     382406
    ## 476     107373
    ## 477      15574
    ## 478      66235
    ## 479      69453
    ## 480      59001
    ## 481      16179
    ## 482      26385
    ## 483      67967
    ## 484      56095
    ## 485     107829
    ## 486      16475
    ## 487      66962
    ## 488     381045
    ## 489      21379
    ## 490      16898
    ## 491      67371
    ## 492      53414
    ## 493      50708
    ## 494      66245
    ## 495      64658
    ## 496      76574
    ## 497      20823
    ## 498      70683
    ## 499      67187
    ## 500      71988
    ## 501      67832
    ## 502      16373
    ## 503      53975
    ## 504      70645
    ## 505      20174
    ## 506      52686
    ## 507      60530
    ## 508      67078
    ## 509      12649
    ## 510      12235
    ## 511     629499
    ## 512      67956
    ## 513      73192
    ## 514      72567
    ## 515     381306
    ## 516      56280
    ## 517      20383
    ## 518      16434
    ## 519      12316
    ## 520      75062
    ## 521       <NA>
    ## 522      94223
    ## 523     268465
    ## 524     218506
    ## 525     239790
    ## 526      18793
    ## 527     319168
    ## 528      11819
    ## 529      67789
    ## 530      72776
    ## 531     233802
    ## 532     353172
    ## 533      55949
    ## 534      26886
    ## 535      67203
    ## 536     108159
    ## 537      17427
    ## 538      14791
    ## 539     635253
    ## 540      52683
    ## 541      68505
    ## 542      67500
    ## 543      23996
    ## 544      17279
    ## 545     209003
    ## 546      21877
    ## 547      66592
    ## 548      19075
    ## 549      70333
    ## 550      27361
    ## 551      20620
    ## 552      68043
    ## 553     207704
    ## 554      71780
    ## 555      11464
    ## 556      56505
    ## 557      22142
    ## 558     228368
    ## 559     333789
    ## 560      74142
    ## 561      12703
    ## 562      17864
    ## 563      69893
    ## 564      68219
    ## 565      98053
    ## 566      30056
    ## 567      76843
    ## 568      66230
    ## 569      26965
    ## 570      20643
    ## 571     245860
    ## 572      68291
    ## 573      68083
    ## 574      67949
    ## 575     217737
    ## 576     216156
    ## 577      66603
    ## 578      20501
    ## 579      20539
    ## 580     237211
    ## 581      21453
    ## 582      83435
    ## 583     214572
    ## 584      18974
    ## 585       <NA>
    ## 586     106795
    ## 587      69482
    ## 588      66165
    ## 589      70572
    ## 590      53333
    ## 591      71085
    ## 592      18221
    ## 593      75619
    ## 594      17827
    ## 595      18824
    ## 596     620648
    ## 597     231874
    ## 598      16322
    ## 599      74254
    ## 600     212427
    ## 601      21815
    ## 602      15526
    ## 603     241627
    ## 604      14718
    ## 605      59014
    ## 606      68145
    ## 607      27966
    ## 608      75939
    ## 609      67105
    ## 610      66729
    ## 611      52009
    ## 612      51810
    ## 613      67623
    ## 614      69902
    ## 615     103468
    ## 616  100039945
    ## 617      13445
    ## 618  100042150
    ## 619      66218
    ## 620     105670
    ## 621      81601
    ## 622      66108
    ## 623      66445
    ## 624      19935
    ## 625      80859
    ## 626      67574
    ## 627     320302
    ## 628      19348
    ## 629  100113398
    ## 630       <NA>
    ## 631      67039
    ## 632      26987
    ## 633      72057
    ## 634       <NA>
    ## 635     230654
    ## 636      70769
    ## 637      78833
    ## 638     269614
    ## 639      70238
    ## 640      52696
    ## 641      12301
    ## 642      18176
    ## 643      66085
    ## 644     216792
    ## 645     110954
    ## 646      71707
    ## 647      68988
    ## 648      77744
    ## 649      68046
    ## 650      67308
    ## 651      60315
    ## 652      21408
    ## 653     108671
    ## 654     212880
    ## 655     225027
    ## 656     320394
    ## 657      76846
    ## 658     218613
    ## 659      12190
    ## 660      67619
    ## 661       <NA>
    ## 662     110816
    ## 663      73666
    ## 664      74430
    ## 665     208084
    ## 666      18700
    ## 667      20016
    ## 668      15510
    ## 669      14194
    ## 670      56452
    ## 671     192170
    ## 672     668137
    ## 673     434080
    ## 674      17168
    ## 675      56399
    ## 676     329384
    ## 677      66070
    ## 678      66559
    ## 679      12151
    ## 680      21749
    ## 681      66148
    ## 682      74041
    ## 683     234683
    ## 684      15469
    ## 685     109079
    ## 686      20833
    ## 687     668096
    ## 688     545432
    ## 689     668113
    ## 690     668115
    ## 691     668100
    ## 692     668119
    ## 693     668107
    ## 694      80744
    ## 695      50529
    ## 696     102115
    ## 697      15547
    ## 698      66314
    ## 699      27221
    ## 700      20931
    ## 701      76901
    ## 702      19177
    ## 703      72692
    ## 704      20460
    ## 705      12952
    ## 706     243905
    ## 707      28010
    ## 708      14841
    ## 709      56330
    ## 710      71876
    ## 711      68328
    ## 712     665563
    ## 713      20630
    ## 714      67836
    ## 715      22375
    ## 716      16418
    ## 717     217333
    ## 718      97122
    ## 719      20744
    ## 720      14852
    ## 721      64685
    ## 722      71870
    ## 723      69719
    ## 724      17688
    ## 725      71701
    ## 726     245578
    ## 727      74484
    ## 728      18294
    ## 729      18034
    ## 730      57317
    ## 731      66206
    ## 732     237336
    ## 733      12466
    ## 734      66409
    ## 735      66497
    ## 736     329659
    ## 737      22247
    ## 738     319997
    ## 739      76367
    ## 740     381406
    ## 741      68845
    ## 742     231803
    ## 743     212326
    ## 744     109242
    ## 745      69804
    ## 746      18201
    ## 747      76547
    ## 748     104444
    ## 749      20603
    ## 750  102443350
    ## 751      66262
    ## 752  100503583
    ## 753     240087
    ## 754     102060
    ## 755      14300
    ## 756      68241
    ## 757     218699
    ## 758      67877
    ## 759      26425
    ## 760     117198
    ## 761      74253
    ## 762      68152
    ## 763      67239
    ## 764      68272
    ## 765     321022
    ## 766      14056
    ## 767      59069
    ## 768     270906
    ## 769      93841
    ## 770      50933
    ## 771      72170
    ## 772     230596
    ## 773      14187
    ## 774      69882
    ## 775      18673
    ## 776     226153
    ## 777      68036
    ## 778      19720
    ## 779      66083
    ## 780      77782
    ## 781      69156
    ## 782      77116
    ## 783     229841
    ## 784     170759
    ## 785      19044
    ## 786      56424
    ## 787      18789
    ## 788     327900
    ## 789     210529
    ## 790      67164
    ## 791      68533
    ## 792      56215
    ## 793      72322
    ## 794      75617
    ## 795      70717
    ## 796     217708
    ## 797      18045
    ## 798      14265
    ## 799      20638
    ## 800      97387
    ## 801     108900
    ## 802      56361
    ## 803      70472
    ## 804     217869
    ## 805      27207
    ## 806      56068
    ## 807     208266
    ## 808      12462
    ## 809     107071
    ## 810      20271
    ## 811     268936
    ## 812     246177
    ## 813      54380
    ## 814      69684
    ## 815       <NA>
    ## 816     227695
    ## 817     101831
    ## 818     100608
    ## 819      94232
    ## 820      11792
    ## 821     108156
    ## 822     110094
    ## 823     217995
    ## 824      20102
    ## 825      73327
    ## 826     234825
    ## 827      67534
    ## 828     241593
    ## 829      23988
    ## 830      55989
    ## 831      67038
    ## 832      56310
    ## 833      54219
    ## 834     100102
    ## 835     386612
    ## 836      11418
    ## 837     380614
    ## 838     101612
    ## 839      13667
    ## 840      72425
    ## 841      26356
    ## 842      66079
    ## 843      22196
    ## 844      14534
    ## 845      66923
    ## 846      20826
    ## 847      15499
    ## 848      66362
    ## 849      72357
    ## 850     233826
    ## 851     229487
    ## 852      68968
    ## 853      56031
    ## 854       <NA>
    ## 855      60365
    ## 856     110109
    ## 857      66407
    ## 858      17768
    ## 859      66336
    ## 860      21781
    ## 861     208624
    ## 862      30946
    ## 863     108673
    ## 864      12518
    ## 865      19181
    ## 866      66414
    ## 867      26462
    ## 868      17535
    ## 869      66660
    ## 870      72749
    ## 871      18949
    ## 872      56371
    ## 873      67681
    ## 874      85305
    ## 875      18643
    ## 876      57741
    ## 877     244495
    ## 878      68549
    ## 879      69878
    ## 880      57441
    ## 881      14163
    ## 882     217109
    ## 883     381903
    ## 884      27407
    ## 885     105298
    ## 886     225870
    ## 887      68431
    ## 888     217893
    ## 889      68147
    ## 890      73166
    ## 891     243025
    ## 892      21885
    ## 893      18938
    ## 894      66755
    ## 895      13804
    ## 896     381801
    ## 897     330064
    ## 898      53895
    ## 899       <NA>
    ## 900       <NA>
    ## 901      13664
    ## 902  100039042
    ## 903  100039052
    ## 904     666806
    ## 905       <NA>
    ## 906     544881
    ## 907       <NA>
    ## 908       <NA>
    ## 909     627873
    ## 910       <NA>
    ## 911  100042776
    ## 912       <NA>
    ## 913       <NA>
    ## 914     435337
    ## 915  100861908
    ## 916      68263
    ## 917      52717
    ## 918      59029
    ## 919      16201
    ## 920     109050
    ## 921      50772
    ## 922      72181
    ## 923     108961
    ## 924     233912
    ## 925      14228
    ## 926      67118
    ## 927      56282
    ## 928      21754
    ## 929  100216538
    ## 930      20852
    ## 931     227720
    ## 932      11352
    ## 933      14084
    ## 934     219150
    ## 935      16319
    ## 936      53356
    ## 937     210766
    ## 938      54188
    ## 939      22224
    ## 940      21982
    ## 941     223696
    ## 942      56772
    ## 943      76522
    ## 944      12328
    ## 945      20462
    ## 946      79044
    ## 947      21915
    ## 948     433864
    ## 949      74386
    ## 950      66506
    ## 951      14923
    ## 952      68058
    ## 953      72016
    ## 954      64340
    ## 955      74996
    ## 956     241494
    ## 957      75089
    ## 958      83815
    ## 959     260315
    ## 960     433813
    ## 961      76936
    ## 962      18141
    ## 963      69663
    ## 964      68229
    ## 965      54351
    ## 966     116905
    ## 967      72415
    ## 968      66140
    ## 969     170439
    ## 970     237436
    ## 971      74200
    ## 972      78651
    ## 973      72103
    ## 974      72400
    ## 975     235469
    ## 976      50497
    ## 977     194268
    ## 978      57785
    ## 979      77035
    ## 980      69577
    ## 981      66223
    ## 982     101943
    ## 983      67011
    ## 984      67089
    ## 985      67219
    ## 986     101214
    ## 987      28126
    ## 988     237107
    ## 989      67197
    ## 990     381038
    ## 991      77891
    ## 992  100039535
    ## 993       <NA>
    ## 994      70396
    ## 995      26408
    ## 996      67755
    ## 997      67811
    ## 998      78244
    ## 999      17975
    ## 1000     67951
    ## 1001    104721
    ## 1002     15481
    ## 1003     80985
    ## 1004    276770
    ## 1005     12793
    ## 1006     74107
    ## 1007    218341
    ## 1008     67920
    ## 1009     97159
    ## 1010     55947
    ## 1011     75273
    ## 1012     14297
    ## 1013    270802
    ## 1014     73720
    ## 1015     69234
    ## 1016     24136
    ## 1017     68201
    ## 1018    231279
    ## 1019     16551
    ## 1020     19052
    ## 1021     12237
    ## 1022    230027
    ## 1023     12144
    ## 1024     72341
    ## 1025     67873
    ## 1026     16876
    ## 1027     22154
    ## 1028     68966
    ## 1029     20005
    ## 1030 100042823
    ## 1031     20639
    ## 1032     14430
    ## 1033     56354
    ## 1034    235184
    ## 1035     68001
    ## 1036    225745
    ## 1037    231769
    ## 1038     93762
    ## 1039    107999
    ## 1040    382066
    ## 1041     66866
    ## 1042     70078
    ## 1043     67493
    ## 1044     66138
    ## 1045    231659
    ## 1046     66349
    ## 1047     23989
    ## 1048     21974
    ## 1049     66614
    ## 1050    230809
    ## 1051      <NA>
    ## 1052    233073
    ## 1053     15387
    ## 1054     66757
    ## 1055     20420
    ## 1056    108062
    ## 1057     68572
    ## 1058     67842
    ## 1059     67148
    ## 1060 100038538
    ## 1061    211770
    ## 1062     77048
    ## 1063    114741
    ## 1064     28028
    ## 1065    227867
    ## 1066     71807
    ## 1067    227059
    ## 1068     69668
    ## 1069     15519
    ## 1070     66899
    ## 1071     19826
    ## 1072     67563
    ## 1073    381379
    ## 1074     11637
    ## 1075    106522
    ## 1076    229905
    ## 1077     27643
    ## 1078    213233
    ## 1079     19934
    ## 1080     72981
    ## 1081    107701
    ## 1082     72672
    ## 1083    216821
    ## 1084     75717
    ## 1085    225280
    ## 1086 100503572
    ## 1087    319169
    ## 1088     74026
    ## 1089     69527
    ## 1090     27050
    ## 1091     78935
    ## 1092     74104
    ## 1093    214444
    ## 1094     56369
    ## 1095     11564
    ## 1096    103135
    ## 1097     56790
    ## 1098     67728
    ## 1099    104394
    ## 1100     53605
    ## 1101    107817
    ## 1102     13732
    ## 1103     66590
    ## 1104     75516
    ## 1105     17192
    ## 1106     11546
    ## 1107    218210
    ## 1108    110355
    ## 1109     70223
    ## 1110     22390
    ## 1111     14113
    ## 1112     18968
    ## 1113     30941
    ## 1114     12339
    ## 1115    210582
    ## 1116     72243
    ## 1117     72201
    ## 1118     75458
    ## 1119     56088
    ## 1120     68066
    ## 1121     67223
    ## 1122     14283
    ## 1123     66549
    ## 1124    107045
    ## 1125     69072
    ## 1126    107686
    ## 1127     65964
    ## 1128     57913
    ## 1129     15528
    ## 1130    628438
    ## 1131     66912
    ## 1132    104458
    ## 1133     98376
    ## 1134     66628
    ## 1135     72465
    ## 1136     12468
    ## 1137     23874
    ## 1138    226844
    ## 1139     14884
    ## 1140     70823
    ## 1141     64050
    ## 1142     76130
    ## 1143     67389
    ## 1144    231868
    ## 1145     74098
    ## 1146     17463
    ## 1147    257633
    ## 1148     24061
    ## 1149     70160
    ## 1150     72662
    ## 1151     67116
    ## 1152    225182
    ## 1153     22339
    ## 1154     69163
    ## 1155     19038
    ## 1156    108888
    ## 1157     67160
    ## 1158     14790
    ## 1159    319601
    ## 1160     22327
    ## 1161     67199
    ## 1162     67210
    ## 1163     15254
    ## 1164     58245
    ## 1165    228839
    ## 1166    108147
    ## 1167     19158
    ## 1168     72614
    ## 1169    213753
    ## 1170     13204
    ## 1171     56055
    ## 1172     66965
    ## 1173    432508
    ## 1174     74196
    ## 1175     68927
    ## 1176     73945
    ## 1177     68499
    ## 1178     67891
    ## 1179     73736
    ## 1180    212670
    ## 1181     12005
    ## 1182    448850
    ## 1183     75731
    ## 1184     54342
    ## 1185     67273
    ## 1186    103266
    ## 1187     76892
    ## 1188    213054
    ## 1189     69090
    ## 1190    109299
    ## 1191     71911
    ## 1192     71819
    ## 1193     74737
    ## 1194     68117
    ## 1195    235682
    ## 1196     66511
    ## 1197     15950
    ## 1198    226691
    ## 1199    109910
    ## 1200    664779
    ## 1201    209584
    ## 1202    216987
    ## 1203    215351
    ## 1204     69912
    ## 1205    330817
    ## 1206     66583
    ## 1207    211586
    ## 1208     56749
    ## 1209     19684
    ## 1210     53323
    ## 1211     50496
    ## 1212     57432
    ## 1213    230082
    ## 1214     19383
    ## 1215    217011
    ## 1216     74414
    ## 1217     12545
    ## 1218    107260
    ## 1219     71957
    ## 1220    224694
    ## 1221    217356
    ## 1222     68614
    ## 1223    216874
    ## 1224     52633
    ## 1225     97541
    ## 1226     12812
    ## 1227     14694
    ## 1228    433693
    ## 1229     13555
    ## 1230     74194
    ## 1231     13178
    ## 1232     66973
    ## 1233     72140
    ## 1234     56306
    ## 1235     72654
    ## 1236     68077
    ## 1237     22701
    ## 1238     83945
    ## 1239     12412
    ## 1240     17082
    ## 1241    100609
    ## 1242    226527
    ## 1243     72612
    ## 1244     18674
    ## 1245    212528
    ## 1246    216549
    ## 1247    192174
    ## 1248     60406
    ## 1249     71909
    ## 1250    212508
    ## 1251     14548
    ## 1252     16906
    ## 1253     23897
    ## 1254    107508
    ## 1255     78658
    ## 1256     67204
    ## 1257    232196
    ## 1258     77721
    ## 1259     20226
    ## 1260     11757
    ## 1261    213773
    ## 1262     21454
    ## 1263     22225
    ## 1264     76563
    ## 1265    214669
    ## 1266    105372
    ## 1267    102423
    ## 1268    216443
    ## 1269    231327
    ## 1270     66350
    ## 1271     69065
    ## 1272     66192
    ## 1273    215051
    ## 1274     19899
    ## 1275     15438
    ## 1276     69358
    ## 1277     12850
    ## 1278     14312
    ## 1279     13877
    ## 1280 100042777
    ## 1281     12370
    ## 1282     79043
    ## 1283     69227
    ## 1284     74776
    ## 1285     12567
    ## 1286     68556
    ## 1287    240057
    ## 1288    212123
    ## 1289     56384
    ## 1290     13684
    ## 1291     11947
    ## 1292    233040
    ## 1293     53379
    ## 1294     11951
    ## 1295     14825
    ## 1296     12764
    ## 1297    110809
    ## 1298    257630
    ## 1299     99100
    ## 1300    103136
    ## 1301    216233
    ## 1302     98956
    ## 1303    231452
    ## 1304     19175
    ## 1305     72107
    ## 1306     18639
    ## 1307    212503
    ## 1308     75735
    ## 1309     19192
    ## 1310     16169
    ## 1311     66925
    ## 1312    216877
    ## 1313     68193
    ## 1314     68052
    ## 1315     74203
    ## 1316    353258
    ## 1317     71713
    ## 1318     67733
    ## 1319     68512
    ## 1320    381318
    ## 1321     21762
    ## 1322     74326
    ## 1323     18861
    ## 1324      <NA>
    ## 1325     22185
    ## 1326     66979
    ## 1327     57316
    ## 1328     12857
    ## 1329     52874
    ## 1330    620419
    ## 1331     76890
    ## 1332    107589
    ## 1333    229317
    ## 1334     66656
    ## 1335     68277
    ## 1336     67955
    ## 1337     68636
    ## 1338     20410
    ## 1339     66634
    ## 1340    110147
    ## 1341     67006
    ## 1342     66632
    ## 1343     67463
    ## 1344    214901
    ## 1345    110750
    ## 1346     57750
    ## 1347     74412
    ## 1348     70451
    ## 1349     59035
    ## 1350     68188
    ## 1351     77832
    ## 1352     17967
    ## 1353    240665
    ## 1354     64657
    ## 1355     68337
    ## 1356     65961
    ## 1357     74111
    ## 1358     28000
    ## 1359     71986
    ## 1360     73205
    ## 1361     50784
    ## 1362     94315
    ## 1363     30795
    ## 1364     67242
    ## 1365     99480
    ## 1366     68877
    ## 1367    319520
    ## 1368     68708
    ## 1369    414077
    ## 1370     75406
    ## 1371     71844
    ## 1372      <NA>
    ## 1373    101739
    ## 1374    170930
    ## 1375     68304
    ## 1376     26446
    ## 1377     76938
    ## 1378     22352
    ## 1379     67936
    ## 1380     72515
    ## 1381     11773
    ## 1382     14629
    ## 1383     71752
    ## 1384      <NA>
    ## 1385     16173
    ## 1386     13629
    ## 1387     97287
    ## 1388     12464
    ## 1389     27354
    ## 1390     69666
    ## 1391     66646
    ## 1392    114714
    ## 1393     18103
    ## 1394    109270
    ## 1395     21357
    ## 1396     19087
    ## 1397     64424
    ## 1398    108012
    ## 1399     94230
    ## 1400    320209
    ## 1401    104662
    ## 1402    433022
    ## 1403     22059
    ## 1404    230996
    ## 1405     18100
    ## 1406     18143
    ## 1407     52715
    ## 1408     52535
    ## 1409     23922
    ## 1410    270066
    ## 1411    218973
    ## 1412     71919
    ## 1413     69305
    ## 1414     20382
    ## 1415     27370
    ## 1416    108797
    ## 1417    170823
    ## 1418     26442
    ## 1419     18114
    ## 1420     56748
    ## 1421     57258
    ## 1422     20220
    ## 1423 100041953
    ## 1424    107939
    ## 1425     16911
    ## 1426     15374
    ## 1427     12566
    ## 1428     52705
    ## 1429    228889
    ## 1430     74600
    ## 1431     67050
    ## 1432    230787
    ## 1433     69259
    ## 1434     56426
    ## 1435     14860
    ## 1436     67760
    ## 1437     20842
    ## 1438     51786
    ## 1439     28071
    ## 1440     50497
    ## 1441     20922
    ## 1442     70999
    ## 1443     66256
    ## 1444     72133
    ## 1445    208643
    ## 1446     66580
    ## 1447     56456
    ## 1448     71793
    ## 1449    213575
    ## 1450     74255
    ## 1451     66480
    ## 1452     71974
    ## 1453    319322
    ## 1454     18769
    ## 1455     13006
    ## 1456     13722
    ## 1457     74467
    ## 1458    140858
    ## 1459     13340
    ## 1460    229279
    ## 1461     59053
    ## 1462     75216
    ## 1463     71999
    ## 1464     78523
    ## 1465     20437
    ## 1466     20438
    ## 1467    233064
    ## 1468     67778
    ## 1469    236732
    ## 1470    382019
    ## 1471     75593
    ## 1472     19691
    ## 1473    108707
    ## 1474    211064
    ## 1475    104416
    ## 1476     18245
    ## 1477    224691
    ## 1478     12571
    ## 1479     76306
    ## 1480     52398
    ## 1481     70930
    ## 1482     77422
    ## 1483     67870
    ## 1484    225896
    ## 1485     20103
    ## 1486     26939
    ## 1487     68544
    ## 1488     66839
    ## 1489    320938
    ## 1490     98386
    ## 1491     67115
    ## 1492     83922
    ## 1493     68133
    ## 1494     71521
    ## 1495    217218
    ## 1496     13433
    ## 1497     19172
    ## 1498     70207
    ## 1499     22596
    ## 1500     72649
    ## 1501     19359
    ## 1502     11821
    ## 1503     51797
    ## 1504    109658
    ## 1505    272538
    ## 1506      <NA>
    ## 1507 100859931
    ## 1508 100233175
    ## 1509     27041
    ## 1510     30058
    ## 1511     13016
    ## 1512    268417
    ## 1513     12469
    ## 1514     13669
    ## 1515     18476
    ## 1516     23938
    ## 1517     14479
    ## 1518     68837
    ## 1519     70584
    ## 1520     13437
    ## 1521     18519
    ## 1522     20687
    ## 1523     22594
    ## 1524     19682
    ## 1525    109674
    ## 1526     15415
    ## 1527     23980
    ## 1528    230770
    ## 1529     57837
    ## 1530      <NA>
    ## 1531     20871
    ## 1532     66836
    ## 1533     18618
    ## 1534    101966
    ## 1535     93697
    ## 1536     20663
    ## 1537     67887
    ## 1538    227707
    ## 1539    207818
    ## 1540    217116
    ## 1541 116621581
    ## 1542     70465
    ## 1543     13548
    ## 1544    230709
    ## 1545     66356
    ## 1546    231413
    ## 1547     14450
    ## 1548     18002
    ## 1549    207777
    ## 1550    230734
    ## 1551     27374
    ## 1552     67848
    ## 1553    107094
    ## 1554     14299
    ## 1555     51869
    ## 1556     64945
    ## 1557     22608
    ## 1558     66596
    ## 1559     67026
    ## 1560     56503
    ## 1561     66865
    ## 1562     74470
    ## 1563     75291
    ## 1564    117171
    ## 1565     26754
    ## 1566     56294
    ## 1567    107271
    ## 1568     77090
    ## 1569     77573
    ## 1570     52521
    ## 1571     54711
    ## 1572     14390
    ## 1573     54352
    ## 1574    107734
    ## 1575     21406
    ## 1576     68592
    ## 1577    229663
    ## 1578    235584
    ## 1579    233875
    ## 1580    252875
    ## 1581    223921
    ## 1582     13627
    ## 1583    215160
    ## 1584    233065
    ## 1585     53610
    ## 1586    269113
    ## 1587     67369
    ## 1588     70312
    ## 1589     21343
    ## 1590     19921
    ## 1591     15568
    ## 1592    606496
    ## 1593     52858
    ## 1594     67471
    ## 1595     67846
    ## 1596     27367
    ## 1597     75316
    ## 1598     70387
    ## 1599     67168
    ## 1600    224640
    ## 1601    217353
    ## 1602     66523
    ## 1603    109065
    ## 1604    106821
    ## 1605     99045
    ## 1606     13990
    ## 1607     69113
    ## 1608      <NA>
    ## 1609     66359
    ## 1610     65105
    ## 1611     76808
    ## 1612     93696
    ## 1613    217431
    ## 1614     54633
    ## 1615     66625
    ## 1616    544717
    ## 1617     72482
    ## 1618     54709
    ## 1619     21824
    ## 1620     78394
    ## 1621    235036
    ## 1622     75597
    ## 1623     66047
    ## 1624     66701
    ## 1625     67676
    ## 1626    239555
    ## 1627     52530
    ## 1628    111266
    ## 1629    216150
    ## 1630    140917
    ## 1631    268670
    ## 1632 100416706
    ## 1633    238690
    ## 1634    212281
    ## 1635     15312
    ## 1636     67036
    ## 1637     75416
    ## 1638    623474
    ## 1639     67096
    ## 1640     50995
    ## 1641     11692
    ## 1642    246198
    ## 1643    233726
    ## 1644     78586
    ## 1645    116940
    ## 1646     21665
    ## 1647     71564
    ## 1648     70601
    ## 1649     16865
    ## 1650     69089
    ## 1651     69260
    ## 1652    225887
    ## 1653     71449
    ## 1654     72102
    ## 1655     66163
    ## 1656     67843
    ## 1657    226747
    ## 1658     12696
    ## 1659     20322
    ## 1660    104884
    ## 1661    211948
    ## 1662     70603
    ## 1663     14598
    ## 1664    216119
    ## 1665     21854
    ## 1666    320632
    ## 1667     72843
    ## 1668     66404
    ## 1669    105083
    ## 1670     75284
    ## 1671     19045
    ## 1672    207932
    ## 1673     11855
    ## 1674     13382
    ## 1675     69159
    ## 1676     56043
    ## 1677     15441
    ## 1678    329506
    ## 1679 100126824
    ## 1680     77087
    ## 1681     18193
    ## 1682     16785
    ## 1683     66942
    ## 1684     72611
    ## 1685    108841
    ## 1686     67287
    ## 1687     80509
    ## 1688     66493
    ## 1689    223267
    ## 1690     22230
    ## 1691     74252
    ## 1692     52892
    ## 1693     66136
    ## 1694     70699
    ## 1695    118451
    ## 1696     66413
    ## 1697     66743
    ## 1698     19889
    ## 1699    210711
    ## 1700     66225
    ## 1701     17165
    ## 1702      <NA>
    ## 1703     66637
    ## 1704     69956
    ## 1705     69178
    ## 1706     12892
    ## 1707     30926
    ## 1708    109077
    ## 1709     56460
    ## 1710    170767
    ## 1711    320769
    ## 1712     11758
    ## 1713     17997
    ## 1714    269623
    ## 1715     67609
    ## 1716 100041585
    ## 1717     11702
    ## 1718     71984
    ## 1719    266692
    ## 1720     70294
    ## 1721     50912
    ## 1722    231887
    ## 1723     20115
    ## 1724     18597
    ## 1725     70408
    ## 1726    319513
    ## 1727     72825
    ## 1728    227721
    ## 1729    239839
    ## 1730     69737
    ## 1731    102247
    ## 1732    238799
    ## 1733     19132
    ## 1734     15182
    ## 1735     56395
    ## 1736     18983
    ## 1737     66310
    ## 1738     21771
    ## 1739     69748
    ## 1740     18181
    ## 1741     66172
    ## 1742    320720
    ## 1743     13714
    ## 1744    232679
    ## 1745     74268
    ## 1746     56218
    ## 1747     20480
    ## 1748     57815
    ## 1749     66441
    ## 1750     73390
    ## 1751     11908
    ## 1752     66124
    ## 1753     66055
    ## 1754     13205
    ## 1755     68099
    ## 1756     69367
    ## 1757     26572
    ## 1758     22123
    ## 1759     57259
    ## 1760     68917
    ## 1761     17701
    ## 1762     67647
    ## 1763     22695
    ## 1764     67976
    ## 1765     66475
    ## 1766     69554
    ## 1767     68250
    ## 1768     66306
    ## 1769     72522
    ## 1770     53890
    ## 1771     67996
    ## 1772     76582
    ## 1773     68925
    ## 1774     64934
    ## 1775    227399
    ## 1776     67030
    ## 1777    319179
    ## 1778     66374
    ## 1779     71474
    ## 1780     24015
    ## 1781     12417
    ## 1782     52653
    ## 1783    243963
    ## 1784      <NA>
    ## 1785     56390
    ## 1786     69237
    ## 1787     12465
    ## 1788     14609
    ## 1789     26440
    ## 1790     94061
    ## 1791     27632
    ## 1792    216154
    ## 1793     66067
    ## 1794     66642
    ## 1795     28035
    ## 1796     74351
    ## 1797     56307
    ## 1798     66400
    ## 1799     72354
    ## 1800     77006
    ## 1801     15516
    ## 1802    214048
    ## 1803     26992
    ## 1804     14105
    ## 1805     14311
    ## 1806     26374
    ## 1807     56317
    ## 1808     99334
    ## 1809     69961
    ## 1810     76014
    ## 1811     67674
    ## 1812     67097
    ## 1813    104570
    ## 1814     67547
    ## 1815    242705
    ## 1816    227102
    ## 1817     20534
    ## 1818    269061
    ## 1819     68995
    ## 1820    215193
    ## 1821    107047
    ## 1822     66229
    ## 1823     19357
    ## 1824     66233
    ## 1825     56070
    ## 1826    244672
    ## 1827     66354
    ## 1828     67897
    ## 1829     68275
    ## 1830    217149
    ## 1831     53380
    ## 1832     22687
    ## 1833     67657
    ## 1834    246696
    ## 1835     70397
    ## 1836     67795
    ## 1837     14423
    ## 1838    224903
    ## 1839     72607
    ## 1840     72084
    ## 1841     50915
    ## 1842     27054
    ## 1843    435692
    ## 1844     14635
    ## 1845     20182
    ## 1846     70527
    ## 1847    194905
    ## 1848     68948
    ## 1849     20874
    ## 1850     19708
    ## 1851     66821
    ## 1852    386649
    ## 1853     22194
    ## 1854    218885
    ## 1855     98221
    ## 1856     23808
    ## 1857     67767
    ## 1858     56200
    ## 1859     67151
    ## 1860    109054
    ## 1861    230908
    ## 1862     75553
    ## 1863     26444
    ## 1864     72308
    ## 1865     66161
    ## 1866    381990
    ## 1867     76781
    ## 1868    407785
    ## 1869     28113
    ## 1870     52231
    ## 1871     74155
    ## 1872    353187
    ## 1873    241490
    ## 1874    227656
    ## 1875    214305
    ## 1876     53315
    ## 1877     12785
    ## 1878     27215
    ## 1879    103711
    ## 1880     15247
    ## 1881     70508
    ## 1882    223870
    ## 1883     19167
    ## 1884     78232
    ## 1885     74753
    ## 1886     74841
    ## 1887    216739
    ## 1888    230234
    ## 1889     74277
    ## 1890    210973
    ## 1891     66878
    ## 1892     21374
    ## 1893     57312
    ## 1894     64660
    ## 1895    217664
    ## 1896     56708
    ## 1897     12314
    ## 1898     74360
    ## 1899    211253
    ## 1900     94064
    ## 1901     14287
    ## 1902     66810
    ## 1903     23856
    ## 1904     66902
    ## 1905     17423
    ## 1906    102122
    ## 1907    102448
    ## 1908     66427
    ## 1909    217707
    ## 1910     21339
    ## 1911     69709
    ## 1912     21976
    ## 1913    279766
    ## 1914     69662
    ## 1915     59028
    ## 1916     24070
    ## 1917    208144
    ## 1918     26920
    ## 1919     93834
    ## 1920    269523
    ## 1921     68816
    ## 1922     66092
    ## 1923    228715
    ## 1924     20624
    ## 1925     21856
    ## 1926    245688
    ## 1927     53314
    ## 1928     96979
    ## 1929     78697
    ## 1930     20867
    ## 1931      <NA>
    ## 1932     71989
    ## 1933    218975
    ## 1934     18120
    ## 1935    225651
    ## 1936     66949
    ## 1937     12461
    ## 1938     52846
    ## 1939     68095
    ## 1940     56334
    ## 1941      <NA>
    ## 1942    214917
    ## 1943     17169
    ## 1944    109075
    ## 1945     66249
    ## 1946    192192
    ## 1947    320609
    ## 1948     20869
    ## 1949     20481
    ## 1950     70998
    ## 1951     19353
    ## 1952    270210
    ## 1953     75901
    ## 1954     64144
    ## 1955     75786
    ## 1956     67582
    ## 1957     20637
    ## 1958     50883
    ## 1959    110854
    ## 1960     73674
    ## 1961    224823
    ## 1962     56530
    ## 1963     69192
    ## 1964     30933
    ## 1965     67296
    ## 1966     77593
    ## 1967    235169
    ## 1968     30931
    ## 1969     23997
    ## 1970     70767
    ## 1971    110616
    ## 1972     29805
    ## 1973     20384
    ## 1974     14356
    ## 1975     14356
    ## 1976     19247
    ## 1977    328162
    ## 1978    320541
    ## 1979    231931
    ## 1980     68011
    ## 1981    105675
    ## 1982     19014
    ## 1983     66248
    ## 1984    268390
    ## 1985     68705
    ## 1986    269955
    ## 1987     19346
    ## 1988     17025
    ## 1989     21780
    ## 1990     68015
    ## 1991     15115
    ## 1992     67667
    ## 1993    171211
    ## 1994     67241
    ## 1995     68980
    ## 1996     20166
    ## 1997     57753
    ## 1998    226154
    ## 1999     17993
    ## 2000     66801
    ## 2001     21843
    ## 2002     72198
    ## 2003     23857
    ## 2004    216820
    ## 2005     70300
    ## 2006     75079
    ## 2007     63985
    ## 2008     76355
    ## 2009     72729
    ## 2010     17692
    ## 2011     19650
    ## 2012     16649
    ## 2013     12400
    ## 2014     22380
    ## 2015    244219
    ## 2016     73744
    ## 2017     27979
    ## 2018     76108
    ## 2019     74035
    ## 2020     70791
    ## 2021     11630
    ## 2022     17188
    ## 2023     77305
    ## 2024     17765
    ## 2025     69596
    ## 2026    243846
    ## 2027     16882
    ## 2028     13495
    ## 2029     74781
    ## 2030    100929
    ## 2031     12549
    ## 2032    234729
    ## 2033     12663
    ## 2034     66641
    ## 2035     78653
    ## 2036     72205
    ## 2037    109129
    ## 2038     18986
    ## 2039     11911
    ## 2040     67211
    ## 2041     78287
    ## 2042    218397
    ## 2043    497652
    ## 2044     12846
    ## 2045    270685
    ## 2046     67099
    ## 2047     66686
    ## 2048     74168
    ## 2049     67809
    ## 2050     11950
    ## 2051     67553
    ## 2052     19170
    ## 2053     19687
    ## 2054     52856
    ## 2055    319651
    ## 2056     14885
    ## 2057     72459
    ## 2058     72554
    ## 2059     75398
    ## 2060     11946
    ## 2061    319719
    ## 2062     22099
    ## 2063    229700
    ## 2064     53893
    ## 2065     12572
    ## 2066     21871
    ## 2067     55942
    ## 2068     67896
    ## 2069     74383
    ## 2070     12267
    ## 2071     17254
    ## 2072     19166
    ## 2073    100226
    ## 2074    210009
    ## 2075    232491
    ## 2076    227674
    ## 2077    223775
    ## 2078     11632
    ## 2079    387609
    ## 2080     68734
    ## 2081    106298
    ## 2082     24116
    ## 2083     56436
    ## 2084 100043022
    ## 2085     20918
    ## 2086    230935
    ## 2087     76893
    ## 2088     68294
    ## 2089    229731
    ## 2090     77591
    ## 2091    229504
    ## 2092     94067
    ## 2093     66209
    ## 2094    232989
    ## 2095     56357
    ## 2096     18632
    ## 2097     67367
    ## 2098     13626
    ## 2099     19820
    ## 2100     66317
    ## 2101     17938
    ## 2102     67797
    ## 2103     19942
    ## 2104     94093
    ## 2105     56228
    ## 2106     50762
    ## 2107     19240
    ## 2108 100043712
    ## 2109     70383
    ## 2110    216363
    ## 2111     67895
    ## 2112    211556
    ## 2113    227210
    ## 2114    103784
    ## 2115     83486
    ## 2116    225215
    ## 2117     71924
    ## 2118     19718
    ## 2119     70247
    ## 2120    231713
    ## 2121     56412
    ## 2122     68041
    ## 2123     67605
    ## 2124    227613
    ## 2125     26445
    ## 2126    237859
    ## 2127     66368
    ## 2128     56372
    ## 2129     56419
    ## 2130     72338
    ## 2131     20815
    ## 2132     69802
    ## 2133     66423
    ## 2134    381760
    ## 2135     22350
    ## 2136    245841
    ## 2137     69232
    ## 2138    231386
    ## 2139    219103
    ## 2140    233870
    ## 2141     17350
    ## 2142     11949
    ## 2143      <NA>
    ## 2144    218734
    ## 2145     70616
    ## 2146     18286
    ## 2147    232536
    ## 2148    234344
    ## 2149     64209
    ## 2150     12626
    ## 2151     80914
    ## 2152     21366
    ## 2153    192292
    ## 2154     15260
    ## 2155     67337
    ## 2156     12537
    ## 2157     14755
    ## 2158     68969
    ## 2159    544971
    ## 2160    234366
    ## 2161     67106
    ## 2162     18541
    ## 2163     18753
    ## 2164     22592
    ## 2165    246229
    ## 2166     67800
    ## 2167    212986
    ## 2168     19057
    ## 2169     81898
    ## 2170    269966
    ## 2171     15502
    ## 2172     67472
    ## 2173     12704
    ## 2174     74204
    ## 2175     53421
    ## 2176     66714
    ## 2177    231225
    ## 2178     60532
    ## 2179    231123
    ## 2180     59002
    ## 2181    207304
    ## 2182     67781
    ## 2183     17345
    ## 2184     68598
    ## 2185     55982
    ## 2186     20017
    ## 2187     14696
    ## 2188    108909
    ## 2189     66194
    ## 2190    228866
    ## 2191     22384
    ## 2192     78903
    ## 2193     20491
    ## 2194     58998
    ## 2195     70082
    ## 2196     20286
    ## 2197    231889
    ## 2198     67501
    ## 2199     74287
    ## 2200     66309
    ## 2201     72542
    ## 2202    109275
    ## 2203     20044
    ## 2204     66679
    ## 2205    242691
    ## 2206 100045778
    ## 2207    236790
    ## 2208     52830
    ## 2209     56451
    ## 2210     17257
    ## 2211     30840
    ## 2212     16468
    ## 2213     69697
    ## 2214     12747
    ## 2215     74133
    ## 2216    245866
    ## 2217     52202
    ## 2218     93765
    ## 2219     73288
    ## 2220    208968
    ## 2221    101867
    ## 2222    100210
    ## 2223     15159
    ## 2224     76233
    ## 2225     74187
    ## 2226    213895
    ## 2227     72935
    ## 2228     27399
    ## 2229     28088
    ## 2230    106338
    ## 2231     17937
    ## 2232    217779
    ## 2233    219158
    ## 2234     67979
    ## 2235     73158
    ## 2236    170789
    ## 2237     78581
    ## 2238     29875
    ## 2239    234733
    ## 2240     22209
    ## 2241     67952
    ## 2242     54369
    ## 2243     68493
    ## 2244     52468
    ## 2245     76614
    ## 2246     56214
    ## 2247    224907
    ## 2248    225467
    ## 2249    223666
    ## 2250    381259
    ## 2251     12362
    ## 2252    223691
    ## 2253     18972
    ## 2254     22341
    ## 2255     72083
    ## 2256     21853
    ## 2257    225010
    ## 2258     67046
    ## 2259     27362
    ## 2260     13688
    ## 2261     80898
    ## 2262     23939
    ## 2263     19697
    ## 2264     50789
    ## 2265     22343
    ## 2266    223753
    ## 2267     12748
    ## 2268     23894
    ## 2269     68735
    ## 2270     81845
    ## 2271     77951
    ## 2272     77605
    ## 2273     19090
    ## 2274     74747
    ## 2275     22785
    ## 2276    230761
    ## 2277    229524
    ## 2278     81000
    ## 2279 100034361
    ## 2280     67532
    ## 2281    233895
    ## 2282    233189
    ## 2283    216767
    ## 2284     68926
    ## 2285     26891
    ## 2286     72722
    ## 2287    102162
    ## 2288    109333
    ## 2289    223773
    ## 2290     50850
    ## 2291     71782
    ## 2292    140859
    ## 2293     56692
    ## 2294    545085
    ## 2295     20091
    ## 2296     14569
    ## 2297     17134
    ## 2298     24128
    ## 2299     68187
    ## 2300    407800
    ## 2301     17299
    ## 2302     18712
    ## 2303    229644
    ## 2304     70118
    ## 2305    574428
    ## 2306     17869
    ## 2307     80886
    ## 2308    107566
    ## 2309    234865
    ## 2310    110960
    ## 2311     71063
    ## 2312     67179
    ## 2313     73373
    ## 2314    105377
    ## 2315     70650
    ## 2316     66926
    ## 2317    320940
    ## 2318     19060
    ## 2319    170791
    ## 2320     26414
    ## 2321     11308
    ## 2322    231093
    ## 2323     14030
    ## 2324    109161
    ## 2325     80837
    ## 2326     18391
    ## 2327     53872
    ## 2328    270106
    ## 2329     20698
    ## 2330     70885
    ## 2331     19365
    ## 2332     70120
    ## 2333     66521
    ## 2334     22335
    ## 2335    217578
    ## 2336     19707
    ## 2337     66492
    ## 2338     71805
    ## 2339     66448
    ## 2340    109801
    ## 2341     26926
    ## 2342     12238
    ## 2343    213109
    ## 2344    231915
    ## 2345    209357
    ## 2346     17874
    ## 2347     23849
    ## 2348     51792
    ## 2349     13822
    ## 2350     12554
    ## 2351     22235
    ## 2352     22334
    ## 2353     27395
    ## 2354    226778
    ## 2355    269610
    ## 2356     12224
    ## 2357     56398
    ## 2358     55944
    ## 2359     11938
    ## 2360     24074
    ## 2361    210925
    ## 2362     74097
    ## 2363     68023
    ## 2364      <NA>
    ## 2365    103836
    ## 2366    217473
    ## 2367    241447
    ## 2368    259279
    ## 2369     70208
    ## 2370    433182
    ## 2371     13806
    ## 2372     66291
    ## 2373     19656
    ## 2374    652988
    ## 2375    232337
    ## 2376     18803
    ## 2377    319757
    ## 2378     59040
    ## 2379     70676
    ## 2380     19878
    ## 2381    224440
    ## 2382    233913
    ## 2383     13831
    ## 2384     56207
    ## 2385     57438
    ## 2386     13665
    ## 2387     28080
    ## 2388    229055
    ## 2389    223776
    ## 2390    239833
    ## 2391     19729
    ## 2392     68401
    ## 2393    320438
    ## 2394    192662
    ## 2395     54624
    ## 2396     67881
    ## 2397     69821
    ## 2398     12189
    ## 2399     76265
    ## 2400     69656
    ## 2401    320213
    ## 2402     22195
    ## 2403     22427
    ## 2404    209354
    ## 2405     53382
    ## 2406     13690
    ## 2407    338320
    ## 2408     27878
    ## 2409     13368
    ## 2410     16878
    ## 2411    110172
    ## 2412     26894
    ## 2413     66446
    ## 2414     93679
    ## 2415     26396
    ## 2416     67958
    ## 2417    246102
    ## 2418     66254
    ## 2419     26879
    ## 2420     51812
    ## 2421     68916
    ## 2422    227522
    ## 2423     66514
    ## 2424    243574
    ## 2425     64659
    ## 2426    240034
    ## 2427     66388
    ## 2428     66874
    ## 2429     57230
    ## 2430    226169
    ## 2431     68180
    ## 2432     68115
    ## 2433    226144
    ## 2434    217379
    ## 2435     76375
    ## 2436    232853
    ## 2437     74157
    ## 2438     67972
    ## 2439    102436
    ## 2440     66684
    ## 2441     73699
    ## 2442    353190
    ## 2443     20917
    ## 2444     83396
    ## 2445    192176
    ## 2446     23924
    ## 2447     66200
    ## 2448     69241
    ## 2449     50721
    ## 2450     72881
    ## 2451     66844
    ## 2452    216395
    ## 2453     72508
    ## 2454     66536
    ## 2455    338349
    ## 2456    320806
    ## 2457    192159
    ## 2458     19647
    ## 2459     57751
    ## 2460    107242
    ## 2461     67812
    ## 2462     66880
    ## 2463     70225
    ## 2464     71968
    ## 2465     66044
    ## 2466    105847
    ## 2467     68475
    ## 2468     26901
    ## 2469    108679
    ## 2470     30954
    ## 2471    268933
    ## 2472     17246
    ## 2473    228005
    ## 2474     66566
    ## 2475     16909
    ## 2476     12017
    ## 2477     22217
    ## 2478     57743
    ## 2479     66830
    ## 2480    212679
    ## 2481     19069
    ## 2482    217558
    ## 2483     72416
    ## 2484     67684
    ## 2485     16341
    ## 2486     72946
    ## 2487     52335
    ## 2488    224727
    ## 2489     52513
    ## 2490     13592
    ## 2491     69181
    ## 2492    227334
    ## 2493     52184
    ## 2494     66271
    ## 2495     72306
    ## 2496     68273
    ## 2497     68472
    ## 2498     12729
    ## 2499    224902
    ## 2500    101568
    ## 2501     71810
    ## 2502    225895
    ## 2503     19732
    ## 2504     70052
    ## 2505     20399
    ## 2506    106021
    ## 2507     72056
    ## 2508     67892
    ## 2509     69718
    ## 2510     76824
    ## 2511     66526
    ## 2512     66399
    ## 2513    218271
    ## 2514     13356
    ## 2515      <NA>
    ## 2516     55993
    ## 2517     68964
    ## 2518     12576
    ## 2519    266690
    ## 2520     16594
    ## 2521     78656
    ## 2522    381644
    ## 2523    272551
    ## 2524    234138
    ## 2525     52563
    ## 2526     66292
    ## 2527    234723
    ## 2528     19134
    ## 2529    217980
    ## 2530    229776
    ## 2531     66971
    ## 2532     54402
    ## 2533    226151
    ## 2534     20024
    ## 2535     50492
    ## 2536    108903
    ## 2537     52132
    ## 2538     22130
    ## 2539     67538
    ## 2540     17349
    ## 2541    225898
    ## 2542     17776
    ## 2543     57905
    ## 2544     68736
    ## 2545    226026
    ## 2546     73172
    ## 2547     64704
    ## 2548     19173
    ## 2549     18102
    ## 2550    102442
    ## 2551    100019
    ## 2552    233905
    ## 2553     67212
    ## 2554     67439
    ## 2555    208908
    ## 2556     15463
    ## 2557     98878
    ## 2558     66202
    ## 2559    103733
    ## 2560     21881
    ## 2561     28084
    ## 2562     67057
    ## 2563    227292
    ## 2564     67973
    ## 2565    224648
    ## 2566     19042
    ## 2567    101471
    ## 2568    223499
    ## 2569    230917
    ## 2570     56275
    ## 2571    109113
    ## 2572     66268
    ## 2573     73130
    ## 2574     75751
    ## 2575     50783
    ## 2576    270156
    ## 2577     66398
    ## 2578     67246
    ## 2579     26441
    ## 2580     69876
    ## 2581     78465
    ## 2582     54006
    ## 2583     28015
    ## 2584     70779
    ## 2585     66199
    ## 2586     59021
    ## 2587     19076
    ## 2588     70974
    ## 2589     54394
    ## 2590     72193
    ## 2591     56433
    ## 2592     66242
    ## 2593     17126
    ## 2594     71885
    ## 2595     72502
    ## 2596     65103
    ## 2597    338359
    ## 2598     18041
    ## 2599    330361
    ## 2600     68585
    ## 2601    224045
    ## 2602    226525
    ## 2603     69792
    ## 2604    235497
    ## 2605      <NA>
    ## 2606     67288
    ## 2607     69008
    ## 2608    242773
    ## 2609     13712
    ## 2610     22273
    ## 2611     20813
    ## 2612    210801
    ## 2613    170936
    ## 2614     65020
    ## 2615    228061
    ## 2616     74213
    ## 2617      <NA>
    ## 2618    170762
    ## 2619    268903
    ## 2620     17083
    ## 2621    212090
    ## 2622     17999
    ## 2623     15278
    ## 2624     26401
    ## 2625     55979
    ## 2626     66422
    ## 2627     19053
    ## 2628     11544
    ## 2629    106073
    ## 2630     78893
    ## 2631     56046
    ## 2632     17129
    ## 2633     13682
    ## 2634    381201
    ## 2635    228482
    ## 2636     68961
    ## 2637    269800
    ## 2638     94213
    ## 2639    271842
    ## 2640     66231
    ## 2641     56878
    ## 2642     78895
    ## 2643    384281
    ## 2644     19664
    ## 2645     56194
    ## 2646     27224
    ## 2647     74237
    ## 2648    240888
    ## 2649     15525
    ## 2650    208366
    ## 2651     54451
    ## 2652     70611
    ## 2653     66917
    ## 2654     14461
    ## 2655     14815
    ## 2656     66616
    ## 2657     68080
    ## 2658    225348
    ## 2659     53375
    ## 2660    110379
    ## 2661    103213
    ## 2662    226016
    ## 2663     66980
    ## 2664     71765
    ## 2665     18194
    ## 2666     20807
    ## 2667     71151
    ## 2668     15368
    ## 2669     70620
    ## 2670     15925
    ## 2671     20708
    ## 2672     69009
    ## 2673     94062
    ## 2674     20930
    ## 2675     27393
    ## 2676     57314
    ## 2677    216151
    ## 2678    380773
    ## 2679     20021
    ## 2680    330790
    ## 2681     14719
    ## 2682    105837
    ## 2683     68626
    ## 2684    246703
    ## 2685    101565
    ## 2686     66997
    ## 2687     74442
    ## 2688     71452
    ## 2689    104479
    ## 2690     53861
    ## 2691     16332
    ## 2692     68327
    ## 2693    102545
    ## 2694    103466
    ## 2695    103466
    ## 2696     18701
    ## 2697     28185
    ## 2698     74185
    ## 2699    226414
    ## 2700     64452
    ## 2701     68671
    ## 2702     12457
    ## 2703     78266
    ## 2704     70427
    ## 2705    246782
    ## 2706    216766
    ## 2707     70422
    ## 2708     67205
    ## 2709    233328
    ## 2710     54638
    ## 2711     27373
    ## 2712    232187
    ## 2713    217232
    ## 2714     64656
    ## 2715     22282
    ## 2716     13163
    ## 2717     56284
    ## 2718     67680
    ## 2719    216157
    ## 2720    217365
    ## 2721     28114
    ## 2722     68114
    ## 2723     71472
    ## 2724     26406
    ## 2725     68979
    ## 2726    170748
    ## 2727     12369
    ## 2728     72046
    ## 2729     56428
    ## 2730    347722
    ## 2731     21975
    ## 2732     75212
    ## 2733     55978
    ## 2734     94184
    ## 2735     24086
    ## 2736     71177
    ## 2737     67276
    ## 2738     28030
    ## 2739     66964
    ## 2740     56196
    ## 2741     13207
    ## 2742    234736
    ## 2743     18408
    ## 2744    224705
    ## 2745     22627
    ## 2746     22688
    ## 2747     19367
    ## 2748    229211
    ## 2749     58520
    ## 2750     56812
    ## 2751     73078
    ## 2752    208211
    ## 2753     66059
    ## 2754     76302
    ## 2755     11566
    ## 2756    208606
    ## 2757    217718
    ## 2758     75974
    ## 2759    234549
    ## 2760    217827
    ## 2761     77634
    ## 2762    102607
    ## 2763     71371
    ## 2764     68035
    ## 2765     19070
    ## 2766     17995
    ## 2767      <NA>
    ## 2768     26400
    ## 2769     67803
    ## 2770    231861
    ## 2771     51813
    ## 2772     71743
    ## 2773     66884
    ## 2774     75705
    ## 2775     13197
    ## 2776    103098
    ## 2777     11993
    ## 2778    244879
    ## 2779    216724
    ## 2780     71997
    ## 2781    104836
    ## 2782     68031
    ## 2783    231214
    ## 2784    232157
    ## 2785    331004
    ## 2786     19654
    ## 2787    110208
    ## 2788    432731
    ## 2789     68539
    ## 2790     66658
    ## 2791     75758
    ## 2792      <NA>
    ## 2793    234734
    ## 2794    214489
    ## 2795     67732
    ## 2796    231580
    ## 2797     68929
    ## 2798    170736
    ## 2799    232314
    ## 2800     72621
    ## 2801     66069
    ## 2802     66170
    ## 2803     12054
    ## 2804     76789
    ## 2805     50776
    ## 2806    209318
    ## 2807     16828
    ## 2808     20088
    ## 2809     12675
    ## 2810     56422
    ## 2811     18140
    ## 2812     72195
    ## 2813     59015
    ## 2814     13486
    ## 2815     66978
    ## 2816     18969
    ## 2817     98985
    ## 2818     66681
    ## 2819     20430
    ## 2820     67966
    ## 2821    319801
    ## 2822    108689
    ## 2823     67059
    ## 2824     78246
    ## 2825     56249

## Salvando arquivos em excel

``` r
#write.xlsx(x, file="path/nome.xlsx", sheetName="Sheet1", 
#  col.names=TRUE, row.names=TRUE, append=FALSE)
```

Descrição:

x: um data.frame a ser escrito na pasta de trabalho. file: o caminho
para o arquivo de saída. sheetName: uma cadeia de caracteres a ser usada
para o nome da planilha. col.names: um valor lógico que especifica se os
nomes das colunas de x devem ser gravados no arquivo. row.names: um
valor lógico que especifica se os nomes das linhas de x devem ser
gravados no arquivo. append : um valor lógico que indica se x deve ser
anexado a um arquivo existente.

Note: write.xlsx2 obtém melhor desempenho em comparação com write.xlsx
para data.frame muito grande (com mais de 100.000 células).

## Referências:

<https://www.w3schools.com/r/default.asp>
<https://www.cs.upc.edu/~robert/teaching/estadistica/rprogramming.pdf>
<https://github.com/colearendt/xlsx>
<http://www.sthda.com/english/wiki/r-xlsx-package-a-quick-start-guide-to-manipulate-excel-files-in-r>
