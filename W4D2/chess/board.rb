# require_relative 'bishop.rb'
# require_relative 'king.rb'
# require_relative 'knight.rb'
# require_relative 'queen.rb'
# require_relative 'rook.rb'
# require_relative 'pawn.rb'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece
    end


    def [](pos)
        row, col = pos[0], pos[1]
        @rows[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @rows[row][col] = value
    end

    def add_piece(piece , pos)
        self[pos] = piece
    end

    def move_piece(start_pos, end_pos)
        if start_pos.empty?
            raise 'There is no piece'
        end

        if !self.valid_pos?(end_pos)
            raise 'The piece cannot be moved there'
        end

        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

    def valid_pos?(pos)
        pos.each do |ele|
            if !ele.between?(0,7)
                return false
            end
        end
        true
    end

    def checkmate?(color)
        #put the king in check and there is nothing they can do to get ou of the check
    end
    
    def in_check?(color)
        #king is under attack (the opposite can eat the king)
    end

    def find_king

    end

    def pieces
        # @rows[0].each do |ele|
        #     ele 
        # end
        rook = '♜'
        knight = "♞"
        bishop = '♝'
        queen =  '♛'
        king = "♔"
        pawn = "♟"


        row_0 = [rook, knight, bishop, queen, king, bishop, knight, rook]
        row_0.each_with_index do |piece,idx|
            @rows[0][idx] = piece

        end
        row_1 = [pawn, pawn, pawn, pawn, pawn, pawn, pawn, pawn]
        row_1.each_with_index do |piece, idx|
            @rows[1][idx] = piece
        end

        row_6 = [pawn, pawn, pawn, pawn, pawn, pawn, pawn, pawn]
        row_6.each_with_index do |piece, idx|
            @rows[6][idx] = piece
        end

        row_7 = [rook, knight, bishop, queen, king, bishop, knight, rook]
        row_7.each_with_index do |piece,idx|
            @rows[7][idx] = piece

        end
        @rows
    end
end
# row 0 : rook, knight, bishop, queen, king, bishop, knight, rook
# row 1 : pawn, pawn, pawn, pawn, pawn, pawn, pawn, pawn

#2--5 empty

# row 6: pawn, pawn, pawn, pawn, pawn, pawn, pawn, pawn
# row 7: rook, knight, bishop, queen, king, bishop, knight, rook

# rook = Rook.new 
# knight = Knight.new
# bishop = Bishop.new
# queen = Queen.new
# king = King.new
# pawn = Pawn.new


