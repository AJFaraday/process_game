module UnitComponents
  module PlayerControl

    def read_keys
      if Gosu::button_down? Gosu::KbLeft
        go_left
      end
      if Gosu::button_down? Gosu::KbRight
        go_right
      end
      if Gosu::button_down? Gosu::KbUp
        go_up
      end
      if Gosu::button_down? Gosu::KbDown
        go_down
      end
      loop_position
    end

  end
end