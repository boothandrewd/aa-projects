require 'byebug'

class TowersOfHanoi
  attr_reader :name, :board

  def initialize(name = 'Player 1')
    @name = name

    @board = [[3, 2, 1], [], []]
  end

  def valid_move?((start_tower, end_tower))
    return false if @board[start_tower].empty?
    return true if @board[end_tower].empty?
    return false if @board[start_tower].last > @board[end_tower].last
    true
  end

  def move((start_tower, end_tower))
    raise 'Invalid move' unless valid_move?([start_tower, end_tower])
    @board[end_tower] << @board[start_tower].pop
  end

  def won?
    @board.last == [3, 2, 1]
  end
end
