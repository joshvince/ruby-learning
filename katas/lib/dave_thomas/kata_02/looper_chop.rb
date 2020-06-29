module DaveThomas
  module Kata02
    class LooperChop
      attr_reader :target
      
      def chop(target, array)
        @target = target
        
        case array.length
        when 0
          -1
        when 1
          final_tick(array, 0)
        else
          tick(array)
        end
      end
      
      private
      
      def tick(array)
        working_array = array
        i = 0
        while working_array.length > 0
          return final_tick(working_array, i) if (working_array.length == 1)
          
          middle_index = (working_array.length / 2.0).floor
          
          case 
          when (target == working_array[middle_index])
            return middle_index + i
          when (target < working_array[middle_index])
            working_array = working_array.slice(0,middle_index)
          when (target > working_array[middle_index])
            working_array = working_array.slice(middle_index, working_array.length)
            i = i + middle_index
          end
        end
      end
      
      def final_tick(array, start_pos)
        if target == array[0]
          start_pos
        else
          -1
        end
      end
    end
  end
end