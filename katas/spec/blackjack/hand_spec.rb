require 'blackjack/hand'

RSpec.describe BlackJack::Hand do
  let(:queen_of_hearts) { create_card(10, "Queen of Hearts")}
  let(:six_of_clubs) { create_card(6, "Six of Clubs") }
  let(:five_of_spades) { create_card(5, "Five of Spades") }
  let(:king_of_diamonds) { create_card(10, "King of Diamonds") }
  let(:ace_of_spades) { create_ace("Ace of Spades") }

  let(:mock_table) { instance_double('BlackJack::Table')}

  let(:new_hand) { described_class.new([queen_of_hearts, five_of_spades])}
  
  before do
    allow(BlackJack::Table).to receive(:new) { mock_table }
    allow(mock_table).to receive(:deal) { [queen_of_hearts, queen_of_hearts] }
    allow(mock_table).to receive(:hit) { five_of_spades }
  end

  let(:hand) {described_class.new(table: mock_table) }

  it 'asks the table for cards when it is initialized' do
    expect(mock_table).to receive(:deal)
    hand
  end

  describe '#hit' do
    it 'fetches the new card from the deck' do
      expect(mock_table).to receive(:hit)
      hand.hit
    end
    
    it 'updates the cards to include the new card' do
      hand.hit
      expect(hand.cards).to include(five_of_spades)
    end
  end

  describe 'keeping score' do
    context 'when not dealt a blackjack' do

      it 'keeps correct score' do     
        expect(hand.score).to eq({score: 20, bust: false, blackjack: false})
      end
      
      it 'knows when someone is bust' do
        hand.hit
        
        expect(hand.score).to eq({score: 25, bust: true, blackjack: false})
      end
    end

    context 'when dealt a blackjack' do
      before do
        allow(mock_table).to receive(:deal) { [queen_of_hearts, ace_of_spades] }
      end

      it 'recognises a true blackjack' do
        expect(hand.score).to eq({score: 21, bust: false, blackjack: true})
      end

    end

    context 'when dealt another type of 21' do
      before do
        allow(mock_table).to receive(:deal) { [queen_of_hearts, six_of_clubs] }
        allow(mock_table).to receive(:hit) { five_of_spades }
      end

      it 'knows not every 21 is a blackjack' do
        hand.hit
        
        expect(hand.score).to eq({score: 21, bust: false, blackjack: false})
      end
    end
  end

  def create_card(value, name)
    instance_double('BlackJack::BlackJackCard', :score => value, :name => name) 
  end

  def create_ace(name)
    instance_double('BlackJack::AceCard', :score => 11, :name => name)
  end

end