module DaveThomas
  module Kata04
    module Weather
      class Day 
        attr_reader :day, :temperature_spread
        def initialize(day: day, max: max, min: min)
          @day = day
          @max = max
          @min = min
          @temperature_spread = (max - min)
        end

        def self.foo
          true
        end
      end
    end
  end
end