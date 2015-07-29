require_relative '../../lib/game'

game = Game.new

faction = game.add_faction('red','red')


faction.add_unit(:peasant, 60, 250)
faction.add_unit(:peasant, 130, 250)
faction.add_unit(:peasant, 200, 250)

faction = game.add_faction('blue','blue')

faction.add_unit(:peasant, 270, 250)
faction.add_unit(:peasant, 350, 250)
faction.add_unit(:peasant, 420, 250)

game.show