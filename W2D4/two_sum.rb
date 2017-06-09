# W2D4/two_sum.rb
# Authors: Joey Jirasevijinda and Andrew Booth

def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |o_el, o_idx|
    arr.each_with_index do |i_el, i_idx|
      next if o_idx == i_idx
      return true if o_el + i_el == target_sum
    end
  end
  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
  arr.sort!
  arr.each_with_index do |el, idx|
    diff = target_sum - el
    other_idx = bsearch(arr, diff)
    next if idx == other_idx
    return true unless other_idx.nil?
  end
  false
end

def bsearch(arr, target_sum)
  return nil if arr.empty?

  middle_idx = arr.size / 2
  case target_sum <=> arr[middle_idx]
  when -1
    bsearch(arr.take(middle_idx), target_sum)
  when 0
    middle_idx
  when 1
    result = bsearch(arr.drop(middle_idx + 1), target_sum)
    result.nil? ? nil : middle_idx + 1 + result
  end
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
