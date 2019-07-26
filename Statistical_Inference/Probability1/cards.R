values <- c("A", as.character(2:10), "J", "Q", "K")
suits <- c("spades", "hearts", "diamonds", "clubs")

# Create a deck as a 13x4 matrix which is easy to verify by eye.
deck <- sapply(suits, function(suit)paste(values, suit, sep=":"))
# Verify.
deck
# Note the value of a card is its row index (if Aces are low.)

# Select n cards from a deck at random without replacement.
hand <- function(n, deck)sample(deck, n, replace=FALSE)

# Deal k hands of n cards each as a kxn matrix.
deal <- function(k, n, deck){
  # Select kxn cards at random without replacement.
  temp <- hand(k*n, deck)
  # Reshape selections into a kxn matrix. Since R
  # fills by column, this is like dealing the cards
  # out in circular order around the table. (Not that
  # it makes any difference since the selection process
  # is a random permutation of the deck anyway.)
  matrix(temp, k, n)
}