require_relative "piece"

class NullPiece < Piece
    attr_reader :symbol

    def initialize
        @symbol = "-"
    end
end
