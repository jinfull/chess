require_relative "piece"

module Slideable
    def moves
        all_moves = []
        
        move_dirs.each do |move_dir|
            move_diff = DIRECTIONS[move_dir]
            end_pos = [position.first + move_diff.first, position.last + move_diff.last]
            
            while in_bounds?(end_pos) && (empty_space?(end_pos) || enemy_in_pos?(end_pos))
                all_moves << end_pos

                break if enemy_in_pos?(end_pos)

                end_pos = [end_pos.first + move_diff.first, end_pos.last + move_diff.last]
            end
        end

        all_moves
    end

    def in_bounds?(move)
        (0..7).include?(move.first) && (0..7).include?(move.last)
    end

    def empty_space?(move)
        @board[*move].is_a?(NullPiece)
    end

    def enemy_in_pos?(move)
        !@board[*move].is_a?(NullPiece) && @board[*move].color != self.color
    end

end
