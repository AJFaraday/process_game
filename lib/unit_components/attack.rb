module UnitComponents
  module Attack


    attr_accessor :attack_damage

    def init_attack(range, damage, animation = :spin)
      @range = range
      @attack_damage = damage

      @animations ||= {}
      @animations[:attack] = @game.animations[animation]
      @attack_length = @animations[:attack].length * 10
    end

    def attack(unit)
      if unit.is_a?(Unit) or unit.is_a?(Building)
        if in_range_of?(unit)
          use_ability(5) do
            unit.damage(@attack_damage)
            @attack_start = Gosu::milliseconds
          end
        end
      end
    end

    attr_accessor :attack_length

    def draw_attack
      if @attack_start and (@attack_start + @attack_length) > Gosu::milliseconds
        time_since_start = Gosu::milliseconds - @attack_start

        animation = @animations[:attack]
        img = animation[(time_since_start / 10)]
        if img
          img.draw(
            @x - @half_size,
            @y - @half_size,
            0.5
          )
        end
      end
    end

  end
end