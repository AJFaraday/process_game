require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit(:monk, 540, 100)
faction.add_unit(:monk, 200, 100)
#faction.add_unit(:peasant, 540, 380)

faction = game.add_faction('red','red')

#faction.add_unit(:monk, 100, 380)
faction.add_unit(:peasant, 100, 100)

game.show