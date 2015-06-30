class ShootingUnit < Unit

  include UnitComponents::FollowClosest

  attr_accessor :target

  def class_init(options={})
    @projectile = options[:projectile]
  end

  def class_update
    if can_attack?
      follow_closest do |target|
        shoot(target)
      end
    elsif distance_to(closest_target) <= @range
      avoid_closest
      loop_position
    end
  end

  def shoot(unit)
    if unit.is_a?(Unit) or unit.is_a?(Building)
      if in_range_of?(unit)
        use_ability(@attack_cost) do
          @game.add_projectile(
            @projectile,
            self,
            unit,
            @attack_damage
          )
        end
      end
    end
  end

end