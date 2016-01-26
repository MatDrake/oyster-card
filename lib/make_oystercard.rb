class OysterCard

    MIN_BALANCE = 1
  	MAX_BALANCE = 90
	attr_reader :balance

	def initialize
    	@balance = 0
      @in_journey = false
  	end

  	def top_up(value)
    	raise "Amount exceeds the limit: #{MAX_BALANCE}" if @balance +value > MAX_BALANCE
    	@balance += value
  	end

    def touch_in
      raise 'not enough funds' if MIN_BALANCE > @balance
      @in_journey = true
    end

    def touch_out
      deduct(MIN_BALANCE)
      @in_journey = false
    end

    def in_journey?
      @in_journey
    end
private
    def deduct(value)
  		@balance -= value
  		return value
  	end
end
