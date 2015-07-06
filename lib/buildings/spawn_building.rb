class SpawnBuilding < Building

  attr_accessor :resource

  def class_init(options={})
    @spawn_class = options[:spawn_class] || :knight
    @spawn_cost = options[:spawn_cost] || 5
    @spawn_time = options[:spawn_time] || 120
    @resource = options[:resource] || 'food'
  end

  def class_update
    if faction and spawn_frame? and alive? and next_in_line?
      faction.buy(@spawn_class, x, y, @resource, @spawn_cost)
    end
  end

  def spawn_frame?
    (game.frame % @spawn_time) == 0
  end

  def next_in_line?
    resource.next_building == self
  end

  def resource
    faction.resources[@resource]
  end

end