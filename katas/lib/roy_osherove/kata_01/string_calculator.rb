module RoyOsherove
  module Kata01
    class StringCalculator
      MULTI_CHAR_SIGNATURE = %r{\[(\S+?)\]}

      def add(string)
        @input = string
        
        return 0 if input.empty?
        
        setup_sequence_and_delimiter
        @sequence = sequence.split(delimiter).map(&:to_i)
        raise_if_negatives
        reject_over_one_thousand.sum
      end

      private
      
      attr_accessor :input, :delimiter, :sequence

      def setup_sequence_and_delimiter
        if input.start_with? "//"
          delim_config, @sequence = input.split(/\n/, 2)
          @delimiter = handle_custom_delimiter(delim_config)
        else
          # the whole input is the sequence if the input didn't define a custom delimiter
          @sequence = input
          @delimiter = /,|\n/
        end
      end

      def handle_custom_delimiter(config)
        if config.match MULTI_CHAR_SIGNATURE
          build_delimiter(config)
        else
          # the spec says that anything not enclosed in square brackets is valid as a single char delimiter
          config.chars.last
        end
      end

      def build_delimiter(input)
        inputted_chars = input.scan(MULTI_CHAR_SIGNATURE).flatten
        capture_groups = inputted_chars.map { |char| "(" + Regexp.quote(char) + "+?)" }
        regex_string = "\[" + capture_groups.join("|") + "\]"
        
        Regexp.new(regex_string)
      end

      def raise_if_negatives
        negatives = sequence.filter(&:negative?)
        raise "negatives not allowed, recieved #{negatives}" unless negatives.empty?
      end

      def reject_over_one_thousand
        sequence.reject { |i| i > 1000 }
      end
    end
  end
end