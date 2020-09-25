
# Subsetting --------------------------------------------------------------

## Atomic 

### Positive integers (subset vector values by index)
vector_1 <- sample(1:999, 20)

vector_1[1] # Vector_name + square brackets + positive integer -> vector by its index
vector_1[2]
vector_1[c(1, 3, 5)]

### Negative integers (remove vector values by index)

vector_1[-1]
vector_1[-c(1, 3, 5)]
# vector_1[c(-2, 2, 5)] It is impossible to use both

### Logical subset

#### Sequence

vector_1[T] # extract all TRUE
vector_1[F]
vector_1[c(T, F)]
vector_1[c(T, F, F, T)]

#### Conditions

vector_1 > 40 # Logical vector of TRUE, FALSE based on a condition
vector_1[vector_1 > 40] # 
vector_1[vector_1 > 100 & vector_1 < 250]

# & AND
# | OR
# ! NOT

### By names

names(vector_1)
vector_2 <- c(
  a = 1, 
  b = 2, 
  c = 3, 
  d = 4
)

vector_2['a']
vector_2[c('a', 'b')]

## Matrices

m1 <- matrix(sample(250:1000, 20), ncol = 4)

### Additional attribute - dimension

m1[1:2,]
m1[,2:3]
m1[1,2]

# Использовать негативные целочисленные для извлечения в матрицах
m1[,-1]
# Использовать разные subsets by integers в строках и столбцах
m1[1:2, -1]
# Использовать логические операторы на матрице
## Использовать логические операторы как последовательность
m1[c(T,F),]
## Использовать логические операторы как условия
m1[m1[,1] > 700,]

colnames(m1) <- c('v1', 'v2', 'v3', 'v4')
rownames(m1) <- c('r1', 'r2', 'r3', 'r4', 'r5')
m1[c('r1', 'r2'), c('v3', 'v4')]

## Lists

### [] - возвращают всегда список и можно извлечь несколько элементов

l1 <- list(
  c(1, 2, 3, 4),
  c(T, F),
  new_list = list(
    c('new1', 'new2'),
    T
  ),
  'meh'
)

# Использовать все четыре способа извлечения, которые изучили
l1[1]
l1[c(1, 3)]
l1[-2]
l1[c(T, F)]
l1['new_list']
# Извлечь первый элемент и посчитать по нему сумму
sum(l1[1])
mean(l1[1])
typeof(l1[1])

### [[]] | $ - возвращают всегда тот элемент, который сохранен, 
### [[]] | $ - извлечение ТОЛЬКО ОДНОГО ЭЛЕМЕНТА!!!

l1[[1]]
sum(l1[[1]])
l1$new_list[[2]] == 0

l1[[c(1, 2)]]
l1[[1]][[2]]

l1[[c(3, 1, 2)]]
l1[[3]][[1]][[2]]

## Data frames

df <- data.frame(
  id = 1:100,
  gndr = factor(sample(1:2, 100, replace = T), c(1, 2), c('Men', 'Women')),
  age = sample(18:65, 100, replace = T),
  salary = rnorm(100, mean = 40000, sd = 5000),
  q1 = sample(1:100, 100, replace = T)
)

# Извлечь людей с зарплатой ниже 40000
df[df$salary < 40000, ]
# Извлечь всех мужчин
df[df$gndr == 'Men',]
# Извлечь всех женщин старше 35
df[df$gndr == 'Women' & df$age > 35, ]

# Control flow ------------------------------------------------------------

## Choices 

vector_3 <- c(1, 2, 3, 7)
7 == vector_3[1] | 7 == vector_3[2] | 7 == vector_3[3] | 7 == vector_3[4]
7 %in% vector_3

if (sum(vector_3) == 14) {
  print('В векторе три мы получили 13')
} else {
  print('В векторе три мы не получили 13')
}

if(vector_3[1] == 2) {
  print('В векторе 3 первый элемент равен двум')
} else if (vector_3[1] == 1) {
  print('В векторе 3 первый элемент равен единице')
} else {
  print('В векторе 3 первый элемент не равен единице или двум')
}

## Loops

new_vector <- c(4, 5, 6, 7)

for (i in seq_along(new_vector)) {
  print(new_vector[i])
}

resulting_vector <- c()
resulting_list <- list()

for (i in seq_along(new_vector)) {
  resulting_vector[i] <- new_vector[i] * 30
}

# 1. Взять new_vector
# 2. Если элемент new_vector нечетный, то прибавить к нему единицу
# 3. Напечатать все значения с помощью print()

for (i in seq_along(new_vector)){
  if (i %in% c(1,3)) {
    print(new_vector[i])
  } else {
    print(new_vector[i] + 1)
  }
}

# Packages ----------------------------------------------------------------

install.packages('tidyverse')
library(tidyverse)

# Web scrapping -----------------------------------------------------------

install.packages('jsonlite')
library(jsonlite)

getwd()
read_json('Class 2/JSON_example.JSON')

ghibli_films <- read_json('https://ghibliapi.herokuapp.com/films')

# Вытащить все названия фильмов (title) из списка ghibli_films

for(i in 1:length(ghibli_films)) {
  print(length(ghibli_films[[i]]$people))
}

rt_scores <- c()
for(i in 1:length(ghibli_films)) {
  rt_scores[i] <- as.double(ghibli_films[[i]]$rt_score)
}

mean(rt_scores)


















