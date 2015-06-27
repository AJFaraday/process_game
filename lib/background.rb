class Background

  attr_accessor :image

  def initialize
    self.image = Gosu::Image.new(
      File.join(File.dirname(__FILE__), "..", 'images','background.png'),
      :tileable => true
    )
  end

  def draw
    image.draw(0, 0, -1)
  end

end