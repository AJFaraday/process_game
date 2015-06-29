require 'yaml'

module GameComponents

  module Units

    attr_accessor :units, :unit_classes

    def init_units
      init_unit_classes
      self.units = []
    end

    def init_unit_classes
      file = File.join(File.dirname(__FILE__), '..', '..', 'data', 'unit_classes.yml')
      @unit_classes = ActiveSupport::HashWithIndifferentAccess.new(
        YAML.load_file(file)
      )
    end

    def add_unit(kls, x, y, options={})
      if kls.is_a?(Symbol) or kls.is_a?(String)
        opts = unit_classes[kls]
        kls = Object.const_get(opts[:class])
        opts.merge!(options)
        kls.send(:new, x, y, self, opts)
      else
        kls.send(:new, x, y, self, options)
      end
    end

  end

end