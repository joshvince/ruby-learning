require 'blackjack/blackjack_card'

RSpec.describe BlackJack::BlackJackCard do

  describe 'scoring' do
    context 'number cards' do
      let(:six_of_clubs) { described_class.new(value: 6, suit: :clubs) }
      
      it 'keeps the accurate score' do
        expect(six_of_clubs.score).to eq 6
      end
    end
    
    context 'face cards' do
      let(:heart_face_cards) { generate_face_cards(:hearts) }
      
      it 'scores face cards as 10' do
        scores = heart_face_cards.map { |c| c.score }
        expect(scores).to all(eq(10))
      end
    end
    
    context 'aces' do
      let(:ace_of_spades) { described_class.new(value: 1, suit: :spades) }
      
      it 'does something' do
        
      end
    end
  end

  def generate_face_cards(suit)
    [
      described_class.new(value: 11, suit: suit),
      described_class.new(value: 12, suit: suit),
      described_class.new(value: 13, suit: suit)
    ]
  end
end