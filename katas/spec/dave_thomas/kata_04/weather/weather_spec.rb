# require 'dave_thomas/kata_04/spec_helper'
require 'dave_thomas/kata_04/weather/weather'

RSpec.describe DaveThomas::Kata04::Weather::Weather do
  let(:weather) { DaveThomas::Kata04::Weather::Weather.new("spec/support/weather_test.dat")}


  it 'returns the day containing the highest temperature spread' do
    expect(weather.highest_spread).to eq 1
  end

  it 'creates the right amount of days' do
    expect(weather.days.count).to eq 3
  end

end