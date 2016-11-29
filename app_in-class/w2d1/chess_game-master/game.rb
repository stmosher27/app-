require_relative 'display'
require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @p1 = HumanPlayer.new("Billy", :white, @display)
    @p2 = HumanPlayer.new("Joe", :black, @display)
    @current_player = @p1
  end

  def play
    until game_over?
      play_turn
      switch_players
    end
    puts "Checkmate! #{winner.name} wins"
  end

  private

  def play_turn
    player_color = @current_player.color
    start_pos, end_pos = @current_player.play_turn
    check_selected(start_pos, player_color)
    @board.move_piece(start_pos, end_pos)
  rescue RuntimeError => e
    puts e
    sleep(1)
    retry
  end

  def check_selected(start_pos, player_color)
    if !@board[start_pos].is_a?(NullPiece) &&
      @board[start_pos].color != player_color
      raise "Not your piece!"
    end
  end

  def game_over?
    @board.checkmate?(:black) || @board.checkmate?(:white)
  end

  def switch_players
    @current_player = (@current_player == @p1 ? @p2 : @p1)
  end

  def winner
    @board.checkmate?(:black) ? @p1 : @p2
  end
end

Game.new.play 
