# THIS CLASS SHOULD BE RESPONSIBLE FOR:
#     - starting + finishing journey
#     - calculating fare
#     - returning whether or not journey is complete

class Journey
  attr_reader :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def journey_complete?
    @exit_station != nil ? true : false
  end

  def fare
    @exit_station == nil ? 6 : 1
  end

end
