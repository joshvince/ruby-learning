module Kata02
  module FunctionalChop
    def chop(target, array, start_pos = 0)
      return -1 unless array.length > 0

      middle_index = (array.length / 2.0).floor

      case (target <=> array[middle_index])
      when 0
        (middle_index + start_pos)
      when 1
        new_half = array.slice(middle_index + 1, array.length)
        new_start_pos = (middle_index + 1 + start_pos)
        chop(target, new_half, new_start_pos)
      when -1
        new_half = array.slice(0, middle_index)
        chop(target, new_half, start_pos)
      end
    end
  end
end