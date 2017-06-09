class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    raise "Out of bounds" unless (0..@store.size).cover?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx] << num
  end

  def remove(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].delete(num)
  end

  def include?(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      if @count + 1 > num_buckets
        resize!
      end
      bucket_idx = num % num_buckets
      @store[bucket_idx] << num
      @count += 1
    end
  end

  def remove(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].delete(num)
  end

  def include?(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |num|
        new_bucket_idx = num % new_store.size
        new_store[new_bucket_idx] << num
      end
    end

    @store = new_store
  end
end
