class Unit

  include UnitComponents::Movement
  include UnitComponents::Name
  include UnitComponents::RelativePositions
  include UnitComponents::AbilityPoints
  include UnitComponents::Attack

  include CommonComponents::Avatar
  include CommonComponents::Health
  include CommonComponents::Faction

  IMAGE_DIRECTORY = File.join(File.dirname(__FILE__), "..", 'images', 'units')
  TILE_SIZE = 60

  attr_accessor :half_size

  def initialize(x, y, game, options={})
    @size = TILE_SIZE
    @game = game
    @faction = options[:faction]
    @game.drawable_objects << self
    @game.updatable_objects << self
    @game.units << self
    init_avatar(options)
    jump(x, y)
    @bar_size = 5
    @half_size = @size / 2

    init_movement(options[:speed] || 5)
    init_health(options[:max_health] || 100)
    init_ability_points(
      options[:max_abiltiy_points] || 50,
      options[:ability_point_recovery_chance] || 10
    )
    init_attack(
      options[:attack_range] || 0,
      options[:attack_damage] || 5
    )
    init_name(options[:name])
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