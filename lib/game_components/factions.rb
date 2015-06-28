module GameComponents
  module Factions

    attr_accessor :factions

    def add_faction(name, color)
      self.factions ||= []
      index = (self.factions.size - 1)
      faction = Faction.new(name, color, self, {:index => index})
      self.factions << faction
      self.drawable_objects << faction
      faction
    end

  end
end