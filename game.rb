require_relative 'board.rb'
require 'byebug'
class MineSweeper
  attr_reader :board
  def initialize
    @board = Board.new
  end

  def play_turn
    position = get_input
    reveal_square(position)

    board.render
  end

  def get_input
    puts "Enter position to guess: "
    parse_position(gets.chomp)
  end

  def parse_position(position)
    position.split(",").map(&:to_i)
  end

  def reveal_square(position)
    @board[position].reveal
  end

  


end

if __FILE__ == $PROGRAM_NAME
  game = MineSweeper.new
  game.play_turn
end
