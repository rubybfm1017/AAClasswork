class Rook < Piece
    include Slideable

    def symbol
        '♖'
    end

    def move_dirs
        self.horizontal_dirs
    end

end