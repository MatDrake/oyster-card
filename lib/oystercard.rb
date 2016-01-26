class Oystercard

  attr_reader :balance, :in_journey

  DEFAULT_BALANCE = 0.0
  MAXIMUM_BALANCE = 90.0
  MINIMUM_BALANCE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    raise "Over maximum balance" if exceed_maximum?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Balance too low' unless minimum_balance?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def exceed_maximum?(amount)
    (@balance + amount) > 90
  end

  def minimum_balance?
    @balance >= MINIMUM_BALANCE
  end


end
