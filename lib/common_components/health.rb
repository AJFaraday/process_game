module CommonComponents
  module Health

    attr_accessor(:health, :max_health)

    def init_health(max)
      @max_health = max
      @health = @max_health
    end

    def damage(amount)
      puts caller unless amount
      @health -= amount
      if dead?
        @game.units.delete(self)
        @game.drawable_objects.delete(self)
        @game.updatable_objects.delete(self)
        @faction.units.delete(self) if @faction
      end
    end

    def heal(amount)
      unless dead?
        target = @health + amount
        target = @max_health if target > @max_health
        @health = target
      end
    end

    def dead?
      @health <= 0
    end

    def alive?
      @health > 0
    end

    def draw_health
      if dead?
        puts "you're dead!"
      else
        width = (@health.to_f / @max_health.to_f) * @size
        Gosu.draw_rect(
          (@x -(@size / 2)),
          ((@y -(@size / 2)) - (@bar_size * 2)),
          width,
          @bar_size,
          Gosu::Color::BLUE,
          LAYERS[:bars]
        )
      end
    end

  end
end