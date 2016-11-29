require_relative 'display'

class Player
  attr_reader :name, :color
  def initialize(name, color, display)
    @name = name
    @color = color
    @display = display
  end
end

class HumanPlayer < Player
  def play_turn
    start_pos = select_pos
    end_pos = select_pos
    return play_turn if start_pos == end_pos
    [start_pos, end_pos]
  end

  def select_pos
    pos = nil
    while pos.nil?
      @display.render
      puts "#{color.to_s.upcase}'s turn!"
      pos = @display.get_input
    end
    
    pos
  end
end
