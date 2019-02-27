require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable

    attr_reader :color, :symbol
    attr_accessor :board, :position

    def initialize(board, color)
        @board = board
        @color = color

        @symbol = :Q
        # @position = 
    end

    def move_dirs
        [:e, :w, :n, :s, :ne, :nw, :sw, :se]
    end

end
