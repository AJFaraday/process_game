module Components
  module Attack

    attr_accessor :attack_damage

    def init_attack(range, damage)
      @range = range
      @attack_damage = damage
    end

    def attack(unit)
      if unit.is_a?(Unit)
        if distance_to(unit) <= adjusted_range
          unit.damage(@attack_damage)
        end
      end
    end

    def adjusted_range
      @range + @size
    end

  end
end