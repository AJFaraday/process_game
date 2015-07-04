module UnitComponents
  module Animations

    attr_accessor :animations

    def init_animations(options)
      @animations ||= {}
      if options[:animations]
        options[:animations].each do |action, animation|
          @animations[action] = OpenStruct.new(
            :images => @game.animations[animation['name']],
            :length => @game.animations[animation['name']].length,
            :follow => self,
            :layer => (animation['layer'] ? LAYERS[animation['layer'].to_sym] : LAYERS[:over_unit]),
            :start => nil
          )
        end
      end
    end

    def run_animation(name, target=nil)
      name = name.to_s
      animation = @animations[name]
      if animation
        animation.follow = target if target
        animation.start = Gosu::milliseconds
      end
    end

    def draw_animations
      @animations.each do |name, animation|
        if animation.start and (animation.start + animation.length) < Gosu::milliseconds
          time_since_start = Gosu::milliseconds - animation.start
          img = animation.images[(time_since_start.to_f / 10)]
          if img
            img.draw(
              animation.follow.x - animation.follow.half_size,
              animation.follow.y - animation.follow.half_size,
              animation.layer
            )
          end
        end
      end
    end

  end
end