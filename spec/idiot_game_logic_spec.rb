require 'idiot_game_logic'

describe 'IdiotGameLogic' do

  let(:card) {double :card, rank: 4}
  let(:table) {double :table, burn: nil, place: nil, topcard_rank: 4, topcard_rule: 4}
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
    expect(game.play(player1,card)).to eq true
    expect(game.play(player2,card)).to eq true
  end

  it 'wont allow a player to play not on their turn' do
    card2 = double :card, rank: 5
    game.add_player(player3)
    game.play(player1,card)
    expect(game.play(player3,card2)).to eq false
  end

  it 'wont allow a player to play a card that cant be played' do
    six_spades = double :card, rank: 6, rule: 6
    four_hearts = double :card, rank: 4
    allow(table).to receive(:topcard_rule).and_return(6)
    game.play(player1, six_spades)
    expect(game.play(player2, four_hearts)).to eq false
  end

  it 'will allow a player to play cards of identical rank out of turn' do
    four_spades = double :card, rank: 4
    four_hearts = double :card, rank: 4
    game.add_player(player3)
    game.play(player1,four_spades)
    expect(game.play(player3,four_hearts)).to eq true
  end

  context 'Special Cards' do
    it 'knows a 2 can always be played' do
      two_spades = double :card, rank: 2
      ace_spades = double :card, rank: 14, rule: 14
      allow(table).to receive(:topcard_rule).and_return(14)
      expect(game.play(player1,two_spades)).to eq true
    end

    it 'knows a 3 can always be played' do
      three_spades = double :card, rank: 3
      ace_spades = double :card, rank: 14, rule: 14
      allow(table).to receive(:topcard_rule).and_return(14)
      expect(game.play(player1,three_spades)).to eq true
    end

    it 'knows a 10 can always be played' do
      ten_spades = double :card, rank: 10
      ace_spades = double :card, rank: 14, rule: 14
      allow(table).to receive(:topcard_rule).and_return(14)
      expect(game.play(player1,ten_spades)).to eq true
    end


  end











end
