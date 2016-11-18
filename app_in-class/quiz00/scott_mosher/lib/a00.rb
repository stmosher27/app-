# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  word = str.split(" ")
  ans = ""
  word.each do |var|
    if var == word.last
      ans << caeser_helper(var, shift)
    else
      ans << caeser_helper(var, shift) + " "
    end
  end
  
  ans
end

def caeser_helper(str, shift)
  alphabet_array = ("a".."z").to_a
  ans = ""
  (0...str.length).each do |i|
    idx = alphabet_array.find_index(str[i])
    ans << alphabet_array[(idx + shift) % alphabet_array.length]
  end
  ans
end
# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  ans = 0
  if num < 10
    return num
  else
  
  
  end
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  if alphabet.nil?
    alphabet_array = ("a".."z").to_a
  end
  
  ordered_str = ""


  
    
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    arr = self
    ansArr = []
    for i in 0...arr.length
      for u in i+1...arr.length
        if (arr[i] + arr[u] == 0)
          if u > i && (!ansArr.include?([i, u]) || !ansArr.include?[u, i])
            ansArr << [i, u]
          else
            ansArr << [u, i]
          end
        end
      end
    end
    ansArr
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    arr = []
    str = self
    puts str
    for i in 0..str.length
      for u in i..str.length
        if dictionary.include?(str[i..u])
          arr << str[i..u]
        end
      end
    end
    arr.uniq
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  arr = []
  for i in 1..num
    if num%i == 0
      arr << i
    end
  end
  arr
end

