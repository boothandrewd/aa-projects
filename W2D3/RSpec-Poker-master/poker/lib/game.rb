require_relative 'player'
require_relative 'deck'
require_relative 'hand'

class Game
  attr_reader :player1, :player2, :current_player

  def initialize(player1_name, player2_name)
    @deck = Deck.new
    @deck.shuffle!

    @game_pot = 0

    @player1 = Player.new(player1_name, Hand.new(@deck.deck_array.pop(5)), 500)
    @player2 = Player.new(player2_name, Hand.new(@deck.deck_array.pop(5)), 500)

    @current_player = @player1
  end

  def swap_turn!
    @current_player = (@current_player == @player1 ? @player2 : @player1)
  end

  def better_hand
    [@player1, @player2].max_by { |plyr| plyr.hand.hand_value }
  end
end
