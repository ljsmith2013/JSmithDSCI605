library(tidyverse)

salaries <- read_csv("Salaries.csv")

salaries_new <- salaries %>% 
  select(rank, discipline,sex,salary) %>%
  filter(salary != "") %>%
  group_by(rank, discipline, sex) %>%
  count(rank,discipline, sex)

wide <- salaries_new %>%
  spread(sex, n, fill=FALSE)

back_to_long <- wide %>%
  gather(sex, n, (ncol(wide)-1):ncol(wide),na.rm=TRUE)