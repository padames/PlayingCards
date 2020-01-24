source("deck.R")
source("setup.R")
deck <- load_deck()
cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle

rm(deck)

shuffle()

print(deal())

print(deal())