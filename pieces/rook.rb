require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable

    attr_reader :color, :symbol
    attr_accessor :board, :position

    def initialize(board, position, color)
        @board = board
        @position = position
        @color = color

        @board[*@position] = self

        @symbol = :R
    end

    def move_dirs
        [:e, :w, :n, :s]
    end
end
