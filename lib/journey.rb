require_relative 'station'

class Journey
  attr_accessor :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def journey_complete?
    !!@entry_station && !!@exit_station
  end

  def fare
    journey_complete? ? (MINIMUM_FARE + (@exit_station.zone - @entry_station.zone)) : PENALTY_FARE
  end
end
