require_relative "piece"
require_relative "slideable"

class Bishop < Piece
    include Slideable

    attr_reader :color, :symbol
    attr_accessor :board, :position

    def initialize(board, position, color)
        @board = board
        @position = position
        @color = color

        @board[*@position] = self

        @symbol = :B
    end
    
    def move_dirs
        [:ne, :nw, :sw, :se]
    end
end
