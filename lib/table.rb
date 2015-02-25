class TableRule

  # How can I make this more protected,
  # yet allow the table and the table alone
  # to always modify these properties

  attr_accessor :rank, :rule
  def initialize
    @rule = 4
  end

  def zero_out
    @rank = 0
    @rule = 4
  end
end

class Table < Array

  def initialize
    super
    @rule = TableRule.new
  end

  def place(card)
    self << card
    card.rank == 10 ? burn! : self
    check_four_burn if count > 3
  end

  def burn!
    self.clear
    @rule.zero_out
  end

  def topcard
    if self.last
      @rule.rank = self.last.rank
      @rule.rule = find_rule(self.last)
    else
      @rule.zero_out
    end
    @rule
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
