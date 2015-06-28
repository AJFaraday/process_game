module GameComponents

  module Units

    attr_accessor :units

    def init_units
      self.units = []
    end

    def add_unit(kls, x, y, options={})
      kls = Object.const_get(kls)
      kls.send(:new, x, y, self, options)
    end

  end

end