require_relative "board"

class Piece
    attr_reader

    def initialize        
        
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

    attr_reader :color, :symbol
    attr_accessor :position

    def initialize(board)
        @board = board

        @color = :B
        @symbol = :B
        @position = [0,0]
    end
    
    def move_dirs
        
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

class NullPiece < Piece
    attr_reader :symbol

    def initialize
        @symbol = "-"
    end
end

# PAWNs

class Pawn < Piece


end
