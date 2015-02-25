require './r'

def build_deck(deck)
  suits = [:♠,:♥,:♦,:♣]
  ranks = [*2..14]

  ranks.each do |rank|
    suits.each do |suit|
      deck << Card.new(rank,suit)
    end
  end
  deck.shuffle
end

def deal_to_players_in(game,deck)
  9.times do
    game.players.each do |player|
      player.deal(deck.draw)
    end
  end
end


deck = Deck.new
table = Table.new

build_deck(deck)

player1 = Player.new
player2 = Player.new
player3 = Player.new

game = IdiotGameLogic.new(table,[player1,player2,player3])


deal_to_players_in(game,deck)

puts game

game.play(player1,player1.hand[0])




