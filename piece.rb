require_relative "board"

class Piece
    attr_reader

    def initialize        
        
    end

    def moves
        # returns an array of positions a Piece can move to
    end
end

# MOVES hash / will this conflict with MOVES constant in cursor.rb?

MOVES = {
    e: [0, 1],
    w: [0, -1],
    n: [-1, 0],
    s: [1, 0],
    ne: [-1, 1],
    nw: [-1, -1],
    sw: [1, -1],
    se: [1, 1]
}
 

#

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
    attr_accessor :board, :position

    def initialize(board, color)
        @board = board
        @color = color

        @symbol = :B
        # @position = [0,0]
    end
    
    def move_dirs
        [:ne, :nw, :sw, :se]
    end
end

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
