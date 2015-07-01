module UnitComponents
  module Shoot

    def shoot(unit)
      if unit.is_a?(Unit) or unit.is_a?(Building)
        if in_range_of?(unit)
          use_ability(@attack_cost) do
            @game.add_projectile(
              @projectile,
              self,
              unit,
              @attack_damage
            )
          end
        end
      end
    end

  end
end