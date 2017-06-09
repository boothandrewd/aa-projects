require "deck"
describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do
    it 'Populates deck with 52 cards' do
      expect(deck.deck_array.length).to eq(52)
    end
    it 'Populates with Card class objects.' do
      expect(deck.deck_array[0].is_a?(Card)).to be(true)
    end

  end
  describe '#shuffle' do
    it 'Shuffles the deck!' do
      expect(deck.deck_array).to receive(:shuffle!)
      deck.shuffle!
    end
  end
end
