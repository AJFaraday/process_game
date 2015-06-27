class Player < Unit

  include Components::UserControl

  # Player overrides other decision making
  # replacing it with user interactions
  def update
    read_keys
  end

end