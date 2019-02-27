class Piece
    attr_reader :color, :board, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def moves
        # returns an array of positions a Piece can move to
    end
end

module Slideable
    # def 
end

module Stepable

end



# sliding pieces
# need to implement sliding module?

class Bishop < Piece
    include Slideable

    
    def move_dirs
        return true if self == Bishop

        false
    end


end

class Rook < Piece
    include Slideable


end

class Queen < Piece
    include Slideable


end

# stepping pieces
# need to implement stepping module?

class Knight < Piece
    include Stepable
end

class King < Piece
    include Stepable

end

# null pieces (occupy empty spaces)

# class NullPiece < Piece
#     include Singleton

# end

# PAWNs

class Pawn < Piece


end
