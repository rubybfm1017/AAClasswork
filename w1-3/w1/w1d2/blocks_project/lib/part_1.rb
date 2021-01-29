def select_even_nums(arr)
    evens = []
    arr.select {|ele| evens << ele if ele % 2 == 0}
    return evens
end

def reject_puppies(arr)
    arr.reject {|hash| hash["age"] <= 2 }
end

def count_positive_subarrays(array)
    array.count {|ele| ele.sum > 0 }
end

def aba_translate(str)
    vowels = "aeiou"
    aba = ""

    str.each_char do |char|
        if vowels.include?(char)
            aba += char + "b" + char
        else  
            aba += char
        end
    end
    aba
end

def aba_array(arr)
    arr.map {|ele| aba_translate(ele)}
end