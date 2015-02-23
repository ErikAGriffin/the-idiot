class Table < Array

  def place(card)
    self << card
  end

  def burn!
    self.clear
  end

  def topcard
    self.last
  end





end
