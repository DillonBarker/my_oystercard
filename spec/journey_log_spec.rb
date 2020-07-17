require 'journey_log'
describe JourneyLog do

  let(:journey){ double :journey }
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
      expect(subject.journeys).to include journey
    end
  end

  describe '#finish' do
    it "adds exit_station to the journey" do
      allow(journey).to receive(:exit_station=)
      subject.finish(entry_station)
    end

    it "pushes the journey to the journeys array" do
      allow(journey).to receive(:exit_station=).with(entry_station)
      subject.this_journey = journey
      subject.finish(exit_station)
      expect(subject.journeys).to include journey
    end

  end
end
