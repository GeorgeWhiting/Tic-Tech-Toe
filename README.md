# Tic-Tech-Toe

Makers Academy week 10

Time allowed: 13 hours

### Rules:

- There are two players in the game (X and O)
- Players take turns until the game is over
- A player can claim a field if it is not already taken
- A turn ends when a player claims a field
- A player wins if they claim all the fields in a row, column or diagonal
- A game is over if a player wins
- A game is over when all fields are taken

##### Main challenge:

Figuring out how to check that a game had been won was the biggest challenge.

A brute force method, checking all 8 possible winning combinations each turn, is really inefficient

To reduce the number of checks the win_check method uses each time it is called, I changed it to only check the row and column altered by the last move.

At this point in time, the diagonal win conditions are still both hard coded, but the win_check method is still doing half the work it would otherwise have to.

To refactor the win_check method further I could add a conditional that the diagonals are only checked if the last move was in a corner square or the middle square, however this is not reducing the total amount of work the method has to do, just preventing unnecessary diagonal checks.
