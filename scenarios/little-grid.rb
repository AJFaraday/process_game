require_relative '../lib/game'
game = Game.new

X_SIZE = 100
Y_SIZE = 100

x = 0
y = 0
until x > X_SIZE
  y = 0
  until y > Y_SIZE
    game.add_unit(:peasant, x, y)
    y += 100
  end
  x += 100
end

game.show