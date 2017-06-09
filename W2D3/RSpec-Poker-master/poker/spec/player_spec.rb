require 'player'

describe Player do
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

  let(:pair) { double(hand_array: [ace, king, jack, jack, two]) }
  let(:no_pair) { double(hand_array: [ace, king, jack, queen, two]) }
  let(:threeoak) { double(hand_array: [jack, king, jack, jack, two]) }
  let(:not_threeoak) { double(hand_array: [queen, king, jack, jack, two]) }

  subject { Player.new('Andy', pair, 500) }

  describe '#initialize' do

    it 'initializes a name' do
      expect(subject.name).to eq('Andy')
    end

    it 'initializes a hand' do
      expect(subject.hand.hand_array.size).to eq(5)
    end

    it 'initializes a pot' do
      expect(subject.pot).to eq(500)
    end

    # it 'starts bid off at 0' do
    #   expect(subject.bid).to eq(0)
    # end
  end

  describe '#place_bid' do
    it 'places an initial bid' do
      expect(subject.place_bid(100)).to eq(100)
    end

    # it 'increments bid' do
    #   subject.place_bid(100)
    #   subject.place_bid(50)
    #   expect(subject.palcbid).to eq(150)
    # end

    it 'decrement pot' do
      subject.place_bid(100)
      expect(subject.pot).to eq(400)
    end
  end
end
