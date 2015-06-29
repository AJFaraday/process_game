class Castle < Building

  def initialize(x, y, game, options={})
    options.merge!({:avatar => 'castle'})
    @spawn_class = options[:spawn_class] || :knight
    @spawn_cost = options[:spawn_cost] || 5
    @spawn_time = options[:spawn_time] || 120
    @resource = options[:resource] || 'food'
    super(x, y, game, options)
  end

  def class_update
    if faction and spawn_frame? and alive?
      if faction.resource(@resource) > @spawn_cost
        faction.increment(@resource, 0 - @spawn_cost)
        faction.add_unit(@spawn_class, x, y)
      end
    end
  end

  def spawn_frame?
    (game.frame % @spawn_time) == 0
  end


end