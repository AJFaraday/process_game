class Castle < Building

  def initialize(x, y, game, options={})
    options.merge!({:avatar => 'castle'})
    super(x,y,game,options)
  end

  def class_update
    if game.spawn_frame?
      # todo spawn unit
    end
  end

end