class HealingUnit < Unit

  include UnitComponents::Heal
  include UnitComponents::FollowClosest

  def class_init(options={})
    init_healing(options)
  end

  def class_update
    if can_heal? and closest_hurt_friend
      follow(closest_hurt_friend) do |target|
        heal(target)
     end
    elsif distance_to(closest_enemy) <= @heal_range
      avoid(closest_enemy)
      loop_position
    end
  end

  def in_range_of?(target)
    in_healing_range_of?(target)
  end


end