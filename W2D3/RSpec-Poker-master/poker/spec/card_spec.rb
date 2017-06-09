require "card"
describe Card do
  subject(:card) { Card.new('♡', :'6') }

  describe '#initialize' do
    it "Assigns a given suite and value" do
      expect(card.value).to eq(:'6')
      expect(card.suite).to eq('♡')
    end
  end

  describe '#to_s' do
    it 'returns string representation of card' do
      expect(card.to_s.is_a?(String)).to be(true)
      expect(card.to_s).to eq('♡6')
    end
  end

end
