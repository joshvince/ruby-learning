module Kata02
  class BinaryChop
    def chop(num, array)
      # case array.index(num)
      # when nil
      #   -1
      # else
      #   array.index(num)
      # end

      recursive(num, array)
    end

      # recurse through yourself with a new array each time

      ## get the length of the array
      ## if the array is 1 long, compare the value with the num, returning either -1 or the pos
      ## if the array is more than one long....
        ## get the middle index, and value of the array
        ## compare the value with the num, returning the num if it matches
        ## otherwise, recurse with (num, new_half, middleindex)
    def recursive(search_int, array, start_pos = 0)
      case array.length
      when 0
        -1
      else
        checker(search_int, array, start_pos)
      end

    end

    def checker(search_int, array, start_pos)
      case array.length
      when 0
        return -1
      when 1
        if (search_int == array[0]) 
          return start_pos 
        else 
          return -1 
        end
      else
        middle_index = (array.length / 2.0).floor
        middle_val = array[middle_index]

        if (search_int == middle_val)  
          return (start_pos + middle_index) 
        end
        
        lower_half = array.slice(0, middle_index)
        upper_half = array.slice(middle_index, array.length)
        
        if (search_int < middle_val)
          checker(search_int, lower_half, start_pos)
        else
          checker(search_int, upper_half, start_pos + middle_index)
        end
      end
    end

    def looper(num, array)
      # loop through the values to explicitly compare values

      ## get the middle value of the array
      ## compare num with that value
      ## 
    end

    def rubyway(num, array)
      # use ruby stdlib methods to achieve the result
    end
  end
end