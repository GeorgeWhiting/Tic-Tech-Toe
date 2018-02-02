require './lib/board'
require './lib/game'

game = Game.new

game.do_turn(1,0)
# game.do_turn(2,1)
# game.do_turn(2,0)
# game.do_turn(2,2)
# game.do_turn(0,0)

p game.board.board[1]


  p "#{game.board.board[0][0]} | #{game.board.board[0][1]} | #{game.board.board[0][2]}"
  p "---------"
  p "#{game.board.board[1][0]} | #{game.board.board[1][1]} | #{game.board.board[1][2]}"
  p "---------"
  p "#{game.board.board[2][0]} | #{game.board.board[2][1]} | #{game.board.board[2][2]}"
