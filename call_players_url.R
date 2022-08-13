#RUN THIS CALL SPARINGLY PER SLEEPER API - LARGE FILE SIZE

#fetch all players in nfl
library(httr)
library(jsonlite)
library(listviewer)
library(curl)


#fetch all players
playersUrl = "https://api.sleeper.app/v1/players/nfl"

#convert from JSON
playersFromJSON <- fromJSON(playersUrl)

#print to viewer
print(listviewer::jsonedit(playersFromJSON))
