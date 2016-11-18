class Game

  def self.game_from_file(file_name, player1 = Player.new("player one"), player2 = Player.new("player two"))
    words = File.readlines(file_name)
    dictionary = {}
    ('a'..'z').each do |key|
      dictionary[key] = words.select { |word| word[0] == key }
    end
    Game.new(dictionary, player1, player2)
  end

  def initialize(dictionary, player1 = Player.new("player one"), player2 = Player.new("player two"))
    @player1 = player1
    @player2 = player2
    @fragment = ''
    @dictionary = dictionary
    @current_player = player1
  end

  def next_player!
    @current_player = (@current_player == @player1 ? @player2 : @player1)
  end

  def play_round
    puts "The fragment is currently #{@fragment}." unless @fragment.nil?
    take_turn(@current_player)
    next_player!
  end


  def game_over?
    return false if @fragment.nil?
    @dictionary[@fragment[0]].include?(@fragment)
  end

  def previous_player
    @current_player == @player1 ? @player2 : @player1
  end

  def take_turn(player)
    temp_frag = nil
    until valid_play(temp_frag)
      player.alert_invalid_guess unless temp_frag.nil?
      letter = player.guess
      temp_frag = fragment + letter
    end
    @fragment = temp_frag
  end

  def valid_play?(str)
    return false if str.nil?
    valid_letters = dictionary[str[0]].map { |el| el[0...str.length] }
    valid_letters.include?(str)
  end

  def run
    until game_over?
      play_round
    end
    puts "#{previous_player} won!"
  end

end

class Player
  def initialize(name)
    @name = name
  end

  def alert_invalid_guess
    puts "Invalid guess! Try again."
  end

  def guess
    puts "What letter would you like to add?"
    letter = nil
    until ("a".."z").to_a.include?(letter)
      puts "Not a letter!" unless letter.nil?
      letter = gets.chomp.downcase
    end
    letter
  end
end

if __FILE__ == $PROGRAM_NAME
  kat = Player.new("Kat")
  scott = Player.new("Scott")
  ghost = Game.game_from_file("dictionary.txt", kat, scott)
  ghost.run
end
