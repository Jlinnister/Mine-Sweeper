class Tile
  def initialize(revealed = false)
    @revealed = revealed
    @value = 0
    @bomb = false
  end

  def value=(val)
    @value = val
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

  attr_reader :value, :revealed
  attr_accessor :bomb

end
