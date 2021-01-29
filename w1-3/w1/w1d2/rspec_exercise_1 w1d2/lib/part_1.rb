def average(n1, n2)
    (n1+n2)/2.0
end

def average_array(numbers)
    numbers.sum/(numbers.length/1.0)
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + '!'
end

#indice even = upcase
#indice odd = lower case

def alternating_case(sentence)
    words = sentence.split(' ')
    new_arr = []
    words.each_with_index do |word, i|
        if i.even?
            new_arr << word.upcase
        else
            new_arr << word.downcase
        end
    end
    new_arr.join(' ')
end