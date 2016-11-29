require_relative 'deck'
class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0
    @cards.each do |card|
      points += card.blackjack_value
    end
    points
  end

  def busted?
    return true if points > 21
    false
  end

  def hit(deck)
    raise 'already busted' if self.busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return true if other_hand.busted?
    return false if self.busted?
    return true if other_hand.points < self.points
    return false if other_hand.points == self.points
    false
  end

  def return_cards(deck)
    deck.return(self.cards)
    self.cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
