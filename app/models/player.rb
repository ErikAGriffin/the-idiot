class Player

  attr_reader :hand, :faceup_cards

  def initialize
    @hand = []
    @facedown_cards = []
    @faceup_cards = []
  end

  def deal(card)
    raise 'You dealt too many cards!' if @hand.count >= 6
    if facedown_cards.count < 3
      @facedown_cards << card
    else
      give(card)
    end
  end

  def give(card)
    @hand << card
  end

  def play(card)
    if faceup?
      my_card = @faceup_cards.delete card
    else
      my_card = @hand.delete card
    end
    raise "Player does not have that card in hand!" if !my_card
    my_card
  end

  def play_facedown(index)
    if @hand.count == 0 && @faceup_cards.count == 0
      give facedown_cards[index]
      play(@hand.first)
    else
      raise "Player does not have that card in hand!"
    end
  end

  def place_faceup(card)
    raise "You've already placed your cards!" if @faceup_cards.count >= 3
    my_card = @hand.delete card
    raise "Player does not own that card!" if !my_card
    @faceup_cards << my_card
  end

  private

  def facedown_cards
    @facedown_cards
  end

  def faceup?
    @hand.count == 0
  end


end
