require_relative 'bike'

class DockingStation

  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    fail 'no bikes available' if @docked_bikes.empty?
    @docked_bikes.pop
  end

  def dock(bike)
    fail 'too many bikes docked' if @docked_bikes.length >= 20
    @docked_bikes << bike
  end

end
