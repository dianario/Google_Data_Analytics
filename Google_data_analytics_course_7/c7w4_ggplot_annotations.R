# c7w4 ggplot annotations
library(tidyverse)
library(palmerpenguins)
data(penguins)

plot <- ggplot(data=penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species))+
  labs(title="Palmer penguins: body masss vs flipper lenght", 
       subtitle="Sample of three penguin species",
       caption="Data collected by Dr. Kristen Gorman")+
  annotate("text", x=220, y =3500, label="the Gentoos are the largest", 
           color="blue", fontface="bold", size=4.5, angle=25)

plot + annotate("text", x=190, y=5000,
               label="Adelie and Chinstrap are equally sized", color="black",
             fontface="bold")
ggsave("ThreePenguinSpecies.png")

