def strange_sums(arr)
    pairs = 0
    arr.each_with_index do |i , idx1|
        arr.each_with_index do |j , idx2|
            if i + j == 0 && idx1 < idx2
                pairs += 1 
            end
        end

    end
   
end
# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0


def pair_product(arr, prod)
    arr.each_with_index do |i , idx1|
        arr.each_with_index do |j , idx2|
            if i * j == prod && idx1 < idx2
                return true
            end
        end

    end
    false
end  
# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false


def rampant_repeats(word, hash)
    result = ""
    word.each_char {|char| hash[char] ? result += char * hash[char] : result += char }
    result
end
# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


def perfect_square(num)
    (0..num).each do |i|
        if i * i == num
            return true
        end
    end
    false
end
# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(10)    # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false


def anti_prime?(num)
    main = find_factors(num)
    counter = 1
    while counter < num
        temp = find_factors(counter)
        
        if temp.length >= main.length
            return false
        end
        counter += 1
    end
    true
end

def find_factors(num)
     main = []

    (1..num).each do |i|
        if num % i == 0 
            main << i
        end
    end
    return main
end

# loops through the 2D array and check if any element is longer than the first element
# def check_arr(arr)
#     arr.each do |ele|
#         if ele.length >= arr
#[0].length && ele != arr[0] 
#             return false
#         end
#     end
#     true
# end

# create 2d array of factors
# first element will be factors of num
# check all other elements against first

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false


def matrix_addition(arr1, arr2)
    result = []
    arr1.each_with_index do |ele1, idx1|
        temp = []
        ele1.each_with_index do |ele2, idx2|
            temp << arr1[idx1][idx2] + arr2[idx1][idx2]
        end
        result << temp
    end
    result
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    factors = []
    nums.each do |num|
        factors << find_factors(num)
    end
    
    result = factors.inject { |acc, factor| acc & factor }
    result 
end

def find_factors(num)
    factors = []
    (1..num).each {|n| num % n == 0 ? factors << n : next}
    factors
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    trib = [1, 1, 2]

    while trib.length - 1 < num
        trib << trib[-1] + trib [-2] + trib[-3]
    end

    trib[num-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
    height = matrices.first.length
    width = matrices.first.first.length
    matrices.each do |matrix|
        if height != matrix.length
            return nil
        elsif width != matrix.first.length
            return nil
        end
    end

    result = matrices.inject { |acc,el| matrix_addition(acc,el) }
    result

end

    # result = []
    # count1 = 0
    # count2 = 0

    # while count1 <= matrices[0].length - 1
    #     sum = 0
    #     temp = []
    #     matrices.each do |matrix|
    #         sum += matrix[count1][count2]
    #     end

    #     temp << sum

    #     unless count2 >= matrices[0][0].length - 1
    #         count2 += 1
    #     else
    #         count2 = 0
    #         count1 += 1
    #         result << temp
    #     end    
    # end
    

    # matrices.each_with_index do |ele1, idx1|
    #     temp = []
    #     ele1.each_with_index do |ele2, idx2|
    #         temp << arr1[idx1][idx2] + arr2[idx1][idx2]
    #     end
    #     result << temp
    # end

# def grab_element(arr, idx1, idx2)
#     return arr[idx1][idx2]    
# end

# loop through matrices
# use counters to grab each element and add to sum
# add sum to temp
# add temp to result

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
    arr.each do |row|
        if row.uniq.length == 1
            return true
        end
    end

    arr.transpose.each do |col|
        if col.uniq.length == 1
            return true
        end
    end

    false

end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(arr)
    arr.each do |row|
        if row.uniq.length == 1
            return true
        end
    end

    arr.transpose.each do |col|
        if col.uniq.length == 1
            return true
        end
    end

    first_diag ,sec_diag = find_diags(arr)
    if first_diag.uniq.length == 1 || sec_diag.uniq.length == 1 
        return true
    end
    false
end

def find_diags(arr)
    first_diag = []
    count = 0
    sec_diag = []
    while count < arr[0].length - 1
        first_diag << arr[count][count]
        sec_diag << arr[count][-count - 1]
        count += 1
    end
    return first_diag, sec_diag
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false


def pascals_triangle(levels)
    result = [[1]]
    (levels-1).times do |n|
        level = []
        level << 1
        level += get_sum(result[-1])
        level << 1
        result << level
    end
    result
end


def get_sum(arr)
    result = []
    (0...arr.length-1).each do |i|
        result << arr[i] + arr[i+1]
    end
    result  
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

def mersenne_prime(num)
    mer_primes = []
    count = 1
    is_mer = false
    while mer_primes.length < num #7
        is_mer = false
        until is_mer 
            if is_prime?(count) 
                if power_of_two?(count + 1)
                    mer_primes << count
                    is_mer = true
                end
            end
            count += 1 # 5
        end
    end
    mer_primes[-1]
end


def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
       if num % i == 0
            return false
       end
    end
    true
end
# p is_prime?(5)

def power_of_two?(num)
    pow = 2
    counter = 1
     while counter < num
         counter = counter * pow
     end
     counter == num ? true : false
 end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?

end