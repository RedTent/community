library(tidyverse)

data <- read_csv2("data/mafa_2022.csv")

n_monsters <- data %>% select(meetpunt, datum) %>% distinct() %>% nrow()

n_taxa <- data %>% select(naam) %>% distinct() %>% nrow()

# monster_totaal <- 
  data %>% 
  group_by(meetpunt, datum) %>% 
  mutate(waarde_tot = sum(waarde),
         waarde_rel = waarde / waarde_tot,
         rank = min_rank(-waarde),
         taxa_tot = n()) %>% View()

# taxa_totaal <- 
  data %>% 
  group_by(naam) %>% 
  summarise(aantal_keer = n(),
            aantal_keer_rel = aantal_keer / n_monsters,
            gem_abundance = mean(waarde),
            max_abundance = max(waarde)) 
