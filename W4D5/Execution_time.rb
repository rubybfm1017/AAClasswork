#  def my_min(arr)
    # min = nil
#     (0...arr.length-1).each do |i|
#         (i+1...arr.length).each do |j|
#             if arr[i] < min
#                  arr[i]
#             end
#         end
#     end
#     min
#  end
 def my_min(arr)
    length = arr.length - 1
    sorted = false
    until sorted
        sorted = true 
        (0...length).each do |idx|
            if arr[idx] < arr[idx + 1]
                arr[idx], arr[idx + 1] = arr[idx+1], arr[idx]
                sorted =false
            end
        end
    end
    arr.last
 end
 #n^2


 #phase 2 O(n)
 
    def my_min_version_2(arr)
        min = arr[0]
        arr.each_with_index do |ele, i|
            if min >= ele
                min = ele
            end
        end
        min
    end
 
    
 
 
 
 
 
 arr = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
  p  my_min_version_2(arr)  # =>  -5

  #n^2

  def largest_sub_sum(arr)
    new_arr = []
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            new_arr << arr[i..j].sum
        end
    end
    new_arr.max
  end
    

  list = [2, 3, -6, 7, -6, 7]
  p largest_sub_sum(list) #8

                                           