class Deck < Array


  def draw
    self.pop
  end

  def shuffle
    self.shuffle!
    self.shuffle!
    self.shuffle!
  end

  def top_card
    self.last
  end


end