class Building

  include CommonComponents::Health
  include CommonComponents::Faction
  include CommonComponents::Avatar

  IMAGE_DIRECTORY = File.join(File.dirname(__FILE__), "..", 'images', 'buildings')

  attr_accessor :game, :x, :y, :half_size

  def self.tile_size
    120
  end

  def initialize(x, y, game, options={})
    @size = self.class.tile_size
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
    init_health(options[:max_health])
    class_init(options) if respond_to?(:class_init)
  end

  def draw
    draw_avatar
    draw_health
  end

  def update
    class_update if self.respond_to?(:class_update)
  end

end