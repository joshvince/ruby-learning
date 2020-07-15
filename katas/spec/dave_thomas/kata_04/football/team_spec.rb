require 'dave_thomas/kata_04/football/team'

RSpec.describe DaveThomas::Kata04::Football::Team, '#new' do
  it 'calculates the goal difference of a team' do
    team = described_class.new(name: "Brighton", goals_for: 100, goals_against: 50)
    expect(team.goal_difference).to eq 50
  end
end