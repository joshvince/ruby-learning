require 'blackjack/ace_card'

RSpec.describe BlackJack::AceCard do
  let(:ace_of_spades) { described_class.new(value: 1, suit: :spades) }

  it 'defaults score to 11' do
    expect(ace_of_spades.score).to eq 11
  end

  it 'allows the player to use it as a 1' do
    ace_of_spades.use_as_one
    
    expect(ace_of_spades.score).to eq 1
  end

  it 'allows the player to change their mind and score it back as 11' do
    ace_of_spades.use_as_one
    ace_of_spades.use_as_eleven

    expect(ace_of_spades.score).to eq 11
  end
end