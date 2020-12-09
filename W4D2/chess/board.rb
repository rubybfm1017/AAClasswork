class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece
    end


    def [](pos)
        row, col = pos
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

end