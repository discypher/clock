require 'time'

class Clock
  def initialize(time)
    clock = Time.parse(time)
    @hour = clock.hour > 12 ? clock.hour - 12 : clock.hour
    @min = clock.min
  end

  # Each hour is 30 degrees, + 0.5 degrees per minute
  # Each minute is 6 degrees
  def to_degrees
    degrees = (((@hour * 30) + (@min * 0.5)) - (@min * 6)).abs.to_i
    degrees > 180 ? (360 - degrees) : degrees
  end
end
