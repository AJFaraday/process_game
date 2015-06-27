module Components
  module Health

    attr_accessor(:health)

    def init_health(max)
      @max_health = max
      @health = @max_health
    end

    def damage(amount)
      @health -= amount
    end

    def dead?
      @health <= 0
    end

    def draw_health
      if dead?
        puts "you're dead!"
      else
        puts "#{@health}/#{@max_health}"
        width = (@health.to_f / @max_health.to_f) * @size
        Gosu.draw_rect(
          (@x -(@size / 2)),
          ((@y -(@size / 2)) - 10),
          width,
          10,
          Gosu::Color::BLUE,
          2
        )
      end
    end

  end
end