class Code
  attr_reader :pegs
  
  PEGS = { "R" => :red, "G" => :green, "B" => :blue, "Y" => :yellow,
  "O" => :orange, "P" => :purple }
  
  def initialize(pegs)
    @pegs = pegs
  end
  
  def self.parse(str)
    pegs = str.split("").map do |var|
      if PEGS.has_key?(var.upcase)
        PEGS[var.upcase]
      else
        raise "error"
      end
    end
    Code.new(pegs)
  end

  def self.random
    pegs = []
    4.times do
      pegs << PEGS.values.sample
    end
    Code.new(pegs)
  end

  def [](i)
    pegs[i]
  end

  def exact_matches(answer)
    matches = 0
    pegs.each_index do |i|
      if self[i] == answer[i]
        matches += 1
      end
    end
    
    matches
  end

  def color_counts
    color_counts = Hash.new(0)
    
    @pegs.each do |color|
      color_counts[color] += 1
    end
  
    color_counts
  end



  def near_matches(answer)
    other_color_counts = answer.color_counts
  
    near_matches = 0
    self.color_counts.each do |color, count|
      next unless other_color_counts.has_key?(color)
    
      near_matches += [count, other_color_counts[color]].min
    end
  
    near_matches - self.exact_matches(answer)
  end


  def ==(answer)
    return false unless answer.is_a?(Code)

    self.pegs == answer.pegs

  end
end

class Game
  MAX_TURNS = 10
  
  attr_reader :secret_code
  
  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end
  
  def play
    MAX_TURNS.times do
      guess = get_guess
      
      if guess == @secret_code
        puts "You're worth it!"
        return
      end
      
      display_matches(guess)
    end
    
    puts "You aren't very good at this..."
  end
  
  def get_guess
    puts "Guess the code:"
    
    begin
      Code.parse(gets.chomp)
      rescue
      puts "Error parsing code!"
      retry
    end
  end
  
  def display_matches(guess)
    exact_matches = @secret_code.exact_matches(guess)
    near_matches = @secret_code.near_matches(guess)
    
    puts "You got #{exact_matches} exact matches!"
    puts "You got #{near_matches} near matches!"
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
