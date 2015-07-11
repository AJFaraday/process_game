require_relative '../../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit(:castle, 100, 100)
faction.add_unit(:goldmine, 100, 220)

faction.set('food', 5)

faction = game.add_faction('red','red')

faction.add_unit('archery-range', 540, 380)
faction.add_unit(:sawmill, 540, 260)

game.show