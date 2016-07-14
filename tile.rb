class Tile
  def initialize(revealed = false)
    @revealed = revealed
    @value = '_'
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


  attr_reader :value, :revealed

end
