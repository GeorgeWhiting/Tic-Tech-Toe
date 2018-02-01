require './lib/board'
require './lib/game'

board = Board.new

board.claim_field(1,1,'x')



  p "#{board.board[0][0]} | #{board.board[0][1]} | #{board.board[0][2]}"
  p " --------"
  p "#{board.board[1][0]} | #{board.board[1][1]} | #{board.board[1][2]}"
  p " --------"
  p "#{board.board[2][0]} | #{board.board[2][1]} | #{board.board[2][2]}"
