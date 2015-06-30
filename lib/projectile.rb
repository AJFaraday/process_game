class Projectile

  include CommonComponents::RelativePositions

  attr_accessor :x, :y

  def initialize(kls, start, finish, damage, game)
    @game = game
    init_class(kls)
    @start_x, @start_y = get_coord(start)
    @x = @start_x
    @y = @start_y
    @finish_x, @finish_y = get_coord(finish)
    @damage = damage
    init_geometry
    @half_size = 15
  end

  def init_geometry
    @angle = Gosu.angle(@start_x, @start_y, @finish_x, @finish_y)
  end

  def init_class(kls)
    kls = @game.projectile_classes[kls]
    @image = kls[:image]
    @speed = kls[:speed]
  end

  def get_coord(source)
    if source.is_a?(Array)
      return source[0], source[1]
    elsif source.respond_to?(:x) and source.respond_to?(:y)
      return source.x, source.y
    else
      return 0, 0
    end
  end

  def update
    @x += Gosu::offset_x(@angle, @speed)
    @y += Gosu::offset_y(@angle, @speed)
    if Gosu::distance(@x, @y, @finish_x, @finish_y) <= 1
      land
    end
  end

  def land
    @game.drawable_objects.delete(self)
    @game.updatable_objects.delete(self)

    @game.units.each{|x| puts distance_to(x)}
    units_landed_on = @game.units.select{|x| distance_to(x) <= @half_size}
    units_landed_on.each{|u| u.damage(@damage)}
  end

  def draw
    @image.draw_rot(@x, @y, 4, @angle)
  end



end