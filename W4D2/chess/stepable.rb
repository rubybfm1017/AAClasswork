module Stepable

    def moves
        moves = []
        move_diffs.each do |dir|
            dir = x ,y
            dx,dy = pos
            current_x = x + dx #1
            current_y = y + dy #1
            current_pos = [current_x,current_y] #[1,1]
            if board.empty?(current_pos) # ?????
                moves << current_pos
            elsif current_pos.color != self.color #????
                moves << current_pos
            end
        end
        moves
    end

end