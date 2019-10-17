require 'docking_station.rb'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error("no bikes available")
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

  end

  it 'checks bike works' do
    bike = Bike.new
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks a bike' do
    bike1 = Bike.new
    subject.dock(bike1)
    expect(subject.dock(bike1)).to eq bike1
  end

  it { is_expected.to respond_to :show_docked_bikes }

  it 'shows docked bikes' do
    bike2 = Bike.new
    subject.dock(bike2)
    expect(subject.show_docked_bikes).to eq bike2
  end

end
