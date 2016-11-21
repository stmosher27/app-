class RecursionMachine

  # Implement a method that finds the sum of the first n
  # fibonacci numbers recursively. Assume n > 0
  def fibs_sum(n)
    return 0 if n <= 0
    return 1 if n <= 1
    fibs_sum(n-1) + fibs_sum(n-2) + 1
  end

  #returns all subsets of an array
  def subsets(array)
    return [array] if array.length <= 0
    result = []
    digit = array.pop
    subs = subsets(array)

    result += subs
    subs.each do |el|
      result << (el + [digit]).flatten
    end
    result
  end

  # return the sum of the first n even numbers recursively. Assume n > 0
  def first_even_numbers_sum(n)
    return 0 if n == 0
    return 2 if n == 1

    2 * n + first_even_numbers_sum(n-1)
  end

  # return b^n recursively. Your solution should accept negative values
  # for n
  def exponent(b, n)
    return 1 if n == 0 || b == 1
    if n > 0
      b * exponent(b, n-1)
    else
      (1.0 / b) * exponent(b, n+1)
    end
end

  # make better change problem from class
  def make_better_change(value, coins)
    check_coins = coins.select { |el| el <= value }
    return nil if check_coins.empty?

    solutions = []
    check_coins.sort.reverse.each do |coin|
      remain = value - coin

      if remain > 0
        remain = make_better_change(remain, coins)
        solutions << [coin] + remain unless remain.nil?
      else
        solutions << [coin]
      end
    end
    solutions.sort_by! { |arr| arr.length }.first

  end

  #deep dup question from class
  def deep_dup(arr)
    deep = []
    arr.each do |el|
      if el.is_a?(Array)
        deep << deep_dup(el)
      else
        deep << el
      end
    end
    deep
end

  # Write a recursive method that takes in a string to search and a key string.
  # Return true if the string contains all of the characters in the key
  # in the same order that they appear in the key.
  #
  # string_include_key?("cadbpc", "abc") => true
  # string_include_key("cba", "abc") => false
  def string_include_key?(string, key)
    str_arr = string.split("")
    key_arr = key.split("")
    return true if key.length == 1 && str_arr.include?(key_arr.first)
    str_arr.each_index do |i|
      if str_arr[i] == key_arr.first
        bool = string_include_key?(str_arr.drop(i+1).join(""), key_arr.drop(1).join(""))
        if bool
          return true
        end
      end
    end
    false
  end

  # Write a recursive function that returns the prime factorization of
  # a given number. Assume num > 1
  #
  # prime_factorization(12) => [2,2,3]
  def prime_factorization(num)
    return [num] if is_prime?(num)
    prime_fact = []
    (2..num).each do |n|
      return [n] + prime_factorization(num / n) if num % n == 0
    end
    prime_fact
  end

  def is_prime?(num)
    (2...num).each do |n|
      return false if num % n == 0
    end
    true
  end

  # Write a method, `digital_root(num)`. It should Sum the digits of a positive
  # integer. If it is greater than 10, sum the digits of the resulting number.
  # Keep repeating until there is only one digit in the result, called the
  # "digital root". **Do not use string conversion within your method.**
  #
  # You may wish to use a helper function, `digital_root_step(num)` which performs
  # one step of the process.

  def digital_root(num)
    return num if num < 10
    sum = 0
    sum += num % 10 + digital_root(num / 10)

    if sum > 10
      digital_root(sum)
    else
      sum
    end
  end

  # Write a recursive method that takes in a base 10 number n and
  # converts it to a base b number. Return the new number as a string
  #
  # E.g. base_converter(5, 2) == "101"
  # base_converter(31, 16) == "1f"

  def base_converter(num, b)
    return "" if num == 0
    digits = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

    base_converter(num/b, b) + digits[num%b]
  end

  # CHALLENGE: Eight queens puzzle precursor
  #
  # Write a recursive method that generates all 8! possible unique ways to
  # place eight queens on a chess board such that no two queens are in
  # the same board row or column (the same diagonal is OK).
  #
  # Each of the 8! elements in the return array should be an array of positions:
  # E.g. [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]]
  #
  # My solution used 3 method parameters: current_row, taken_columns, and
  # positions so far
  def eight_queens_possibilities(current_row, taken_columns, positions)
    positions ||= []
    return [positions] if current_row == 8

    all_pos = []
    cols_left = (0..7).to_a - taken_columns

    cols_left.each do |col|
      pos_dup = positions.dup
      pos_dup << [current_row, col]

      all_pos += eight_queens_possibilities(current_row+1,
        taken_columns+[col], pos_dup)
    end
    all_pos
  end
end
