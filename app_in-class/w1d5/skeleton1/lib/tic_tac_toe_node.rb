require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board, @next_mover_mark, @prev_move_pos = board, next_mover_mark,
      prev_move_pos
  end

  def losing_node?(evaluator)
    winner = board.winner
    if board.over?
      return true if winner != evaluator
      return false if winner.nil? || winner == evaluator
    end
    if next_mover_mark == evaluator
      children.all? { |child| child.losing_node?(evaluator) }
    else
      children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    winner = board.winner
    if board.over?
      return true if winner == evaluator
      return false if winner.nil? || winner != evaluator
    end

    if next_mover_mark == evaluator
      children.any? { |child| child.winning_node?(evaluator) }
    else
      children.all? { |child| child.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    board.rows.each_index do |row|
      board.rows[row].each_index do |col|
        pos = [row, col]
        if board[pos].nil?
          new_board = board.dup
          new_board[pos] = next_mover_mark
          children << self.class.new(new_board, switch_mark(next_mover_mark), pos)
        end
      end
    end
    children
  end

  def switch_mark(prev_mark)
    prev_mark == :o ? :x : :o
  end
end
