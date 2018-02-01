require './lib/board'

board = Board.new

p board.board[1][1]
board.claim_field(board.board[1][1], 'x')
p board.board[1][1]
