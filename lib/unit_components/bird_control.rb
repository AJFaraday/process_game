module UnitComponents
  module BirdControl

    def read_keys
      if Gosu::button_down? Gosu::KbLeft
        turn_left
      end
      if Gosu::button_down? Gosu::KbRight
        turn_right
      end
      go_forward
      loop_position
    end

  end
end