require './lib/station'
require './lib/journey'

class OysterCard

 attr_reader :balance, :entry_station, :journey_history, :exit_station, :journey


 MAXIMUM_AMOUNT = 90
 MINIMUM_AMOUNT = 1

	def initialize
		@balance = 0
	end

	def top_up(amount)
    fail "Does not accept negative amounts" if amount < 0
    fail "You have reached £#{MAXIMUM_AMOUNT}" if max?(amount)
		@balance += amount
	end


  def touch_in(station)
    fail "Insufficient Funds Available" if low_funds?
  end

  def touch_out(station)
    @exit_station = station
    deduct(MINIMUM_AMOUNT)
  end

  private

  def max?(amount)
    @balance + amount > MAXIMUM_AMOUNT
  end

  def low_funds?
    @balance < MINIMUM_AMOUNT
  end

  def deduct(amount)
    @balance -= amount
  end


end
