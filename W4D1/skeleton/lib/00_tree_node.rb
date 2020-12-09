class PolyTreeNode
    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    
        
    def parent=(node) 
             @parent.children.delete(self) if @parent != nil
            if node != nil
                @parent = node
                
                node.children << self unless node.children.include?(self)
            else
                @parent = node
            end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if child_node.parent == nil
            raise "node is not a child"
        end
        child_node.parent = nil
    end

    def dfs(target)
        return nil if self == nil
        return self if self.value == target
        self.children.each do |child|
            result = child.dfs(target)
            if result != nil
                return result
            end
        end
        nil

    end

    def bfs(target)
        queue = [self]
        until queue.empty?
         if queue.first.value == target
            return queue.first
         else
            queue.shift.children.each do |child|
                queue << child 
            end
        end
         
        end
         nil
    end
end

