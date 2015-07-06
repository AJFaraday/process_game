require_relative '../lib/game'

game = Game.new

faction = game.add_faction('red','red')
faction.add_unit(:goldmine, 100, 0)
faction.add_unit(:sawmill, 100, 120)
faction.add_unit(:castle, 100, 240)
faction.add_unit(:'archery-range', 100, 360)

faction.add_unit(:flag, 200, 100)
faction.add_unit(:flag, 200, 200)
faction.add_unit(:flag, 200, 60)
faction.add_unit(:flag, 200, 360)

faction = game.add_faction('blue','blue')
faction.add_unit(:sawmill, 520, 0)
faction.add_unit(:goldmine, 520, 120)
faction.add_unit(:castle, 520, 240)
faction.add_unit(:'archery-range', 520, 360)

faction.add_unit(:flag, 420, 360)
faction.add_unit(:flag, 420, 60)
faction.add_unit(:flag, 420, 200)
faction.add_unit(:flag, 420, 100)


game.show