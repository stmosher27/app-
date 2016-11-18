require 'byebug'

class Array
  def my_each(&prc)
    self.length.times do |idx|
      prc.call(self[idx])
    end
  end

  def my_select(&prc)
    selected = []
    self.my_each do |el|
      selected << el if prc.call(el)
    end
    selected
  end

  def my_reject(&prc)
    selected = []
    self.my_each do |el|
      selected << el unless prc.call(el)
    end
    selected
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    flattened = []
    self.my_each do |el|
      if !el.is_a? Array
        flattened << el
      else
        flattened += el.my_flatten
      end
    end
    flattened
  end

  def my_zip(*args)
    zipped = []
    cur_idx = 0
    self.length.times do
      sub_array = []
      sub_array << self[cur_idx]
      args.my_each do |arr|
        sub_array << arr[cur_idx]
      end
      cur_idx += 1
      zipped << sub_array
    end
    zipped
  end

  def my_rotate(rotation = 1)
    return self if rotation == 0
    rotated = self.dup
    rotation.abs.times do
      if rotation > 0
        rotated.push(rotated.shift)
      else
        rotated.unshift(rotated.pop)
      end
    end
    rotated
  end

  def my_join(seperator = '')
    str = ''
    self.my_each do |el|
      str << el + seperator
    end
    str
  end

  def my_reverse
    reversed = []
    (1..self.length).to_a.my_each do |idx|
      reversed << self[-idx]
    end
    reversed
  end

end
