require_relative "00_tree_node"
class KnightPathFinder
  GRID_SIZE = 8

  MOVES = [[1, -2], [1, 2], [-1, -2], [-1, 2], [2, -1], [2, 1], [-2, 1], [2, -1]]

  def self.valid_moves(pos)
    row, col = pos
    valid_moves = []
    MOVES.each do |move|
      valid_move = [row + move.first, col + move.last]
      next unless valid_move.all? { |el| el.between?(0, GRID_SIZE - 1) }
      valid_moves << valid_move unless valid_moves.include?(valid_move)
    end
    valid_moves
  end

  def initialize(pos)
    @visited_positions = [pos]
    @move_tree = build_move_tree(pos)
  end

  def new_move_positions(pos)
    new_moves = self.class.valid_moves(pos)
    new_moves.reject! { |el| @visited_positions.include?(el) }
    @visited_positions += new_moves
    new_moves
  end

  def build_move_tree(pos)
    root = PolyTreeNode.new(pos)
    queue = [root]

    until queue.empty?
      current_node = queue.shift
      pos_array = new_move_positions(current_node.value)

      pos_array.each do |child_pos|
        child_node = PolyTreeNode.new(child_pos)
        child_node.parent = current_node
        queue << child_node
      end
    end
    root
  end

  def find_path(end_pos)
    target_node = @move_tree.dfs(end_pos)
    trace_path_back(target_node)
  end

  def trace_path_back(target_node)
    path = []
    current_node = target_node
    until current_node.nil?
      path.unshift(current_node.value)
      current_node = current_node.parent
    end
    path
  end
end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
