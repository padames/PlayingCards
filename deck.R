
load_deck <- function() {
  # load the data directly from the book website
  deck <- read_csv("https://gist.githubusercontent.com/garrettgman/9629323/raw/ee5dfc039fd581cb467cc69c226ea2524913c3d8/deck.csv")
  deck
}

# deck for black jack

create_deck_black_jack <- function(deck) {
  # make a copy
  deck_bj <- deck

  # prepare the filter for face cards
  filter_face_cards = deck$face %in% c("king", "queen","jack")
  
  # assign value to face cards
  deck_bj$value[filter_face_cards] <- 10
  
  # assign missing value to aces
  
  deck_bj$value[deck_bj$face == "ace"] <- NA

  deck_bj
}