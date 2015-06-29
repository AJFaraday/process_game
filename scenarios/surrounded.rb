require_relative '../lib/game'

game = Game.new

game.init_unit(:peasant, 220, 140)
game.init_unit(:peasant, 440, 140)
game.init_unit(:peasant, 440, 340)
game.init_unit(:peasant, 220, 340)

game.init_unit('Player', 320, 240, :name => 'Andrew Faraday')

game.show