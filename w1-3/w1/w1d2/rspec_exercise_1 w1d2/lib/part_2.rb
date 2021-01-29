def hipsterfy(word)
    vowels = "aeiou"
    count = 0 # keep track of nonvowels
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            $v = i
            #v keeps track of vowels index
        else  
            count += 1  
        end
    end
    if count == word.length
        return word 
    else  
        word = word[0...$v] + word[$v + 1..-1]
    end
end

def vowel_counts(str)
    vowels = 'aeiou'
    count = Hash.new(0)
    new_str = str.downcase
    new_str.each_char do |char|
        if vowels.include?(char)
            count[char] += 1
        end
    end
    count
end

def caesar_cipher(str, num)
    alphabet = ('a'..'z').to_a
    cipher = ""
    str.each_char do |char|
        if alphabet.include?(char)
            old_i = alphabet.index(char)
            new_i = (old_i + num ) % 26
            cipher += alphabet[new_i]
        else  
            cipher += char
        end
    end
    cipher
end

