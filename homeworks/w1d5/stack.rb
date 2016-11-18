class Stack
  def initialize(stack = [])
    @stack = stack
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end
require 'byebug'
class Map
  def initialize(map = [])
    @map = map
  end

  def assign(k, v)
    @map.each do |arr|
      if arr.first == k
        remove(arr.first)
      end
    end
    @map.push([k, v])
  end

  def lookup(k)
    @map.each do |arr|
      return arr if arr.first == k
    end
    nil
  end

  def remove(k)
    @map.reject! { |el| el.first == k }
    nil
  end

  def show
    @map
  end


end
