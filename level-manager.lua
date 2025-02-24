levelmanager = {}

blocks = {}

function levelmanager.load()
	for i=1, 4 do
		for k=1, 6 do
			blocks[k + 6*(i-1)] = Block(20 + 130*(k-1), 20 + 40*(i-1))
		end
	end
end

function levelmanager.draw()
	for k, block in pairs(blocks) do
		block:draw()
	end
end

function levelmanager.update(dt)

end

function levelmanager.LOAD()
	levelmanager.load()
end

function levelmanager.UPDATE(dt)
	levelmanager.update(dt)
end

function levelmanager.DRAW()
	levelmanager.draw()
end