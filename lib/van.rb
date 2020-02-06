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
    fail 'Docking station empty' if station.broken_bikes.empty?
    fail 'Van is full' if van_full?
    @loaded_broken_bikes.push(bike)
    station.broken_bikes.delete(bike)
  end

  private

  def van_empty?
    @loaded_fixed_bikes.length + @loaded_broken_bikes.length == 0
  end

  def van_full?
    @loaded_working_bikes.length + @loaded_broken_bikes.length >= @capacity
  end

end
