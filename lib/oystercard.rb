require_relative 'journey'

class OysterCard
  attr_reader :balance, :journey_log

  CARD_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize(journey_log = JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(amount)
    raise "card limit: #{CARD_LIMIT} reached" if amount + @balance > CARD_LIMIT

    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient balance" if @balance < MINIMUM_AMOUNT

    deduct(@journey_log.current_journey.fare) if in_journey?
    @journey_log.start(entry_station)
  end

  def touch_out(exit_station)
    @journey_log.finish(exit_station)
    deduct(@journey_log.journeys.last.fare)
  end


  def in_journey?
    !!@journey_log.current_journey
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
