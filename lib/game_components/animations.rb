module GameComponents
  module Animations

    attr_accessor :animations

    def init_animations
      # presented here as template for when I want a spin to happen
      @animations = {}

      animations_path = File.join(File.dirname(__FILE__), '..', '..', 'images', 'animations')
      Dir.glob(File.join(animations_path, '*.png')).each do |file|
        name = file.split(/[\/\.]/)[-2]
        @animations[name] = Gosu::Image::load_tiles(
          file,
          60,
          60
        )
      end
    end

  end
end