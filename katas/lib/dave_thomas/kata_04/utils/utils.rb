module DaveThomas
  module Kata04
    module Utils
      module Utils
        def build_record(headers,lines)
          header_vals = headers.map { |h| h.to_sym}
          lines.map do |line|
            header_vals.zip(line).to_h
          end
        end

        def to_float(value)
          Float(value) rescue value
        end

        def to_int(value)
          Integer(value) rescue value
        end
      end
    end
  end
end