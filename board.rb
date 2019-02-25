require_relative "piece"

class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) }

        (0..7).each do |row|
            (0..7).each do |col|
                if (0..1).include?(row) || (6..7).include?(row)
                    @board[row][col] = Piece.new
                end
            end
        end
    end

    def move_piece(start_pos, end_pos)
        raise "there is no piece at #{start_pos}!" if self[*start_pos].nil?
        raise "there is already a piece at #{end_pos}!" unless self[*end_pos].nil?
        # raise "that is not a legal move!" if self[*start_pos].possible_moves.include?([*end_pos])

        self[*end_pos] = self[*start_pos]
        self[*start_pos] = nil
    end

    

    def valid_pos?(pos)
        (0..7).include?(pos.first) && (0..7).include?(pos.last)
    end


    def [](row,col)
        @board[row][col]
    end

    def []=(row,col,value) 
        @board[row][col] = value
    end

end