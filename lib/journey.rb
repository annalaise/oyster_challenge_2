
class Journey

attr_reader :history

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @history  = []
    @entry_station = nil
    @exit_station = nil
  end

  def entry_station(station)
    @entry_station = station
  end

  def exit_station(station)
    @exit_station = station
    save_journey
  end

  def save_journey
    @history << {@entry_station => @exit_station}
  end

  def incomplete?
    true if @entry_station != nil
    save_journey
  end

  def complete?
    true if @entry_station && @exit_station != nil
  end

  def reset_journey
    entry_station(nil)
    exit_station(nil)
  end

  def calc_fare
    if complete? == true
      return MINIMUM_FARE
    else
      return PENALTY_FARE
    end
  end


end
