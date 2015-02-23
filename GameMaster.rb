require './r'

def build_deck(deck)
  suits = [:♠,:♥,:♦,:♣]
  ranks = [*1..13]

  ranks.each do |rank|
    suits.each do |suit|
      deck << Card.new(rank,suit)
    end
  end
  deck.shuffle
end

deck = Deck.new
table = Table.new
game = IdiotGameLogic.new(table)

build_deck(deck)






