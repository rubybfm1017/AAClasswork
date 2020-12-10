class Bishop < Piece
    include Slideable

    def symbol
        '♝'
    end

    def move_dirs
        self.diagonal_dirs
    end

end