require './Board'
require './Card'
require './HumanPlayer'
require './ComputerPlayer'
require 'byebug'
class Game
  attr_reader :board
  def initialize(size = 4, player = HumanPlayer.new)
    @board = Board.new(size)
    @prev_guess_card = Card.new(0)
    @player = player
    @score = 0
  end

  def play
    @board.populate
    @board.render
    until @board.won?
      current_card = @board.reveal(@player.guess(4, @score))
      @board.render
      if @score.even?
      elsif @score.odd? && current_card.value == @prev_guess_card.value
        current_card.face = true
        @prev_guess_card.face = true
      else
        current_card.face = false
        @prev_guess_card.face = false
      end
      puts
      @player.show(current_card, @score)
      @prev_guess_card = current_card
      @score += 1
    end

    puts "You won!"
  end

end
