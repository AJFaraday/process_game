class AttackingUnit < Unit

  include Components::FollowClosest

  attr_accessor :target

  def class_update
    follow_closest do |target|
      attack(target)
    end
  end

end