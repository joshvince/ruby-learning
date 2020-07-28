require 'blackjack/deck'

RSpec.describe BlackJack::Deck do
  let(:card_class) { double() }
  let(:ace_class) { double() }
  let(:fresh_deck) { described_class.new(card_class: card_class, ace_class: ace_class) }

  before do
    allow(card_class).to receive(:new) do |input_hash|
      input_hash
    end 
    allow(ace_class).to receive(:new) do |input_hash|
      input_hash
    end
  end

  describe '#new' do
    
    it 'has 52 cards to start with' do
      expect(fresh_deck.cards.count).to eq 52
    end
    
    it 'creates 12 non-ace cards of each suit' do
      suits = [:hearts, :clubs, :spades, :diamonds]
      suits.each do |suit|
        expect(card_class).to receive(:new).exactly(12).times.with(hash_including(:suit => suit))
      end
      
      fresh_deck
    end
    
    it 'creates 4 aces' do
      expect(ace_class).to receive(:new).exactly(4).times
      
      fresh_deck
    end
  end

  describe 'interacting' do
    let(:second_deck) { described_class.new(card_class: card_class, ace_class: ace_class) }
    
    it 'shuffles the order from a starting deck' do
      fresh_one = fresh_deck
      second_deck.shuffle

      expect(fresh_one.cards).not_to eq(second_deck.cards)
    end

    describe '#deal' do
      it 'returns the dealt cards' do
        expect(fresh_deck.deal(2).count).to eq 2
      end
      
      it 'removes the dealt cards from the deck' do
        fresh_deck.deal(2)
        expect(fresh_deck.cards.count).to eq 50
      end
    end

    describe '#to_back' do
      it 'returns the card to the back of the deck' do
        returning_card = ace_class.new({value: 1, suit: :spades})
        fresh_deck.send_to_back(returning_card)

        expect(fresh_deck.cards.last).to eq(returning_card)
      end
    end
  end


end