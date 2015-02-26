class Table

  attr_reader :cards

  def initialize
    @cards = []
  end

  def place(card)
    @cards << card
    card.rank == 10 ? burn! : cards
    check_four_burn if cards.count > 3
  end

  def burn!
    @cards.clear
  end

  def topcard_rule
    @cards.last ? @rule = find_rule(@cards.last) : @rule = 4
    @rule
  end

  def topcard_rank
    @cards.last ? @rank = @cards.last.rank : @rank = 0
    @rank
  end

  # # # # # # # # # # # # # #

  def find_rule(card)
    if card.rank == 3
      @cards[-2].rank
    else
      @cards.last.rank
    end
  end

  def check_four_burn
    burn! if @cards[-4..-1].inject {|lastcard, card|
      lastcard.rank == card.rank ? card : (return nil) }
  end

end
