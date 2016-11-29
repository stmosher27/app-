require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    if self.hand.points < 17
      self.hand.hit(deck)
    end
    until self.hand.points >= 17
      self.hand.hit(deck)
    end
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    @bets.each do |player, amt|
      if player.hand.beats?(self.hand)
        player.pay_winnings(amt*2)
      end
    end 
  end
end
