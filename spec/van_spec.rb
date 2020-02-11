require 'van.rb'

describe Van do

  let(:bike) { double :bike, working: true }
  let(:broken_bike) { double :bike, working: false }
  let(:broken_bike2) { double :bike, working: false }
  let(:station) { double :docking_station, working_bikes: [bike], broken_bikes: [broken_bike] }
  let(:empty_station) { double :docking_station, working_bikes: [], broken_bikes: [] }
  let(:full_station) { double :docking_station, working_bikes: [bike], broken_bikes: [broken_bike, broken_bike2] }

  describe '#collect' do
    it 'raises an error when the DockingStation is empty' do
      subject.collect(station, broken_bike)
      expect { subject.collect(station, broken_bike2) }.to raise_error 'DockingStation empty - no broken bikes'
    end

    it 'raises an error when the van is full' do
      subject.capacity = 1
      subject.collect(full_station, broken_bike)
      expect { subject.collect(full_station, broken_bike2) }.to raise_error 'Van is full'
    end

    it 'cannot collect working bikes from DockingStation' do
      expect { subject.collect(station, bike) }.to raise_error 'Can only collect broken bikes from DockingStations'
    end

    it 'collects broken bikes from DockingStation' do
      subject.collect(station, broken_bike)
      expect(subject.loaded_broken_bikes).to include(broken_bike)
    end
  end

  describe '#distribute' do
    it 'raises an error when the van is empty' do
      expect { subject.distribute(station, bike) }.to raise_error 'Van is empty - no working bikes'
    end

    it 'cannot distribute broken bikes to DockingStations' do
      subject.collect(station, broken_bike)
      expect { subject.distribute(station, broken_bike) }.to raise_error 'Can only distribute working bikes to DockingStations'
    end

    # it 'distributes working bikes to DockingStation' do
    #   subject.collect(station, broken_bike)
    #   subject.distribute(empty_station, bike)
    #   expect(empty_station.working_bikes).to include(bike)
    # end
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
    end
  end
end
