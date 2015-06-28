class Farm < Building

  def initialize(x, y, game, options={})
    options.merge!({:avatar => 'farm'})
    super(x,y,game,options)
  end

  def class_update
    if faction and game.resource_frame? and alive?
      faction.increment('food', 1)
    end
  end

end