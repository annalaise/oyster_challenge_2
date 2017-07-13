class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1


  def initialize(journey)
    @balance = 0
    @journey = journey
  end

  def top_up(amount)
    fail "Top up limit is £#{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if balance < MIN_BALANCE
    @journey.entry_station(station)
  end

  def touch_out(station)
    @journey.exit_station(station)
  end

  def charge
    deduct(@journey.calc_fare)
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
