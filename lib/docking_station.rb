require_relative 'bike'

class DockingStation

  attr_accessor :capacity
  attr_reader :working_bikes
  attr_reader :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @working_bikes = []
    @broken_bikes = []
  end

  def release_bike
    fail 'Docking station empty' if empty?
    @working_bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    if bike.working == false
      @broken_bikes.push(bike)
    else
      @working_bikes.push(bike)
    end
  end

  private

  def empty?
    @working_bikes.empty?
  end

  def full?
    @working_bikes.length + @broken_bikes.length >= @capacity
  end
end
