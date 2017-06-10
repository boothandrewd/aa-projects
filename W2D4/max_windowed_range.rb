# W2D4/max_windowed_range.rb

### Naive Solution

def windowed_max_range(array, window_size)
  current_max_range = nil
  array.each_cons(window_size) do |window|
    range = window.max - window.min
    current_max_range = range if !current_max_range || range > current_max_range
  end

  current_max_range
end


### Optimized Solution

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(el)
    @in_stack.push(el)
  end

  def dequeue
    queueify if @out_stack.empty?
    @out_stack.pop
  end

  def peek
    queueify if out_stack.empty?
    @out_stack.peek
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  private

  def queueify
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
end

class MinMaxStack < MyStack
  def initialize
    super
    @max_stack = MyStack.new
    @min_stack = MyStack.new
  end

  def pop
    el = super
    return if !el

    if el >= max
      @max_stack.pop
    end

    if el <= min
      @min_stack.pop
    end

    el
  end

  def push(el)
    if !max || el > max
      @max_stack.push(el)
    end

    if !min || el < min
      @min_stack.push(el)
    end

    super(el)
  end

  def max
    @max_stack.peek
  end

  def min
    @min_stack.peek
  end
end

class MinMaxStackQueue < StackQueue
  def initialize
    @in_stack = MinMaxStack.new
    @out_stack = MinMaxStack.new
  end

  def min
    [@in_stack.min, @out_stack.min].reject(&:nil?).min
  end

  def max
    [@in_stack.max, @out_stack.max].reject(&:nil?).max
  end
end

def better_windowed_max_range(array, window_size)
  current_max_range = nil

  mmsq = MinMaxStackQueue.new
  array.each do |el|
    mmsq.enqueue(el)
    mmsq.dequeue if mmsq.size > window_size

    next unless mmsq.size == window_size
    range = mmsq.max - mmsq.min
    current_max_range = range if !current_max_range || range > current_max_range
  end

  current_max_range
end


### Script lines

if __FILE__ == $PROGRAM_NAME
  p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

  p better_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p better_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p better_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p better_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
end
