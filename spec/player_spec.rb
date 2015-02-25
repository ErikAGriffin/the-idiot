require 'player'

describe 'Player' do

  let(:player) {Player.new}
  let(:card) {double :card}

  it 'is first dealt the three facedown cards' do
    3.times {player.deal(card)}
    expect(player.send(:facedown_cards)).to eq [card,card,card]
  end

  it 'is subsequently dealt to his or her hand' do
    6.times {player.deal(card)}
    expect(player.send(:facedown_cards)).to eq [card,card,card]
    expect(player.hand).to eq [card,card,card]
  end

  it 'can have a card added to his/her hand' do
    player.give(card)
    expect(player.hand).to eq [card]
  end

  it 'can place three cards upon the facedown cards' do
    9.times {player.deal(card)}
    player.place_faceup(card)
    expect(player.faceup_cards).to eq [card]
  end

  it "can't play the faceup cards before hand is empty" do
    spade = double :card
    8.times {player.deal(card)}
    player.deal(spade)
    player.place_faceup(spade)
    expect{player.play(spade)}.to raise_error "Player does not have that card in hand!"
  end

  it 'can play faceup cards when hand is empty' do
    spade = double :card
    3.times {player.deal(card)}
    player.deal(spade)
    player.place_faceup(spade)
    expect(player.play(spade)).to eq spade
  end

  it 'cannot play a facedown card while there are faceup cards' do
    spade = double :card
    player.deal(spade)
    3.times {player.deal(card)}
    player.place_faceup(card)
    expect{player.play_facedown(0)}.to raise_error "Player does not have that card in hand!"
  end

  it 'can play a facedown card when they are the only cards left' do
    spade = double :card
    player.deal(spade)
    2.times {player.deal(card)}
    expect(player.play_facedown(0)).to eq spade
  end


  # !! ** !!
  # Need to somehow prevent place_faceup from working
  # After the game has begun.

  it 'can play a card from his/her hand' do
    player.give(card)
    expect(player.play(card)).to eq card
    expect(player.hand).to eq []
  end

  context 'Idiot proofing' do

    it 'raises an error if playing a card not in the players hand' do
      expect{player.play(card)}.to raise_error "Player does not have that card in hand!"
    end

    it 'raises an error if an attempt is made to deal too many cards' do
      9.times {player.deal(card)}
      expect{player.deal(card)}.to raise_error "You dealt too many cards!"
    end

    it 'raises an error if placing more than 3 faceup cards' do
      spade = double :card
      heart = double :card
      club = double :card
      diamond = double :card
      3.times {player.deal(card)}
      player.deal(spade);player.deal(heart)
      player.deal(club); player.deal(diamond)
      player.place_faceup(spade)
      player.place_faceup(heart)
      player.place_faceup(diamond)
      expect{player.place_faceup(club)}.to raise_error "You've already placed your cards!"
    end

  end

end
