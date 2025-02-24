player = {}
paddleCollider = _

function player.load()
    paddle = {
        width = 150,
        height = 20,
        speed = 300
    }

    player.x = love.graphics.getWidth()/2
    player.y = love.graphics.getHeight() - 2*paddle.height

    paddleCollider = HC.rectangle(player.x, player.y + (paddle.height/2), paddle.width, paddle.height)
end

function player.draw()
    love.graphics.rectangle("fill",
    player.x-(paddle.width/2),
    player.y,
    paddle.width,paddle.height)
end

function player.move(dt)
    if love.keyboard.isDown("right") then 
        player.x = player.x + paddle.speed*dt
    end
    if love.keyboard.isDown("left") then 
        player.x = player.x - paddle.speed*dt
    end
    if player.x < paddle.width/2 then player.x = paddle.width/2 end
    if player.x > love.graphics.getWidth() - paddle.width/2 then player.x = love.graphics.getWidth() - paddle.width/2 end

    paddleCollider:moveTo(player.x, player.y + (paddle.height/2))
end

function player.LOAD()
	player.load()
end

function player.UPDATE(dt)
	player.move(dt)
end

function player.DRAW()
	player.draw()
end