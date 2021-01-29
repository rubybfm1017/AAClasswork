# Warmup
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def range(min, max)  #(1, 5)
    return [] if max <= min # returns input arr if our base-case is met
    range(min, max - 1) << max - 1 
end

#p range(1, 5) 
#=> [1, 2, 3, 4]
# [1, 2, 3, 4] #desired output
# [1, 2, 3] << 4 => (max - 1) | Stack: 1 so max = 5
# [1, 2] << 3 => (max - 1) | Stack: 2 so max = 4
# [1] << 2 => (max - 1) | Stack: 3 so max = 3
# max = 5
# base case = []

# def range_sum(num_arr)
#     num_arr.reduce(&:+)
# end

def range_sum(num_arr)
    return 0 if num_arr.empty?
    num_arr[0] + range_sum(num_arr.drop(1))
end

# [1, 2, 3, 4, 5]
# 1 + [2, 3, 4, 5]
# 2 + [3, 4, 5]
# 3 + [4, 5]
# 4 + [5]
# 5 + 0


# arr[0] + arr[1..-1] 1 +  2, 3, 4
# arr[0] + 2 + 3, 4
#
#
#
#range(1, 5) 
# arr = [4,5,6,9]
# p range_sum(arr)

def exponent_1(base, power)
    return 1 if power == 0
    base * exponent_1(base, power - 1)
end

def exponent_2(base, power) # 4, 5 -------- # 4, 4 
    return 1 if power == 0
    return base if power == 1

    exp = exponent_2(base, power / 2)

    if power.even?
         exp * exp
    else 
        base * exp * exp
    end

end

# p exponent_1(2, 3) 
# p exponent_1(2, 4) 
# p exponent_1(2, 3) 
# p exponent_1(2, 0) 
# p exponent_1(2, 1) 

class Array 

    def deep_dup
        new_arr = []
        self.each do |el|
            if el.is_a?(Array)
                new_arr << el.deep_dup
            else
                new_arr << el
            end
        end
        new_arr
    end

end

# a = [1, [2], [3, [4, 6, 7, 8, 9]]]
# b = a.deep_dup #new array ID
# c = a.dup #same array ID - linked together
# p a[2][1].object_id
# p b[2][1].object_id
# puts
# p c[2][1].object_id

# def fib(num)
#     return [] if num == 0
#     return [0] if num == 1

#     seq = [0, 1]

#     while seq.length < num
#         seq << seq[-2] + seq[-1]
#     end
#     seq
# end

def fib(num)
    return [] if num == 0
    return [0] if num == 1
    return [0, 1] if num == 2

    seq = fib(num - 1)
    seq << seq[-1] + seq[-2]

    #fib(num - 1) << fib(num - 2) + fib(num - 1)
end

# p fib(7)# [0, 1, 1, 2, 3, 5, 8]  -> n = 7


def bsearch(array, target)
    
    half = array.length / 2

    return nil if !array.include?(target)

    if array[half] == target
        return half 
    elsif array[half] >= target 
        bsearch(array[0...half], target)
    else
        bsearch(array[half..-1].drop(1), target) + half + 1# [1, 3, 4, 5, 9] 0 1 2 3 4 half = 5
    end
    

end

# p bsearch([1, 2, 3], 1) # => 0 
# p bsearch([2, 3, 4, 5], 3) # => 1 
# p bsearch([2, 4, 6, 8, 10], 6) # => 2 


# p bsearch([1, 3, 4, 5, 9], 5) # => 3 <---- 0
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5 <----- 1


# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil 
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil 

def merge_sort()
end





# 	def bubble_sort(array)
#     sorted = false  
#     while !sorted       
#         sorted = true       
#         (0...array.length - 1).each do |i|
#             if array[i] > array[i + 1]                              
#                 array[i], array[i + 1] = array[i + 1], array[i]     
#                 sorted = false                                      
#             end                                                     
#         end
#     end
#     array
# end

def merge(left, right)
    new_arr = []
    i = 0
    j = 0
    while i < left.length || j < right.length
        
        if i == left.length
            return new_arr + right[j..-1]
        elsif j == right.length
            return new_arr + left[i..-1]
        
        elsif (left[i] < right[j])
            new_arr << left[i]
            i += 1
        else
            new_arr << right[j]
            j += 1
            
        end
    end
end


def mergesort(array)
  return array if array.length == 1
  middle = array.length / 2
  merge(mergesort(array[0...middle]), mergesort(array[middle..-1]))
end


# def merge(left, right)
#   result = []
#   until left.length == 0 || right.length == 0 do
#     result << (left.first <= right.first ? left.shift : right.shift)
#   end
#   result + left + right
# end


# 1. input arr [6, 7, 12, 15, 3, 45, 23, 1]
# 2 sort pairs [6 <--> 7]   [12 <--15]   [3 <---> 45]   [23 <--- 1]                 
# 3. return   [6, 7],[12, 15], <--------> [3, 45], [1, 23]                            #4
# 4. sort into two halfs [6, 7, 12, 15] < -------- > [1, 3,                    #2
# 5.   [1, 3, 6, 7, 12, 15, 23, 45]]
p mergesort([6, 7, 12, 15, 3, 45, 23, 1])




# [3, 27 38 ,43] [9 ,10, 82]
#   i = 1            j = 0
#3 9 10 27