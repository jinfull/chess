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
        (0..7).include?(move.first) && (0..7).include?(move.last) && @board[*move].is_a?(NullPiece)
    end
end