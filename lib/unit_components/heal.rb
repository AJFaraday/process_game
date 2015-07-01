module UnitComponents
  module Heal

    def init_healing(options={})
      @heal_range = options[:heal_range] || 50
      @heal_power = options[:heal_power] || 20
      @heal_cost = options[:heal_cost] || 20
    end

    def can_heal?
      ability_points >= @heal_cost
    end

    def heal(unit)
      if unit.is_a?(Unit)
        if in_healing_range_of?(unit)
          use_ability(@heal_cost) do
            unit.heal(@heal_power)
          end
        end
      end
    end

  end
end