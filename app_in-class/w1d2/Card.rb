class Card
  attr_accessor :face
  attr_reader :value, :seen

  def initialize(value)
    @value = value
    @face = false
    @seen = false
  end

  def hide
    @face = false
  end

  def reveal
    @face = true
  end

  def seen_by_comp
    @seen = true
  end 

  def to_s
    print @face ? @value : 'X'
  end

  def ==(other_card)
    self.value == other_card.value
  end
end
