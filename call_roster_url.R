#get all rosters in league

library(httr)
library(jsonlite)
library(listviewer)
library(curl)

#concatenate to get user url
rostersUrl = paste0(base,leagueID,"/","rosters")

#convert from JSON
rostersFromJSON <- fromJSON(rostersUrl)

#print to viewer
print(listviewer::jsonedit(rostersFromJSON))