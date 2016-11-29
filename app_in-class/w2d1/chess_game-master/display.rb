require_relative 'board'
require_relative 'cursor'
require 'colorize'
class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def get_input
    @cursor.get_input
  end

  def render
    system("clear")
    arr = []
    8.times do |row|
      row_array = render_row(row)
      arr << row_array.join("")
    end
    puts arr.join("\n")
    in_check_message
  end

  private

  def render_row(row)
    row_array = []
    8.times do |col|
      pos = [row, col]
      str = render_pos(pos)
      if @cursor.cursor_pos == pos
        str = colorize_cursor(str)
      end
      row_array << str
    end
    row_array
  end

  def in_check_message
    if @board.in_check?(:black)
      puts "Black is in check!"
    elsif @board.in_check?(:white)
      puts "White is in check!"
    end
  end

  def colorize_cursor(str)
    color = @cursor.selected ? :light_green : :light_red
    str.colorize(:background => color)
  end

  def render_pos(pos)
    color = pos.inject(:+).odd? ? :white : :light_grey
    " #{@board[pos].to_s} ".colorize(:background => color)
  end

end
