require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable

    attr_reader :color, :symbol
    attr_accessor :board, :position

    def initialize(board, color)
        @board = board
        @color = color

        @symbol = :R
        # @position = 
    end

    def move_dirs
        [:e, :w, :n, :s]
    end
end
