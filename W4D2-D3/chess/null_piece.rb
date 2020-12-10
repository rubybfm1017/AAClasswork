class NullPiece < Piece
    include Singleton

    def initialize
        @color = ''
        @symbol = ''
    end

    def moves
        nil
    end

    def symbol
        @symbol
    end


end