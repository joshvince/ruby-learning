require 'kata_02/recursive_chop'

RSpec.describe Kata02::RecursiveChop, '#chop' do
  context 'recursive chop' do
    it 'returns -1 if the array is empty' do
      search = Kata02::RecursiveChop.new(3, [])
      expect(search.chop).to eq -1
    end

    it 'returns -1 if the value is not in the array' do
      search = Kata02::RecursiveChop.new(3, [1])
      expect(search.chop()).to eq -1
    end

    it 'returns the index of the number supplied' do
      search = Kata02::RecursiveChop.new(1,  [1])
      expect(search.chop()).to eq 0
    end

    it 'returns the index of the number supplied in an array of length two' do
      search = Kata02::RecursiveChop.new(2,  [1,2])
      expect(search.chop()).to eq 1
    end

    it 'handles long arrays where the number is present at the beginning' do
      search = Kata02::RecursiveChop.new(1,  [1, 3, 5])
      expect(search.chop()).to eq 0
    end

    it 'handles long arrays where the number is present at the end' do
      search = Kata02::RecursiveChop.new(9,  [1, 3, 5, 7, 9])
      expect(search.chop()).to eq 4
    end

    it 'handles long arrays when the number is not present' do
      search = Kata02::RecursiveChop.new(8,  [1, 3, 5, 7])
      expect(search.chop()).to eq -1
    end

    it 'handles very long arrays when the number is not present' do
      search = Kata02::RecursiveChop.new(7,  [1, 3, 5, 7])
      expect(search.chop()).to eq 3
    end

    it 'handles all of Daves other tests' do
      expect(Kata02::RecursiveChop.new(3, [1, 3, 5]).chop).to eq 1
      expect(Kata02::RecursiveChop.new(5, [1, 3, 5]).chop).to eq 2
      expect(Kata02::RecursiveChop.new(0, [1, 3, 5]).chop).to eq -1
      expect(Kata02::RecursiveChop.new(2, [1, 3, 5]).chop).to eq -1
      expect(Kata02::RecursiveChop.new(4, [1, 3, 5]).chop).to eq -1
      expect(Kata02::RecursiveChop.new(6, [1, 3, 5]).chop).to eq -1
      
      expect(Kata02::RecursiveChop.new(1, [1, 3, 5, 7]).chop).to eq 0
      expect(Kata02::RecursiveChop.new(3, [1, 3, 5, 7]).chop).to eq 1
      expect(Kata02::RecursiveChop.new(5, [1, 3, 5, 7]).chop).to eq 2
      expect(Kata02::RecursiveChop.new(0, [1, 3, 5, 7]).chop).to eq -1
      expect(Kata02::RecursiveChop.new(2, [1, 3, 5, 7]).chop).to eq -1
      expect(Kata02::RecursiveChop.new(4, [1, 3, 5, 7]).chop).to eq -1
      expect(Kata02::RecursiveChop.new(6, [1, 3, 5, 7]).chop).to eq -1
    end
  end
end