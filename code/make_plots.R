library(tidyverse)
library(gapminder)

data <- gapminder::gapminder

data %>% 
    filter(year==1997) %>% 
    ggplot(aes(x=gdpPercap,y=lifeExp,color=continent)) +
        geom_point(size=3,alpha=0.7) +
        theme_bw() +
        xlab("GDP per capita") +
        ylab("Life Expectancy (years)") +
        scale_color_discrete(name="Continent") +
        ggtitle("1997")
ggsave("figures/gdp_lifeExp_1997.png")
        
data %>% 
    filter(year==2007) %>% 
    ggplot(aes(x=gdpPercap,y=lifeExp,color=continent)) +
        geom_point(size=3,alpha=0.7) +
        theme_bw() +
        xlab("GDP per capita") +
        ylab("Life Expectancy (years)") +
        scale_color_discrete(name="Continent") +
        ggtitle("2007")
ggsave("figures/gdp_lifeExp_2007.png")

data %>% 
    filter(year %in% c(1997,2007)) %>% 
    ggplot(aes(x=gdpPercap,y=lifeExp,color=factor(year))) +
        geom_point(size=3,alpha=0.7) +
        theme_bw() +
        xlab("GDP per capita (in millions)") +
        ylab("Life Expectancy (years)") +
        scale_color_discrete(name="Year") +
        facet_grid(~continent)
ggsave("figures/gdp_lifeExp_continent.png",width=12)
