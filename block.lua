Class = require("Libraries.middleclass.middleclass")
Block = Class("Block")

function Block:initialize(xPos, yPos)
    self.width = 110
    self.height = 20
    self.x = xPos
    self.y = yPos
    self.blockCollider = HC.rectangle(self.x, self.y, self.width, self.height)

    return self
end

function Block:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    self.blockCollider:draw('fill')
end