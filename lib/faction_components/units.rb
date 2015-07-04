module FactionComponents
  module Units

    def buildings
      units.select{|u| u.is_a?(Building) and !u.is_a?(FlagBuilding)}
    end

    def moving_units
      units.select{|u| u.is_a?(Unit)}
    end

    def flags
      units.select{|u| u.is_a?(FlagBuilding)}
    end

    def add_unit(kls, x, y, options={})
      options = ActiveSupport::HashWithIndifferentAccess.new(options)
      if kls.is_a?(Symbol) or kls.is_a?(String)
        opts = game.unit_classes[kls]
        options.merge!(opts)
        kls = Object.const_get(opts[:class])
      end
      options.merge!({:faction => self, :colour => colour})
      unit = kls.send(:new, x, y, game, options)
      self.units << unit
      unit
    end

  end
end