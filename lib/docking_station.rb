class DockingStation

  attr_reader :docked_bikes

  def release_bike
    raise "no bikes available" unless @docked_bikes
    @docked_bikes
  end

  def dock(bike)
    raise "too many bikes docked" if @docked_bikes
    @docked_bikes = bike
  end

  def show_docked_bikes
    @docked_bikes
  end
  
end
