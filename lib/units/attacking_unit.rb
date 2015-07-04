class AttackingUnit < Unit

  include UnitComponents::FollowClosest

  def class_update
    follow(closest_enemy) do |target|
      attack(target)
    end
  end

end