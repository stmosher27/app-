class Board
  DISPLAY_HASH = {
  nil => " ",
  :s => " ",
  :x => "x"
  }
  
  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  attr_reader :grid

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def count
    grid.flatten.select { |el| el == :s }.length
  end

  def full?
    grid.flatten.none?(&:nil?)
  end

  def empty?(pos = nil)
    if pos
      if self[pos].nil?
        return true
      else
        return false
      end
    else
      count == 0
    end
  end

  def place_random_ship
    if full?
      raise "error"
    end
    
    pos = [rand(grid.length), rand(grid.length)]
  
    while !empty?(pos)
      pos = [rand(grid.length), rand(grid.length)]
    end
  
    self[pos] = :s
  end

  def won?
    grid.flatten.none? { |el| el == :s }
  end
end
