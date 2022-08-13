#create tibble of users and corresponding IDs, avatars
library(jsonlite)
library(tidyverse)
library(httr)
library(readr)

usersTibble <- tibble(usersFromJSON, .name_repair = "universal")
#unnest metadata object
usersTibble <- unnest(usersTibble, usersTibble$metadata$team_name, usersTibble$metadata$mention_pn, usersTibble$metadata$allow_pn,
                          usersTibble$metadata$avatar, usersTibble$metadata$show_mascots)
#drop redundant or unnecessary columns
usersTibble <- usersTibble %>% select(-c(settings, metadata, league_id, is_owner, is_bot, "usersTibble$metadata$mention_pn",
                                         "usersTibble$metadata$allow_pn", "usersTibble$metadata$show_mascots"))

#rename header columns and add owner_name column
usersTibble <- usersTibble %>% rename_at(vars(orig_user_headers), ~ new_user_headers) %>% 
 mutate( "owner_name" = owner_name$owner_name, .before = "user_name")


write_csv(usersTibble, "usersTibble.csv")
view(usersTibble)