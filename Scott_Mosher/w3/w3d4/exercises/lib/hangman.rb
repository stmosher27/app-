class Hangman
  attr_reader :guesser, :referee, :board
  
  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end
  
  def setup
    word_length = @referee.pick_secret_word
    @guesser.register_secret_length(word_length)
    @board = [nil]*word_length
  end
  
  def take_turn
    guess = @guesser.guess(@board)
    idxs = @referee.check_guess(guess)
    update_board(guess, idxs)
    
    @guesser.handle_response(guess, idxs)
  end
  
  def update_board(guess, idxs)
    idxs.each do |idx|
      @board[idx] = guess
    end
  end
end

class HumanPlayer
  
    def register_secret_length(length)
      puts "The secret word is #{length} characters long"
    end
    
    def guess(board)
      p board
      puts "What is your guess?"
      gets.chomp
    end
    
    def handle_response(guess, idxs)
      puts "Nice! Got #{guess} at position/s #{idxs}"
    end
    
    def pick_word
      puts "How long is your word?"
      
      leng = Integer(gets.chomp)
    end
end

class ComputerPlayer
  
  attr_reader :candidate_words
  
  def initialize(dictionary)
    @dictionary = dictionary
  end
  
  def pick_secret_word
    @secret_word = @dictionary.sample
    
    @secret_word.length
  end
  
  def check_guess(guess)
    idx_arr = []
    @secret_word.length.times do |idx|
      if @secret_word[idx] == guess
        idx_arr << idx
      end
    end
    
    idx_arr
  end
  
  def register_secret_length(leng)
    @candidate_words = @dictionary.select do |word|
      word.length == leng
    end
  end
  
  def guess(board)
    possible_answers = freq_table(board)
    
    most_frequent_letters = possible_answers.sort_by { |letter, count| count }
    letter, _ = most_frequent_letters.last
    
    letter
  end
  
  def freq_table(board)
    freq_table = Hash.new(0)
    @candidate_words.each do |word|
      board.each_with_index do |letter, index|
        freq_table[word[index]] += 1 if letter.nil?
      end
    end
    
    freq_table
  end
  
  def handle_response(guess, idxs)
    @candidate_words.delete_if do |word|
      should_delete = false
      
      word.split("").each_with_index do |letter, index|
        if (letter == guess) && (!idxs.include?(index))
          should_delete = true
          break
          elsif (letter != guess) && (idxs.include?(index))
          should_delete = true
          break
        end
      end
      
      should_delete
    end
  end
    
  
end

if __FILE__ == $PROGRAM_NAME
  print "Guesser: Computer (yes/no)? "
  if gets.chomp == "yes"
    guesser = ComputerPlayer.player_with_dict_file("dictionary.txt")
    else
    guesser = HumanPlayer.new
  end
  
  print "Referee: Computer (yes/no)? "
  if gets.chomp == "yes"
    referee = ComputerPlayer.player_with_dict_file("dictionary.txt")
    else
    referee = HumanPlayer.new
  end
  
  Hangman.new({guesser: guesser, referee: referee}).play
end

