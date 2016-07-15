class Tile
  def initialize(revealed = false)
    @revealed = revealed
    @value = 0
    @bomb = false
    @flag = false
  end

  def revealed?
    revealed
  end

  def reveal
    @revealed = true
  end

  def to_s
    @value
  end

  def bomb?
    @bomb
  end

  def flag?
    @flag
  end

  attr_reader :revealed
  attr_accessor :bomb, :flag, :value

end
