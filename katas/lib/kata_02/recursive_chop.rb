module Kata02
  class RecursiveChop
    def initialize(num, array)
      @search_int = num
      @array = array
      @start_pos = 0
    end
    
    attr_reader :search_int
    attr_accessor :array, :start_pos

    def chop
      case array.length
      when 0
        -1
      when 1
        final_tick
      else
        tick
      end
    end

    def tick
      middle_index = (array.length / 2.0).floor
      middle_val = array[middle_index]

      if (search_int == middle_val)  
        (start_pos + middle_index) 
      elsif (search_int < middle_val)
        @array = array.slice(0, middle_index)
        chop
      elsif (search_int > middle_val)
        @array = array.slice(middle_index, array.length)
        @start_pos = (start_pos + middle_index)
        chop
      end
    end

    def final_tick
      if (search_int == array[0])
        start_pos
      else
        -1
      end
    end
  end
end