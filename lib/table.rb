class Table < Array

  def place(card)
    self << card
    card.rank == 10 ? burn! : self
    check_four_burn if count > 3
  end

  def burn!
    self.clear
  end

  def topcard_rule
    self.last ? @rule = find_rule(last) : @rule = 4
    @rule
  end

  def topcard_rank
    self.last ? @rank = last.rank : @rank = 0
    @rank
  end

  # # # # # # # # # # # # # #

  def find_rule(card)
    if card.rank == 3
      self[-2].rank
    else
      self.last.rank
    end
  end

  def check_four_burn
    burn! if self[-4..-1].inject {|lastcard, card|
      lastcard.rank == card.rank ? card : (return nil) }
  end

end
