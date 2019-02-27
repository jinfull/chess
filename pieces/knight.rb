require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable

    attr_reader :color, :symbol
    attr_accessor :board, :position

    def initialize(board, position, color)
        @board = board
        @position = position
        @color = color

        @board[*position] = self

        @symbol = :N
    end
end