class ComputerPlayer
  def initialize(name = "machine")
    @name = name
    @store = {
      1 => [[],[]],
      2 => [[],[]],
      3 => [[],[]],
      4 => [[],[]],
      5 => [[],[]],
      6 => [[],[]],
      7 => [[],[]],
      8 => [[],[]]
    }
    @possible_moves = fill_up_moves
    @result = []
    # @prev_value = 0
    # @ctr = 0
    # @next_move = nil
    # @card_face = false
  end

  def fill_up_moves
    result= []
    0.upto(3) do |idx1|
      0.upto(3) do |idx2|
        result << [idx1, idx2]
      end
    end

    result
  end

  def guess(_, _)
    p @store if @possible_moves.empty?
    @result = @possible_moves.sample
    @possible_moves.delete(@result)

    @result
  end

  # def guess(size, score)
  #   @ctr = score
  #   #
  #   result = []
  #   while result.include?()
  #     2.times { result << (0...size).to_a.sample }
  #   end
  #   #end
  #   #@moves << result
  #   result
  #
  #
  #   #return @next_move if @next_move
  #
  #   # if @ctr.even? && @store.values.none? { |v| v.length == 2 }
  #   #   puts random_move(size)
  #   #   random_move(size)
  #   #
  #   # elsif @ctr.odd? && @store.keys.include?(@prev_value)
  #   #   puts @moves.last
  #   #   @moves.last
  #   # elsif @ctr.even? && @store.values.any?{ |v| v.length == 2 }
  #   #   puts win_move
  #   #   win_move
  #
  #
  #   # return @next_move unless @next_move
  #   # @ctr = score
  #   # result = []
  #   # return win_move if @store.values.any? { |v| v.length == 2 }
  #   # result = random_move(size)
  #   # @moves << result
  #   # result
  # end

  # def win_move
  #   @store.values.each do |v|
  #     @next_move = v.last
  #     return v.first
  #   end
  # end

  def random_move(size)
    result = []
    first = true
    while @moves.include?(result) || first
      2.times { result << (0...size).to_a.sample}
      first = false
    end
    @moves << result
    result
  end

  def show(card, _)
    val = card.value
    @store[val] << @result
    # @store[card.value] = @moves.last
    # @prev_value = @store.key(@moves.last)
    # @card_face = card.face
  end

end
