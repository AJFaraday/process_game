class Player < Unit

  include Components::PlayerControl

  # Player overrides other decision making
  # replacing it with user interactions
  def class_update
    read_keys
    attack(closest_target)
  end

end