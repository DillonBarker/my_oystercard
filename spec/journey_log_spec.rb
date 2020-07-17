require 'journey_log'
describe JourneyLog do

  let(:journey) { double :journey }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey_class) {double :journey_class, new: journey} # this lets the journey class double accept the method new and therefore create journey
  subject {described_class.new(journey_class: journey_class)} # this assigns the behaviour we have used above to subject. rather than assuming the behaviour


  describe '#start' do

    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(entry_station)
      subject.start(entry_station)
    end

  end

  describe '#finish' do
    it "adds exit_station to the journey" do
      expect(journey).to receive(:exit_station=).with(exit_station)
      subject.finish(exit_station)
    end

    it "pushes the journey to the journeys array" do
      allow(journey).to receive(:exit_station=)
      subject.finish(exit_station)
      expect(subject.journeys).to include journey
    end
  end

  describe '#journeys' do
    it 'returns uneditable array of journeys' do
      allow(journey).to receive(:exit_station=).with(exit_station)
      subject.start(entry_station)
      subject.finish(exit_station)
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journeys).to eq([journey, journey])
    end

    it 'does not allow external changes' do
      allow(journey).to receive(:exit_station=).with(exit_station)
      subject.start(entry_station)
      subject.finish(exit_station)
      subject.journeys.pop
      expect(subject.journeys.count).to eq 1
    end
  end
end
