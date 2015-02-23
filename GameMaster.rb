require './lib/deck'
require './lib/card'

def build_deck(deck)
  suits = ["♠","♥","♦","♣"]
  ranks = [*1..13]

  ranks.each do |rank|
    suits.each do |suit|
      deck << Card.new(rank,suit)
    end
  end
  deck.shuffle
end

deck = Deck.new

build_deck(deck)




