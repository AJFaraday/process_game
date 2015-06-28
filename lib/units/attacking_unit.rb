class AttackingUnit < Unit

  include UnitComponents::FollowClosest

  attr_accessor :target

  def class_update
    follow_closest do |target|
      attack(target)
    end
  end

end