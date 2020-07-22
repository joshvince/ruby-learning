require 'dave_thomas/kata_04/spread_object'

RSpec.describe DaveThomas::Kata04::SpreadObject do
  it 'returns the name as provided' do
    obj = described_class.new(name: 1, max: 90, min: 70)
    expect(obj.name).to eq 1
  end

  context 'when provided integers' do
    it 'returns the spread' do
      obj = described_class.new(name: 1, max: 90, min: 70)
      expect(obj.spread).to eq 20 
    end
  end
  
  context 'when provided floats' do
    it 'returns the spread' do
      obj = described_class.new(name: 1, max: 90.5, min: 70.5)
      expect(obj.spread).to eq 20
    end
  end
end