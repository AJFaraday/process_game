module FactionComponents

  module Resources

    RESOURCE_WIDTH = 100

    attr_accessor :resources

    def init_resources
      self.resources ||= {}
      add_resource('gold')
      add_resource('wood')
      add_resource('food')
    end

    def add_resource(name)
      self.resources[name] = Resource.new(name)
      self.resources[name].faction = self
    end

    def set(name, amount)
      self.resources[name].amount = amount
    end

    def increment(name, amount)
      self.resources[name].amount += amount
    end

    def resource(name)
      resources[name].amount
    end

    def draw_resources(y)
      resources.values.each_with_index do |resource, index|
        resource.draw(
          10 + @name_width + (RESOURCE_WIDTH * index),
          y
        )
      end
    end

    def buy(spawn_class, x, y, resource, spawn_cost)
      res = resources[resource]
      if res.amount > spawn_cost
        increment(resource, (0 - spawn_cost))
        add_unit(spawn_class, x, y)
        res.building_index += 1
      end
    end

  end

end