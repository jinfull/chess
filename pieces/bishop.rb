require_relative "piece"
require_relative "slideable"

class Bishop < Piece
    include Slideable

    attr_reader :color, :symbol
    attr_accessor :board, :position

    def initialize(board, color)
        @board = board
        @color = color

        @symbol = :B
        @position = [3,4]
    end
    
    def move_dirs
        [:ne, :nw, :sw, :se]
    end
end
