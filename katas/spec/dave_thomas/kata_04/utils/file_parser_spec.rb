require 'dave_thomas/kata_04/utils/file_parser'

RSpec.describe DaveThomas::Kata04::Utils::FileParser do
  let (:football_parser) { described_class.new(path: 'spec/support/football_test.dat') }
  let (:weather_parser) { described_class.new(path: 'spec/support/weather_test.dat') }

  it 'stores the right number of headers as strings' do
    expect(football_parser.headers).to eq expected_headers
  end

  it 'stores the contents as an array of strings' do
    expect(football_parser.contents).to all(be_a(String))
  end

  context 'when file contains dashed lines' do
    it 'returns contents without dashed lines' do
      expect(football_parser.contents).to eq expected_football_contents
    end
  end

  context 'when file contains empty lines' do
    it 'returns contents without empty lines' do
      expect(weather_parser.contents).to eq expected_weather_contents
    end
  end

  def expected_headers
    ['Team','P','W','L','D','F','A','Pts']
  end

  def expected_football_contents
    [
      "1. Arsenal         38    26   9   3    79    36    87",
      "2. Liverpool       38    24   8   6    67    30    80",
      "18. Ipswich         38     9   9  20    41    64    36"
    ]
  end

  def expected_weather_contents
    [
      "1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5",
      "2  79.5  71.5  71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5",
      "3  77*   55*   66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8"
    ]
  end

end