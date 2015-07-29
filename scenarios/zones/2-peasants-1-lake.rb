require_relative '../../lib/game'

game = Game.new

game.add_lake(250, 100, 50, 300)

faction = game.add_faction('red','red')

faction.add_unit(:peasant, 100, 250)

faction = game.add_faction('blue','blue')

faction.add_unit(:peasant, (X_SIZE - 100), 250)

game.show