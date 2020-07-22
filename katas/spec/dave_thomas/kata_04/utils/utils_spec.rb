require 'dave_thomas/kata_04/utils/utils'

RSpec.describe DaveThomas::Kata04::Utils::Utils do
  
  describe '#build_record' do
    let(:dummy_class) { Class.new { include DaveThomas::Kata04::Utils::Utils } }
    let(:dummy_parser) { dummy_class.new}
    it 'creates a hash from the header and values' do
      headers = ["team", "played", "points"]
      values = [["Arsenal", 38, 100]]
      expect(dummy_parser.build_record(headers, values)).to eq([{team: "Arsenal", played: 38, points: 100}])
    end
  end

  describe '#to_float' do
    let(:dummy_class) { Class.new { include DaveThomas::Kata04::Utils::Utils } }
    let(:dummy_parser) { dummy_class.new}

    it 'returns floats if the string is float-like' do
      expect(dummy_parser.to_float("12.3")).to eq 12.3
    end

    it 'returns strings if the string is not float-like' do
      expect(dummy_parser.to_float("Arsenal")).to eq "Arsenal"
    end

    it 'converts integers into floats' do
      expect(dummy_parser.to_float("14")).to eq 14.0
    end
  end
end