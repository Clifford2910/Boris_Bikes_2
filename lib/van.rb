require_relative 'docking_station'

class Van

  attr_accessor :capacity
  attr_reader :loaded_working_bikes
  attr_reader :loaded_broken_bikes

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @loaded_working_bikes = []
    @loaded_broken_bikes = []
  end

  def collect(station, broken_bike)
    fail 'Docking station empty - no broken bikes' if station.broken_bikes.empty?
    fail 'Van is full' if van_full?
    @loaded_broken_bikes.push(broken_bike)
    station.broken_bikes.delete(broken_bike)
  end

  private

  def van_full?
    @loaded_working_bikes.length + @loaded_broken_bikes.length >= @capacity
  end

end
