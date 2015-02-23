require 'deck'

describe 'Deck' do

  let(:card) {double :card}

  let(:deck) {Deck.new(52, card)}


  it 'is an array that can hold cards' do
    expect(deck.count).to eq 52
  end

  it 'can have the top card taken off' do
    expect(deck.draw).to eq card
    expect(deck.count).to eq 51
  end

  # Once every blue moon this test will fail.
  # Working as intended

  it 'can shuffle itself' do
    deck.draw
    king = double :card
    deck << king
    deck.shuffle
    expect(deck.top_card).to_not eq king
  end


end