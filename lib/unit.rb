class Unit

  include Components::Movement
  include Components::Health

  def initialize(game)
    @game = game
    @image = Gosu::Image.new(
      File.join(File.dirname(__FILE__), "..", 'images', 'peasant.png')
    )
    @score = 0
    @size = TILE_SIZE

    init_movement
    init_health(100)
    centre
  end

  def draw
    unless dead?
      draw_avatar
      draw_health
    end
  end

  def draw_avatar
    @image.draw(
      (@x -(@size / 2)),
      (@y -(@size / 2)),
      1
    )
  end

  def update
    read_keys
  end

end