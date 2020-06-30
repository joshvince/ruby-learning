module RoyOsherove
  module Kata01
    class StringCalculator
      attr_accessor :input, :delimiter, :sequence

      def add(string)
        @input = string
        
        return 0 if input.length == 0
        
        configure_delimiter
        integers = sequence.split(delimiter).filter { |i| i != "" }.map { |s| s.to_i }
        valid_integers(integers).sum
      end
      
      private

      def configure_delimiter
        if input.start_with? "//"
          handle_custom_delimiter
        else
          # the whole input is the sequence if the input didn't define a custom delimiter
          @sequence = input
          @delimiter = /[,]|[\n]/
        end
      end

      def handle_custom_delimiter
        delim_config, @sequence = input.split(/\n/, 2)

        multi_char_signature = %r{\[(\S+?)\]}

        case delim_config.match multi_char_signature
        when nil
          # the spec says that anything not enclosed in square brackets is valid as a single char delimiter
          @delimiter = delim_config.chars.last
        else
          build_delimiter(delim_config, multi_char_signature)
        end
      end

      def build_delimiter(input, regex)
        inputted_chars = input.scan(regex).flatten
        capture_groups = inputted_chars.map { |char| "(" + Regexp.quote(char) + "+?)" }
        regex_string = "\[" + capture_groups.join("|") + "\]"
        
        @delimiter = Regexp.new(regex_string)
      end

      def valid_integers(integers)
        raise_negative_number_error(integers) unless integers.all? {|i| i.positive?}
        
        integers.reject { |i| i > 1000 }
      end

      def raise_negative_number_error(integers)
        raise "negatives not allowed, received: #{integers.filter { |n| n.negative? }}"
      end
    end
  end
end