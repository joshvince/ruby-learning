require 'dave_thomas/kata_04/weather/weather'

RSpec.describe DaveThomas::Kata04::Weather::Weather do
  let(:weather) { DaveThomas::Kata04::Weather::Weather.new("spec/support/weather_test.dat")}

  it 'returns the day containing the highest temperature spread' do
    expect(weather.highest_spread).to eq 1
  end

  it 'stores the days as an array of objects that will provide a temp spread' do
    expect(weather.days).to all(respond_to(:temperature_spread))
  end
end