def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(' ')
    new_arr = []
    words.each {|word| new_arr << prc.call(word)}
    new_arr.join(' ')
end