require "tdd"
describe Array do
  subject(:dup_array) { [1, 1, 5, 4, 7, 2, 7] }
  subject(:sum_array) { [-1, 0, 2, -2, 1] }
  subject(:transpose_array) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
  subject(:stock_array) { [ 5, 6, 1, 9, 2, 100, 5, 9, 3 ] }

  describe 'remove_dups' do
    it 'returns a new dup_array' do
      expect(dup_array.my_uniq) .to_not be(dup_array)
    end

    it 'removes dups.' do
      expect(dup_array.my_uniq).to eq(dup_array.uniq)
    end
  end

  describe 'two_sum' do
    it 'returns smaller elements first' do
      expect(sum_array.two_sum).to start_with([0, 4])
      expect(sum_array.two_sum).to eq(sum_array.two_sum.sort)
    end

    it 'returns correct pairs' do
      expect(sum_array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#my_transpose' do
    it 'transposes the array' do
      expect(transpose_array.my_transpose).to match([
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ])
    end

    it 'doesn\'t call builtin #transpose' do
      expect(transpose_array).to_not receive(:transpose)
      transpose_array.my_transpose
    end
  end

  describe 'stock_picker' do
    it 'returns the best buy date, and sell date.' do
      expect(stock_array.stock_picker).to eq([2,5])
    end
  end
end
