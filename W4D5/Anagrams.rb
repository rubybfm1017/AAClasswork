def first_anagram?(str1,str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char do |char|
        hash1[char] += 1

    end
    str2.each_char do |char|
        hash2[char] += 1
    end

    hash1 == hash2
end
 #O(n)
# p first_anagram?("catdog","dgotca")
# p first_anagram?("dogcat","cogahfsfksdjfkaslf")


def first_anagram_2(str1,str2)
    permutations = []
    letters_1 = str1.split("")
    letters_2 = str2.split("")

    permutations = letters_1.permutation.to_a 
    if permutations.include?(letters_2)
        true
    else 
        false
    end

end
# O(n!)

# p first_anagram_2("catdog","dgotca")
# p first_anagram_2("dogcat","cogahfsfksdjfkaslf")

def second_anagram?(str1,str2)
    letters_1 = str1.split("")
    letters_2 = str2.split("")

    letters_1.each_with_index do |ele, idx|
        indices = letters_2.find_index(ele)
        # p indices
        if indices != nil
            letters_2.delete_at(indices)
        else
            return false
        end
    end
    letters_2.empty?
end
#O(n^2) 
p second_anagram?("catdog","dgotca")
p second_anagram?("dogcat","cogahfsfksdjfkaslf")

def third_anagram?(str1,str2)
    letters_1 = str1.split("")
    letters_2 = str2.split("")
    letters_1.sort == letters_2.sort

end
#O(n log n)

p third_anagram?("catdog","dgotca")
p third_anagram?("dogcat","cogahfsfksdjfkaslf")

