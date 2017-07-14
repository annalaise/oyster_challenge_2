require './journey.rb'

class JourneyLog

  def initialize(journey = Journey.new)
  @journey = journey
  end

  def start(station)
    journey.entry_station(station)
  end

  def finish

  end

  def journeys

  end


  private

  def current_journey

  end



end
