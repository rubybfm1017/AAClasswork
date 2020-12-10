class Queen < Piece
    include Slideable

    def symbol
        '♛'
    end

    def move_dirs
        self.diagonal_dirs + self.horizontal_dirs
    end

end