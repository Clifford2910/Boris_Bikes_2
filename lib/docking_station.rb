require_relative 'bike'

class DockingStation

  attr_accessor :capacity
  attr_reader :docked_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @docked_bikes = []
    @broken_bikes = []
  end

  def release_bike
    fail 'Docking station empty' if empty?
    @docked_bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    if bike.working == false
      @broken_bikes << bike
    else
      @docked_bikes << bike
    end
  end

  private

  def empty?
    @docked_bikes.empty?
  end

  def full?
    @docked_bikes.length + @broken_bikes.length >= @capacity
  end

end
