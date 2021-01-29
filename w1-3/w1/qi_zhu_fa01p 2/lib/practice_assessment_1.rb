# Define your methods here. 
def first_letter_vowel_count(sent)
    words = sent.split
    count = 0
    words.each do |word|
    count += 1 if first_letter_vowel(word)
    end
    count
end

def first_letter_vowel(word)
    vowels = "aeiouAEIOU"
    first = word[0]
    if vowels.include?(first)
        return true
    end
    false
end

def count_true(arr, prc)
    count = 0
    arr.each {|ele| count += 1 if prc.call(ele)}
    count
end

def procformation(arr,prc1, prc2, prc3)
    arr.map!{|ele| prc1.call(ele) ? prc2.call(ele) : prc3.call(ele)}

end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(sent)
    words = sent.split
    new_arr = []
    words.each do |word|
        if (first_letter_vowel(word) || end_with_vowels(word)) || (first_letter_vowel(word) && end_with_vowels(word))
            new_arr << word
        else   
            new_arr << word.reverse
        end
    
    end
    new_arr.join(" ")
end

def end_with_vowels(word)
    first_letter_vowel(word.reverse)
end

def hash_missing_keys(hash, *letters)
    new_arr = []
    if letters.length != 0
        hash.each do |k, v|
            if !hash.key?(letters)
                new_arr << k
            end
        end
    else   
        return new_arr
    end
    letters - new_arr 
end