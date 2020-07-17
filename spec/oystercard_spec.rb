require 'oystercard'

describe OysterCard do

  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station) }
  let(:top_up) { subject.top_up(OysterCard::CARD_LIMIT)}

  describe '#initialize' do
    it 'is initialized with a balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up(amount)' do
    it 'top up card with amount' do
      expect{ top_up }.to change { subject.balance }.by(OysterCard::CARD_LIMIT)
    end

    it 'prevents top up if limit exceeded' do
      top_up
      expect { subject.top_up(1) }.to raise_error("card limit: #{OysterCard::CARD_LIMIT} reached")
    end
  end

  describe '#touch_in' do

    it 'throws error if card with insufficient balance is touched in' do
      expect { subject.touch_in(entry_station) }.to raise_error("Insufficient balance")
    end

    it 'touch in touch in, penalty fare' do
      top_up
      subject.touch_in(entry_station)
      expect { subject.touch_in(entry_station) }.to change{ subject.balance }.by(-Journey::PENALTY_FARE)

    end
  end

  describe '#touch_out' do

    it 'touch out without touching in' do
      top_up
      expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Journey::PENALTY_FARE)
    end

    it 'touch out touch out' do
      top_up
      subject.touch_out(exit_station)
      expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Journey::PENALTY_FARE)
    end
  end

  describe '#in_journey?' do
    it 'marks a card as in journey' do
      top_up
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to be true
    end

    it 'marks a card as not in journey' do
      expect(subject.in_journey?).to be false
    end
  end



end
