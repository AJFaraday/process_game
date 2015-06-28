module UnitComponents
  module RelativePositions

    def closest_target
      candidates = targets
      if candidates.any?
        candidates.sort!{|a,b| distance_to(a) <=> distance_to(b)}
        candidates[0]
      else
        return nil
      end
    end

    def touching?(target)
      distance_to(target) < @size
    end

    def in_range_of?(target)
      distance_to(target) < @size + @range
    end


    def distance_to(unit)
      if unit.respond_to?(:x) and unit.respond_to?(:y)
        Gosu.distance(x, y, unit.x, unit.y)
      else
        9999999999999999999999
      end
    end

    def right_of?(unit)
      unit.respond_to?(:x) and x > unit.x
    end

    def left_of?(unit)
      unit.respond_to?(:x) and x < unit.x
    end

    def higher_than?(unit)
      unit.respond_to?(:y) and y < unit.y
    end

    def lower_than?(unit)
      unit.respond_to?(:y) and y > unit.y
    end

  end
end