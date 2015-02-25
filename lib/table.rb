class TableRule

  # How can I make this more protected,
  # yet allow the table and the table alone
  # to always modify these properties

  attr_accessor :rank, :rule
  def initialize
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
  end

  def burn!
    self.clear
  end

  def topcard
    if self.last
      @rule.rank = self.last.rank
      @rule.rule = self.last.rank
    else
      @rule.rank = 0
      @rule.rule = 4
    end
    @rule
  end





end
