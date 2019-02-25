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
        begin
            
        rescue => exception
            
        end


    end

    

    def [](row,col)
        @board[row][col]
    end

    def []=(row,col,value) 
        @board[row][col] = value
    end

end