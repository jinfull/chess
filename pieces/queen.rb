require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable

    attr_reader :color, :symbol
    attr_accessor :board, :position

    def initialize(board, position, color)
        @board = board
        @position = position
        @color = color

        @board[*@position] = self

        @symbol = :Q
    end

    def move_dirs
        [:e, :w, :n, :s, :ne, :nw, :sw, :se]
    end

end
