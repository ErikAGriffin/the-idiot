require 'table'

describe 'Table' do

  let(:card) {double :card}
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

  it 'shows the topcard' do
    table.place(card)
    expect(table.topcard).to eq card
  end

  context 'Special Cards' do



  end




end
