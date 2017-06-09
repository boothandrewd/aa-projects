require_relative "card"


class Deck
  SUITES = ['♡', '♢', '♠', '♣'].freeze
  VALUES = %i[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :deck_array

  def initialize
    @deck_array = SUITES.reduce([]) do |suite_acc, suite|
      suite_acc + VALUES.reduce([]) do |val_acc, val|
        val_acc << Card.new(suite, val)
      end
    end
  end

  def shuffle!
    @deck_array.shuffle!
  end
end
