require 'oystercard'
describe OysterCard do
  describe '#initialize' do
    it 'is initialized with a balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up(amount)' do
    it 'top up card with amount' do
      expect(subject.top_up(50)).to eq("topped up 50")
    end

    it 'prevents top up if limit exceeded' do
      expect { subject.top_up(100)}.to raise_error("card limit: #{OysterCard::CARD_LIMIT} reached")
    end
  end

  describe '#deduct(amount)' do
    it 'deducts an amount from the card balance' do
      subject.top_up(OysterCard::CARD_LIMIT)
      expect(subject.deduct(20)).to eq("20 deducted")
    end
  end

end
