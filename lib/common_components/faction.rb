module CommonComponents
  module Faction

    attr_accessor(:faction)

    def friends
      if @faction
        units = @faction.units.clone
        units.delete(self)
        units
      else
        nil
      end
    end

    def closest_friend
      closest_unit(friends)
    end

    def closest_hurt_friend
      heal_targets = friends.clone
      heal_targets.reject! { |unit| unit.health >= unit.max_health }
      closest_unit(heal_targets)
    end

    def enemies
      if @faction
        @game.units.clone - @faction.units
      else
        units = @game.units.clone
        units.delete(self)
        units
      end
    end

    def closest_enemy
      closest_unit(enemies)
    end

    def closest_unit(units)
      units = units.clone
      if units.any?
        units.sort! { |a, b| distance_to(a) <=> distance_to(b) }
        units[0]
      else
        return nil
      end
    end

    def friend_of?(unit)
      self.friends.include?(unit)
    end

    def enemy_of?(unit)
      self.enemies.include?(unit)
    end

  end
end