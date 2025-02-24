ball = {}           -- declara variável da bola
ballCollider = _    -- declara variável do collider
paddleCollisionRsEdg = false
blockCollisionRsEdg = false

function init() 
    ball.x = love.graphics.getWidth()/2 -- posição inicial da bola
    ball.y = love.graphics.getHeight()/2 -- posição inicial da bola
    ball.radius = 4 -- diametro da bola
    ball.vx = 0 -- velocidade inicial da bola no eixo x
    ball.direction = 1 -- direção da bola no eixo y
    ball.wait = 1 -- tempo de espera da bola antes de iniciar o jogo
    ball.speed = 5 -- velocidade inicial da bola
    ballCollider = HC.circle(ball.x,ball.y,4) -- posiciona o colisor junto da bola
end

function PlayerLost(player) -- reseta os parâmetros iniciais da bola ao perder o jogo
    init()
end

function ball.load() -- carrega parâmetros inicias da bola ao iniciar o jogo
    init()
end

function ball.draw()
    love.graphics.circle("fill", ball.x, ball.y, ball.radius) -- desenha a bola na tela
end

function ball.move(dt)
    if ball.wait then -- lógica para fazer a bola esperar o jogo começar
        ball.wait = ball.wait - dt
        if ball.wait <= 0 then ball.wait = nil end
    else
        ball.x = ball.x + ball.vx -- se a bola estiver em movimento
        ball.y = ball.y + ball.speed*ball.direction
        if ball.y <= 0 then -- se a bola bater no teto, rebate
            ball.y = -ball.y
            ball.direction = -ball.direction
        elseif ball.y > love.graphics.getHeight() then -- se a bola cair no chão, jogador perde
            PlayerLost()
        end
        if ball.x > love.graphics.getWidth() then -- se a bola bater nas laterais, rebate
            ball.x = ball.x - (ball.x - love.graphics.getWidth())
            ball.vx = -ball.vx
        elseif ball.x < 0  then
            ball.x = -ball.x
            ball.vx = -ball.vx
        end
    end

    ballCollider:moveTo(ball.x, ball.y) -- fazer o collider acompanhar a bola
end

function ball.update(dt)
    if(CollisionRisingEdge(ballCollider, paddleCollider, paddleCollisionRsEdg)) then
        ball.direction = ball.direction * -1
        ball.vx = ball.vx + (ball.x - player.x)/paddle.width*4
    end
    for i, block in pairs(blocks) do
		if(CollisionRisingEdge(ballCollider, blocks[i].blockCollider, blockCollisionRsEdg)) then
            ball.direction = -ball.direction
            table.remove(blocks, i)
        end
	end
end

function ball.LOAD()
	ball.load()
end

function ball.UPDATE(dt)
	ball.move(dt)
    ball.update(dt)
end

function ball.DRAW()
	ball.draw()
end

