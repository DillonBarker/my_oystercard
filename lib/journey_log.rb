require 'journey'

class JourneyLog
  attr_reader :this_journey, :journey_class

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []

  end

  def start(entry_station)
    @this_journey = journey_class.new(entry_station)
  end

  def finish(exit_station)
    this_journey.exit_station = exit_station
    @journeys << @this_journey
    @this_journey = nil
  end

  def journeys
    @journeys.dup
  end

private
  def this_journey
    @this_journey ||= journey_class.new
  end

end
