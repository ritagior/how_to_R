library(tidyverse)
library(MetBrewer)
library(ggrepel)


data <- data.frame(
  cat = c("label1", "label2",
          "label3", "label4"),
  value = c(13.6, 22.2, 21.4, 42.8)
)

data_donut <- data %>%
  mutate(ymax = cumsum(value),
         ymin = c(0, head(ymax, n = -1)))

data_donut$label_pos <- (data_donut$ymax + data_donut$ymin) /2



data_donut %>%
  ggplot(aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3,
             fill = cat)) +
  geom_rect() +
  coord_polar(theta = "y") +
  xlim(c(1.8, 4)) +
  geom_text_repel(aes(x = 3.45, y = label_pos,
                      label = cat),
                  size = 6, hjust = 0.5,
                  force = 0.5,
                  nudge_x = 0.5, direction = "y",
                  segment.curvature = -0.1 ,
                  segment.ncp = 30,
                  segment.angle = 20, seed = 123
  ) +
  theme_void() +
  scale_fill_manual(values = met.brewer("Egypt", 6), name = "") +
  theme(legend.position = "none",
        plot.title = element_text(size = 28, hjust = 0.5),
        plot.margin = margin(
          t = 50, r = 15, b = 1, l = 20, unit = "pt"),) +
  guides(fill=guide_legend(nrow=1,byrow=TRUE)) +
  labs(
    title = "Your title here",
    caption = "Source and other information here"
  )
