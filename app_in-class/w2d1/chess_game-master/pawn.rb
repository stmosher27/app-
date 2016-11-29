require_relative 'piece'

class Pawn < Piece
  def initialize(color, pos, board)
    super
    @symbol = choose_symbol
  end

  # def moves
  #   poss_moves = []
  #
  #   diag_dirs.each do |dir|
  #     new_pos = get_pos(pos, dir)
  #     next unless @board.in_bounds?(new_pos)
  #     other = @board[new_pos]
  #     next if other.is_a?(NullPiece) || other.same_team?(self)
  #     poss_moves << new_pos
  #   end
  #
  #   straight_dirs.each do |dir|
  #     new_pos = get_pos(pos, dir)
  #     next unless @board.in_bounds?(new_pos)
  #     other = @board[new_pos]
  #     break unless other.is_a?(NullPiece)
  #     poss_moves << new_pos
  #   end
  #
  #   poss_moves
  # end

  def moves
    poss_moves = []

    all_dirs = diag_dirs + straight_dirs
    all_dirs.each_with_index do |dir, idx|
      new_pos = get_pos(pos, dir)
      next unless @board.in_bounds?(new_pos)
      other = @board[new_pos]

      if idx < diag_dirs.length
        next if other.is_a?(NullPiece) || other.same_team?(self)
      else
        break unless other.is_a?(NullPiece)
      end

      poss_moves << new_pos
    end

    poss_moves
  end

  private

  def diag_dirs
    diff = @color == :black ? 1 : -1
    [[diff, 1], [diff, -1]]
  end

  def first_row?
    pos.first == (@color == :black ? 1 : 6)
  end

  def straight_dirs
    diff = @color == :black ? 1 : -1
    if first_row?
      [[diff, 0],[diff * 2, 0]]
    else
      [[diff, 0]]
    end
  end

  def choose_symbol
    @color == :black ? "\u{265F}" : "\u{2659}"
  end
end
