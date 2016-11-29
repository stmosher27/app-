require_relative 'all_pieces'
require 'byebug'
class Board
  def initialize(grid = nil)
    @grid = grid || make_starting_grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    start_piece = self[start_pos]
    check_start(start_piece)
    check_move(start_piece, end_pos)
    switch_pieces(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    switch_pieces(start_pos, end_pos)
  end

  def in_bounds?(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end

  def in_check?(color)
    king = find_king(color)
    opponent_pieces = @grid.flatten.reject do |piece|
      piece.is_a?(NullPiece) || king.same_team?(piece)
    end

    opponent_pieces.any? do |piece|
      piece.moves.include?(king.pos)
    end
  end

  def checkmate?(color)
    return false unless in_check?(color)

    our_pieces = @grid.flatten.select do |piece|
      piece.color == color
    end

    our_pieces.all? { |piece| piece.valid_moves.empty? }
  end

  def dup
    dup_grid = @grid.map { |row| row.dup }

    new_board = Board.new(dup_grid)

    8.times do |row|
      8.times do |col|
        pos = [row, col]
        piece = new_board[pos]
        if piece.is_a?(NullPiece)
          new_piece = NullPiece.instance
        else
          new_piece = piece.class.new(piece.color, pos, new_board)
        end

        new_board[pos] = new_piece
      end
    end

    new_board
  end

  private

  def check_start(piece)
    raise "No piece here" if piece.is_a?(NullPiece)
  end

  def check_move(piece, pos)
    raise "Invalid move" unless piece.valid_moves.include?(pos)
  end

  def make_starting_grid
    grid = []
    8.times do |row|
      color = (row < 2 ? :black : :white)
      pieces_array = case row
      when 0, 7
        make_back_rank(color, row)
      when 1, 6
        make_pawn_rank(color, row)
      else
        Array.new(8){ NullPiece.instance }
      end

      grid << pieces_array
    end
    grid
  end

  def make_pawn_rank(color, row)
    (0..7).map {|col| Pawn.new(color, [row, col], self)}
  end

  def make_back_rank(color, row)
    [
      Rook.new(color, [row, 0], self),
      Knight.new(color, [row, 1], self),
      Bishop.new(color, [row, 2], self),
      Queen.new(color, [row, 3], self),
      King.new(color, [row, 4], self),
      Bishop.new(color, [row, 5], self),
      Knight.new(color, [row, 6], self),
      Rook.new(color, [row, 7], self)
    ]
  end

  def switch_pieces(start_pos, end_pos)
    unless self[end_pos].is_a?(NullPiece)
      # set end pos to nullpiece
      self[end_pos] = NullPiece.instance
    end
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    self[end_pos].update_pos(end_pos)
  end

  def find_king(color)
    #returns king instance of matching color
    @grid.flatten.each do |piece|
      return piece if piece.is_a?(King) && piece.color == color
    end
  end
end
