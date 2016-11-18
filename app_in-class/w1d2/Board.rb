require './Card.rb'
require './HumanPlayer'
require './Game.rb'
class Board
  attr_reader :board
  def initialize(size = 4)
    @size = size
    @board = Array.new(size) { Array.new(size) }
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def populate
    hash_map = {
      1 => 2,
      2 => 2,
      3 => 2,
      4 => 2,
      5 => 2,
      6 => 2,
      7 => 2,
      8 => 2
    }

    0.upto(@board.length - 1) do |row|
      0.upto(@board[row].length - 1) do |col|
        value = nil
        value = hash_map.keys.sample until value && hash_map[value] > 0
        hash_map[value] -= 1
        @board[row][col] = Card.new(value)
      end
    end
  end

  def render
    @board.each do |line|
      line.map(&:to_s)
      puts
    end
  end

  def won?
    @board.each do |line|
      line.each do |card|
        return false unless card.face
      end
    end
    true
  end


  def reveal(guess)
    card = self[guess]
    unless card.face
      card.face = true
    end
    card
  end

end
