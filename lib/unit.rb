class Unit

  include Components::Movement
  include Components::Health
  include Components::RelativePositions
  include Components::Attack

  def initialize(game)
    @game = game
    @game.drawable_objects << self
    @game.updatable_objects << self
    @game.units << self
    @image = Gosu::Image.new(
      File.join(File.dirname(__FILE__), "..", 'images', 'peasant.png')
    )
    @score = 0
    @size = TILE_SIZE

    init_movement
    init_health(100)
    init_attack(5, 5)
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
    puts "called unit base class update"
    puts 'decisions should be made by child classes'
  end

  # Anything which is not me is a target

  def targets
    @game.units.select { |target| target != self }
  end

end