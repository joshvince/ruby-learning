module DaveThomas
  module Kata04
    module Weather
      class FileParser
        attr_reader :file, :headers, :lines
        def initialize(path)
          @file = File.new(path)
          @headers = separate_into_columns(@file.gets)
          @lines = parse_file_lines
        end

        private

        def parse_file_lines
          @file.readlines
              .reject {|l| l == "\n"}
              .map {|l| separate_into_columns(l) }
              .take(3)
              .map {|l| convert_to_numbers(l) }
        end
        
        def separate_into_columns(line)
          line.strip.split /\s+/
        end

        def convert_to_numbers(line)
          day, min, max = line
          day = day.to_i
          min = min.tr("*", "").to_f
          max = max.tr("*", "").to_f
          [day, min, max]
        end
      end
    end
  end
end