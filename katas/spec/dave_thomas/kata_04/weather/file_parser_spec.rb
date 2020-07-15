require 'dave_thomas/kata_04/weather/file_parser'

RSpec.describe DaveThomas::Kata04::Weather::FileParser do

  describe '#new' do
    let(:parser) { DaveThomas::Kata04::Weather::FileParser.new("spec/support/weather_test.dat") }
    it 'stores a file object' do
      expect(parser.file).to be_a(File)
    end

    it 'stores the headers separately' do
      expect(parser.headers).to be_an(Array)
    end

    it 'stores only nonempty lines' do
      expect(parser.lines.length).to eq 3
    end

    it 'each line is an array' do
      expect(parser.lines).to all(be_an(Array))
    end

    it 'correctly stores the first three important values' do
      line = parser.lines.first
      vals = line.take(3)
      expect(vals).to eq [1, 88.0, 59.0]
    end

    it 'correctly stores the second three important values' do
      line = parser.lines[1]
      vals = line.take(3)
      expect(vals).to eq [2, 79.5, 71.5]
    end

    it 'correctly stores the second three important values' do
      line = parser.lines[2]
      vals = line.take(3)
      expect(vals).to eq [3, 77.0, 55.0]
    end
  end
end