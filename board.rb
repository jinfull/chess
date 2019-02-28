Dir[File.join(__dir__, 'pieces', '*.rb')].each { |file| require file }

require "byebug"

class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) }

        @board.each_with_index do |row, i|
            row.each_with_index do |col, j|
                @board[i][j] = NullPiece.new
            end
        end

        self.populate_board
    end

    def populate_board
        #red
        self[0,0] = Rook.new(self, [0,0], :red)
        self[0,7] = Rook.new(self, [0,7], :red)

        self[0,1] = Knight.new(self, [0,1], :red)
        self[0,6] = Knight.new(self, [0,6], :red)

        self[0,2] = Bishop.new(self, [0,2], :red)
        self[0,5] = Bishop.new(self, [0,5], :red)

        self[0,3] = Queen.new(self, [0,3], :red)
        self[0,4] = King.new(self, [0,4], :red)

        #green
        self[7,0] = Rook.new(self, [7,0], :green)
        self[7,7] = Rook.new(self, [7,7], :green)

        self[7,1] = Knight.new(self, [7,1], :green)
        self[7,6] = Knight.new(self, [7,6], :green)

        self[7,2] = Bishop.new(self, [7,2], :green)
        self[7,5] = Bishop.new(self, [7,5], :green)

        self[7,3] = Queen.new(self, [7,3], :green)
        self[7,4] = King.new(self, [7,4], :green)

        @board[1].each_with_index do |el, i|
            el = Pawn.new(self, [1, i], :red)
        end

        @board[7].each_with_index do |el, i|
            el = Pawn.new(self, [6, i], :green)
        end
    end

    # def render
    #     (0..7).each do |row|
    #         (0..7).each do |col|
    #             print "#{@board[row][col].symbol} "
    #         end

    #         puts "\n"
    #     end

    #     nil
    # end

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