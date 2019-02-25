class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) }

        @board.each do |row|
            row.each do |col|
                if (0..1).include?(row) || (6..7).include?(row)
                    @board[row][col] = Piece.new
                else
                    @board[row][col] = nil
                end
            end
        end
    end





end