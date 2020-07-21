require 'dave_thomas/kata_04/utils/file_parser'

RSpec.describe DaveThomas::Kata04::Utils::FileParser do
  let (:football_parser) { described_class.new(path: 'spec/support/football_test.dat') }
  let (:weather_parser) { described_class.new(path: 'spec/support/weather_test.dat') }

    it 'responds to the right methods' do
      expect(football_parser).to respond_to(:file, :headers, :contents)
    end

    it 'stores a file' do
      expect(football_parser.file).to be_a(File)
    end

    it 'stores the headers as an array of strings' do
      expect(football_parser.headers).to all(be_a(String))
    end

    it 'stores the correct number of headers' do
      header_lengths = [football_parser.headers.count, weather_parser.headers.count]

      expect(header_lengths).to eq([8, 17])
    end

    it 'stores the contents as an array of strings' do
      expect(football_parser.contents).to all(be_a(String))
    end

    it 'correctly stores the right number of lines in contents' do
      content_lengths = [football_parser.contents.count, weather_parser.contents.count]
      expect(content_lengths).to eq [3,3]
    end
end