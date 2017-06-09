
class Array
  def my_each(&prc)
    idx = 0
    while idx < length
      prc.call(self[idx])
      idx += 1
    end
  end

  def my_select(&prc)
    selected = []
    my_each do |el|
      selected.push(el) if prc.call(el)
    end
    selected
  end

  def my_reject(&prc)
    selected = []
    my_each do |el|
      selected.push(el) unless prc.call(el)
    end
    selected
  end

  def my_any?(&prc)
    my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    array1 = []
    my_each do |el|
      if el.is_a?(Array)
        array1 += el.my_flatten
      else
        array1 << el
      end
    end

    array1
  end

  def my_zip(*args)
    #p args
    result_array = []
    array_size = self.length

    # ([self] + args).my_each do |arg|
    #   temp_array = []
    #
    # end

    counter = 0
    while counter < self.length
      temp_array = []
      temp_array << self[counter]
      args.my_each do |arg|
        temp_array << arg[counter]
      end
      result_array << temp_array
      counter += 1
    end
    result_array
  end

  def my_rotate(count=1)
    if count < 0
      count = self.length+count
    end
    count %= self.length
    self.drop(count) + self.take(count)
  end

  def my_join(sep = '')
    str = ''
    my_each do |el|
      str += el
      str += sep
    end
    str[0...-1]
  end

  def my_reverse
    result = []

    each_index do |idx|
      result << self[self.length-idx-1]
    end

    result
  end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
