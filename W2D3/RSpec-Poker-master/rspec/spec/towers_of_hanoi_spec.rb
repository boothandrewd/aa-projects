require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject { TowersOfHanoi.new('Nicholas') }

  describe '#initialize' do
    it 'has 3 nested arrays' do
      expect(subject.board.length).to eq(3)
      expect(subject.board.first.class).to eq(Array)
    end

    it 'leftmost array is [3 2 1]' do
      expect(subject.board.first).to match([3, 2, 1])
    end

    it 'sets name' do
      expect(subject.name).to eq('Nicholas')
    end
  end

  describe '#valid_move?' do
    it 'returns true for valid move' do
      expect(subject.valid_move?([0, 1])).to be(true)
    end

    it 'returns false for invalid move' do
      expect(subject.valid_move?([1, 0])).to be(false)
    end
  end

  describe '#move' do
    it 'raises "Invalid move" if move invalid' do
      expect { subject.move([1, 0]) }.to raise_error('Invalid move')
    end

    it 'should move stuff' do
      subject.move([0, 1])
      expect(subject.board.first).to match([3, 2])
      expect(subject.board[1]).to match([1])
    end
  end

  describe '#won?' do
    it 'returns true if won' do
      subject.board.last.concat([3, 2, 1])
      expect(subject.won?).to be(true)
    end

    it 'returns false if not won' do
      subject.board.last.concat([3, 2])
      expect(subject.won?).to be(false)
    end
  end
end
