#Données

library(dplyr)
data("diamonds")
data ("starwars")
names(diamonds)
head(diamonds)
names (starwars)

## graph1

ggplot(data = diamonds, 
       mapping = aes(x = cut, y = depth, color = clarity)) +
  geom_col() +
  facet_wrap(~color)+
  labs(title = "Colonnes des prix en fonction de la coupe",
       x = "Cut",
       y = "Price",
       fill = "Clarity") +
  theme_minimal()

## graph 2

ggplot(data = diamonds, 
       mapping = aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 1) +
  geom_smooth(method = "lm") +
  labs(title = "Nuage de points représentant le prix en fonction du carat et sa clarté",
       x = "Carat",
       y = "Price",
       color = "Clarity") +
  theme_minimal()
  
## graph3

ggplot(data = starwars, 
       mapping = aes(x = birth_year, y = height, size = mass, color = "lightblue")) +
  geom_point(alpha = 0.7, 
             aes(shape = factor (gender))) +
  facet_wrap(~species) +
  labs(title = "Nuage de point des tailles des personnages en fonction de la date de naissance",
       x = "Birth year",
       y = "Height",
       size = "mass") +
  theme_minimal()
