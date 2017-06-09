class Array
  def my_uniq
    new_arr = []
    self.each do |el|
      new_arr << el unless new_arr.include?(el)
    end
    new_arr
  end

  def two_sum
    new_arr = []
    i = 0
    while i < self.length
      i2 = i + 1
      while i2 < self.length
        new_arr << [i, i2] if (self[i] + self[i2]).zero?
        i2 += 1
      end
      i += 1
    end
    new_arr
  end

  def my_transpose
    new_arr = Array.new(self.length) { [] }
    self.each_with_index do |row|
      row.each_with_index do |el, el_idx|
        new_arr[el_idx] << el
      end
    end
    new_arr
  end

  def stock_picker
    new_hash = {}
    i1 = 0
    while i1 < self.length
      i2 = i1 + 1
      while i2 < self.length
        new_hash[[i1, i2]] = self[i2] - self [i1]
        i2 += 1
      end
      i1 += 1
    end
    new_hash.max_by(&:last).first
  end



end
