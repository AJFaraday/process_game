class Bomb

  include CommonComponents::RelativePositions

  attr_accessor :x, :y

  def initialize(kls, source, damage, time, range, game)
    @game = game
    init_class(kls)
    @source = source
    @range = range
    @x, @y = get_coord(@source)
    @fuse = time
    @damage = damage
    @half_size = 30
  end

  def init_class(kls)
    kls = @game.bomb_classes[kls]
    @image = kls[:image]
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
    @fuse -= 1
    bang! if timed_out?
  end

  def timed_out?
    @fuse <= 0
  end

  def bang!
    @game.drawable_objects.delete(self)
    @game.updatable_objects.delete(self)
    units_landed_on = @game.units.select do |x|
      distance_to(x) <= (@range + x.half_size)
    end
    units_landed_on.each { |u| u.damage(@damage) }
    landing_animation
  end

  def landing_animation
    if @source.respond_to?(:animations)
      animation = @source.animations['explosion']
      if animation
        animation.follow = OpenStruct.new(
          :x => @x, :y => @y,
          :half_size => 30
        )
        animation.start = Gosu::milliseconds
      end
    end
  end

  def draw
    @image.draw(
      @x - @half_size,
      @y - @half_size,
      LAYERS[:over_unit]
    )
  end


end