install.packages(c("ggplot2","gapminder"))
library(ggplot2)
library(gapminder)
gm = gapminder
p <- ggplot(data = gm)
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp)) 

## Add a layer
p + geom_point(size=2)

## Add some color grouping
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp, color=continent))
p + geom_point()

## Add a regression line, dropped the color grouping
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(pch=16) + geom_smooth(method="lm")

## Change dot color?
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = "purple"))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()


## How about this?

p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10()

## Add labels

p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10() +
  xlab("GDP per capita") +
  ylab("Life Expectancy")


## Facetting

p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10() +
  xlab("GDP per capita") +
  ylab("Life Expectancy") +
  facet_wrap(~ continent, nrow=2)

## Finishing touches

p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10() +
  xlab("GDP per capita") +
  ylab("Life Expectancy") +
  facet_wrap(~ continent, nrow=2) +
  theme(text=element_text(size=14, family="Palatino")) 

## Theme!

p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10() +
  xlab("GDP per capita") +
  ylab("Life Expectancy") +
  facet_wrap(~ continent, nrow=2) +
  theme(text=element_text(size=14, family="Palatino")) + 
  theme_bw()


# Why font still the same?
# 
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10() +
  xlab("GDP per capita") +
  ylab("Life Expectancy") +
  facet_wrap(~ continent, nrow=2)  + 
  theme_bw() + 
  theme(text=element_text(size=14, family="Palatino")) 
