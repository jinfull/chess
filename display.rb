require_relative "board"
require_relative "cursor"

require "colorize"

class Display
    attr_reader :board, :cursor
    
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end

    def render
        (0..7).each do |row_i|
            (0..7).each do |col_i|
                if @board[row_i,col_i].is_a?(Piece)
                    print "#{@board[row_i,col_i].value} "
                else
                    print "- "
                end
            end

            puts "\n"
        end
        
        nil
    end




end