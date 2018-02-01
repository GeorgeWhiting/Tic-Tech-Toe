class Board

  attr_accessor :board

  def initialize
    @board = Array.new(3, Array.new(3, '-'))
  end

  def get_element_value(i, j)
    board[i][j]
  end

  def claim_field(i, j, player)
    board[i][j] = player
  end

end
