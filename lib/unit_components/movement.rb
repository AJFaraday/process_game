module UnitComponents
  module Movement

    attr_accessor :x, :y, :speed, :half_size

    def init_movement(speed)
      self.speed=(speed)
    end

    def speed=(value)
      @speed = value
      @step = @speed.to_i / 5.0
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
      if !@moved_y
        if can_go_up?
          @y = @y - @step
          @moved_y = true
        else
          go_right
        end
      end
    end

    def go_down
      if !@moved_y
        if can_go_down?
          @y = @y + @step
          @moved_y = true
        else
          go_left
        end
      end
    end

    def go_right
      if !@moved_x
        if can_go_right?
          @x = @x + @step
          @moved_x = true
        else
          go_up
        end
      end
    end

    def go_left
      if !@moved_x
        if can_go_left?
          @x = @x - @step
          @moved_x = true
        else
          go_down
        end
      end
    end

    # These methods check if a step in a given direction is passable or not.
    # Impassable:
    #
    # Lakes

    def coord_passable?(x, y)
      @game.lakes.any? { |l| !l.includes_coord?(x, y, @half_size) }
    end

    def can_go_right?
      target_x = @x + @step
      coord_passable?(target_x, @y)
    end

    def can_go_left?
      target_x = @x - @step
      coord_passable?(target_x, @y)
    end

    def can_go_up?
      target_y = @y - @step
      coord_passable?(@x, target_y)
    end

    def can_go_down?
      target_y = @y + @step
      coord_passable?(@x, target_y)
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