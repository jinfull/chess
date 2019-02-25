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
                if [row_i,col_i] == @cursor.cursor_pos
                    print "#{@board[row_i,col_i].value.colorize(:blue)} "
                else 
                    print "#{@board[row_i,col_i].value} "
                end
            end

            puts "\n"
        end
        
        nil
    end

    def make_move_clone

        while true
            @cursor.get_input
            self.render
        end
        
    end




end