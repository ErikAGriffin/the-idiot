class IdiotGameLogic

  attr_reader :table, :players

  def initialize(table, players=[])
    @table = table
    @players = players
    @active_player = player1
  end

  def add_player(player)
    raise "Game is full" if self.full?
    @players << player
  end

  def full?
    @players.count >= 5
  end

  def play(player,card)
    return false if card_illegal?(card)
    quick_play(player,card)
    if player == @active_player
      player.play(card)
      table.place(card)
      next_player
      true
    else
      false
    end
  end

  # # # attr_readers # # #

  def player1
    @players[0]
  end

  def player2
    @players[1]
  end

  def player3
    @players[2]
  end

  def player4
    @players[3]
  end

  def player5
    @players[4]
  end

  # # # # # # # # # # # # # #

  private

  def next_player
    index = @players.find_index(@active_player)+1
    @active_player = @players[index]
  end

  def quick_play(player,card)
    return if table.topcard_rank == 0
    if table.topcard_rank == card.rank
      @active_player = player
    end
  end

  def card_illegal?(card)
    return true if table.topcard_rule == :lower && card.rank > 8
    if table.topcard_rule <= card.rank
      false
    elsif card.rank == 2 || card.rank == 3 || card.rank == 10
      false
    else
      true
    end
  end

end
