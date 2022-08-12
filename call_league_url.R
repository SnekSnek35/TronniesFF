library(httr)
library(jsonlite)
library(listviewer)
library(curl)

#create base url
base = "https://api.sleeper.app/v1/league/"
year = "2022"
leagueID = "860920784586158080"
leagueAvatar = "70483a187359ebc96b02c9c8c64e0753"

#concatenate url and store
leagueUrl = paste0(base,leagueID)

SleeperFromJSON <- jsonlite::fromJSON(leagueUrl)

print(listviewer::jsonedit(SleeperFromJSON))

