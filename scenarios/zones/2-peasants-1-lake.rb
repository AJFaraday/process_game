require_relative '../../lib/game'

game = Game.new

game.add_lake(250, 100, 61, 350)
game.add_lake(100, 250, 350, 61)

faction = game.add_faction('red','red')

faction.add_unit(:peasant, 100, 100)
faction.add_unit(:peasant, 100, 250)


faction = game.add_faction('blue','blue')

faction.add_unit(:peasant, 400, 400)
faction.add_unit(:peasant, 250, 100)

game.show