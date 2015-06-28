class Farm < Building

  def initialize(x, y, game, options={})
    options.merge!({:avatar => 'farm'})
    super(x,y,game,options)
  end

  def class_update
    if game.resource_frame?
      # add resource
    end
  end

end