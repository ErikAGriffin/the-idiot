class IdiotGameLogic

  attr_reader :table

  def initialize(table, players=[])
    @table = table
    @players = players
  end

  def add_player(player)
    raise "Game is full" if self.full?
    @players << player
  end

  def full?
    @players.count >= 5
  end

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

end
