require_relative "piece"
require "byebug"

class Pawn < Piece
    attr_reader :color, :symbol
    attr_accessor :board, :position

    def initialize(board, position, color)
        @board = board
        @position = position
        @color = color

        @board[*@position] = self

        @symbol = :P
    end

    def moves
        all_moves = []


        if @color == :red 
            return [] if position.first == 7

            one_spot_ahead = [position.first + 1, position.last]
            two_spots_ahead = [position.first + 2, position.last]
            diagonal_sw = [position.first + 1, position.last - 1]
            diagonal_se = [position.first + 1, position.last + 1]
            
            all_moves << one_spot_ahead if @board[*one_spot_ahead].is_a?(NullPiece)

            if position.first == 1 && @board[*one_spot_ahead].is_a?(NullPiece)
                all_moves << two_spots_ahead if @board[*two_spots_ahead].is_a?(NullPiece)
            end

            if !@board[*diagonal_sw].is_a?(NullPiece) && @board[*diagonal_sw].color != self.color
                all_moves << diagonal_sw
            end

            if !@board[*diagonal_se].is_a?(NullPiece) && @board[*diagonal_se].color != self.color
                all_moves << diagonal_se
            end

            all_moves.select { |move| inbounds?(move) }

            

        else
            return [] if position.first == 0
            
            one_spot_ahead = [position.first - 1, position.last]
            two_spots_ahead = [position.first - 2, position.last]
            diagonal_nw = [position.first - 1, position.last - 1]
            diagonal_ne = [position.first - 1, position.last + 1]

            all_moves << one_spot_ahead if @board[*one_spot_ahead].is_a?(NullPiece)

            if position.first == 6 && @board[*one_spot_ahead].is_a?(NullPiece)
                all_moves << two_spots_ahead if @board[*two_spots_ahead].is_a?(NullPiece)
            end

            if !@board[*diagonal_nw].is_a?(NullPiece) && @board[*diagonal_nw].color != self.color
                all_moves << diagonal_nw
            end

            if !@board[*diagonal_ne].is_a?(NullPiece) && @board[*diagonal_ne].color != self.color
                all_moves << diagonal_ne
            end

            all_moves.select { |move| inbounds?(move) }            
        end
    end

    def valid_move?(move)
        inbounds?(move) # && some other stuff 
    end

    def inbounds?(move)
        (0..7).include?(move.first) && (0..7).include?(move.last)
    end
end
