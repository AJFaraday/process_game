require_relative '../../lib/game'

game = Game.new

game.add_lake(100, 100, 100, 100)


faction = game.add_faction('red','red')

faction.add_unit(:peasant, 150, 70)

faction = game.add_faction('blue','blue')

faction.add_unit(:peasant, 150, 230)




game.show