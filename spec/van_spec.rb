require 'van.rb'

describe Van do

  let(:bike) { double :bike, working: true }
  let(:broken_bike) { double :bike, working: false }
  let(:broken_bike2) { double :bike, working: false }
  let(:station) { double :docking_station, working_bikes: [], broken_bikes: [broken_bike] }
  let(:full_station) { double :docking_station, working_bikes: [], broken_bikes: [broken_bike, broken_bike2] }

  describe '#collect' do
    it 'raises an error when there are no bikes available' do
      subject.collect(station, broken_bike)
      expect { subject.collect(station, broken_bike2) }.to raise_error 'Docking station empty - no broken bikes'
    end

    it 'raises an error when there are too many bikes on the van' do
      subject.capacity = 1
      subject.collect(full_station, broken_bike)
      expect { subject.collect(full_station, broken_bike2) }.to raise_error 'Van is full'
    end

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
