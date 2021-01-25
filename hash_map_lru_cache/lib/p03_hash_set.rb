class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @all_items = []
  end

  def insert(key)
    resize! if @count == num_buckets
    if !self[key].include?(key)
      self[key] << key
      @count += 1
      @all_items << key
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
      @all_items.delete(key)
    end 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @all_items.each {|item| remove(item)}
    num_buckets.times do
      @store.push(Array.new)
    end
    @all_items.each {|item| insert(item)}
  end
end
