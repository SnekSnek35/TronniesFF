#create tibble of player data
library(jsonlite)
library(tidyverse)
library(httr)
library(readxl)

#create tibble of player data
playersTibble <- tibble(playersFromJSON, .name_repair = "universal")


#unnest individual player objects, delete columns that are type list (metadata, fantasy_positions)
#only 7 players have multiple fantasy positions and half of them are retired
#kelvin benjamin is listed as both a WR and TE lololololol
playersTibble <- unnest_wider(playersTibble, col = 1) %>% 
  #drop irrelevant columns, or columns with list objects c(metadata, fantasy_positions)
  select(-c(metadata, fantasy_positions, high_school, full_name, sport, depth_chart_position, depth_chart_order,
            news_updated, sportradar_id, search_first_name, search_last_name, hashtag, gsis_id, injury_notes, practice_description)) %>% 
  #relocate player information to beginning of tibble
  relocate(player_id, first_name, last_name, team, position) %>% 
  #filter only fantasy positions and active players
  filter(active == "TRUE" & position %in% c("QB", "RB", "WR", "TE", "DEF") & team != "NA") %>% 
  #concatenate names to have team defense names in one field
  unite("full_name", first_name, last_name, sep = " ", remove = FALSE)



#write to csv
#write_excel_csv coerces data to columns much better than basic write_csv
write_excel_csv(playersTibble, "all_Player_data.csv")

#view player tibble
#view(playersTibble)