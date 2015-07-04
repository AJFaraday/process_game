class Resource

  IMAGE_DIRECTORY = File.join(File.dirname(__FILE__), "..", 'images', 'resources')
  TILE_SIZE = 30

  include CommonComponents::Avatar

  attr_accessor :amount

  def initialize(name)
    @name = name
    init_avatar(:avatar => name)
    @amount = 0
    @font = Gosu::Font.new(TILE_SIZE)
  end

  def draw(x,y)
    @avatar.draw(
      x,
      y,
      LAYERS[:ui],
      0.5,
      0.5
    )
    @font.draw(
      @amount,
      x + TILE_SIZE,
      y,
      LAYERS[:ui]
    )
  end


end