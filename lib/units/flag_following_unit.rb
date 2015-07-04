class FlagFollowingUnit < Unit

  include UnitComponents::FollowClosest

  def after_init
    if faction
      @flags_to_visit = faction.flags
    end
    @initialised = true
  end

  def class_update
    after_init unless @initialised
    if @flags_to_visit.any?
      attack_closest_enemy if in_range_of?(closest_enemy)
      go_to_flag
    else
      attack_closest_enemy
    end
  end

  def go_to_flag
    flag = @flags_to_visit[0]
    go_to(flag) do
      @flags_to_visit.delete(flag)
    end
  end

  def attack_closest_enemy
    follow(closest_enemy) do |target|
      attack(target)
    end
  end

end