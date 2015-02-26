require './lib/deck'
require './lib/card'
require './lib/table'
require './lib/player'
require './lib/idiot_game_logic'




def build_deck(deck)
  suits = [:♠,:♥,:♦,:♣]
  ranks = [*2..14]

  ranks.each do |rank|
    suits.each do |suit|
      deck.add_card(Card.new(rank,suit))
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
