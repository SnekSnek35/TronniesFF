#create vectors of original userTibble column headers and replacement values
library(tidyverse)
library(httr)
library(jsonlite)
library(readr)

#userTibble original column headers

orig_user_headers <- c("user_id", "display_name", "avatar", 
                       "usersTibble$metadata$team_name", "usersTibble$metadata$avatar")

#create vector of new userTibble column headers
#user_avatar is the avatar of the account, team_avatar is the avatar of the specific team

new_user_headers <- c("user_id", "user_name", "user_avatar", "team_name", "team_avatar")

#read in owner_name column from csv
owner_name <- read_csv("owner_name.csv", col_names = TRUE)
