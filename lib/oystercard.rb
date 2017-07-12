class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

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

  def touch_out(fare = MIN_FARE, station)
    deduct(fare)
    @journey.exit_station(station)
  end


  private
  def deduct(amount)
    @balance -= amount
  end

end
