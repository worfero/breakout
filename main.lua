require "scene-manager"
require "Util.auxfunc"
require "on-game-UI"
require "Classes.block"
require "player"
require "Classes.ball"
require "handler"
require 'collision-edges'

HC = require 'Libraries.HC'

screenWidth = love.graphics.getWidth()
screenHeight = love.graphics.getHeight()

function love.load()
    scenemanager.LOAD()
end

function love.draw()
    scenemanager.DRAW()
end

function love.update(dt)
    scenemanager.UPDATE(dt)
end