class Player
  attr_accessor :pot
  attr_reader :name, :hand, :folded, :bid

  def initialize(name, hand, pot)
    @name = name
    @hand = hand
    @pot = pot

    @folded = false
  end

  def display_hand
    @hand.display_hand
  end

  def place_bid(value)
    @pot -= value
    value
  end

  def discard
    display_hand
    puts 'Which cards do want to discard?'
    gets.chomp.split(',').map { |s| s.to_i - 1 }
  end
end
