require 'van.rb'

describe Van do

  let(:bike) { double :bike, working: true }
  let(:broken_bike) { double :bike, working: false }
  let(:station) { double :docking_station, working_bikes: [bike], broken_bikes: [broken_bike] }

  describe '#collect' do
    it 'collects broken bikes from DockingStation' do
      subject.collect(station, broken_bike)
      expect(subject.loaded_broken_bikes).to include(broken_bike)
    end
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
    end
  end
end
