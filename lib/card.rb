class Card

  attr_reader :rank, :contents

  def initialize(rank=0,suit= "?" )
    @rank = rank
    @suit = suit
  end

  def suit
    @suit.to_sym
  end

  def contents
    rank = parse_rank
    (rank+@suit).to_sym
  end

  def parse_rank
    ranks = ["?", "Ace", "2", "3", "4", "5", "6", "7",
      "8", "9", "10", "Jack", "Queen", "King"]
    ranks[@rank]
  end





end