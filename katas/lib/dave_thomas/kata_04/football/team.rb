module DaveThomas
  module Kata04
    module Football
      class Team
        attr_reader :goal_difference, :name
        def initialize(name:, goals_for:, goals_against:)
          @name = name
          @goal_difference = (goals_for - goals_against)
        end
      end
    end
  end
end