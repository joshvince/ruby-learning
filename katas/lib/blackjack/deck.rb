require 'blackjack/blackjack_card'
require 'blackjack/ace_card'

module BlackJack
  class Deck
    SUITS = [:hearts, :diamonds, :clubs, :spades]

    attr_reader :cards
    def initialize(card_class:, ace_class:)
      @card_class = card_class
      @ace_class = ace_class
      @cards = generate_fresh_deck
    end

    def shuffle
      cards.shuffle!
    end

    def deal(number_of_cards)
      cards.shift(number_of_cards)
    end

    def send_to_back(returning_cards)
      cards.append(returning_cards)
    end

    private

    attr_reader :card_class, :ace_class

    def generate_fresh_deck
      SUITS.map { |suit| build_value_hash(suit) }
           .flatten
           .map { |hash| create_card(hash) }
    end


    def build_value_hash(suit_name)
      (1..13).map { |n|  {suit: suit_name, value: n} }
    end

    def create_card(hash)
      case hash[:value]
      when 1
        ace_class.new(hash)
      else
        card_class.new(hash)
      end
    end
    
  end
end