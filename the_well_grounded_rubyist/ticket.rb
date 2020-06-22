ticket = Object.new

def ticket.date
  "01/02/03"
end

def ticket.venue
  "Town Hall"
end

def ticket.event
  "Author's reading"
end

def ticket.performer
  "Mark Twain"
end

def ticket.seat
  "Second Balcony, row J, seat 12"
end

def ticket.price
  5.50
end

puts "This ticket is for: #{ticket.event}, at #{ticket.venue}." + 
"The performer is #{ticket.performer}." +
"The seat is #{ticket.seat}, " + 
"and it costs $#{"%.2f." % ticket.price}"

print "Information desired: "
request = gets.chomp
if ticket.respond_to?(request)
  puts ticket.send(request)
else
  puts "No info available"
end

class Ticket
  VENUES = ["Convention Center", "Fairgrounds", "Town Hall"]
  attr_reader :venue, :date
  attr_accessor :price

  def initialize(venue, date)
    if VENUES.include?(venue)
      @venue = venue
    else  
      raise ArgumentError, "Unknown venue #{venue}"
    end
    @date = date
  end

  def discount(percent)
    @price = @price * (100 - percent) / 100.0
  end

end