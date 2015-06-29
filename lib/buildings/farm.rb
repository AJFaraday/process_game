class Farm < Building

  def initialize(x, y, game, options={})
    options.merge!({:avatar => 'farm'})
    super(x,y,game,options)
    @resource_time = options[:resource_time] || 60
    @resource = options[:resource] || 'food'
  end

  def class_update
    if faction and resource_frame? and alive?
      faction.increment(@resource, 1)
    end
  end

  def resource_frame?
    (game.frame % @resource_time) == 0
  end

end