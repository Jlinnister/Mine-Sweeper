require_relative 'tile.rb'

class Board

  def initialize
    @grid = Array.new(9) {Array.new(9) {Tile.new}}
    populate_with_bombs(9)
  end

  def populate_with_bombs(num_bombs)
    num_bombs.times do
      row = rand(9)
      col = rand(9)
      until @grid[row][col] != "b"
        row = rand(9)
        col = rand(9)
      end
      @grid[row][col].value = "b"
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x,y = pos
    @grid[x][y] = value
  end


end
