module DaveThomas
  module Kata04
    module Football
      class FileParser
        attr_reader :file, :headers, :lines
        def initialize(path)
          @file = File.new(path)
          @headers = separate_into_columns(@file.gets)
          @lines = convert_to_lines

          parse_values
        end 

        private

        def separate_into_columns(line)
          line.strip.split /\s+/
        end

        def convert_to_lines
          @file.readlines
          .map {|l| l.gsub(/\-|\n/, "").split(/\s+/) }
          .reject(&:empty?)
          .map {|l| remove_position_columns(l) }
        end

        def parse_values
          @lines = @lines.map do |values|
            values.map { |v| parse_integers(v)}
          end
        end

        def remove_position_columns(line)
          line.drop(2)
        end

        def parse_integers(value)
          Integer(value) rescue value
        end
      end
    end
  end
end
