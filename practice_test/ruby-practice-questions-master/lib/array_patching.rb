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
    zipped = []
    length.times do |i|
      zipped << [self[i]]
      arrs.each do |el|
        zipped[i] << el[i]
      end
    end

    zipped

  end

  def my_rotate(num=1)
    dups = self.dup
    n = num % length
    while n > 0
      temp = dups.shift
      dups << temp
      n -= 1
    end
    dups
  end

  def my_join(str = "")
    joined = ""
    length.times do |i|
      if i < length-1
        joined.concat(self[i].concat(str))
      else
        joined.concat(self[i])
      end
    end
    joined
  end

  def my_reverse
    reversed = []
    each_index do |i|
      reversed << self[length-i-1]
    end
    reversed

  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    return self if length <= 1
    prc ||= Proc.new { |x, y| x <=> y }

    pivot = first
    left = self[1..-1].select { |el| prc.call(el, pivot) == -1 }
    right = self[1..-1].select { |el| prc.call(el, pivot) != -1 }

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)

  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
    return nil if length == 0
    prc ||= Proc.new { |x, y| x <=> y }

    mid = length / 2
    case prc.call(self[mid], target)
    when 1
      return self.dup.take(mid).my_bsearch(target, &prc)
    when 0
      return mid
    else
      result = self.dup.drop(mid+1).my_bsearch(target, &prc)
      result + mid + 1 unless result.nil?
    end
  end

end
