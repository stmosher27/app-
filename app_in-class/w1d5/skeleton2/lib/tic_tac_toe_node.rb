require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      return true if board.winner != evaluator && board.won?
      return false if board.winner.nil? || board.winner == evaluator
      #return board.won? && board.winner != evaluator
    end
    if evaluator == next_mover_mark
      children.all? { |child| child.losing_node?(evaluator) }
    else
      children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator
    end
    if evaluator == next_mover_mark
      children.any? { |child| child.winning_node?(evaluator) }
    else
      children.all? { |child| child.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_array = []
    board.rows.each_index do |row|
      board.rows[row].each_index do |col|
        pos = [row, col]
        if board[pos].nil?
          new_board = board.dup
          new_board[pos] = next_mover_mark
          child_array << self.class.new(new_board, switch_mark(next_mover_mark), pos)
        end
      end
    end
    child_array
  end

  def switch_mark(mark)
    mark == :x ? :o : :x
  end
end
