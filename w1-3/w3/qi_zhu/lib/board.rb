class Board
    attr_reader :size

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end

    def initialize(size)
        @size = size
        @grid = Array.new(size){Array.new(size)}
    end 

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col] 
    end

    def []=(pos, mark)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.any? {|row|row.all?(mark)}
    end

    def complete_col?(mark)
        @grid.transpose.any?{|row|row.all?(mark)}
    end

    def complete_diag?(mark)
        length = @grid.size
        return true if (0...length).all?{|i| @grid[i][i] == mark}
        return true if (0...length).all?{|i| @grid[i][- i - 1] == mark}
        return false
    end

    def winner?(mark)
        complete_col?(mark) || complete_row?(mark) || complete_diag?(mark)
    end
end
