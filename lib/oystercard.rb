require './lib/journey.rb'
require './lib/station.rb'

class OysterCard

 MAXIMUM_BALANCE = 90
 MINIMUM_BALANCE = 1

 MINIMUM_CHARGE = 1

 attr_reader :balance, :entry_station

 def initialize
   @balance = 0
   @in_journey = false
 end

 def top_up(amount)
 	raise "error balance greater than maximum balance" if balance + amount > MAXIMUM_BALANCE
 	@balance += amount
 end

 def touch_in(station=nil)
 	raise 'Balance too low.' if balance < MINIMUM_BALANCE
 	@journey = Journey.new(station)
 end

 def touch_out(exit_station=nil)
    @entry_station = nil
    @journey.exit(exit_station)
    deduct
 end

def previous_journeys
@journey.previous_journeys
end

 private

 def deduct
 	@balance -= @journey.fare
 end

end
