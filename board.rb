Dir[File.join(__dir__, 'pieces', '*.rb')].each { |file| require file }

class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) }

        (0..7).each do |row_i|
            (0..7).each do |col_i|
                @board[row_i][col_i] = NullPiece.new
            end
        end
    end

    def render
        (0..7).each do |row|
            (0..7).each do |col|
                print "#{@board[row][col].symbol} "
            end

            puts "\n"
        end

        nil
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