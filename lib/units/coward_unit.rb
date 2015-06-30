class CowardUnit < Unit

  include UnitComponents::FollowClosest

  attr_accessor :target

  def class_update
    if can_attack?
      follow_closest do |target|
        attack(target)
      end
    else
      avoid_closest
    end
    loop_position
  end

end