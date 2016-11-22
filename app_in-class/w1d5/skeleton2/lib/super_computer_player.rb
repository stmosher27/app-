require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    root = TicTacToeNode.new(game.board, mark)
    root.children.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end
    root.children.each do |child|
      return child.prev_move_pos unless child.losing_node?(mark)
    end

    raise "loser"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(cp, hp).run
end
