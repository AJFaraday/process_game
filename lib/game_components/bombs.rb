module GameComponents

  module Bombs

    attr_accessor :bombs, :bomb_classes

    def init_bombs
      self.bombs = []
      self.bomb_classes = {}
      init_bomb_classes
      init_bomb_images
    end

    def add_bomb(kls, source, damage, time)
      bomb = Bomb.new(kls, source, damage, time, self)
      self.updatable_objects << bomb
      self.drawable_objects << bomb
      bomb
    end

    def init_bomb_classes
      file = File.join(File.dirname(__FILE__), '..', '..', 'data', 'bomb_classes.yml')
      @bomb_classes = ActiveSupport::HashWithIndifferentAccess.new(
        YAML.load_file(file)
      )
    end

    def init_bomb_images
      @bomb_classes.each do |name, kls|
        path = File.join(
          File.dirname(__FILE__), '..', '..', 'images',
          'bombs', "#{kls[:image]}.png"
        )
        kls[:image] = Gosu::Image.new(path)
      end
    end
  end


end