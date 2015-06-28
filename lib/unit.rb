class Unit

  include UnitComponents::Movement
  include UnitComponents::Name
  include UnitComponents::RelativePositions
  include UnitComponents::Health
  include UnitComponents::AbilityPoints
  include UnitComponents::Attack
  include UnitComponents::Faction

  IMAGE_DIRECTORY = File.join(File.dirname(__FILE__), "..", 'images', 'units')

  def initialize(x, y, game, options={})
    @game = game
    @avatar = options[:avatar] || 'peasant'
    @colour = options[:colour] || 'green'
    @faction = options[:faction]
    @game.drawable_objects << self
    @game.updatable_objects << self
    @game.units << self
    @image = Gosu::Image.new(
      if File.exists?(full_avatar_path)
        full_avatar_path
      else
        basic_avatar_path
      end
    )
    jump(x, y)
    @bar_size = 5
    @size = TILE_SIZE

    init_movement(options[:speed] || 5)
    init_health(options[:max_health] || 100)
    init_ability_points(
      options[:max_abiltiy_points] || 50,
      options[:ability_point_recovery_chance] || 10
    )
    init_attack(
      options[:range] || 5,
      options[:damage] || 5
    )
    init_name(options[:name])
  end

  def basic_avatar_path
    File.join(IMAGE_DIRECTORY, @avatar, "#{@avatar}.png")
  end

  def full_avatar_path
    File.join(IMAGE_DIRECTORY, @avatar, "#{@avatar}-#{@colour}.png")
  end

  def draw
    unless dead?
      draw_avatar
      draw_health
      draw_ability_points
      draw_name
      draw_attack
      class_draw if self.respond_to?(:class_draw)
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
    recover_ability_points
    class_update if self.respond_to?(:class_update)
  end


  def targets
    if self.faction
      # anything which isn't in my faction is a target
      enemies
    else
      # Anything which is not me is a target
      @game.units.select { |target| target != self }
    end
  end

end