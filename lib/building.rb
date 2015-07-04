class Building

  include CommonComponents::Health
  include CommonComponents::Faction
  include CommonComponents::Avatar

  IMAGE_DIRECTORY = File.join(File.dirname(__FILE__), "..", 'images', 'buildings')

  TILE_SIZE = 120

  attr_accessor :game, :x, :y, :half_size

  def initialize(x, y, game, options={})
    @size = TILE_SIZE
    @half_size = @size / 2
    @game = game
    @x = x
    @y = y
    @faction = options[:faction]
    @bar_size = 10
    @layer = LAYERS[:building]
    @game.drawable_objects << self
    @game.updatable_objects << self
    @game.units << self
    init_avatar(options)
    init_health(1000)
  end

  def draw
    draw_avatar
    draw_health
  end

  def update
    class_update if self.respond_to?(:class_update)
  end

end