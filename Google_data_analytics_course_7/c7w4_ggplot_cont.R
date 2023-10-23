library(ggplot2)
library(palmerpenguins)
ggplot(data = penguins, aes(x=flipper_length_mm, y=body_mass_g))+ 
  geom_point(aes(color=species)) +
  facet_wrap(~species)

ggplot(data=diamonds) + geom_bar(mapping=aes(x=color, fill=cut))+
  facet_wrap(~cut)

# facet_grid split values vertically by the val of var1 and horizontally by val 
# of var2
ggplot(data = penguins, aes(x=flipper_length_mm, y=body_mass_g))+ 
  geom_point(aes(color=species)) +
  facet_grid(sex~species)