require_relative "board"
require_relative "cursor"

require "colorize"

class Display
    attr_reader :board
    
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end




end