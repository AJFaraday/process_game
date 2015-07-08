class Bird < Unit

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
    if can_drop_bomb?
      drop_bomb if on_top_of?(closest_target)
      if facing_right_of?(closest_target)
        turn_left
      end
      if facing_left_of?(closest_target)
        turn_right
      end
    end
    go_forward
    loop_position
  end

  def draw_avatar
    @avatar.draw_rot(@x, @y, LAYERS[:air], @angle)
  end

end