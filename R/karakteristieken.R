library(tidyverse)

data <- read_csv2("data/mafa_2022.csv")

n_monsters <- data %>% select(meetpunt, datum) %>% distinct() %>% nrow()

n_taxa <- data %>% select(naam) %>% distinct() %>% nrow()

# monsters <- 
  data %>% 
  group_by(meetpunt, datum) %>% 
  mutate(waarde_tot = sum(waarde),
         waarde_rel = waarde / waarde_tot,
         rank = min_rank(-waarde),
         taxa_tot = n()) %>% View()


# Monsters totaal ---------------------------------------------------------

  data %>% 
    group_by(meetpunt, datum) %>% 
    summarise(n_taxa = n(),
              n_ind  = sum(waarde))
  
  

# Taxa totaal -------------------------------------------------------------

# Taxon: Aantal keer waargenomen (in hoeveel monsters)
# Taxon: Percentage aantal keer waargenomen (uitgedrukt tov het totaal aantal monsters)
# Taxon: Gemiddeld aantal individuen
# Taxon: Mediaan aantal individuen
# Taxon: Maximaal aantal waargenomen individuen
# Taxon: Hoe vaak het taxon met de meeste individuen
# Taxon: Hoe vaak het taxon met het aantal individuen in de top 3
  
    
# taxa_totaal <- 
  data %>% 
  group_by(meetpunt, datum) %>% 
  mutate(waarde_tot = sum(waarde),
         waarde_rel = waarde / waarde_tot,
         rank = min_rank(-waarde), # rank van boven en rank van beneden gebruiken
         n_taxa = n()) %>% 
  group_by(naam) %>% 
  summarise(aantal_keer = n(),
            aantal_keer_rel = aantal_keer / n_monsters,
            gem_abundance = mean(waarde),
            med_abundance = median(waarde),
            max_abundance = max(waarde),
            dom_spec1     = sum(rank == 1),
            dom_spec3     = sum(rank <= 3)) %>% View()
    

  
 