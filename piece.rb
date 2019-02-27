class Piece
    attr_reader :value

    def initialize(value)
        @value = value
    end

    def moves
        # returns an array of positions a Piece can move to
    end
end

module Sliding

end

module Stepping

end



    # sliding pieces
# need to implement sliding module?

class Bishop < Piece

end

class Rook < Piece


end

class Queen < Piece

end

# stepping pieces
# need to implement stepping module?

class Knight < Piece

end

class King < Piece


end

# null pieces (occupy empty spaces)

class NullPiece < Piece


end

# PAWNs

class Pawn < Piece


end
