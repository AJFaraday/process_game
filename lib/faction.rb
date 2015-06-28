class Faction

  attr_accessor :game, :name, :colour

  attr_accessor :units

  def initialize(name, colour, game)
    @name = name
    @colour = colour
    @game = game
    @units = []
  end

  def add_unit(kls, x, y, options={})
    kls = Object.const_get(kls)
    options.merge!({:faction => self})
    unit = kls.send(:new, x, y, game, options)
    self.units << unit
    unit
  end

  def dead?
    self.units.none?
  end

  def alive?
    !dead?
  end



end