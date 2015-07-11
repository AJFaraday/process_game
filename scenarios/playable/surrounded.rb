require_relative '../../lib/game'

game = Game.new

game.add_unit(:peasant, 120, 140)
game.add_unit(:peasant, 500, 140)
game.add_unit(:peasant, 500, 340)
game.add_unit(:peasant, 120, 340)

game.add_unit(:player_peasant, 320, 240, :name => 'Andrew Faraday')

game.show