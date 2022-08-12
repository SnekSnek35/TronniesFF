library(httr)
library(jsonlite)
library(listviewer)
library(curl)

#concatenate to get user url
usersUrl = paste0(base,leagueID,"/","users")

#convert from JSON
usersFromJSON <- fromJSON(usersUrl)

#print to viewer
print(listviewer::jsonedit(usersFromJSON))
