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
      distance_to(target) < (((@half_size + target.half_size) / 2))
    end

    def on_top_of?(target)
      distance_to(target) <= 5
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


    def angle_to(unit)
      Gosu.angle(@x, @y, unit.x, unit.y)
    end

    def facing_right_of?(unit)
      if @angle
        Gosu.angle_diff(@angle, angle_to(unit)) < 0
      else
        false
      end
    end

    def facing_left_of?(unit)
      if @angle
        Gosu.angle_diff(@angle, angle_to(unit)) > 0
      else
        false
      end
    end

  end
end