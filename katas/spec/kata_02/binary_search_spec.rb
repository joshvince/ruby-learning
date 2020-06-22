require 'kata_02/binary_chop'

RSpec.describe Kata02::BinaryChop, '#chop' do
  context 'binary chop' do
    let(:search) { Kata02::BinaryChop.new }
    
    it 'returns -1 if the array is empty' do
      expect(search.chop(3, [])).to eq -1
    end

    it 'returns -1 if the value is not in the array' do
      expect(search.chop(3, [1])).to eq -1
    end

    it 'returns the index of the number supplied' do
      expect(search.chop(1,  [1])).to eq 0
    end

    it 'returns the index of the number supplied in an array of length two' do
      expect(search.chop(2,  [1,2])).to eq 1
    end

    it 'handles long arrays where the number is present at the beginning' do
      expect(search.chop(1,  [1, 3, 5])).to eq 0
    end

    it 'handles long arrays where the number is present at the end' do
      expect(search.chop(9,  [1, 3, 5, 7, 9])).to eq 4
    end

    it 'handles long arrays when the number is not present' do
      expect(search.chop(8,  [1, 3, 5, 7])).to eq -1
    end

    it 'handles very long arrays when the number is not present' do
      expect(search.chop(7,  [1, 3, 5, 7])).to eq 3
    end
  end
end