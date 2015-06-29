module CommonComponents
  module Avatar

    def init_avatar(options)
      @avatar_name = options[:avatar] || 'peasant'
      puts @avatar_name
      @colour = options[:colour] || 'green'
      @avatar = Gosu::Image.new(
        if File.exists?(full_avatar_path)
          full_avatar_path
        else
          basic_avatar_path
        end
      )
    end

    def basic_avatar_path
      File.join(self.class::IMAGE_DIRECTORY, @avatar_name, "#{@avatar_name}.png")
    end

    def full_avatar_path
      File.join(self.class::IMAGE_DIRECTORY, @avatar_name, "#{@avatar_name}-#{@colour}.png")
    end

    def draw_avatar
      @avatar.draw(
        (@x -(@size / 2)),
        (@y -(@size / 2)),
        1
      )
    end

  end
end