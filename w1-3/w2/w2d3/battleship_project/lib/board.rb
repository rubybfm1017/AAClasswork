require "byebug"
class Board
    attr_reader :size
    def initialize(num)
        @grid = Array.new(num) { Array.new(num, :N)}
        @size = num * num
    end
    def [](position)
        row = position[0]
        col = position[1]
        return @grid[row][col]
    end
    def []=(position, value)
        row = position[0]
        col = position[1]
        @grid[row][col] = value
    end
    def num_ships
        count = 0 
        @grid.flatten.each { |el| count += 1 if el == :S }
        count
    end
    def attack(position)
        if self.[](position) == :S 
            self.[]=(position, :H)
            p "you sunk my battleship!"
            return true
        else  
            self.[]=(position, :X)
            return false
        end
    end
    
    def place_random_ships
        num = (@size * 25) / 100
        # i = 0
        while self.num_ships < num # 1,1 
            @grid[rand(0..@grid.length - 1)][rand(0..@grid.length - 1)] = :S
            # i += 1
        end
    end
    
    def hidden_ships_grid
        @grid.map do |subarr|
            subarr.map do |ele|
                ele == :S ? :N : ele
            end
        end
    end
    def self.print_grid(arr)
        arr.each { |subarr| puts subarr.join(" ")}
    end
    def cheat
        Board.print_grid(@grid)
    end
    def print
        Board.print_grid(self.hidden_ships_grid)
    end
    

end
