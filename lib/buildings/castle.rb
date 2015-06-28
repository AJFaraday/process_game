class Castle < Building

  def initialize(x, y, game, options={})
    options.merge!({:avatar => 'castle'})
    super(x, y, game, options)
  end

  def class_update
    if faction and game.spawn_frame? and alive?
      if faction.resource('food') > 5
        faction.increment('food', -5)
        faction.add_unit('AttackingUnit', x, y)
      end
    end
  end

end