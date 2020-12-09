require_relative '../skeleton/lib/00_tree_node.rb'
class KnightPathFinder
    attr_reader :considered_positions
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end

    def self.valid_moves(pos) #[3, 3], 
        valid = []
        dirs = [[2, 1], [1, 2],[-1, 2],[-2, 1],[-2, -1], [-1, -2],[1, -2], [2, -1]]
        dirs.each do |dir|
            row, col = pos[0]+dir[0], pos[1]+dir[1]
            if (row <= 7 && row >= 0) && (col <= 7 && col >= 0)
                valid << [row, col]
            end
        end
        valid
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        possible_moves = []
        valid_moves.each do |move|
            if !@considered_positions.include?(move)
                @considered_positions << move
                possible_moves << move
            end
        end
        possible_moves
    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            current_node = queue.shift
            self.new_move_positions(current_node.value).each do |pos|
            #create a polytree node with each pos
            #shovel node to queue, make node child of current node
            new_node = PolyTreeNode.new(pos)
            queue << new_node
            current_node.add_child(new_node)

            end
        end
    end

    def find_path(end_pos)
        @root_node.dfs(end_pos)
    end









end

new_thing = KnightPathFinder.new([0,0])


 new_thing.build_move_tree
 p new_thing.find_path([4,2])