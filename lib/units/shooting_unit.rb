class ShootingUnit < Unit

  include UnitComponents::Shoot
  include UnitComponents::FollowClosest

  attr_accessor :target

  def class_init(options={})
    @projectile = options[:projectile]
  end

  def class_update
    if can_attack?
      follow(closest_enemy) do |target|
        shoot(target)
      end
    elsif distance_to(closest_target) <= @attack_range
      avoid(closest_enemy)
      loop_position
    end
  end



end