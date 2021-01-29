class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end
    
    def get_position
        p "enter a position with 2 numbers, add a space between them like 4 7"
        use_input = gets.chomp.split(" ").map{|ele| ele.to_i}
        if  use_input.length != 2 || !use_input.all?{|ele| ele.instance_of?(Integer)}
            raise "Sorry, It is invalid!"
        end
        use_input
    end

    
end