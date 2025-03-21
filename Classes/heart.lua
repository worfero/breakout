Class = require("Libraries.middleclass.middleclass")
Heart = Class("Heart")

function Heart:initialize(xPos, yPos)
    self.width = 20
    self.height = 20
    self.x = xPos
    self.y = yPos

    return self
end

function Heart:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end