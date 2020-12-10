class King < Piece
    include Stepable

    def symbol
        "♔"
    end

    def move_diffs
        dirs = [[-1,-1], [-1, 0],[-1, 1],[0, -1],[0, 1], [1, -1],[1, 0], [1, 1]]
        return dirs
    end

end