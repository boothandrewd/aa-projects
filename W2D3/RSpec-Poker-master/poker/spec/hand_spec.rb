require 'hand'

describe Hand do
  let(:ace) { double(value: :A, suite: '♠') }
  let(:king) { double(value: :K, suite: '♠') }
  let(:queen) { double(value: :Q, suite: '♠') }
  let(:jack) { double(value: :J, suite: '♠') }
  let(:ten) { double(value: :'10', suite: '♠') }
  let(:five) { double(value: :'5', suite: '♠') }
  let(:four) { double(value: :'4', suite: '♠') }
  let(:three) { double(value: :'3', suite: '♠') }
  let(:two) { double(value: :'2', suite: '♠') }
  let(:two_hearts) { double(value: :'2', suite: '♡') }

  describe '#one_pair?' do
    let(:pair) { Hand.new([ace, king, jack, jack, two]) }
    let(:no_pair) { Hand.new([ace, king, jack, queen, two]) }

    it 'returns true if hand contains pair' do
      expect(pair.one_pair?).to be_truthy
    end

    it 'returns false if hand does not contain pair' do
      expect(no_pair.one_pair?).to be(false)
    end
  end

  describe '#three_OAK?' do
    let(:threeoak) { Hand.new([jack, king, jack, jack, two]) }
    let(:not_threeoak) { Hand.new([queen, king, jack, jack, two]) }

    it 'returns true if hand contains three of a kind' do
      expect(threeoak.three_OAK?).to be_truthy
    end

    it 'returns false if hand does not contain three of a kind' do
      expect(not_threeoak.three_OAK?).to be(false)
    end
  end

  describe '#four_OAK?' do
    let(:fouroak) { Hand.new([jack, king, jack, jack, jack]) }
    let(:not_fouroak) { Hand.new([jack, king, jack, ace, jack]) }

    it 'returns true if hand contains four of a kind' do
      expect(fouroak.four_OAK?).to be_truthy
    end

    it 'returns false if hand does not contain four of a kind' do
      expect(not_fouroak.four_OAK?).to be(false)
    end
  end

  describe '#two_pair?' do
    let(:two_pair) { Hand.new([ace, ace, jack, jack, two]) }
    let(:not_two_pair_1) { Hand.new([queen, ace, jack, jack, two]) }
    let(:not_two_pair_2) { Hand.new([ace, ace, jack, five, two]) }

    it 'returns true if hand contains 2 pairs' do
      expect(two_pair.two_pair?).to be_truthy
    end

    it 'returns false if hand does not contain 2 pairs' do
      expect(not_two_pair_1.two_pair?).to be(false)
      expect(not_two_pair_2.two_pair?).to be(false)
    end
  end

  describe '#full_house?' do
    let(:full) { Hand.new([ace, ace, jack, jack, jack]) }
    let(:not_full) { Hand.new([ace, ace, jack, queen, jack]) }

    it 'returns true if hand contains full house' do
      expect(full.full_house?).to be_truthy
    end

    it 'returns false if hand does not contain full house' do
      expect(not_full.full_house?).to be(false)
    end
  end

  describe '#flush?' do
    let(:flush) { Hand.new([ace, king, jack, jack, two]) }
    let(:not_flush) { Hand.new([ace, king, jack, jack, two_hearts]) }

    it 'returns true if hand contains flush' do
      expect(flush.flush?).to be_truthy
    end

    it 'returns false if hand does not contain flush' do
      expect(not_flush.flush?).to be(false)
    end
  end

  describe '#straight?' do
    let(:straight) { Hand.new([jack, ten, queen, ace, king]) }
    let(:straight_2) { Hand.new([ace, two, three, five, four]) }
    let(:not_straight) { Hand.new([ten, jack, two, king, ace]) }

    it 'returns true if hand contains straight' do
      expect(straight_2.straight?).to be_truthy
      expect(straight.straight?).to be_truthy
    end

    it 'returns false if hand does not contain straight' do
      expect(not_straight.straight?).to be(false)
    end
  end

  describe '#straight_flush?' do
    let(:sf) { Hand.new([three, four, ace, five, two]) }
    let(:not_sf) { Hand.new([three, four, ace, five, two_hearts]) }

    it 'returns true if hand contains straight flush' do
      expect(sf.straight_flush?).to be_truthy
    end

    it 'returns false if hand does not contain straigh flush' do
      expect(not_sf.straight_flush?).to be(false)
    end
  end

  describe 'high_card' do
    let(:high) {Hand.new([three, four, ace, five, two]) }
    let (:less_high) {Hand.new([three, four, jack, five, two]) }
    let (:least_high) {Hand.new([three, four, two, five, two]) }
    it 'returns ace if hand contains ace as highest card.' do
      expect(high.high_card.value).to eq(:'A')
    end

    it 'returns jack if hand contains jack as highest card.' do
      expect(less_high.high_card.value).to eq(:'J')
    end

    it 'returns five if hand contains five as highest card.' do
      expect(least_high.high_card.value).to eq(:'5')
    end
  end
end
