require 'card'

describe 'Card' do

  let(:card) {Card.new(1,:♠)}

  it 'has a rank' do
    expect(card.rank).to eq 14
  end

  it 'has a suit' do
    expect(card.suit).to eq :♠
  end

  it 'has contents' do
    expect(card.contents).to eq :Ace♠
  end



end
