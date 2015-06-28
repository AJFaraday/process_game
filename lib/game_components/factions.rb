module GameComponents
  module Factions

    attr_accessor :factions

    def add_faction(name, color)
      self.factions ||= []
      faction = Faction.new(name, color, self)
      self.factions << faction
      faction
    end

  end
end