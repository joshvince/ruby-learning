# require 'dave_thomas/kata_04/spec_helper'
require 'dave_thomas/kata_04/weather/weather'

RSpec.describe DaveThomas::Kata04::Weather::Weather do

  let(:weather) { DaveThomas::Kata04::Weather::Weather.new("spec/support/weather_test.dat")}
  # THIS FAILS
  # let(:mock_day) { class_double(DaveThomas::Kata04::Weather::Day, new: "OK!") }

  it 'returns the day containing the highest temperature spread' do
    expect(weather.highest_spread).to eq 1
  end

  it 'stores the days as an array of objects that will provide a temp spread' do
    expect(weather.days).to all(respond_to(:temperature_spread))
  end

  # THIS FAILS
  # it 'processes the first file line correctly' do
  #   expected_line = {day: 1, max: 88.0, min: 59.0}
  #   expect(mock_day).to receive(:new).with(expected_line)
  #   weather
  # end

  it 'processes the first line correctly' do
    expected = {day: 1, temperature_spread: 29.0}
    day = weather.days.first
    puts day.temperature_spread
    actual = {day: day.day, temperature_spread: day.temperature_spread}
    expect(actual).to eq expected
  end
end