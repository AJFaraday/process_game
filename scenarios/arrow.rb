require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')
faction.add_unit(:farm, 100, 100)
peasant = faction.add_unit(:peasant, 400, 400)

faction = game.add_faction('red','red')
faction.add_unit(:farm, 500, 100)

game.add_projectile(
  :arrow,
  [100, 400], # starting co-ords
  [400, 400], # ending co-ords
  20 # damage
)

game.show