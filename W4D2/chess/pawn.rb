class Pawn < Piece 
    def symbol
        "♟"
    end
    
    def moves
        forward_steps + side_attacks
    end

    def at_start_row?
        if self.color == "white" && pos.first == 6
            return true
        elsif self.color == "black" && pos.first == 1
            return true
        end
        false
    end

    def forward_dir
        if self.color == "black"
            return 1
        else
            return -1
        end
    end

    def forward_steps
        x, y = pos
        all_moves = []
        one_move = [x + forward_dir, y]
        two_move = [x + forward_dir + forward_dir, y]

        if @board[one_move].empty?
            all_moves << one_move
        end

        if @board[two_move].empty? && @board[one_move].empty?
            all_moves << two_move
        end
        all_moves
    end

    def side_attacks
        x, y = pos
        all_moves = []
        left = [x + forward_dir, y-1]
        right = [x + forward_dir, y+1]
        all_moves = [left, right]
        attacks = []
        all_moves.each do |move|
            if !@board[move].empty? && (@board[move].color != self.color)
                attacks << move
            end
        end

        attacks
    end

end