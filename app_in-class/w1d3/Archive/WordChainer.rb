require 'set'
class WordChainer

  attr_accessor :dictionary, :current_words, :all_seen_words, :words
  def initialize(dictionary)

    @words = (File.readlines(dictionary).map(&:chomp))
    @dictionary = Set.new(@words)

    @current_words = []
    @current_word = ""
    @all_seen_words = []
  end


  def adjacent_words(word)
    out = Set.new(@words)
    out.keep_if { |el| word.length == el.length }
    out.keep_if do |el|
      count = 0
      el.chars.each_with_index do |letter, idx|
        unless letter == word[idx]
          count += 1
        end
      end
      true if count == 1
    end
    out
  end

  def is_adjacent(word1, word2)
    count = 0
    return false unless word1.length == word2.length
    word1.chars.each_with_index do |letter, idx|
      unless letter == word2[idx]
        count += 1
      end
    end
    return true if count == 1
    false
  end

  def run(start, target)
    @current_words << start
    @all_seen_words << start

    until @current_words.empty?
      new_current_words = []
      @current_words.each do |current_word|
        subset = adjacent_words(current_word)
        subset.each do |adjacent_word|
          next if @all_seen_words.include?(adjacent_word)
          new_current_words << adjacent_word
          @all_seen_words << adjacent_word
        end
      end
      p new_current_words
      @current_words = new_current_words
    end
  end

end



test = WordChainer.new("dictionary.txt")

test.dictionary.take(3)

test.adjacent_words("cat")
test.is_adjacent("cat", "har")
test.run("meaning", "skate")
