require_relative '../../lib/game'

game = Game.new

game.add_unit(:peasant, 100, 100)
game.add_unit(:peasant, 540, 100)
game.add_unit(:peasant, 540, 380)
game.add_unit(:peasant, 100, 380)

game.show