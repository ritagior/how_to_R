## Decluttered bar chart
library(tidyverse)


data <- data.frame(
  cat = c("until 10", "from 11 to 15", "from 16 to 20 ",
          "from 21 to 25 ", "from 26 a 30", "Over 30"),
  value = c(3.7, 9.9, 22.2, 21.4, 40.9, 1.9)
)

data_bar <- data %>%
  mutate(index = rownames(data),
         cat = factor(cat, levels = cat))

data_bar %>%
  ggplot(aes(y = value, x = cat, fill = "#19869B")) +
  geom_col() +
  theme_minimal() +
  geom_text(aes(x = cat, y = value + 0.9 ,
                label = paste(value, "%")),
            size = 6, hjust = 0.4) +
  scale_fill_manual(values = "#19869B", name = "") +
  theme(legend.text = element_text(size = 16),
        legend.position = "bottom",
        plot.caption = element_text(hjust = 1)) +
  guides(fill=guide_legend(nrow=1,byrow=TRUE)) +
  labs(
    title = "Duration of mortgages",
    caption = "Graphic: Rita Giordano, Source: Corriere della sera"
  ) +
  xlab("years") + ylab("") +
  theme(
    plot.title = element_text(size = 30, hjust = 0.5),
    plot.caption = element_text(size = 11),
    legend.position = "none",
    axis.text.x = element_text(size = 16, colour = "black", vjust = 5),
    axis.title.x = element_text(size = 18),
    axis.ticks = element_blank(),
    axis.text.y = element_blank(),
    panel.grid = element_blank()
  )

