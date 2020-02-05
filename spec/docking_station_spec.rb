require 'docking_station.rb'
require 'bike.rb'

describe DockingStation do

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'Docking station empty'
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases working bikes' do
      bike = Bike.new
      expect(bike.working).to eq true
    end

    it 'cannot release broken bikes' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'Docking station empty'
    end
  end

  describe '#dock' do
    it 'raises an error when there are too many bikes docked' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station full'
    end

    it 'docks a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.docked_bikes).to include(bike)
    end
  end

  describe '#show_docked_bikes' do
    it 'shows docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.docked_bikes).to include(bike)
    end
  end

  describe '#capacity' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

end
