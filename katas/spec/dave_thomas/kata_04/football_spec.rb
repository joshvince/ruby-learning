require 'dave_thomas/kata_04/football'

RSpec.describe DaveThomas::Kata04::Football do
  let(:football) { described_class.new('spec/support/football_test.dat')}
  it 'returns the name of the best goal difference' do
    expect(football.best_goal_diff).to eq "Arsenal"
  end
end