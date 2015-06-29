require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit(:knight, 100, 240)

faction = game.add_faction('red','red')

faction.add_unit(:peasant, 300, 240)
faction.add_unit(:peasant, 400, 240)

game.show