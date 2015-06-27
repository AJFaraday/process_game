class Unit

  include Components::Movement

  def initialize(game)
    @game = game
    @image = Gosu::Image.new(
      File.join(File.dirname(__FILE__), "..", 'images', 'peasant.png')
    )
    @score = 0
    @size = TILE_SIZE

    init_movement
    centre
  end

  def draw
    @image.draw(
      (@x -(@size / 2)),
      (@y -(@size / 2)),
      1
    )
  end

  def update
    read_keys
    loop_position
    collect_spinners
  end

  #TODO kill this
  def score
    @score
  end

  def collect_spinners
    @game.spinners.each do |spinner|
      if Gosu::distance(@x, @y, spinner.x, spinner.y) < 35
        @game.drawable_objects.delete(spinner)
        @game.spinners.delete(spinner)
        @score += 1
        puts @score
      end
    end
  end

end