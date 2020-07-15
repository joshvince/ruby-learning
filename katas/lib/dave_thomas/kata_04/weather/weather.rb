module DaveThomas
  module Kata04
    module Weather
      class Weather
        attr_reader :days
        def initialize(file)
          @file = FileParser.new(file)
          @days = convert_lines_to_days
        end

        def highest_spread
          highest = 
            @days.sort {|a, b| a.temperature_spread <=> b.temperature_spread }.first
            highest.day
        end

        private

        def convert_lines_to_days
          days = @file.lines.map do |line_array| 
            day, min, max = line_array
            Day.new(day: day, max: max, min: min)
          end
        end
      end
    end
  end
end