module Components
  module Movement

    def init_movement
      @x = @y = @vel_x = @vel_y = @angle = 0.0
      @speed = 10
      @step = @speed / 5.0
    end

    def read_keys
      if Gosu::button_down? Gosu::KbLeft
        go_left
      end
      if Gosu::button_down? Gosu::KbRight
        go_right
      end
      if Gosu::button_down? Gosu::KbUp
        go_up
      end
      if Gosu::button_down? Gosu::KbDown
        go_down
      end
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

    def loop_position
      if @x > X_SIZE + @size
        @x = 0 - @size
        puts 'right edge'
      end
      if @x < 0 - @size
        puts 'left edge'
        @x = X_SIZE + @size
      end
      if @y > Y_SIZE + @size
        puts 'bottom edge'
        @y = 0 - @size
      end
      if @y < 0 - @size
        puts 'top edge'
        @y = Y_SIZE + @size
      end
    end

  end
end