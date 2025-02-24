require "level-manager"
require "block"
require "player"
require "ball"
require 'collision-edges'

HC = require 'Libraries.HC'

function love.load()
    levelmanager.LOAD()
    player.LOAD()
    ball.LOAD()
end

function love.draw()
    levelmanager.DRAW()
    player.DRAW()
    ball.DRAW()
end

function love.update(dt)
    levelmanager.UPDATE(dt)
    player.UPDATE(dt)
    ball.UPDATE(dt)
end