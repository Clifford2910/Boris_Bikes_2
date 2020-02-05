require 'bike.rb'
require 'docking_station.rb'

describe Bike do
  describe '#report_broken' do
    it 'reports a broken bike' do
      bike = Bike.new
      bike.report_broken
      expect(bike.working).to eq false
    end
  end

end
