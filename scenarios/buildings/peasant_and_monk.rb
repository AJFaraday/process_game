require_relative '../../lib/game'

game = Game.new

faction = game.add_faction('red','red')
faction.add_unit(:farm, 100, 0)
faction.add_unit(:farm, 100, 120)
faction.add_unit(:village, 100, 240)
faction.add_unit(:monasterry, 100, 360)

faction = game.add_faction('blue','blue')
faction.add_unit(:farm, 520, 0)
faction.add_unit(:farm, 520, 120)
faction.add_unit(:monasterry, 520, 240)
faction.add_unit(:village, 520, 360)

game.show