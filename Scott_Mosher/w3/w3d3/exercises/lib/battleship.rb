require_relative "board"
require_relative "player"

class BattleshipGame
  attr_reader :board, :player
  
  def initialize(player = HumanPlayer.new("Scott"), board = Board.random)
    @player = player
    @board = board
    @hit = false
  end
  
  def attack(pos)
    if board[pos] == :s
      @hit = true
    else
      @hit = false
    end
    
    board[pos] = :x
    
  end
  
  def count
    board.count
  end
  
  def game_over?
    board.won?
  end
  
  def play_turn
    pos = nil
    until pos.is_a?(Array) && board.in_range?(pos)
      board.display
      if @hit
        puts "It's a hit"
      end
      puts "there are #{count} ships remaining"
      pos = player.get_play
    end
    attack(pos)
  end
  
  def play
    if over?
      winner
    else
      play_turn
    end
  end
  
  
  def winner
    puts "You win!"
  end
end

if __FILE__ == $PROGRAM_NAME
  BattleshipGame.new.play
end
