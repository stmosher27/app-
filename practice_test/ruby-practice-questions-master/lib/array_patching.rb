require 'byebug'
class Array

  def my_each(&prc)
    length.times do |i|
      prc.call(self[i])
    end
    self
  end

  def my_each_with_index(&prc)
    length.times do |i|
      prc.call(self[i], i)
    end
    self
  end

  def my_select(&prc)
    selected = []
    my_each do |el|
      selected << el if prc.call(el)
    end
    selected
  end

  def my_reject(&prc)
    self.dup - my_select(&prc)
  end

  def my_any?(&prc)
    my_each { |el| return true if prc.call(el) }
    false
  end

  def my_all?(&prc)
    my_each { |el| return false unless prc.call(el) }
    true
  end

  def my_flatten
    flat = []
    my_each do |el|
      if el.is_a?(Array)
        flat += el.my_flatten
      else
        flat << el
      end
    end
    flat
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n < 1
    flat = []
    my_each do |el|
      if el.is_a?(Array)
        flat += el.my_controlled_flatten(n-1)
      else
        flat << el
      end
    end
    flat
  end

  def my_zip(*arrs)
    new_array = []
    length.times do |i|
      new_array << [self[i]]
      arrs.each do |el|
        new_array[i] << el[i]
      end
    end
    new_array
  end

  def my_rotate(num=1)
    rotations = num % length
    rotated = self.dup
    rotations.times do
      temp1 = rotated.shift
      rotated << temp1
    end
    rotated
  end

  def my_join(str = "")
    str_join = ""
    self.my_each do |char|
      str_join += char
      str_join += str unless char == self.last
    end
    str_join
  end

  def my_reverse
    reversed = []
    my_each do |char|
      reversed.unshift(char)
    end
    reversed
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if length <= 1

    pivot = first
    left = self[1..-1].my_select { |el| prc.call(el, pivot) == -1 }
    right = self[1..-1].my_select { |el| prc.call(el, pivot) != -1 }

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return nil if length <= 0
    mid = length / 2

    case prc.call(self[mid], target)
    when 0
      return mid
    when 1
      return self[0...mid].my_bsearch(target, &prc)
    else
      result = self[mid+1..-1].my_bsearch(target, &prc)
      result + mid + 1 unless result.nil?
    end

    # if self[mid] > target
    #   my_bsearch(self[first...mid])
    # elsif self[mid] < target
    #   my_bsearch(self[mid..last])
    # else
    #   return self
    # end
  end

end
