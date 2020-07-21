module DaveThomas
  module Kata04
    module Weather
      class Day 
        attr_reader :day, :temperature_spread
        def initialize(day:, max:, min:)
          @day = day
          @temperature_spread = (max - min)
        end
      end
    end
  end
end