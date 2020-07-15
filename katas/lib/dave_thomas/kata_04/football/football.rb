module DaveThomas
  module Kata04
    module Football
      class Football
        def initialize(filepath)
          @file = FileParser.new(filepath)
          @teams = create_teams
        end

        def create_teams
          @file.lines.map do |line|
            Team.new(name: line[0], goals_for: line[5], goals_against: line[6])
          end
        end

        def best_goal_diff
          @teams.sort {|a,b| b.goal_difference <=> a.goal_difference}.first.name
        end
      end
    end
  end
end