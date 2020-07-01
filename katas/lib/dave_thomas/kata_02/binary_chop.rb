$LOAD_PATH.unshift File.expand_path(".", "lib/dave_thomas/kata_02")
require 'benchmark'
require 'recursive_chop'
require 'looper_chop'
require 'functional_chop'
include DaveThomas::Kata02::FunctionalChop
module DaveThomas
  module Kata02
    module BinaryChop
      def self.measure_recursive(upper_limit)
        Benchmark.bm(20) do |bm|
          target = rand(upper_limit)
          array = [*1..upper_limit]
          bm.report("Recursive Search:") do
            searcher = Kata02::RecursiveChop.new(target, array)
            1.times do ; searcher.chop ; end
          end
          bm.report("Linear Search:") do
            1.times do ; linear_search(target, array) ; end
          end
        end
      end
      
      def self.measure_looper(upper_limit)
        Benchmark.bm(20) do |bm|
          target = rand(upper_limit)
          array = [*1..upper_limit]
          bm.report("Looper Search:") do
            searcher = Kata02::LooperChop.new
            1.times do ; searcher.chop(target, array) ; end
          end
          bm.report("Linear Search:") do
            1.times do ; linear_search(target, array) ; end
          end
        end
      end
      
      def self.measure_functional(upper_limit)
        Benchmark.bm(20) do |bm|
          target = rand(upper_limit)
          array = [*1..upper_limit]
          bm.report("Functional Search:") do
            1.times do ; Kata02::FunctionalChop.chop(target, array) ; end
          end
          bm.report("Linear Search:") do
            1.times do ; linear_search(target, array) ; end
          end
        end
      end
      
      def self.compare_implementations(upper_limit)
        Benchmark.bm(20) do |bm|
          target = rand(upper_limit)
          array = [*1..upper_limit]
          recursive_searcher = Kata02::RecursiveChop.new(target, array)
          looper_searcher = Kata02::LooperChop.new
          
          bm.report("Recursive Search:") do
            1.times do ; recursive_searcher.chop ; end
          end
          bm.report("Looper Search:") do
            1.times do ; looper_searcher.chop(target, array) ; end
          end
          bm.report("Functional Search:") do
            1.times do ; Kata02::FunctionalChop.chop(target, array) ; end
          end
        end
      end
      
      def self.linear_search(target, array)
        counter = 0
        
        while counter < array.length
          if array[counter] == target
            return counter
          else
            counter += 1
          end
        end
        nil
      end
    end
  end
end