require 'blackjack/table'

RSpec.describe BlackJack::Table do
  let(:queen_of_hearts) { instance_double('BlackJack::BlackJackCard', :score => 10, :name => "Queen of Hearts")}
  let(:mock_deck) { instance_double('BlackJack::Deck', :deal => queen_of_hearts, :shuffle => [queen_of_hearts])}
  let(:mock_deck_class) { class_double('BlackJack::Deck', :new => mock_deck)}   
  let(:table) { described_class.new(deck_class: mock_deck_class) }

  before do
    allow(mock_deck).to receive(:deal).with(1) { queen_of_hearts }
    allow(mock_deck).to receive(:deal).with(2) { [queen_of_hearts, queen_of_hearts]}
  end

  it 'shuffles the deck at the start of the game' do
    expect(mock_deck).to receive(:shuffle)
    table
  end

  it 'deals two cards to the player when they ask for it' do
    cards = table.deal
    expect(cards.count).to eq 2
  end

  it 'a hit message deals a card from the deck' do
    expect(mock_deck).to receive(:deal) { [{}] }
    table.hit
  end

  it 'updates the score when it receives stand' do
    player_hand = {score: 20, bust: false, blackjack: false}
    dealer_hand = {score: 16, bust: false, blackjack: false}

    table.stand(:player, player_hand)
    table.stand(:dealer, dealer_hand)
    expect(table.score).to include(:player => player_hand, :dealer => dealer_hand)
  end

  it 'updates the score on a bust' do
    hand = {score: 25, bust: true, blackjack: false}

    table.bust(:player, hand)

    expect(table.score).to include(:player => hand)
  end

  describe '#result' do
    let(:bust_hand) { {score: 25, bust: true, blackjack: false} }
    let(:valid_high_hand) { {score: 21, bust: false, blackjack: false} }
    let(:valid_low_hand) { {score: 16, bust: false, blackjack: false} }

    context 'when the player busts' do

      it 'identifies the dealer as the winner' do
        table.bust(:player, bust_hand)
        table.stand(:dealer, valid_low_hand)
        
        expect(table.result.downcase).to include('dealer wins')
      end

    end

    context 'when both parties bust' do

      it 'identifies the dealer as the winner' do
        table.bust(:player, bust_hand)
        table.bust(:dealer, bust_hand)
        
        expect(table.result.downcase).to include('dealer wins')
      end
    end
    
    context 'when the dealer busts' do

      it 'identifies the player as the winner' do
        table.stand(:player, valid_low_hand)
        table.bust(:dealer, bust_hand)
        
        expect(table.result.downcase).to include('player wins')
      end
      

    end
    
    context 'when no one busts' do

      it 'identifies a winning player score' do
        table.stand(:player, valid_high_hand)
        table.stand(:dealer, valid_low_hand)
        
        expect(table.result.downcase).to include('player wins')
      end

      it 'identifies a winning dealerscore' do
        table.stand(:player, valid_low_hand)
        table.stand(:dealer, valid_high_hand)
        
        expect(table.result.downcase).to include('dealer wins')
      end

      it 'identifies as a tie' do
        table.stand(:player, valid_high_hand)
        table.stand(:dealer, valid_high_hand)

        expect(table.result.downcase).to include('tie')
      end
    end
  end
end