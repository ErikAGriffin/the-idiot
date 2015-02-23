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

build_deck(deck)

player1 = Player.new
player2 = Player.new
player3 = Player.new

game = IdiotGameLogic.new(table,[player1,player2,player3])

puts game.inspect





