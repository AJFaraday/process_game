module CommonComponents
  module Faction

    attr_accessor(:faction)

    def friends
      units = @faction.units.clone
      units.delete(self)
      units
    end

    def closest_friend
      closest_unit(friends)
    end

    def closest_hurt_friend
      heal_targets = friends.clone
      heal_targets.reject!{|unit| unit.health >= unit.max_health }
      closest_unit(heal_targets)
    end

    def enemies
      @game.units.clone - @faction.units
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