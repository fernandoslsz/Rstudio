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
  geom_point(mapping = aes(x = displ, y = hwy, color = hwy < 20))

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



# Facet exercises
# What happens if you facet on a continuous variable ?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cyl, ncol = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cyl, nrow = 2)

# 3 What plots does the following code make ?
# What does. do ?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~.)# Ele mostra a relação entre as 3 variáveis.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(.~ cyl)




# Geometric Objects

# A Geom is a geometrical object that a plot uses to represent data.
# People often describe plots by the type of geom that the plot uses.
# For example, bar charts use bar geoms, line charts use line geoms.
# Boxplots use boxplot geoms, and so on. Scatterplots break the trend:
# they use the point geom. As we see in the preceding plots, you can
# use different geoms to plot the same data.
# The plot on the left uses the point geom, and the plot on the right uses
# the smooth  geom, a smooth line fitted to the data.
# To change the geom in your plot, change the geom function that you add to 
# ggplot(). For instance, to make the preceding plots


# Left 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# Right
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


# Every geom function in ggplot2 takes a mapping argument. However, 
# not every aesthetic works with every geom.
# You could set the
# shape of a point, but you couldn’t set the “shape” of a line. On the
# other hand, you could set the linetype of a line. geom_smooth() will
# draw a different line, with a different linetype, for each unique value
# of the variable that you map to linetype:
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# Here geom_smooth() separates the cars into three lines based on
# their drv value, which describes a car’s drivetrain.
# Here geom_smooth() separates the cars into three lines based on
# their drv value, which describes a car’s drivetrain. One line describes
# all of the points with a 4 value, one line describes all of the points
# with an f value, and one line describes all of the points with an r
# value. Here, 4 stands for four-wheel drive, f for front-wheel drive,
# and r for rear-wheel drive.

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))


# To display multiple geoms in the same plot, add multiple geom
# functions to ggplot():

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

# If you place mappings in a geom function, ggplot2 will treat them as
# local mappings for the layer. It will use these mappings to extend or
# overwrite the global mappings for that layer only. This makes it pos‐
# sible to display different aesthetics in different layers:

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()


# You can use the same idea to specify different data for each layer.
# Here, our smooth line displays just a subset of the mpg dataset, the
# subcompact cars.

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy, color = drv)
) +
  geom_point() +
  geom_smooth(se = FALSE)








ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))



ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = dry))
  




# Exercise 6 
# Plot 1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# Plot 2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

# PLot 3
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv))

# Plot 4
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# plot 5 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# Plot 6
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))