require_relative "board"
require_relative "cursor"
Dir[File.join(__dir__, 'pieces', '*.rb')].each { |file| require file }

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
                pos = [row_i, col_i]

                if pos == @cursor.cursor_pos
                    print "#{@board[*pos].symbol} ".colorize(:blue)
                elsif !@board[*pos].is_a?(NullPiece)
                    print "#{@board[*pos].symbol} ".colorize(@board[*pos].color)
                else
                    print "#{@board[*pos].symbol} "
                end
            end

            puts "\n"
        end
        
        nil
    end

    def make_move_clone
        until @cursor.get_input == @cursor.cursor_pos
            self.render
        end
    end
end