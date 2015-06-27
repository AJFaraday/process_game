module Components
  module Health

    attr_accessor(:health)

    def init_health(max)
      @max_health = max
      @health = (@max_health)
      @bar_width = 5
    end

    def damage(amount)
      @health -= amount
      if dead?
        @game.units.delete(self)
        @game.drawable_objects.delete(self)
        @game.updatable_objects.delete(self)
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
          ((@y -(@size / 2)) - @bar_width),
          width,
          @bar_width,
          Gosu::Color::BLUE,
          2
        )
      end
    end

  end
end