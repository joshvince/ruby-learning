module BlackJack
  class Hand
    attr_reader :cards 
    def initialize(table:)
      @table = table
      @cards = table.deal
    end

    def status
      print_status
    end

    def hit
      card = table.hit
      @cards << card
    end

    def score
      calculate_score
    end   

    private

    def print_status
      puts "Your cards are: #{get_card_names}"
      puts "Your score is: #{score[:score]}"
      puts 'You got a blackjack!' if score[:blackjack]
      puts 'You are bust, sorry!' if score[:bust]
    end

    def calculate_score
      score_value =  cards.reduce(0) { |score, card| score + card.score }
      is_blackjack = (score_value == 21 && cards.count == 2)
      is_bust = score_value > 21

      {score: score_value, bust: is_bust, blackjack: is_blackjack}
    end

    def get_card_names
      cards.map { |card| card.name }.join(' and ')
    end

    attr_reader :table

  end
end