class Book
  # TODO: your code goes here!
  SMALL = %w(a the an and in of)
  
  attr_reader :title
  
  def title=(title)
    arr = title.split(" ")

    arr.each.with_index do |word, i|
      if SMALL.include?(word) && i != 0
        word
      else
        word.capitalize!
      end
    end

    @title = arr.join(" ")
  end
end
