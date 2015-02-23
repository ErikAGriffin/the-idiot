require 'idiot_game_logic'

describe 'IdiotGameLogic' do

  let(:table) {double :table}
  let(:player1) {double :player}
  let(:player2) {double :player}
  let(:player3) {double :player}
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




end
