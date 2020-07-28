require 'humanize'

module BlackJack
  class Card
    attr_reader :value, :suit, :name, :face_up

    def initialize(value:, suit:)
      @value = value
      @suit = suit
      @name = generate_name
      @face_up = false
    end
    
    def is_face_card?
      value > 10
    end

    def turn_over
      @face_up= !face_up
    end
    
    private

    def generate_name
      "#{pictoral_name} of #{suit.to_s.capitalize}"
    end

    def pictoral_name
      case value
      when 1
        'Ace'
      when 11
        'Jack'
      when 12
        'Queen'
      when 13
        'King'
      else
        value.humanize.capitalize
      end
    end

  end
end