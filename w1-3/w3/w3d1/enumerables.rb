require "byebug"
class Array

  def my_each(&block)
    self.length.times do |i|
      block.call(self[i])
    end
    self
  end
  
  def my_select(&block)
    arr = []
    self.my_each do |ele|
      arr << ele if block.call(ele)
    end
    arr
  end

  def my_reject(&block)
    arr = []
    self.each do |ele|
      arr << ele if !block.call(ele)
    end

    arr
  end

  def my_any?(&block)
    self.my_each do |ele|
      return true if block.call(ele)
    end
    false
  end
  
  def my_all?(&block)
    self.my_each do |ele|
      return false if !block.call(ele)
    end
    true
  end

  def my_flatten
    new_arr = []
    # return new_arr if !self.kind_of?(Array)
    self.each do |ele|
        if ele.kind_of?(Array)
            new_arr += ele.my_flatten
        else   
            new_arr << ele
        end
    end
    new_arr
  end

  
  def my_zip(*arrs)
    new_arr = []
    self.length.times do |i|
      arr1 = []
      arr1 << self[i]
      arrs.each do |arr|
        arr1 << arr[i]
      end
      new_arr << arr1
    end
    new_arr
  end
  require 'byebug'
  
  def my_rotate(n=1)
    # final_idx = n % self.length
    # final_idx.times do 
    # self.rotate(n)
    arr_1 = self.dup
    if n > 0 
        n.times do 
            ele = arr_1.shift
            arr_1.push(ele)
        end
    elsif n < 0
      # debugger
        n = -n 
        n.times do 
            ele = arr_1.pop
            arr_1.unshift(ele)
        end
    end
    arr_1 
  end

  def my_join(sign="")
    new_str = ""
    self.length.times do |i| 
      if i < self.length - 1
        new_str += self[i]
        new_str += sign
      else
        new_str += self[i]
      end
    end
    new_str
  end 
  
  def my_reverse
    new_arr = []
    self.each.with_index do |ele, i|
        new_arr << self[self.length - 1 - i]
    end
    new_arr
  end
  
end

# a = [1,2,3]

# p a.my_each {|num| num * 2}

# # p return_value  # => [1, 2, 3]  

# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]



# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)        #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"


p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
