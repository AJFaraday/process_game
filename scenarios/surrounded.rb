require_relative '../lib/game'

game = Game.new

game.add_unit(:peasant, 220, 140)
game.add_unit(:peasant, 440, 140)
game.add_unit(:peasant, 440, 340)
game.add_unit(:peasant, 220, 340)

game.add_unit(:player_peasant, 320, 240, :name => 'Andrew Faraday')

game.show