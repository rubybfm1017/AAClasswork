require './board.rb'

class Game
    def initialize
        @player1 = "Mike"
        @player2 = "Carlos"
        @current_player = @player1
    end

    def get_user_input
        pos = gets.chomp.split(" ").map { |i| i.to_i }
        pos
    end

    def switch_turns
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end
    
end
