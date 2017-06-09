require 'game'

describe Game do
  subject { Game.new('Andrew', 'Nick') }

  describe '#initialize' do
    it 'creates a player class' do
      expect(subject.player1.is_a?(Player)).to be(true)
    end
  end

  describe '#swap_turn!' do
    it 'swaps whose turn it is' do
      first_player = subject.current_player
      subject.swap_turn!
      expect(subject.current_player).to_not be(first_player)
    end
  end

  describe '#take_turn' do
    it ''
  end
end
