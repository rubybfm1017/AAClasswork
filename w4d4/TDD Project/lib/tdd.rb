def my_unique(arr)
  new_arr = []
  arr.each do |el|
    if !new_arr.include?(el)
      new_arr << el
    end
  end
  new_arr
end

def two_sum(arr)
  new_arr = []
  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      if idx1 < idx2 && el1 + el2 == 0
        new_arr << [idx1, idx2]
      end
    end
  end
  new_arr
end

def my_transpose(arr)
  height = arr.length
  width = arr[0].length
  new_arr = Array.new(height) {Array.new(width)}

  arr.each_with_index do |el1,idx1|
    arr.each_with_index do |el2,idx2|
        new_arr[idx1][idx2] = arr[idx2][idx1]
    end
  end
  new_arr
end

def stock_picker(arr)
  new_arr = []
  hash = {}
  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      # return new_arr if idx1 < idx2
      # next if idx1 > idx2
      if idx1 < idx2
        profit = arr[idx2] - arr[idx1]
        new_arr << profit if profit > 0

        hash[profit] = [idx1,idx2]
        # max = new_arr.max
        
      end
    end
  end
  if !new_arr.empty?
    return hash[new_arr.max]
  else
    return []

  end
end