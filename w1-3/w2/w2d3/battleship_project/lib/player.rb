class Player
    def get_move
        p "enter a position with coordinates separated with a space like `4 7`"
        user_input = gets.chomp
        user_input.split(" ").map do |el|
            el.to_i
        end
    end

    
end
