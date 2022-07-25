library(tidyverse)
library(dplyr)
library(data.table)

diamonds

diamonds%>%
  select(carat,cut,price)%>%
  filter(cut == "Premium")%>%
  filter(price > 7000 & price < 10000)%>%
  arrange(desc(carat))%>%
  slice(1:20)

diamonds.dt <- data.table(diamonds)

diamonds1 <- diamonds.dt[cut == "Premium" & price > 7000 & price < 10000, .(carat, cut, price)]
diamonds2 <- diamonds1[order(-carat)]
diamonds3 <- diamonds2[1:20]
diamonds3
