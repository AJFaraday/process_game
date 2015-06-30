require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit(:castle, 100, 100)
faction.add_unit(:farm, 100, 220)

faction.set('food', 5)

faction = game.add_faction('red','red')

faction.add_unit(:castle, 540, 380)
faction.add_unit(:farm, 540, 260)

game.show