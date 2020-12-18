def bad_two_sum?(arr,target)
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            if i < j && arr[i] + arr[j] == target
                return true
            end
        end
    end
    false
end
#O(n^2) brute-force 
# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false