class PlayerBird < Unit

  include UnitComponents::BirdControl
  include UnitComponents::BirdMovement
  include UnitComponents::Bombing

  def class_init(options={})
    init_angle
    init_bombs(options)
    @turn_speed = options[:turn_speed]
  end

  # Player overrides other decision making
  # replacing it with user interactions
  def class_update
    read_keys
    if Gosu::button_down? Gosu::KbSpace
      drop_bomb
    end
    #attack(closest_target)
  end

  def draw_avatar
    @avatar.draw_rot(@x, @y, LAYERS[:air], @angle)
  end

end