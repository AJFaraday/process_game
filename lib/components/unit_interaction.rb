module Components
  module UnitInteraction

    def closest_target
      #candidates = @game.units.select{|target| target.object_id != self.object_id}
      candidates = targets
      if candidates.any?
        candidates.sort!{|a,b| distance_to(a) <=> distance_to(b)}
        candidates[0]
      else
        return nil
      end
    end

    def distance_to(unit)
      if unit.respond_to?(:x) and unit.respond_to?(:y)
        Gosu.distance(x, y, unit.x, unit.y)
      else
        9999999999999999999999
      end
    end

  end
end