class Game

  attr_accessor :current_turn

  def initialize
    @board = Board.new
    @turns_remaining = @board.free_fields_count
    @current_turn = 'x'
  end

  def next_turn
    self.current_turn == 'x' ? self.current_turn = 'o' : self.current_turn = 'x'
  end

end
