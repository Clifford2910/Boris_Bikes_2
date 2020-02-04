require 'bike.rb'

describe Bike do
  it { is_expected.to respond_to :working? }

  describe '#working?' do
    it 'checks bike works' do
      bike = Bike.new
      expect(bike).to be_working
    end
  end

end
