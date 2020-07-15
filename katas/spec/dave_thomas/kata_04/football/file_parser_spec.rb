require 'dave_thomas/kata_04/football/file_parser'

RSpec.describe DaveThomas::Kata04::Football::FileParser do
  describe '#new' do
    let (:parser) { described_class.new('spec/support/football_test.dat')}
    it 'stores a file' do
      expect(parser.file).to be_a(File)
    end

    it 'stores headers and lines as arrays' do
      contents = [parser.headers, parser.lines] 
      expect(contents).to all(be_an(Array))
    end

    it 'stores headers and lines that are the same length' do
      line_lengths = parser.lines.map {|l| l.count }

      expect(line_lengths).to all(eq(parser.headers.count))
    end

    it 'stores each line as an array' do
      expect(parser.lines).to all(be_an(Array))
    end

    it 'should store one line per team' do
      expect(parser.lines.count).to eq 3
    end

    it 'should store ints as ints' do
      stats = parser.lines[0].drop(2)
      expect(stats).to all(be_a(Integer))
    end
  end
end