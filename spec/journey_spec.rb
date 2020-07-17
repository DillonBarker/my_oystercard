require 'journey.rb'
require 'journey_log'
require 'station.rb'

describe Journey do

let(:entry_station) { double(:entry_station) }
let(:exit_station) { double(:exit_station) }
let(:subject) {described_class.new(entry_station) }

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

  describe '#journey_complete?' do
    it 'is the journey complete, returns false' do
      journey = Journey.new(entry_station)
      expect(journey.journey_complete?).to be false
    end

    it 'is the journey complete, returns true' do
      journey = Journey.new(entry_station)
      journey.end_journey(exit_station)
      expect(journey.journey_complete?).to be true
    end
  end

  describe '#fare' do
    it 'returns penalty fare of 6, if no entry or exit' do
      journey = Journey.new(entry_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end


    it 'calculates fare of travel between zone 1 and zone 1' do
      update_zones(1,1)
      subject.end_journey(exit_station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

    it 'calculates fare of travel between zone 1 and zone 1' do
      update_zones(1,2)
      subject.end_journey(exit_station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE + 1
    end

    it 'calculates fare of travel between zone 1 and zone 1' do
      update_zones(1,3)
      subject.end_journey(exit_station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE + 2
    end

    it 'calculates fare of travel between zone 1 and zone 1' do
      update_zones(2,5)
      subject.end_journey(exit_station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE + 3
    end


    def update_zones(entry_zone, exit_zone)
      allow(entry_station).to receive(:zone).and_return(entry_zone)
      allow(exit_station).to receive(:zone).and_return(exit_zone)
    end
  end
end
