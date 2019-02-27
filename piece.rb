class Piece
    attr_reader :value

    def initialize(value)
        @value = value
    end

    def moves
        # returns an array of positions a Piece can move to
    end
end