class Player

  attr_reader :hand

  def initialize
    @hand = []
  end

  def give(card)
    @hand << card
  end

  def play(card)
    my_card = @hand.delete card
    raise "Player does not have that card!" if !my_card
    my_card
  end


end