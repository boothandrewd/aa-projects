# W2D4/time_difference.rb
require 'byebug'

def my_min_I(array)
  array.each do |o_el|
    return o_el if array.all? { |i_el| o_el <= i_el }
  end
end

arr = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_I(arr)

def my_min_II(array)
  min = array.first
  array.each do |el|
    min = el if el < min
  end

  min
end

p my_min_II(arr)

def largest_contiguous_subsum(list)
  subs = (1..list.length).reduce([]) do |l, n|
    l + list.each_cons(n).to_a
  end

  subs.map { |el| el.reduce(:+) }.max
end

p largest_contiguous_subsum([5, 3, -7])

def largest_contiguous_subsumII(list)
  cumulative_sum = list.first
  max = cumulative_sum
  last_negative = false
  list.drop(1).each do |el|
    if cumulative_sum < 0
      cumulative_sum = el
    else
      cumulative_sum += el
    end

    max = cumulative_sum if cumulative_sum > max
  end

  max
end

p largest_contiguous_subsumII([5, 3, -7])
p largest_contiguous_subsumII([2, 3, -6, 7, -6, 7])
p largest_contiguous_subsumII([-5, -1, -3])
