require_relative 'bike'

class DockingStation

  attr_accessor :capacity
  attr_reader :docked_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @docked_bikes = []
  end

  def release_bike
    fail 'Docking station empty' if empty?
    @docked_bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @docked_bikes << bike
  end

  private

  def empty?
    @docked_bikes.empty?
  end

  def full?
    @docked_bikes.length >= @capacity
  end

end
