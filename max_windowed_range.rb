def windowed_max_range(arr, window_size)
  diffs = []
  (0..arr.length-window_size).each do |i|
    subarr = arr[i...(i+window_size)]
    diffs << subarr.max - subarr.min
  end
  diffs.max
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2)# == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3)# == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4)# == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5)# == 6 # 3, 2, 5, 4, 8
