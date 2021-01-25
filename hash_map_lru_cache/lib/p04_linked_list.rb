require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def inspect
    "#{@key}: #{@val} #{@next}: #{@prev}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.next.prev = self.prev
    self.prev.next = self.next
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current = first
    found = false 
    while !found
    # until current.key == key
      if current.key == key 
        return current.val
      else 
        return nil if current.next == nil
        current = current.next
      end 
    end
  end

  def include?(key)
    get(key) != nil
    # result = get(key)
    # if result != nil
    #   return true
    # else
    #   return false
    # end
  end

  def append(key, val)
    new = Node.new(key, val)
    new.prev = @tail.prev
    new.next = @tail
    @tail.prev.next = new
    @tail.prev = new
  end

  def update(key, val)
    current = first
    found = false 
    while !found
    # until current.key == key
      if current.key == key 
        current.val = val
        found = true
      else 
        return nil if current.next == nil
        current = current.next
      end 
    end
    
  end

  def remove(key)
    return nil if include?(key) == false
    current = first
    found = false 
    while !found
      if current.key == key
        current.remove
        found = true
      else 
        return nil if current.next == nil
        current = current.next
      end 
    end
  end

  def each(&prc)
    current_node = first
    until current_node == @tail
      yield(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
