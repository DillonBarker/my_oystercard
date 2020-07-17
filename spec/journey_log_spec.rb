require 'journey_log'
describe JourneyLog do

  let(:journey){ double :journey, entry: entry_station , exit: exit_station }
  let(:entry_station){ double :entry_station }
  let(:exit_station){ double :exit_station }
  let(:journey_class){double :journey_class, new: journey}
  subject {described_class.new(journey_class: journey_class)}


  describe '#start' do
    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(entry_station: entry_station)
      subject.start(entry_station: entry_station)
    end

    it 'records a journey' do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(entry_station)
      expect(subject.this_journey).to eq journey
    end
  end

  describe '#finish' do
    it "adds exit_station to the journey" do
      allow(journey).to receive(:exit_station=)
      allow(journey).to receive(:exit_station).and_return(exit_station)
      subject.finish(exit_station)
      expect(subject.this_journey.exit_station).to eq exit_station
    end

    it "pushes the journey to the journeys array" do
      subject.start(entry_station)
      allow(journey).to receive(:exit_station=)
      subject.finish(exit_station)
      expect(subject.journeys).to include journey
    end
  end

  describe '#journeys' do
    it 'returns uneditable array of journeys' do
      subject.start(entry_station)
      allow(journey).to receive(:exit_station=)
      subject.finish(exit_station)
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journeys).to eq([journey, journey])
    end
  end

end
