require './r'


deck = Deck.new
table = Table.new

build_deck(deck)

player1 = Player.new
player2 = Player.new
player3 = Player.new

game = IdiotGameLogic.new(table,[player1,player2,player3])


deal_to_players_in(game,deck)

puts game

game.play(player2,player2.hand[0])
puts game.inspect




