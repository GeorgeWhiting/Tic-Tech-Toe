class Game

  attr_accessor :current_turn, :remaining_turns
  attr_reader :board

  def initialize(board_class = Board)
    @board = board_class.new
    @current_turn = 'x'
    @remaining_turns = 9
  end

  def switch_player
    self.current_turn == 'x' ? self.current_turn = 'o' : self.current_turn = 'x'
    @remaining_turns -= 1
  end

  def do_turn(i,j)
    @board.claim_field(i, j, @current_turn)
    switch_player if (@remaining_turns == @board.free_fields_count+1)
  end

end
