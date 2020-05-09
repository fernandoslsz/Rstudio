print("This is a second file created")

print("This is a second line created")

print("Third line ")


# Given vector indices
vetor <- c("A" = 1, "B" = 2, "C" = 3)
vetor
vetor["A"]


names(vetor) <- c("x","y","z")
vetor

# Vectorized Expression
x <- 1:3
x ** 2

y <- 6:11
x ** 2 - y


# Creating function

square<- function(x) x ** 2
square(2:5)
square(10:11)

menos <- function(y) y - 5
menos(20:30)

square_and_subtract <- function(x, y){
  squared <- x ** 2
  squared - y
}

square_and_subtract(1:5, rev(1:5))



multiplica_e_dividir <- function(x, y){
  resultado <- x * 10
  resultado / 2
}

multiplica_e_dividir(2:8)


multiplica_e_diminuir <- function(x, y) return(x ** 2 - y)
multiplica_e_diminuir(2:8)

library(tidyverse)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# A MPG data set is a rectangular collection of variables (in the columns) and
# observations (in the rows). mpg contains observations collected by the
# US Environment Protection Agency on 38 models of cars.


# The ggplot() creates a coordinates system that you can add layer to.
# The first argument of ggplot() is the dataset to use in the graph. 
# So ggplot(data = mpg) creates an empty graph, but it's not very interesting
# To complete your graph by adding one or more layers to ggplot() adds a layer
# of points to your plot, which creates a scatterplot.
# Each geom function in ggplot2 takes a mapping argument. 
# This defines how variable in your dataset are mapped to visual properties.


ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = hwy))


# An aesthetic is a visual property of the objects in your plot.
# Aesthetic include thing like the size, the shape , or the color of you points.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = year, size = year, shape = year))


ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, size = class, color = class, shape = class))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))


# the ggplot2 will only use six shapes at a time. By default, additional groups will go
# unplotted when you use this aesthetic.


# YOu can also set the aesthetic properties of your geom manually. For example,
# we can make all of the points in our plot blue.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

# A useful way for categorical variables, is to split your plot into facets,
# Subplots that each display one subset of the data.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

# To facet your plot on the combination of two variables, add facet_grid() to
# your plot call. The first argument of facet_grid() is also a formula.
# This time the formula should contain two variable names separated by a ~

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)