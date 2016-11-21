require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &block)
    i = 0
    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end
    accumulator

  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

def primes(num)
  prime_array = []
  possible_primes = 2
  until prime_array.length == num
    prime_array << possible_primes if is_prime?(possible_primes)
    possible_primes += 1
  end
  prime_array
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num <= 1
  facs = factorials_rec(num-1)
  facs << facs.last * (num-1)
  facs
end


class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dups_hash = Hash.new { |h, k| h[k] = [] }
    self.each_with_index do |el, i|
      dups_hash[el] << i
    end
    dups_hash.select { |_, v| v.count > 1 }
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    pal_array = []
    str_array = self.split("")
    str_array.each_index do |i|
      (i+1..self.length-1).each do |u|
        temp = str_array[i..u]
        if temp == temp.reverse && temp.length > 1
          pal_array << str_array[i..u].join("")
        end
      end
    end
    pal_array
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if length <= 1

    middle = length / 2
    sorted_left = self.take(middle).merge_sort(&prc)
    sorted_right = self.drop(middle).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
      merged.concat(left)
      merged += right

      merged
  end
end
