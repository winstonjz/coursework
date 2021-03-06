require_relative 'piece'
require_relative 'stepping_piece'
class King < Piece
  include Steppable
  def initialize(pos, color)
    super("king", pos, color)
  end

  def to_s
    @color == 'black' ? '♚'.colorize(:black) : '♚'
  end

  def moves
    self.king_moves
  end

  def valid_moves(grid)
    valid_moves = []
    pos_moves = moves

    pos_moves.select! do |pairs|
      x, y = pairs
      x.between?(0, 7) && y.between?(0, 7)
    end

    pos_moves.each do |pairs|
      x, y = pairs
      piece_check = grid[x][y]
      if piece_check.is_a?(Piece)
        if @color != piece_check.color
          valid_moves << pairs
        end
      else
        valid_moves << pairs
      end
    end

    valid_moves
  end
end
