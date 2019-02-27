require_relative "../board.rb"

require "byebug"

class Piece
    attr_reader

    def initialize        
        
    end

    def moves
        # returns an array of positions a Piece can move to
    end
end

DIRECTIONS = {
    e: [0, 1],
    w: [0, -1],
    n: [-1, 0],
    s: [1, 0],
    ne: [-1, 1],
    nw: [-1, -1],
    sw: [1, -1],
    se: [1, 1]
}

