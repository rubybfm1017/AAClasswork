# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
       if num%factor == 0
        return false
       end
    end
    true
end

def largest_prime_factor(num)
    factors = []
    (1..num).each do |factor|
        if num%factor == 0 && prime?(factor)
            factors << factor
        end
    end
    factors.max
end


def unique_chars?(str)
    count = Hash.new(0)
    str.each_char do |char| #"a" apple  
        count[char] += 1 #{a=>1}
        if count[char] > 1
            return false
        end
    end
    true 
end

def dupe_indices(array)
    count = Hash.new {|key, value| key[value] = []}
    array.each_with_index do |char, i|
       count[char] << i
    end
    #debugger
    count.values.each do |arr|
        if arr.length == 1 
            count.delete(count.key(arr))
        end
    end
    count
end

def ana_array(arr1, arr2)
    count1 = Hash.new(0)
    arr1.each do |ele|
        count1[ele] += 1
    end
    count2 = Hash.new(0)
    arr2.each do |ele|
        count2[ele] += 1
    end

    count1 == count2

end
