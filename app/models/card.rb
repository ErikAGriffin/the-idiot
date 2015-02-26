class Card

  attr_reader :rank, :contents

  # If this is to be a generic class, start thinking
  # about how to implement the ace being either
  # high or low, and who decides that and when.
  # For now, ace is High.

  def initialize(rank=0,suit= :"?" )
    rank == 1 ? (rank = 14) : rank
    @rank = rank
    @suit = suit.to_sym
  end

  def suit
    @suit
  end

  def contents
    rank = parse_rank
    (rank+suit.to_s).to_sym
  end

  def parse_rank
    ranks = ["?", "?", "2", "3", "4", "5", "6", "7",
      "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    ranks[@rank]
  end





end
