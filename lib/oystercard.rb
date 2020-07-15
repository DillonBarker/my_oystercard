class OysterCard
  attr_reader :balance, :journey_history, :current_journey

  CARD_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    raise "card limit: #{CARD_LIMIT} reached" if amount + @balance > CARD_LIMIT

    @balance += amount
    "topped up #{amount}"
  end

  def touch_in(entry_station)
    raise "Insufficient balance" if @balance < MINIMUM_AMOUNT

    @current_journey = Journey.new(entry_station)
    "Touch-in successful"
  end

  def touch_out(exit_station)
    deduct(MINIMUM_AMOUNT)
    @current_journey.end_journey(exit_station)
    save_history
    "Touch-out successful"
  end

  def save_history
    @journey_history << @current_journey
    @current_journey = nil
  end

  def in_journey?
    @current_journey != nil ? true : false
  end

  private
  def deduct(amount)
    @balance -= amount
    "#{amount} deducted"
  end
end
