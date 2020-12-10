class Knight < Piece
    include Stepable

    def symbol
        "♞"
    end

    def move_diffs
        dirs = [[2, 1], [1, 2],[-1, 2],[-2, 1],[-2, -1], [-1, -2],[1, -2], [2, -1]]
        return dirs
    end

end