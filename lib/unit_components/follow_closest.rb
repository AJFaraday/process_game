module UnitComponents
  module FollowClosest

    def follow_closest(&block)
      self.target = closest_target
      if in_range_of?(target)
        if block_given?
          yield(target)
        end
      else
        if higher_than?(target)
          go_down
        end
        if lower_than?(target)
          go_up
        end
        if left_of?(target)
          go_right
        end
        if right_of?(target)
          go_left
        end
      end
    end

    def avoid_closest
      self.target = closest_target
      if higher_than?(target)
        go_up
      end
      if lower_than?(target)
        go_down
      end
      if left_of?(target)
        go_left
      end
      if right_of?(target)
        go_right
      end
    end

  end
end