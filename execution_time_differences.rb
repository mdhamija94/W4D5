list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# O(n^2)

def my_min_bad(list)
  (0...list.length).each do |start_idx|
    (start_idx...list.length).each do |end_idx|
      break if list[start_idx] > list[end_idx]
      return list[start_idx] if end_idx == list.length - 1
    end
  end
end

# O(n)

def my_min_good(list)
  min = list.first

  (1...list.length).each do |i|
    min = list[i] if list[i] < min
  end

  min
end

p my_min_bad(list)
p my_min_good(list)

array = [-5, -1, -3]

def contiguous_sub_sum_bad(array)
  sub_arrays = []

  (0...array.length).each do |i|
    (i...array.length).each do |j|
      sub_arrays << array[i..j]
    end
  end

  sub_arrays.map{ |sub| sub.sum }.max
end

def contiguous_sub_sum_good(array)
  max_so_far = array[0]
  max_ending_here = array[0]

  (0...array.length).each do |i|
    max_ending_here += array[i]
    max_ending_here = array[i] if max_ending_here < array[i]
    max_so_far = max_ending_here if max_ending_here > max_so_far
  end

  max_so_far
end

p contiguous_sub_sum_bad(array)
p contiguous_sub_sum_good(array)

