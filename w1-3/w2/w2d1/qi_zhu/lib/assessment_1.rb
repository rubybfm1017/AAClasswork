# Define your methods here.
def string_map!(str,&prc)
    
    str.chars.map! do |word|
        prc.call(word)
    end
    
    
end

def three?(arr, &prc)
    count = 0
    arr.each{|ele| count += 1 if prc.call(ele)}
    count == 3
end

def nand_select(arr,prc1,prc2)
    new_arr = arr.select{ |ele|
        !(prc1.call(ele) && prc2.call(ele))}
    new_arr
end

def hash_of_array_sum(hash)
    sum = 0
    hash.each do |k,v|
        v.each do |ele|
            sum += ele
        end
    end
    sum
end

def abbreviate(sent)
    words = sent.split
    new_sent = []
    words.each do |word|
        if word.length > 4
            new_sent << remove_vowels(word)
        else
            new_sent << word
        end
    end
    new_sent.join(" ")
end

def remove_vowels(word)
    vowels = "aeiouAEIOU"
    new_str = ""
    word.each_char do |char|
        if !vowels.include?(char)
            new_str << char
        end      
    end
    new_str
end

def hash_selector(hash, *args)
    new_hash = {}
    hash.keys.each do |key|
        if args.include?(key)
            new_hash[key] = 0
        else
            return hash
        end
    end
    hash.each do |k,v|
        if new_hash.key?(k)
            new_hash[k] = v
        end
    end
    new_hash
end