library(tidyverse)
library(twn)

read_csv2("data_raw/Biologische_meetgegevens_HHSK.csv") %>% 
  filter(methodecode == "MAFA",
         year(datum) %in% (2022)) %>% 
  mutate(naam = twn_voorkeurnaam(naam),
         naam = increase_taxonlevel(naam, "Species")) %>% 
  filter(is_taxonlevel(naam, "Species")) %>% # Bij deze stap valt bijna een derde weg!
  group_by(meetpunt, datum, naam) %>% 
  summarise(waarde = sum(waarde_stadiummeting)) %>% 
  ungroup() %>% 
  write_csv2("data/mafa_2022.csv", na = "")
  
