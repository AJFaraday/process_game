module UnitComponents
  module AbilityPoints

    attr_accessor :ability_points

    def init_ability_points(max, ability_point_recovery_chance=1)
      @max_ability_points = max
      @ability_points = (@max_ability_points)
      # out of 100
      @ability_point_recovery_chance = ability_point_recovery_chance
      @ability_bar_colour = Gosu::Color.rgba(225, 0, 0, 127)
    end

    def use_ability(amount, &block)
      if ability_points >= amount
        @ability_points -= amount
        yield
      end
    end

    def draw_ability_points
      if ability_points > 0
        width = (@ability_points.to_f / @max_ability_points.to_f) * @size
        Gosu.draw_rect(
          @x -(@size / 2),
          (@y -(@size / 2) - @bar_size),
          width,
          @bar_size,
          @ability_bar_colour,
          LAYERS[:bars]
        )
      end
    end

    def recover_ability_points
      if rand(100) < @ability_point_recovery_chance and
        @ability_points < @max_ability_points
        @ability_points += 1
      end
    end

  end
end