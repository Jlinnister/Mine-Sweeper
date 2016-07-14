require 'byebug'
require_relative 'tile.rb'

class Board
  attr_reader :grid

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

  def adjacent_tiles(position)
    deltas = [[-1,1],[-1,-1],[1,-1],[1,1],[-1, 0], [1,0], [0,1], [0,-1]]
    tiles = []
    deltas.each do |delta|
      tiles << [(position[0] + delta[0]), (position[1] + delta[1])]
    end
    tiles.reject{|el| el.any?{|v| v < 0 || v >= grid.length}}
  end

  def count_adjacent_bombs(positions)
    positions.count do |pos|
      self[pos].value == "b"
    end
  end

  def set_bomb_count(position, value)
    self[position].value = value
  end

  def render
    rows = grid.map  do |row|
      row = row.map do |square|
        square.value
      end
      row.join("")
    end
    puts rows.join("\n")

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
