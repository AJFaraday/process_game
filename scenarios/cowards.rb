require_relative '../lib/game'

game = Game.new

game.add_faction('green','green')
game.add_faction('purple','purple')
game.add_faction('white','white')

x = 0
y = 60
n = 0
until x > X_SIZE
  y = 0
  until y > Y_SIZE
    faction = game.factions[n % game.factions.length]
    n += 1
    faction.add_unit(:coward_peasant, x, y)
    y += 240
  end
  x += 240
end


game.show