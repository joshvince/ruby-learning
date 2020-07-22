require 'dave_thomas/kata_04/utils/utils'
require 'dave_thomas/kata_04/utils/file_parser'
require 'dave_thomas/kata_04/team'

module DaveThomas
  module Kata04
    class Football
      include Utils::Utils

      def initialize(filepath = 'lib/dave_thomas/kata_04/files/football.dat')
        @file = Utils::FileParser.new(path: filepath)
        @teams = create_teams
      end

      
      def best_goal_diff
        @teams.sort {|a,b| b.spread <=> a.spread}.first.name
      end

      private

      def create_teams
        @file.contents.map do |line|
          data = parse_one_line(line)
          Team.new(name: data[0], max: data[5], min: data[6])
        end
      end

      def parse_one_line(line_string) 
        parser = Proc.new { |str| to_float(str.strip) }

        line_string.scan(/(\S*\s*)/).flatten.map(&parser).drop(1)
      end
    end
  end
end