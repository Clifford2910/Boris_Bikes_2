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

  def collect(station, bike)
    fail 'Can only collect broken bikes from DockingStations' if bike.working == true
    fail 'DockingStation empty - no broken bikes' if station.broken_bikes.empty?
    fail 'Van is full' if van_full?
    @loaded_broken_bikes.push(bike)
    station.broken_bikes.delete(bike)
  end

  def distribute(station, bike)
    fail 'Can only distribute working bikes to DockingStations' if bike.working == false
    fail 'Van is empty - no working bikes' if van_empty?
    station.working_bikes.push(bike)
    @loaded_working_bikes.delete(bike)
  end

  private

  def van_full?
    @loaded_working_bikes.length + @loaded_broken_bikes.length >= @capacity
  end

  def van_empty?
    @loaded_working_bikes.empty?
  end
end
