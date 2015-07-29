require_relative '../../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit(:castle, 100, 100)
faction.add_unit(:goldmine, 100, 260)
faction.add_unit(:flag, 100, 380)
faction.add_unit(:flag, 200, 380)
faction.add_unit(:flag, 300, 380)

faction.set('gold', 25)

faction = game.add_faction('red','red')

faction.add_unit(:castle, 540, 380)
faction.add_unit(:goldmine, 540, 220)
faction.add_unit(:flag, 540, 100)
faction.add_unit(:flag, 440, 100)
faction.add_unit(:flag, 340, 100)

faction.set('gold', 25)

game.show