class Spin
  attr_reader :x, :y

  def initialize(animation)
    @animation = animation
    @x = rand * 640
    @y = rand * 480
  end

  def draw
    index = Gosu::milliseconds / 10 % @animation.size
    img = @animation[index]
    img.draw(
      @x - img.width / 2.0,
      @y - img.height / 2.0,
      0
    )
  end

end