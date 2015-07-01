module UnitComponents
  module Animations

    def init_animations(options)
      @animations ||= {}
      options[:animations].each do |action, animation|
        @animations[action] = OpenStruct.new(
          :images => @game.animations[animation],
          :length => @game.animations[animation].length,
          :follow => self,
          :start => nil
        )
      end
    end

    def run_animation(name, target=nil)
      name = name.to_s
      animation = @animations[name]
      if animation
        animation.target = target if target
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
              0.5
            )
          end
        end
      end
    end

  end
end