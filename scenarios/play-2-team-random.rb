require_relative '../lib/game'

def fill_faction(faction)
  5.times do
    faction.add_unit(
      :peasant,
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
    :player_peasant,
    rand(X_SIZE),
    rand(Y_SIZE)
  )
end

game.factions.each do |faction|
  faction.hide_info_bar = true
end

game.show