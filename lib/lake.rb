# A lake is an impassible rectangle

class Lake


  def initialize(x, y, x_size, y_size)
    @x, @y, @x_size, @y_size = x, y, x_size, y_size
    @max_x = @x + @x_size
    @max_y = @y + @y_size
  end

  def draw
    Gosu.draw_rect(
      @x, @y, @x_size, @y_size,
      Gosu::Color::BLUE,
      LAYERS[:under_unit]
    )
  end

  def includes_coord?(x, y, half_size = 0)
    (
      ((x - half_size) > @x and (x - half_size) < @max_x) or
      ((x + half_size) > @x and (x + half_size) < @max_x)
    ) and (
      ((y - half_size) > @y and (y - half_size) < @max_y) or
      ((y + half_size) > @y and (y + half_size) < @max_y)
    )
  end

end