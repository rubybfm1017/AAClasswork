require "./board.rb" 
require "./human_player.rb"
class Game
    def initialize(player_1_mark, player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @current_player = @player1
        @board = Board.new
    end
    
    def switch_turn
        if @current_player != @player1
            @current_player = @player1
        else
            @current_player = @player2
        end
    end
    def play 
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "victory" + @current_player.mark
                return
            else
                self.switch_turn
                
            end
        end
        p "draw"
    end
end
