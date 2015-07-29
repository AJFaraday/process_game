require_relative '../../lib/game'

game = Game.new

game.add_lake(250, 100, 50, 300)
game.add_lake(100, 250, 300, 50)

faction = game.add_faction('red','red')

faction.add_unit(:peasant, 100, 100)

faction = game.add_faction('blue','blue')

faction.add_unit(:peasant, 400, 400)

game.show