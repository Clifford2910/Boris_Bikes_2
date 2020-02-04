require 'docking_station.rb'
require 'bike.rb'

describe DockingStation do

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'raises an error when there are no bikes available' do
      bike = Bike.new
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases working bikes' do
      bike = Bike.new
      expect(bike).to be_working
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'raises an error when there are too many bikes docked' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'too many bikes docked'
    end

    it 'docks a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.docked_bikes).to include(bike)
    end
  end

  describe '#show_docked_bikes' do
    it { is_expected.to respond_to :docked_bikes }

    it 'shows docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.docked_bikes).to include(bike)
    end
  end

end
