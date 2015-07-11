require_relative '../../lib/game'

game = Game.new

game.add_faction('red','red')
game.add_faction('yellow','yellow')
game.add_faction('green','green')
game.add_faction('teal','teal')
game.add_faction('blue','blue')
game.add_faction('purple','purple')

game.add_faction('grey','grey')
game.add_faction('white','white')
game.add_faction('black','black')

unit_types = [:peasant, :archer, :coward_peasant, :knight, :bird, :monk]

x = 0
y = 0
n = 0
until x > X_SIZE
  y = 0
  until y > Y_SIZE
    faction = game.factions[n % game.factions.length]
    n += 1
    type = unit_types[n % unit_types.count]
    faction.add_unit(type, x, y)
    y += 60
  end
  x += 60
end

game.factions.each do |faction|
  faction.hide_info_bar = true
end


game.show