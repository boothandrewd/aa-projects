# recursion.rb
require 'byebug'

def range(start, last)
  return [] if last < start
  return [start] if start == last

  range(start, last - 1) + [last]
end


def recursive_sum(array)
  return 0 if array.empty?
  return array.first if array.length == 1

  array.first + recursive_sum(array[1..-1])
end

def iterative_sum(array)
  sum = 0
  array.each do |int|
    sum+=int
  end
  sum
end


def exponentiation_one(base, exponent)
  return 1 if exponent.zero?
  base * exponentiation_one(base,exponent-1)
end

def exponentiation_two(base, exponent)
  return 1 if exponent.zero?
  return base if exponent == 1
  # result = exponentiation_two(base,exponent/2)
  # return exponentiation_two(base,exponent/2) *
  #   exponentiation_two(base,exponent/2)
  if exponent.even?
    result = exponentiation_two(base,exponent/2)
    result * result
  else
    result =  exponentiation_two(base,(exponent-1)/2)
    base * result * result
  end
end


def deep_dup_cheating?(arr)
  Marshal.load(Marshal.dump(arr))
  false
end

class Array
  def deep_dup
    # return [self.first] if length == 1
    # [self.first.dup] + self[1..-1].deep_dup
    map do |el|
      if el.is_a? (Array)
        el.deep_dup
      else
        begin
          el.dup
        rescue
          el
        end
      end
    end
  end
end


def recursive_fibonacci(n)
  return [] if n < 1
  return [1] if n == 1
  return [1, 1] if n == 2

  result = recursive_fibonacci(n - 1)
  result + [result[-2] + result[-1]]
end

def iterative_fibonnaci(n)
  return [] if n < 1
  return [1] if n == 1
  fib = [1, 1]
  until fib.length == n
    fib << fib[-2] + fib[-1]
  end
  fib
end

class Array
  def subsets
    # byebug
    return [[]] if self.empty?
    result = self[0...-1].subsets
    result + result.map do |subarr|
      subarr.dup.push(self.last)
    end
  end

end

def permutations(array)
  return [array] if array.empty?

  permutations(array[0...-1]).reduce([]) do |perms, subarr|
    (subarr.length + 1).times do |index|
      perms << subarr.dup.insert(index, array.last)
    end
    perms
  end
end

def bsearch(array, target)
  # byebug
  return nil if array.empty?
  return nil if array.length == 1 && array[0] != target

  middle_index = array.length / 2
  middle_el = array[middle_index]
  return middle_index if middle_el == target

  left = array[0...middle_index]
  right = array[middle_index + 1..-1]
  if target < middle_el
    bsearch(left, target)
  else
    result = bsearch(right, target)
    return result.nil? ? nil : middle_index + 1 + bsearch(right, target)
  end
end


class Array

  def merge_sort
    return self if length <= 1
    middle_index = length/2
    self[0...middle_index].merge_sort.merge(self[middle_index..-1].merge_sort)

  end

  def merge(other_arr)
    new_arr = []
    until self.empty? || other_arr.empty?
      if self.first < other_arr.first
        new_arr << self.shift
      else
        new_arr << other_arr.shift
      end
    end

    new_arr + self + other_arr
  end

end

def greedy_make_change(total, denominations)
  return [denominations.first] * (total / denominations.first) if (total % denominations.first).zero?
  new_total = total - (denominations.first) * (total / denominations.first)
  greedy_make_change(new_total, denominations.drop(1)).unshift([denominations.first] * (total / denominations.first)).flatten
end

# def make_better_change(total,denominations)
#   # byebug
#   # return [denominations.first] * (total / denominations.first) if (total % denominations.first).zero?
#   # denominations.each_with_index do |denom, idx|
#   #   if total >= denom
#   #     arr << make_better_change(total - denom, denominations[idx..-1]).unshift(denom)
#   #   end
#   # end
#   # arr
#   make_better_change_helper(total, denominations).sort_by(&:length)[0]
# end

def make_better_change(total, denominations)
  # byebug
  return [total] if denominations.include?(total)

  denominations.select do |denomination|
    denomination <= total
  end.map.with_index do |denomination, index|
    [denomination] + make_better_change(total - denomination, denominations.drop(index))
  end.min_by(&:length)
end

p make_better_change(25, [10, 7, 1])
