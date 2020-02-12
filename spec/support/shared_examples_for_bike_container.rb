shared_examples_for BikeContainer do

  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  describe 'capacity' do
    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new(random_capacity)
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'add_bike' do
    let(:bike) { Bike.new }

    it 'adds a bike' do
      expect(subject.add_bike(bike)).to include(bike)
    end

    it 'adds the bike to the collection' do
      subject.add_bike(bike)
      expect(subject).to_not be_empty
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.add_bike(double :bike) }
      expect { subject.add_bike(double :bike) }.to raise_error "#{described_class.name} full"
    end
  end

  describe 'remove_bike' do
    let(:bike) { Bike.new }
    before(:each) { subject.add_bike(bike) }

    it 'removes a bike' do
      expect(subject.remove_bike).to eq(bike)
    end

    it 'removes the bike from the collection' do
      subject.remove_bike
      expect(subject).to be_empty
    end

    it 'raises an error when empty' do
      subject.remove_bike
      expect { subject.remove_bike }.to raise_error "#{described_class.name} empty"
    end
  end
end
