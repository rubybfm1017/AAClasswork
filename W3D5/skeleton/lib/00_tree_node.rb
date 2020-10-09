class PolyTreeNode

    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil 
        @children = []

    end

    def parent=(new_parent)
        if @parent == new_parent
            return
        end

        if @parent != nil
            @parent.children.delete(self)
        end

        @parent = new_parent
    
        if @parent != nil && @parent.children.none?{|ele| ele == self}
            @parent.children << self
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if child != nil && !self.children.include?(child) 
            raise "not child"
        end
        child.parent = nil
    end

    def dfs(value)
        if self.nil?
            return nil 
        end
        if self.value == value
            return self
        end

        self.children.each do |child|
            result = child.dfs(value)
            if !result.nil?
                return result
            end
        end
        return nil 

    end

    def bfs(value)
        queue = [self]
        until queue.empty?
            ele = queue.shift
            if ele.value == value
                return ele 
            end
            ele.children.each {|child| queue << child}
        end
        return nil
    end
end