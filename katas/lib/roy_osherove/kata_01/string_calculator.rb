module RoyOsherove
  module Kata01
    class StringCalculator
      DEFAULT_DELIMETER = /[,]|[\n]/
      attr_accessor :input, :delimiter, :sequence

      def add(string)
        return 0 unless string.length > 0
        
        @input = string
        set_delimiter_and_sequence
        integers = sequence.split(delimiter).filter { |i| i != "" }.map { |s| s.to_i }
        valid_integers(integers).sum
      end
      
      private

      def set_delimiter_and_sequence
        if input.start_with? "//"
          multi_char_regex = %r{\[(\S+?)\]}
          delim_input, seq = input.split(/\n/, 2)
          
          @sequence = seq

          case delim_input.match multi_char_regex
          when nil
            @delimiter = delim_input.chars[-1]
          else
            @delimiter = build_delimiter(delim_input, multi_char_regex)
          end
        else
          @sequence = input
          @delimiter = /[,]|[\n]/
        end
      end

      def build_delimiter(input, regex)
        string = input.scan(regex).flatten
                 .map { |char| "(" + Regexp.quote(char) + "+?)" }.join("|")
                 .prepend("\[").concat("\]")
        Regexp.new(string)
      end

      def valid_integers(integers)
        raise_negative_number_error(integers) unless integers.all? {|i| i.positive?}
        
        integers.reject { |i| i > 1000 }
      end

      def raise_negative_number_error(integers)
        negatives = integers.filter { |n| n.negative? }

        raise "negatives not allowed, received: #{negatives}"
      end
    end
  end
end