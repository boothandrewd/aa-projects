require_relative 'deck'

require 'byebug'

class Hand
  attr_reader :hand_array

  def initialize(hand_array = [])
    @hand_array = hand_array
  end

  def hand_value
    return 8 if straight_flush?
    return 7 if four_OAK?
    return 6 if full_house?
    return 5 if flush?
    return 4 if straight?
    return 3 if three_OAK?
    return 2 if two_pair?
    return 1 if one_pair?
    return 0
  end

  def <=>(other)
    self.hand_value <=> other.hand_value
  end

  def add_card(card)
    @hand_array << card
  end

  def display_hand
    puts (1..5).to_a.join('      ')
    puts @hand_array.map(&:to_s).join('   ')
  end

  def straight_flush?
    straight? && flush?
  end

  def four_OAK?
    hand_value = @hand_array.map(&:value)
    hand_value.uniq.any? { |value| hand_value.count(value) == 4 }
    # hand_value.uniq.each do |value|
    #   return value if hand_value.count(value) == 4
    # end
    # false
  end

  def full_house?
    hand_value = @hand_array.map(&:value)
    hand_value.uniq.count == 2 && hand_value.uniq.any? { |value| hand_value.count(value) == 3 }
  end

  def flush?
    hand_suite = @hand_array.map(&:suite)
    hand_suite.uniq.length == 1
  end

  def straight?
    sorted_hand = @hand_array.map(&:value).sort_by { |v| Deck::VALUES.index(v) }.join
    Deck::VALUES.join.include?(sorted_hand) || sorted_hand == '2345A'
  end

  def three_OAK?
    hand_value = @hand_array.map(&:value)
    hand_value.uniq.any? { |value| hand_value.count(value) == 3 }
  end

  def two_pair?
    hand_value = @hand_array.map(&:value)
    hand_value.uniq.count == 3 && hand_value.uniq.any? { |value| hand_value.count(value) == 2 }
  end

  def one_pair?
    hand_value = @hand_array.map(&:value)
    hand_value.uniq.any? { |value| hand_value.count(value) == 2 }
  end

  def high_card
    @hand_array.max_by { |card| Deck::VALUES.index(card.value) }
  end
end
