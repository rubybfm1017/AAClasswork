class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(3){Array.new(3,"_")}
    end
    def valid?(position)
        row = position[0]
        col = position[1]
        if row < @grid.length && col < @grid.length
            return true
        else  
            return false
        end
    end
    def empty?(position)
        row = position[0]
        col = position[1]
        @grid[row][col] == "_"
    end
    def place_mark(position, mark)
        if !valid?(position) || !empty?(position)
            raise " try another position "
        else
            @grid[position[0]][position[1]] = mark
        end 
    end

    def print
        @grid.each do |subarr|
            p subarr
        end
    end
    def win_row?(mark)
        @grid.each do |subarr|
            if subarr.all? {|ele| ele == mark}
                return true
            end
        end
        return false
    end
    def win_col?(mark)
        @grid.transpose.each do |subarr|
            if subarr.all? {|ele| ele == mark}
                return true
            end
        end
        return false
    end
    def win_diagonal?(mark)
         (@grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]) || (@grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0])
    end
    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        else
            return false
        end 
    end
    
    def empty_positions?
        @grid.any?{|subarr| subarr.include?("_")}
    end


end

# board = Board.new
# # p board.valid?([0,1]) #true
# # p board.valid?([3,4]) #false
# board.place_mark([0,2],"O")
# board.print
