require 'journey.rb'

describe Journey do

let(:entry_station) { double(:entry_station) }
let(:exit_station) { double(:exit_station) }

  describe '#initialize' do
    it 'stores entry station' do
      journey = Journey.new(entry_station)
      expect(journey.entry_station).to eq entry_station
    end

  describe '#end_journey'
    it 'stores exit station' do
      journey = Journey.new(entry_station)
      journey.end_journey(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
  end
end
