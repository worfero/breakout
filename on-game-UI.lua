require "Classes.heart"

local font = love.graphics.newFont("Fonts/8-bit-hud.ttf", 14)
local levelText = _

ongameUI = {}
hearts = {}

function ongameUI.load()
	for i=1, 3 do
		hearts[i] = Heart(screenWidth - 30*i, screenHeight - 30)
	end

	love.graphics.setFont(font)
	levelText = "Level "..tostring(currentLevel)
end

function ongameUI.draw()
	love.graphics.line(0, screenHeight - 40, screenWidth, screenHeight - 40)
	for k, heart in pairs(hearts) do
		heart:draw()
	end
	love.graphics.printf(levelText, 0, screenHeight - 32, screenWidth, "center")
end

function ongameUI.update(dt)
	for k, heart in pairs(hearts) do
		if player.lives < k and hearts[k] ~= nil then
			table.remove(hearts, k)
		end
	end
	levelText = "Level "..tostring(currentLevel)
end

function ongameUI.LOAD()
	ongameUI.load()
end

function ongameUI.UPDATE(dt)
	ongameUI.update(dt)
end

function ongameUI.DRAW()
	ongameUI.draw()
end