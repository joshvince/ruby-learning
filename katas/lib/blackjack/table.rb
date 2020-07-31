require 'blackjack/deck'

module BlackJack
  class Table

    attr_reader :score

    def initialize(deck_class: BlackJack::Deck)
      @deck = deck_class.new
      @deck.shuffle
      @score = {player: {}, dealer: {}}
    end

    def deal
      deck.deal(2)
    end

    def hit
      deck.deal(1).first
    end

    def stand(name, final_score)
      @score[name] = final_score
    end

    def bust(name, final_score)
      @score[name] = final_score
    end

    def result
      player_score = score[:player]
      dealer_score = score[:dealer]

      return 'Dealer wins...' if player_score[:bust]
      return 'Player wins!' if dealer_score[:bust]

      case player_score[:score] <=> dealer_score[:score]
      when 1
        'Player wins!'
      when -1
        'Dealer wins...'
      else
        "It's a tie..."
      end
    end

    private

    attr_accessor :deck
    attr_writer :score

  end
end