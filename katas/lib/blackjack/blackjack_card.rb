require 'blackjack/card'

module BlackJack
  class BlackJackCard < Card
    
    attr_reader :score

    def initialize(value:, suit:)
      super
      @score = calculate_score
    end

    private

    def calculate_score
      case value
      when 1
        11
      when 11..13
        10
      else
        value
      end
    end
  end
end