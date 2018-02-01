class Board

  attr_accessor :board

  def initialize
    @board = Array.new(3){ Array.new(3, '-') }
  end

  def get_element_value(i, j)
    board[i][j]
  end

  def claim_field(i, j, player)
    board[i][j] = player if is_field_free?(i,j)
  end

  def is_field_free?(i, j)
    get_element_value(i, j) == '-'
  end

  def free_fields_count
    @board.flatten.select {|f| f == '-'}.length
  end

end
