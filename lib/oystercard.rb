class OysterCard
  attr_reader :balance

  CARD_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "card limit: #{CARD_LIMIT} reached" if amount > CARD_LIMIT

    @balance += amount
    "topped up #{amount}"
  end
end
