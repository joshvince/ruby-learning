require 'blackjack/card'

RSpec.describe BlackJack::Card do
  context 'for numerical cards' do
    let(:ten_of_clubs) { described_class.new(value: 10, suit: :clubs) }

    it 'exposes the suit back' do
      expect(ten_of_clubs.suit).to eq :clubs
    end

    it 'exposes the value back' do
      expect(ten_of_clubs.value).to eq 10
    end
  
    it 'knows that 10 is not a face card' do
      expect(ten_of_clubs.is_face_card?).to eq false
    end
  end
  
  context 'for face cards' do
    let(:queen_of_hearts) { described_class.new(value: 12, suit: :hearts) }
    let(:heart_face_cards) { generate_face_cards(:hearts) }
    
    it 'keeps the value provided to it' do
      expect(queen_of_hearts.value).to eq 12
    end

    it 'correctly understands the face card assigned to each value' do
      face_names = heart_face_cards.map { |c| c.name }
      expect(face_names).to eq ["Jack of Hearts", "Queen of Hearts", "King of Hearts"]
    end

    it 'correctly sets the face value' do
      face_values = heart_face_cards.map { |c| c.is_face_card? }
      expect(face_values).to all(be(true))
    end
  end

  context 'for aces' do
    let(:ace_of_spades) { described_class.new(value: 1, suit: :spades)}

    it 'knows that ace is the card of value 1' do
      expect(ace_of_spades.name).to eq "Ace of Spades"
    end

    it 'knows that aces are not face cards' do
      expect(ace_of_spades.is_face_card?).to eq false
    end
  end
  

  context 'turning cards' do
    let(:six_of_clubs) { described_class.new(value: 6, suit: :clubs) }

    it 'starts face down' do
      expect(six_of_clubs.face_up).to eq false
    end

    it 'turns over correctly' do
      eight_of_clubs = described_class.new(value: 8, suit: :clubs)
      eight_of_clubs.turn_over
      expect(eight_of_clubs.face_up).to eq true
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