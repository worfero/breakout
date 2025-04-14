Class = require("Libraries.middleclass.middleclass")
Ball = Class("Ball")

local pi = math.pi

function Ball:initialize(x, y, vx, direction, vy)
    self.paddleCollisionRsEdg = false
    self.blockCollisionRsEdg = false
    self.radius = 4 -- diametro da bola
    self:initialPosition(x, y, vx, direction, vy)
    self.collider = HC.circle(self.x,self.y,4) -- posiciona o colisor junto da bola
    
    return self
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius) -- desenha a bola na tela
end

function Ball:initialPosition(x, y, vx, direction, vy) 
    local tweak = love.math.random(20, 24)*signRandomizer()
    self.x = x -- posição inicial da bola
    self.y = y -- posição inicial da bola
    self.vx = vx -- velocidade inicial da bola no eixo x
    self.vy = vy -- velocidade inicial da bola
    self.angle = pi/2 + pi/tweak
    self.speed = 5
    self.wait = 1 -- tempo de espera da bola antes de iniciar o jogo
    self.debugTime = nil
end

function Ball:move(dt)
    if self.wait then -- lógica para fazer a bola esperar o jogo começar
        self.wait = self.wait - dt
        if self.wait <= 0 then self.wait = nil end
    else
        self.vx = math.cos(self.angle)*self.speed
        self.vy = math.sin(self.angle)*self.speed
        self.x = self.x + self.vx -- se a bola estiver em movimento
        self.y = self.y + self.vy
        if self.y <= 0 then -- se a bola bater no teto, rebate
            self.angle = 2*pi - self.angle
            self.y = 1
        elseif self.y > screenHeight - 40 then -- se a bola cair no chão, jogador perde
            BallLost(self)
        end
        if self.x > screenWidth then -- se a bola bater nas laterais, rebate
            self.angle = pi - self.angle
            self.x = screenWidth
        elseif self.x < 0  then
            self.angle = pi - self.angle
            self.x = 0
        end
    end

    self.collider:moveTo(self.x, self.y) -- fazer o collider acompanhar a bola
end

function Ball:update(dt)
    --block
    local col, dx, dy
    texto[1] = math.floor(self.angle + 0.5)
    for i, block in pairs(blocks) do
        col, dx, dy = self.collider:collidesWith(block.blockCollider)
        if(CollisionRisingEdge(col, self.blockCollisionRsEdg)) then
            table.remove(blocks, i)
            if math.abs(dy) >= math.abs(dx) and math.abs(dx) < 1 then
                self.angle = 2*pi - self.angle
            else
                self.angle = pi - self.angle
            end
            if block.power == 1 then
                --paddle.width = paddle.width - 20
                --paddleCollider:setWidth(paddle.width)
            end
            if block.power == 2 then
                --paddle.width = paddle.width + 20
                --paddleCollider:setWidth(paddle.width)
            end
            if block.power == 3 then
                --NewBall(self)
            end
        end
    end
    --paddle
    col, dx, dy = self.collider:collidesWith(paddleCollider)
    if self.debugTime then -- lógica para fazer a bola esperar o jogo começar
        self.debugTime = self.debugTime - dt
        if self.debugTime <= 0 then self.debugTime = nil end
        if self.x > player.x then
            self.x = player.x + paddle.width/2
        else
            self.x = player.x - paddle.width/2
        end
    else
        if(CollisionRisingEdge(col, self.paddleCollisionRsEdg)) then
            if math.abs(dy) >= math.abs(dx) and math.abs(dx) < 1 then
                local pos = self.x - player.x
                local posperc = (pos/(paddle.width/2))
                
                if self.x > player.x then
                    --self.angle = 2*pi - self.angle - (pi/200*math.abs(posperc) - pi/2)/2
                    -------self.angle = 2*pi - self.angle + math.abs(self.angle*math.abs(posperc)/4)
                    self.angle = 2*pi - self.angle + (pi/2*posperc)/6
                else
                    --self.angle = 2*pi - self.angle + (pi/200*math.abs(posperc) - pi/2)/2
                    -------self.angle = 2*pi - self.angle - math.abs(self.angle*math.abs(posperc)/4)
                    self.angle = 2*pi - self.angle + (pi/2*posperc)/6
                end
                self.y = self.y - 2
            else
                --self.vx = -self.vx + 6*self.vy
                self.angle = pi - self.angle
                self.debugTime = 0.5
            end
        end
    end
end