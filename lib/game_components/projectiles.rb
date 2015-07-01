module GameComponents

  module Projectiles

    attr_accessor :projectiles, :projectile_classes

    def init_projectiles
      self.projectiles = []
      self.projectile_classes = {}
      init_projectile_classes
      init_projectile_images
    end

    def add_projectile(kls, start, finish, damage, animation=nil)
      puts caller unless damage
      projectile = Projectile.new(kls, start, finish, damage, self)
      self.updatable_objects << projectile
      self.drawable_objects << projectile
      projectile
    end

    def init_projectile_classes
      file = File.join(File.dirname(__FILE__), '..', '..', 'data', 'projectile_classes.yml')
      @projectile_classes = ActiveSupport::HashWithIndifferentAccess.new(
        YAML.load_file(file)
      )
    end

    def init_projectile_images
      @projectile_classes.each do |name, kls|
        path = File.join(
          File.dirname(__FILE__), '..', '..', 'images',
          'projectiles', "#{kls[:image]}.png"
        )
        kls[:image] = Gosu::Image.new(path)
      end
    end
  end


end