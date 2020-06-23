require 'kata_02/looper_chop'

RSpec.describe Kata02::LooperChop, '#chop' do
  context 'looper chop' do
    let(:searcher) { Kata02::LooperChop.new }
    it 'returns -1 if the array is empty' do
      expect(searcher.chop(3, [])).to eq -1
    end
    
    it 'returns -1 if the value is not in the array' do
      expect(searcher.chop(3, [1])).to eq -1
    end
    
    it 'returns the index of the number supplied' do
      expect(searcher.chop(1,  [1])).to eq 0
    end

    it 'returns the index of the number supplied in an array of length two' do
      expect(searcher.chop(2,  [1,2])).to eq 1
    end

    it 'handles long arrays where the number is present at the beginning' do
      expect(searcher.chop(1,  [1, 3, 5])).to eq 0
    end

    it 'handles long arrays where the number is present at the end' do
      expect(searcher.chop(9,  [1, 3, 5, 7, 9])).to eq 4
    end

    it 'handles long arrays when the number is not present' do
      expect(searcher.chop(8,  [1, 3, 5, 7])).to eq -1
    end

    it 'handles very long arrays when the number is not present' do
      expect(searcher.chop(7,  [1, 3, 5, 7])).to eq 3
    end

    it 'handles all of Daves other tests' do
      expect(searcher.chop(3, [1, 3, 5])).to eq 1
      expect(searcher.chop(5, [1, 3, 5])).to eq 2
      expect(searcher.chop(0, [1, 3, 5])).to eq -1
      expect(searcher.chop(2, [1, 3, 5])).to eq -1
      expect(searcher.chop(4, [1, 3, 5])).to eq -1
      expect(searcher.chop(6, [1, 3, 5])).to eq -1
      
      expect(searcher.chop(1, [1, 3, 5, 7])).to eq 0
      expect(searcher.chop(3, [1, 3, 5, 7])).to eq 1
      expect(searcher.chop(5, [1, 3, 5, 7])).to eq 2
      expect(searcher.chop(0, [1, 3, 5, 7])).to eq -1
      expect(searcher.chop(2, [1, 3, 5, 7])).to eq -1
      expect(searcher.chop(4, [1, 3, 5, 7])).to eq -1
      expect(searcher.chop(6, [1, 3, 5, 7])).to eq -1
    end
  end
end