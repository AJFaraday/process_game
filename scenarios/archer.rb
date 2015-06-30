require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit(:peasant, 100, 100)
faction.add_unit(:peasant, 160, 100)
faction.add_unit(:peasant, 100, 160)
faction.add_unit(:peasant, 160, 160)



faction = game.add_faction('reds','red')

faction.add_unit(:archer, 540, 380)
faction.add_unit(:archer, 480, 380)
faction.add_unit(:archer, 540, 320)
faction.add_unit(:knight, 480, 320)

game.show