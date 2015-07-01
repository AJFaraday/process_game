class CowardUnit < Unit

  include UnitComponents::FollowClosest

  attr_accessor :target

  def class_update
    if can_attack?
      follow(closest_enemy) do |target|
        attack(target)
      end
    else
      avoid(closest_enemy)
    end
    loop_position
  end

end