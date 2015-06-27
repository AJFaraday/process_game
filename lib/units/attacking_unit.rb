class AttackingUnit < Unit

  include Components::FollowClosest

  attr_accessor :target

  def update
    follow_closest do |target|
      attack(target)
    end
  end

  def targets
    @game.units.select { |target| target.alive? and target.is_a?(Player) }
  end

end