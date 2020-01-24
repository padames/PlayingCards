# function designed to seal off the functions and the state that will contain the deck
# becaue the functions are returned with the environemnt they were created in...they will
# have access to the full and original DECK for shuffling
setup <- function(deck) {
  # create a copy in the runtime environment
  DECK <- deck
  
  # this function will return the top card form the deck and update it
  # It will return NAs after being called 52 times without calling shuffle in between
  DEAL <- function() {
    card <- deck[1, ]
    # update the deck in the parent (enclosing) environment of their runtime environment
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  
  # calling this function will reset the deck to the original one and shuffle it
  # just like in the real game
  SHUFFLE <- function() {
    random <- sample(1:52, size = 52)
    # update the deck in the parent (enclosing) environment of their runtime environment
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  
  # return the functions with their enclosing environments
  list(deal=DEAL, shuffle = SHUFFLE)
}
