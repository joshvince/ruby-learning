require 'blackjack/blackjack_card'

module BlackJack
  class AceCard < BlackJackCard
    def use_as_one
      @score = 1
    end

    def use_as_eleven
      @score = 11
    end
  end
end