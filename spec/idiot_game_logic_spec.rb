require 'idiot_game_logic'

describe 'IdiotGameLogic' do

  let(:table) {double :table, place: nil}
  let(:player1) {double :player, play: nil}
  let(:player2) {double :player, play: nil}
  let(:player3) {double :player, play: nil}
  let(:game) {IdiotGameLogic.new(table,[player1,player2])}

  it 'is initialized with a table' do
    expect(game.table).to eq table
  end

  it 'can be initialized with players' do
    expect(game.player1).to eq player1
    expect(game.player2).to eq player2
    expect(game.player3).to eq nil
  end

  it 'can add players to the game' do
    game.add_player(player3)
    expect(game.player3).to eq player3
  end

  it 'Raises an error if more than 5 players attempt to enter a game' do
    player4 = double :player
    player5 = double :player
    player6 = double :player
    game.add_player(player3)
    game.add_player(player4)
    game.add_player(player5)
    expect{game.add_player(player6)}.to raise_error "Game is full"
  end

  it 'allows a player to play a card on their turn' do
    card1 = double :card
    card2 = double :card
    expect(game.play(player1,card1)).to eq true
    expect(game.play(player2,card2)).to eq true
  end

  it 'wont allow a player to play not on their turn' do
    card1 = double :card
    card2 = double :card
    game.add_player(player3)
    game.play(player1,card1)
    expect(game.play(player3,card2)).to eq false
  end

  it 'wont allow a player to play a card that cant be played' do
    six_spades = double :card, rank: 6
    four_hearts = double :card, rank: 4


  end









end
