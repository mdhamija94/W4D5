def bad_two_sum?(arr, target)
  (0...arr.length).each do |start_idx|
    (start_idx + 1...arr.length).each do |end_idx|
      return true if arr[start_idx] + arr[end_idx] == target
    end
  end
  
  false
end

def binary_search(arr, target)
  return false if arr.length < 1
  mid_idx = arr.length / 2
  arr[mid_idx] == target || binary_search(arr[0...mid_idx], target) || binary_search(arr[mid_idx+1..-1], target)
end

def okay_two_sum?(arr, target)
  arr.sort!

  arr.each_with_index do |ele, i|
    new_target = target - ele
    return true if binary_search(arr[i+1..-1], new_target)
  end
  false
end

def two_sum?(arr, target)
  hash = {}
  arr.each_with_index do |ele, i|
    hash[ele] = i
  end
  p hash
  arr.each_with_index do |ele, i |
    new_target = target - ele

    return true if hash.has_key?(new_target) && hash[new_target] != i

  end
  false
end

#arr = [5 ,0, 5, 7]
arr = [5,7,6,6]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

p two_sum?(arr, 18) # => should be false
