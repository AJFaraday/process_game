module Components
  module Movement

    attr_accessor :x, :y, :speed

    def init_movement
      @x = @y = @vel_x = @vel_y = @angle = 0.0
      @speed = 10
      @step = @speed / 5.0
      @half_size = @size / 2
    end

    def jump(x, y)
      @x, @y = x, y
    end

    def centre
      self.jump(
        X_SIZE / 2,
        Y_SIZE / 2
      )
    end


    def loop_position
      if at_right_edge?
        @x = 0 - @half_size
      end
      if at_left_edge?
        @x = X_SIZE + @half_size
      end
      if at_bottom_edge?
        @y = 0 - @half_size
      end
      if at_top_edge?
        @y = Y_SIZE + @half_size
      end
    end

    def go_up
      @y = @y - @step
    end

    def go_down
      @y = @y + @step
    end

    def go_right
      @x = @x + @step
    end

    def go_left
      @x = @x - @step
    end

    def at_top_edge?
      @y < 0 - @half_size
    end

    def at_bottom_edge?
      @y > Y_SIZE + @half_size
    end

    def at_left_edge?
      @x < 0 - @half_size
    end

    def at_right_edge?
      @x > X_SIZE + @half_size
    end


  end
end