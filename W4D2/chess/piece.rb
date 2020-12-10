class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def moves
        moves - move_into_check
    end

    def empty?

    end

    def move_into_check?(end_pos)
        #make a dup of the board
        # move_piece
        # in_check?
    end
end