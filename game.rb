require_relative 'board.rb'
require 'byebug'
class MineSweeper
  attr_reader :board, :over
  def initialize
    @board = Board.new
  end

  def run
    until over?
      play_turn
    end

  end
  def play_turn
    position, type = get_input
    if type == 'r'
      reveal_square(position)
    elsif type == 'f'
      board.flag_square(position)
    end

    board.render
  end

  def get_input
    puts "Enter move (ex: 'r 0,1') "
    input = gets.chomp

    move_type = input[0]
    [parse_position(input[2..-1]), move_type]
  end

  def parse_position(position)
    position.split(",").map(&:to_i)
  end

  def reveal_square(position)
    @board[position].reveal
    if @board[position].bomb?
      @over = true
      puts "Kaboom!"
    end
    if board[position].value == 0
      adjacents = board.adjacent_tiles(position)
      unless adjacents.any?{|el| board[el].bomb?}
        adjacents.each do |tile|
          reveal_square(tile) unless @board[tile].revealed?
        end
      end
    end
  end

  def over?
    @over
  end


end

if __FILE__ == $PROGRAM_NAME
  game = MineSweeper.new
  game.run
end
