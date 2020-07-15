class OysterCard
  attr_reader :balance, :entry_station, :journey_history

  CARD_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize
    @balance = 0
    @in_use = false
    @journey_history = []
  end

  def top_up(amount)
    raise "card limit: #{CARD_LIMIT} reached" if amount + @balance > CARD_LIMIT

    @balance += amount
    "topped up #{amount}"
  end

  def touch_in(entry_station)
    raise "Insufficient balance" if @balance < MINIMUM_AMOUNT

    @entry_station = entry_station
    "Touch-in successful"
  end

  def touch_out(exit_station)
    deduct(MINIMUM_AMOUNT)
    @exit_station = exit_station
    save_history
    @entry_station = nil
    "Touch-out successful"
  end

  def save_history
    @journey_history << { entry: @entry_station, exit: @exit_station }
  end

  def in_journey?
    @entry_station != nil ? true : false
  end

  private
  def deduct(amount)
    @balance -= amount
    "#{amount} deducted"
  end
end
