def first_anagram?(str1, str2)
  perms = str1.split("").permutation.to_a
  perms.map! { |perm| perm.join("") }
  # perms
  perms.include?(str2)
end

def second_anagram?(str1,str2)
  chars = str2.split("")
  str1.each_char do |char|
    matched_idx = chars.find_index(char)
    if matched_idx.nil?
      return false
    else
      chars.delete_at(matched_idx)
    end
  end
  true
end

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2)
  counter1 = Hash.new(0)
  counter2 = Hash.new(0)
  str1.each_char { |char| counter1[char]+= 1}
  str2.each_char { |char| counter2[char]+= 1}
  counter1 == counter2
end

def bonus_anagram?(str1, str2)
  counter = Hash.new(0)
  str1.each_char { |char| counter[char]+= 1}
  str2.each_char { |char| counter[char]+= 1}
  counter.values.all? { |v| v.even? }
end

p first_anagram?("elvis", "lives")
p first_anagram?("gizmo", "sally")
p second_anagram?("elvis", "lives")
p second_anagram?("gizmo", "sally")
p third_anagram?("elvis", "lives")
p third_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")
p bonus_anagram?("elvis", "lives")
p bonus_anagram?("gizmo", "sally")