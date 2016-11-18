require 'byebug'

def range(start, stop)
  return [] if start >= stop-1

  #return [stop - start] if (stop - start) == 2
  [start + 1] + range(start+1, stop)
end

def arr_sum(arr)
  arr.inject { |el, sum| sum += el }
end

#p arr_sum([1,2,3,4])

def arr_sum_recur(arr)
  return arr[0] if arr.length == 1
  arr[0] + arr_sum_recur(arr[1..-1])
end

#p arr_sum_recur([1,2,3])

def exponent(b, n)
  return 1 if n == 0
  b * exponent(b, n-1)
end



def exponent2(b, n)
  return 1 if n == 0
  return b if n == 1
  exponent2(b, n/2) * exponent2(b, n/2) if n.even?
  exponent2(b, (n-1) / 2) * exponent2(b, (n-1) / 2) * b

end

# p exponent2(3,3)
# p exponent2(3,0)

class Array

  def deep_dup(arr=self)
    out = []
    arr.each do |el|
      deep_dup(el) if el.is_a?(Array)
      out << el
    end
    out
  end
end

def fibonacci(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  fibonacci(n - 1) << fibonacci(n-1)[-1] + fibonacci(n-1)[-2]
end

# a = [1,[1],[2,[3]]]
# b = a.deep_dup
# p a
# a[0] = 3
# p a,b

#p fibonacci(8)

def permutations(arr)
  return [arr] if arr.length == 1

  digit = arr.shift
  perms = permutations(arr)

  new_array = []

  perms.each do |el|
    (0..perms.length).each do |idx|
      new_array << el[0...idx] + [digit] + el[idx..-1]
    end
  end
  new_array
end
#p permutations([1, 2, 3])

def bsearch(array, target)
  return 0 if array[0] == target
  return nil unless array.include?(target)
  position = 0
  #iterative thing
  middle_pos = array.length / 2
  if target > array[middle_pos]
    position += middle_pos + bsearch(array[middle_pos..-1], target)
  elsif target < array[middle_pos]
    position += bsearch(array[0..middle_pos], target)
  else
    position = middle_pos
  end
  position
end
#
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  return arr if arr.length <= 1

  merge(merge_sort(arr[0...arr.length/2]), merge_sort(arr[arr.length/2..-1]))

end

def merge(arr1, arr2)
  return arr1 if arr2.nil?
  return arr2 if arr1.nil?
  out = []
  idx1 = 0
  idx2 = 0
  until idx1 == arr1.length && idx2 == arr2.length
    if arr1[idx1].nil?
      out << arr2[idx2]
      idx2 += 1
    elsif arr2[idx2].nil? || arr1[idx1] <= arr2[idx2]
      out << arr1[idx1]
      idx1 += 1
    else
      out << arr2[idx2]
      idx2 += 1
    end
  end
  out
end


def subsets(arr)
  #byebug
  return [arr] if arr.length == 0

  digit = arr.pop
  subset_array = []
  subs = subsets(arr)

  subset_array += subs
  subs.each do |el|
    #(0..subs.length).each do |idx|
    subset_array << (el + [digit]).flatten
  end
  subset_array
end

#subsets([1,2,3])


def greedy_make_change(num, arr)
  return [] if num == 0

  coin_array = []
  coin_idx = 0
  largest = 0
  arr.each_with_index do |coin, idx|
    if coin <= num
      largest = coin
      coin_idx = idx
      break
    end
  end

  coin_array += [arr[coin_idx]] + greedy_make_change(num - largest, arr)


end


def make_better_change(num, arr)
  return [] if num == 0

  arr.sort.reverse
  return [num] if num < arr.last
  optimal_array = nil
  arr.each_with_index do |coin, i|
    #iterate over each coin
    if coin <= num
      best_remainder = make_better_change(num - coin, arr.drop(i))
      current_change = [coin] + best_remainder
      optimal_array = current_change if optimal_array.nil? || current_change.length < optimal_array.length
    end

  end
  #coin_arrays << coin_array
  optimal_array
end
greedy_make_change(192, [10,7, 4, 25 ,1])

p make_better_change(193, [10,7, 4, 25, 1])
