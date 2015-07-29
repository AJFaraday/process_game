# A lake is an impassible rectangle

class Lake

  attr_accessor :x, :y, :x_size, :y_size

  def initialize(x,y,x_size, y_size)
    @x, @y, @x_size, @y_size = x, y, x_size, y_size
  end

  def draw
    Gosu.draw_rect(
      x, y, x_size, y_size,
      Gosu::Color::BLUE,
      LAYERS[:under_unit]
    )
  end

end