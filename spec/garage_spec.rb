require 'garage.rb'

describe Garage do

  let(:bike) { Bike.new }
  let(:bike2) { Bike.new }
  let(:broken_bike) { double :bike, working: false }
  let(:broken_bike2) { double :bike, working: false }
  let(:van) { double :van, loaded_working_bikes: [bike], loaded_broken_bikes: [broken_bike, broken_bike2] }
  let(:empty_van) { double :van, loaded_working_bikes: [], loaded_broken_bikes: [] }

  describe '#take' do
    it 'raises an error when the van is empty' do
      expect { subject.take(empty_van, broken_bike) }.to raise_error 'Van empty - no broken bikes'
    end

    it 'raises an error when the garage is full' do
      subject.capacity = 1
      subject.take(van, broken_bike)
      expect { subject.take(van, broken_bike2) }.to raise_error 'Garage is full'
    end

    it 'cannot collect working bikes from the van' do
      expect { subject.take(van, bike) }.to raise_error 'Can only collect broken bikes'
    end

    it 'takes broken bikes from the van' do
      subject.take(van, broken_bike)
      expect(subject.bikes_to_be_fixed).to include(broken_bike)
    end
  end

  describe '#fix' do
    it 'garage should fix a broken bike' do
      bike.report_broken
      subject.take(van, bike)
      subject.fix(bike)
      expect(bike.working).to eq true
    end

    it 'should put the appropriate bikes in the apporpriate arrays' do
      bike.report_broken
      subject.take(van, bike)
      expect(subject.bikes_to_be_fixed).to include(bike)
      subject.fix(bike)
      expect(subject.fixed_bikes).to include(bike)
    end
  end

  describe '#give' do
    it 'raises an error when the garage is empty' do
      bike.report_broken
      subject.take(van, bike)
      subject.fix(bike)
      subject.give(van, bike)
      expect { subject.give(van, bike2) }.to raise_error 'garage empty - no fixed bikes'
    end

    it 'cannot give broken bikes to the van' do
      bike.report_broken
      subject.take(van, bike)
      expect { subject.give(van, bike) }.to raise_error 'Can only give working bikes'
    end

    it 'garage should give fixed bikes to the van' do
      bike.report_broken
      subject.take(van, bike)
      subject.fix(bike)
      subject.give(empty_van, bike)
      expect(empty_van.loaded_working_bikes).to include(bike)
    end
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Garage::DEFAULT_CAPACITY
    end
  end

end
