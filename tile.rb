class Tile
  def initialize(revealed = false)
    @revealed = revealed
    @value = '_'
  end

  def value=(val)
    @value = val
  end

  private
  attr_reader :value

end
