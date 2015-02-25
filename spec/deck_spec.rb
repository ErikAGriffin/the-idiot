require 'deck'

describe 'Deck' do

  let(:card) {double :card}

  let(:deck) {Deck.new}


  it 'is an array that can hold cards' do
    deck.add_card(card)
    expect(deck.count).to eq 1
  end

  it 'can have the top card taken off' do
    deck.add_card(card)
    expect(deck.draw).to eq card
    expect(deck.count).to eq 0
  end

  # Once every blue moon this test will fail.
  # Working as intended

  it 'can shuffle itself' do
    51.times {deck.add_card(card)}
    king = double :card
    deck.add_card(king)
    deck.shuffle
    expect(deck.top_card).to_not eq king
  end


end
