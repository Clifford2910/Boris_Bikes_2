require_relative 'van'

class Garage

  attr_accessor :capacity
  attr_reader :fixed_bikes
  attr_reader :bikes_to_be_fixed

  DEFAULT_CAPACITY = 100

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @fixed_bikes = []
    @bikes_to_be_fixed = []
  end

  def take(van, bike)
    fail 'Can only collect broken bikes' if bike.working == true
    fail 'Van empty - no broken bikes' if van.loaded_broken_bikes.empty?
    fail 'Garage is full' if garage_full?
    @bikes_to_be_fixed.push(bike)
    van.loaded_broken_bikes.delete(bike)
  end

  def fix(bike)
    bike.fix
    @fixed_bikes.push(bike)
    @bikes_to_be_fixed.delete(bike)
  end

  def give(van, bike)
    fail 'Can only give working bikes' if bike.working == false
    fail 'garage empty - no fixed bikes' if garage_empty?
    van.loaded_working_bikes.push(bike)
    @fixed_bikes.delete(bike)
  end

  private

  def garage_full?
    @fixed_bikes.length + @bikes_to_be_fixed.length >= @capacity
  end

  def garage_empty?
    @fixed_bikes.empty?
  end

end
