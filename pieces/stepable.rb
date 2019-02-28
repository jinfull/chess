require_relative "piece"

module Stepable
    def moves
        if symbol == :N
            positions = [
                [position.first - 2, position.last - 1], [position.first - 2, position.last + 1], 
                [position.first - 1, position.last - 2], [position.first - 1, position.last + 2], 
                [position.first + 1, position.last - 2], [position.first + 1, position.last + 2], 
                [position.first + 2, position.last - 1], [position.first + 2, position.last + 1]
            ]

            positions.select { |pos| valid_move?(pos) }

        else
            all_moves = []

            DIRECTIONS.values.each do |direction|
                possible_dir = [position.first + direction.first, position.last + direction.last]
                
                if valid_move?(possible_dir)
                    all_moves << possible_dir
                end
            end

            all_moves
        end

    end



    def valid_move?(move)
        inbounds?(move) && (empty_space?(move) || enemy_in_pos?(move))
    end

    def inbounds?(move)
        (0..7).include?(move.first) && (0..7).include?(move.last)
    end

    def empty_space?(move)
        @board[*move].is_a?(NullPiece)
    end

    def enemy_in_pos?(move)
        !@board[*move].is_a?(NullPiece) && @board[*move].color != self.color
    end

end