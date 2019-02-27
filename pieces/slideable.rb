require_relative "piece"

module Slideable
    def moves
        all_moves = []
        
        # debugger

        move_dirs.each do |move_dir|
            move_diff = DIRECTIONS[move_dir]
            end_pos = [position.first + move_diff.first, position.last + move_diff.last]
            
            while valid_move?(end_pos)
                all_moves << end_pos
                end_pos = [end_pos.first + move_diff.first, end_pos.last + move_diff.last]
            end
        end

        all_moves
    end

    def valid_move?(move)
        (0..7).include?(move.first) && (0..7).include?(move.last) && @board[*move].is_a?(NullPiece)
    end
end
