require 'dave_thomas/kata_04/weather/day'

RSpec.describe DaveThomas::Kata04::Weather::Day, '#new' do
  it 'calculates the temperature spread for a specific day' do
    day = DaveThomas::Kata04::Weather::Day.new(day: 1, max: 90, min: 70)
    expect(day.temperature_spread).to eq 20  
  end
  
  it 'handles floats' do
    day = DaveThomas::Kata04::Weather::Day.new(day: 1, max: 90.5, min: 80.5)
    expect(day.temperature_spread).to eq 10
  end
end