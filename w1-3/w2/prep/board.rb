class Board
    COOL_VARIABLE = 1 #CLASS CONSTANT

    # attr_reader :size 
    # attr_writer :size

    attr_accessor :size

    def initialize(num_rows)
        @@color = "blue"
        @size = num_rows * num_rows
        # @grid =  Array.new(num_rows, []) # can we do this????? => Nope
        @grid =  Array.new(num_rows) { [] } # can we do this????? => Nope
    end

    def [](pos)
        row, col = pos 
        # row = pos[0]
        # col = pos[1]
        @grid[row][col]
    end

    def []=(pos, value)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = value
        # self[pos] = value # You cannot do this
        # self[]=(pos, value) # You cannot do this
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |row| row.all?(mark) }
    end

    def win_diagonal?(mark)
        left_to_right_diagonal = (0...@grid.length).all? do |i|
            pos = [i, i]
            # @grid[i][i] could do this
            # @grid[pos] # can't do this because @grid is an array
            self[pos] == mark
        end

        right_to_left = (0...@grid.length).all? do |i|
            pos = [i, @grid.length - 1 - i]
            # pos = [i, - 1 - i]
            self[pos] == mark
        end
        left_to_right_diagonal || right_to_left
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
        # self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end
    
    # def size
    #     @size
    # end

    # def size=(new_size)
    #     @size = new_size
    # end

    #instance 
    def my_method # Board#my_method
        @my_variable = 5
    end

    def new_method
        # self.my_method
        my_method 
    end

    def self.my_other_method # Board::my_other_method
        @@my_class_variable = true 
    end


end

board = Board.new(4)
# board.my_method #instance method

# Board.my_other_method #class method
p board.size
board.size = 25
# board.size=(25)
p board.size