class TicTacToe
  def self.check(*args)
    new(*args).check
  end

  def initialize(board)
    @board = board
  end

  def check
    return 1 if inline_board.any? { |line| line == [1] }
    return 2 if inline_board.any? { |line| line == [2] }
    return -1 if inline_board.any? { |line| line.include?(0) }

    0
  end

  private

  attr_reader :board

  def inline_board
    @inline_board ||= (lines + rows + [right_cross] + [left_cross]).map(&:uniq)
  end

  def lines
    board
  end

  def rows
    board.transpose
  end

  def right_cross
    cross_for(:right)
  end

  def left_cross
    cross_for(:left)
  end

  def cross_for(direction)
    positions = (0..2).to_a
    positions.reverse! if direction == :left

    positions.map.with_index { |r, i| board[i][r] }
  end
end
