require 'dave_thomas/kata_04/utils/utils'
require 'dave_thomas/kata_04/utils/file_parser'

module DaveThomas
  module Kata04
    module Weather
      class Weather
        include DaveThomas::Kata04::Utils::Utils
        
        attr_reader :days
        def initialize(file)
          @file = DaveThomas::Kata04::Utils::FileParser.new(path: file)
          @days = convert_lines_to_days
        end

        def highest_spread
          days.sort {|a, b| b.temperature_spread <=> a.temperature_spread }.first.day
        end

        private

        def convert_lines_to_days
          @file.contents.map do |line_string| 
            day, max, min = parse_one_line(line_string)
            Day.new(day: Integer(day), max: max, min: min)
          end
        end
        
        def parse_one_line(string)
          value_parser = Proc.new { |str| to_float(str.gsub(/\s|\*/, "")) }

          only_relevant_columns(string).map(&value_parser)
        end

        def only_relevant_columns(line_string)
          line_string.scan(/(\S*\s*)/).take(3).flatten
        end
      end
    end
  end
end