class HumanPlayer
  def initialize(name = "Burt")
    @name = name
  end

  def guess(size, _)
    puts "#{@name}, Please type your guess < #{size}
      with this board sperated by a comma!"
    gets.chomp.split(",").map(&:to_i)
  end

  def show(card, _)

  end

end
