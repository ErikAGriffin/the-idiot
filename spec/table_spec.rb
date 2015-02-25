require 'table'

describe 'Table' do

  let(:card) {double :card, rank: 4}
  let(:table) {Table.new}

  it 'is an array that holds cards' do
    expect(table).to eq []
  end

  it 'can have a card placed on the table' do
    table.place(card)
    expect(table).to eq [card]
  end

  it 'can burn itself, removing those cards from the game' do
    table.place(card)
    table.burn!
    expect(table).to eq []
  end

  it "displays the current table 'rule'" do
    table.place(card)
    expect(table.topcard.rule).to eq card.rank
  end

  context 'Special Cards' do

    it 'zeros out the table if a 2 is played' do
      two_spades = double :card, rank: 2
      table.place(two_spades)
      expect(table.topcard.rank <= 4).to eq true
    end

    it 'passes on present value if a 3 is played' do
      queen_hearts = double :card, rank: 12
      three_spades = double :card, rank: 3
      table.place(queen_hearts)
      table.place(three_spades)
      expect(table.topcard.rank).to eq 3
      expect(table.topcard.rule).to eq 12
    end

    it 'burns the deck when a 10 is played' do
      ace_spades = double :card, rank: 14
      ten_diamonds = double :card, rank: 10
      table.place(ace_spades)
      table.place(ten_diamonds)
      expect(table).to eq []
      expect(table.topcard.rule).to eq 4
      expect(table.topcard.rank).to eq 0
    end

  end




end
