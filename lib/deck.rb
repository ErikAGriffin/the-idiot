class Deck

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def draw
    @cards.pop
  end

  def shuffle
    @cards.shuffle!
    @cards.shuffle!
    @cards.shuffle!
  end

  def top_card
    @cards.last
  end

  def count
    @cards.count
  end


end
