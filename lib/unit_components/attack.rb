module UnitComponents
  module Attack


    attr_accessor :attack_damage

    def init_attack(range, damage, attack_cost)
      @attack_range = range
      @attack_damage = damage
      @attack_cost = attack_cost
    end

    def attack(unit)
      if unit.is_a?(Unit) or unit.is_a?(Building)
        if in_range_of?(unit)
          use_ability(@attack_cost) do
            unit.damage(@attack_damage)
            run_animation(:attack)
            run_animation(:damage, unit) if unit.is_a?(Unit)
          end
        end
      end
    end

    def can_attack?
      ability_points >= @attack_cost
    end

  end
end