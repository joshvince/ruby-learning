
def fussy_method(x)
  raise ArgumentError, "I need a number under 10" unless x < 10
end
begin
  fussy_method(20)
rescue ArgumentError => e
  puts "unacceptable number"
  puts "heres the backtrace"
  puts e.backtrace
  puts "and heres message"
  puts e.message
end
