library(ggplot2)

# Dataset
Dt.Plot <- read.csv('Raster.csv')
head(Dt.Plot)

# Set as factor 
Dt.Plot$'Level' <- 1
Dt.Plot$State <- factor(Dt.Plot$State, 
                        levels = c('Baseline 1', 'Signal 1', 'Baseline 2', 'Signal 2'))
# Figure
p <- 
  ggplot(Dt.Plot, aes(x = Time, 
                      y = Level, 
                      fill = State)) + 
  geom_bin_2d(stat = "identity") + 
  scale_x_continuous(
    expand = c(0, 0)) + 
  scale_y_continuous(
    expand = c(0, 0)) +
  labs(x = 'Time (s)', y = 'States of Neural Behavior') + 
  theme_bw() +                                                      # dark-on-light theme
  theme(panel.border = element_rect(colour = "black"),
        panel.grid = element_blank(),
        axis.text.x = element_text(colour = "black", size = 11),          # text to the left side for 1 unit 
        axis.text.y = element_blank(),
        axis.ticks.x = element_line(),                              
        axis.ticks.y = element_blank(),
        axis.title.x = element_text(colour = "black", size = 11, face = 'bold'),                              
        axis.title.y = element_text(colour = "black", size = 11, face = 'bold'),
        legend.title = element_blank())  

p