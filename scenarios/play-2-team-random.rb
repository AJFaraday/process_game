require_relative '../lib/game'

def fill_faction(faction)
  5.times do
    faction.add_unit(
      'AttackingUnit',
      rand(X_SIZE),
      rand(Y_SIZE)
    )
  end
end

game = Game.new

faction = game.add_faction('blue', 'blue')
fill_faction(faction)

faction = game.add_faction('greens', 'green')
5.times do
  faction.add_unit(
    'Player',
    rand(X_SIZE),
    rand(Y_SIZE)
  )
end

game.show