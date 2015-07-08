module UnitComponents
  module BirdMovement

    attr_accessor :angle

    def init_angle
      @angle = 0
    end

    def turn_right
      @angle += @turn_speed
    end

    def turn_left
      @angle -= @turn_speed
    end

    def go_forward
      @x += Gosu::offset_x(@angle, @speed)
      @y += Gosu::offset_y(@angle, @speed)
    end

  end
end