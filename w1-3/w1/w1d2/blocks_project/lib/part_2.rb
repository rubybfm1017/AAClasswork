def all_words_capitalized?(arr)
    arr.all? {|ele| ele.capitalize == ele}
end

def no_valid_url?(arr)
    #url = ['.com', '.net', '.io', '.org']
    arr.none? {|ele| ele.end_with?('.com', '.net', '.io', '.org')}
        
end

def any_passing_students?(array)
    array.any? {|hash| (hash[:grades].sum / (hash[:grades].length / 1.0))>= 75}


end