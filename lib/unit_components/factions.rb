module UnitComponents
  module Faction

    attr_accessor(:faction)

    def friends
      units = @faction.units
      units.delete(self)
      units
    end

    def enemies
      @game.units - @faction.units
    end

    def friend_of?(unit)
      self.friends.include?(unit)
    end

    def enemy_of?(unit)
      self.enemies.include?(unit)
    end

  end
end