require 'player'

describe 'Player' do

  let(:player) {Player.new}
  let(:card) {double :card}

  it 'can have a card added to his/her hand' do
    player.give(card)
    expect(player.hand).to eq [card]
  end

  it 'can play a card from his/her hand' do
    player.give(card)
    expect(player.play(card)).to eq card
    expect(player.hand).to eq []
  end

  it 'raises an error if playing a card not in the players hand' do
    expect{player.play(card)}.to raise_error "Player does not have that card!"
  end

end