module CommonComponents
  module RelativePositions

    def closest_target
      candidates = targets
      if candidates.any?
        candidates.sort! { |a, b| distance_to(a) <=> distance_to(b) }
        candidates[0]
      else
        return nil
      end
    end

    def touching?(target)
      distance_to(target) < @size
    end

    def in_range_of?(target)
      if target
        distance_to(target) < (target.half_size + @attack_range)
      else
        false
      end
    end

    def in_healing_range_of?(target)
      if target
        distance_to(target) < (target.half_size + @heal_range)
      else
        false
      end
    end

    def distance_to(unit)
      if unit.respond_to?(:x) and unit.respond_to?(:y)
        Gosu.distance(x, y, unit.x, unit.y) - @half_size
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

    def outside_map?
      @x < 0 or @y < 0 or @x > X_SIZE or @y > Y_SIZE
    end

  end
end