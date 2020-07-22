module DaveThomas
  module Kata04
    module Utils
      class FileParser
        include Utils
        attr_reader :headers, :contents
        def initialize(path:)
          @file = File.new(path)
          parse_and_store_headers
          parse_and_store_contents
        end

        private

        attr_reader :file
        
        def parse_and_store_headers
          file.rewind
          @headers = file.gets.strip.split /\s+/
          file.rewind
        end

        def parse_and_store_contents
          file.rewind
          contents_only = file.readlines.drop(1)
          @contents = strip_content_strings(contents_only)
        end

        def strip_content_strings(lines)
          lines.map { |str| str.strip.gsub(/\-|\n/, "") }.reject(&:empty?)
        end
      end
    end
  end
end