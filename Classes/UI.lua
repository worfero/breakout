Class = require("Libraries.middleclass.middleclass")
Button = Class("Button")

function Button:initialize(form, text, textHeight, scene, xPos, yPos, width, height)
    self.width = width
    self.height = height
    self.x = xPos - self.width/2
    self.y = yPos - self.height/2
    self.type = form
    self.text = text
    self.textHeight = textHeight/2
    self.scene = scene
    self.clicked = false

    return self
end

function Button:draw()
    if self.type == "rect" then love.graphics.rectangle("fill", self.x, self.y, self.width, self.height) end 
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf(self.text, self.x, self.y + self.height/2 - self.textHeight, self.width, "center")
    love.graphics.setColor(1, 1, 1, 1)
end

function Button:click()
    function love.mousepressed(x, y, button)
        if button == 1 then
            if (x >= self.x and x <= self.x + self.width and 
                y >= self.y and y <= self.y + self.height and
                self.scene == currentLevel) then
                    self.clicked = true
            else
                self.clicked = false
            end
        end
    end
end