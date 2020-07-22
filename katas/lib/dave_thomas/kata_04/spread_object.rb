module DaveThomas
  module Kata04
    class SpreadObject
      attr_reader :name, :spread
      def initialize(name:, max:, min:)
        @name = name
        @spread = max - min
      end
    end
  end
end