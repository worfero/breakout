local font = love.graphics.newFont("Fonts/8-bit-hud.ttf", 8)

texto = {}
texto[1] = ""
texto[2] = ""

scenes = {}

balls = {}
blocks = {}
buttons = {}

function scenes:ReturnBlocks()
	return blocks
end

---------------------------
------Load Functions-------
---------------------------

function scenes.commonLoad()
	balls[1] = Ball(screenWidth/2, screenHeight/2, 0, 1, 5)
	ongameUI.LOAD()
    player.LOAD()
end

function scenes.MainMenuLoad()
	local text = "Play"
	love.graphics.setFont(font)
	local textHeight = font:getHeight(text)
	buttons[1] = Button("rect", text, textHeight, 0, screenWidth/2, screenHeight/2, 120, 50)
end

function scenes.Level1Load()
	scenes.commonLoad()
    for i=1, 4 do
		for k=1, 6 do
			blocks[k + 6*(i-1)] = Block(20 + 130*(k-1), 20 + 40*(i-1), i-1)
		end
	end
	--blocks[1] = Block(20, 20)
end

function scenes.Level2Load()
	scenes.commonLoad()
	local c = 1
    for i=1, 6 do
		for k=1, i do
			blocks[c] = Block(20 + 130*(k-1), 20 + 40*(i-1), 0)
			c = c + 1
		end
	end
end

---------------------------
------Draw Functions-------
---------------------------

function scenes.commonDraw()
	for k, ball in pairs(balls) do
		ball:draw()
	end
	ongameUI.DRAW()
	player.DRAW()
	love.graphics.print(texto[1], 10, 400)
	love.graphics.print(texto[2], 10, 500)
end

function scenes.MainMenuDraw()
	for k, button in pairs(buttons) do
		button:draw()
	end
end

function scenes.Level1Draw()
	scenes.commonDraw()
	for k, block in pairs(blocks) do
		block:draw()
	end
end

function scenes.Level2Draw()
	scenes.commonDraw()
	for k, block in pairs(blocks) do
		block:draw()
	end
end

---------------------------
-----Update Functions------
---------------------------

function scenes.commonUpdate(dt)
	ongameUI.UPDATE(dt)
	player.UPDATE(dt)
	for k, ball in pairs(balls) do
		ball:move(dt)
		ball:update(dt)
	end

	if next(scenes:ReturnBlocks()) == nil then
		NextLevel()
	elseif player.lives <= 0 then
		Restart()
	end
end

function scenes.MainMenuUpdate()
	local clicked = false
	buttons[1]:click()
	if buttons[1].clicked then NextLevel() end
end