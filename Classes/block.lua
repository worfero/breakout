Class = require("Libraries.middleclass.middleclass")
Block = Class("Block")

function Block:initialize(xPos, yPos, power)
    self.power = power -- 0: branco; 1: vermelho; 2: verde; 3: azul;
    self.width = 110
    self.height = 20
    self.x = xPos
    self.y = yPos
    self.blockCollider = HC.rectangle(self.x, self.y, self.width, self.height)

    return self
end

function Block:draw()
    if self.power == 1 then love.graphics.setColor(0.75, 0, 0, 1) 
    elseif self.power == 2 then love.graphics.setColor(0, 0.75, 0, 1) 
    elseif self.power == 3 then love.graphics.setColor(0, 0, 0.75, 1) end
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    self.blockCollider:draw('fill')
    love.graphics.setColor(1, 1, 1, 1)
end